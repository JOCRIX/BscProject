----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2024 07:48:03 PM
-- Design Name: 
-- Module Name: adc_resampler - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adc_resampler is
  Port (
        i_acquire_start_int_mem_reg     : in std_logic_vector(15 downto 0) := (others => '0'); --MSb controls the start
        --i_acquire_start_int_mem_reg : in std_logic := '0';
        --o_acquire_start_read_int_mem    : in std_logic := '0';
        i_sample_frq_high_int_mem_reg   : in std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_frq_low_int_mem_reg    : in std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_size_int_mem_reg       : in std_logic_vector(15 downto 0) := "0000000001100100";--x"4E20"; --Default sample zie = 20000. May need to remove this when int mem is connected
        o_resampler_DnBusy              : out std_logic := '1';
        o_acquire_start_adc_control     : out std_logic := '0';
        i_reset_logic                   : in std_logic := '0';
        i_dds_clk_50MHz                 : in std_logic := '0';
        i_master_clk                    : in std_logic :='0'
   );
end adc_resampler;

architecture Behavioral of adc_resampler is
--Direct digital synthesis component
component dds_compiler_1
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_config_tvalid : IN STD_LOGIC;
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
end component;

--50MHz CLK for testing
--component clk_wiz_0
--port
-- (
--  clk_out1          : out    std_logic;
--  clk_out2          : out    std_logic;
--  clk_in1           : in     std_logic
-- );
--end component;

signal r_sample_size : integer range 32767 downto 0;
signal r_run_sampler : std_logic := '0';
signal r_done : std_logic := '0';
signal r_acq : std_logic := '0';
signal r_reset : std_logic := '0';
signal w_mclk : std_logic ;
--DDS signaler, unused
signal m_axis_config_tvalid : std_logic;
signal m_axis_data_tvalid : std_logic;
--Update output frq
signal s_axis_config_tvalid : std_logic;
--Sets output frq
signal r_dds_frq_word : std_logic_vector(47 DOWNTO 0) := "000001010001111010111000010100011110111010011000";  -- (others => '0'); 
--DDS output
signal m_axis_data_tdata : std_logic_vector(15 downto 0);
--DDS output CLK
signal r_dds_clk : std_logic;
--DDS input clk
type state_resampler is (IDLE, ARM, RUN, STOP);
signal s_resamp : state_resampler := IDLE;
signal r_dds_clk_count : integer range 0 to 32767:= 0;
signal r_dds_mux_enable : std_logic := '0';
--test signals
--signal i_dds_clk_50MHz : std_logic := '0';
--signal i_master_clk : std_logic := '0';
signal r_dds_counting : std_logic := '0';
signal r_dds_done_count : std_logic := '0';
signal r_delay_count : integer range 512 downto 0 := 0;
signal r_F_IN       : std_logic_vector(47 downto 0) := (others => '0');
signal w_update_F   : std_logic := '0';

begin

w_mclk <= i_master_clk;

sample_clk : dds_compiler_1
  PORT MAP (
    aclk => i_dds_clk_50MHz,
    s_axis_config_tvalid => s_axis_config_tvalid,
    s_axis_config_tdata => r_dds_frq_word,
    m_axis_data_tvalid => m_axis_data_tvalid,
    m_axis_data_tdata => m_axis_data_tdata
  );

--50MHz CLK for DDS
--dds_50_MHz_clk : clk_wiz_0
--   port map ( 
--  -- Clock out ports  W
--   clk_out1 => i_dds_clk_50MHz,
--   clk_out2 => w_mclk,
--   -- Clock in ports
--   clk_in1 => i_master_clk --i_master_clk 
-- );

r_dds_clk <= m_axis_data_tdata(11);

--set frq word to DDS

--r_sample_size <= 500;--50;
r_sample_size <= to_integer(unsigned(i_sample_size_int_mem_reg));
r_reset <= i_reset_logic;
--r_acq <= TEST_ACQ_START;
r_acq <= i_acquire_start_int_mem_reg(15); --MSb = '1' means acq start.
--r_acq <= i_acquire_start_int_mem_reg;
--TEST_DDS_CLK <= r_dds_clk;
--TEST_ACQ_START_OUT <= TEST_ACQ_START;

--code for updating frq word for DDS
r_F_IN <= i_sample_frq_high_int_mem_reg & i_sample_frq_low_int_mem_reg & x"0000";
s_axis_config_tvalid <= w_update_f;

update_frq_word : process (i_dds_clk_50MHz, r_dds_frq_word, r_F_IN)is
begin
    if(rising_edge(i_dds_clk_50MHz)) then       
        if(r_dds_frq_word /= r_F_IN) then  
            r_dds_frq_word <= r_F_IN;      
            w_update_F <= '1';
        else
            w_update_F <= '0';
        end if;
    end if;
end process;

resampler : process (w_mclk, s_resamp, r_dds_counting, r_delay_count, r_run_sampler, r_reset) is
--variable r_delay_count : integer range 512 downto 0 := 0;
begin
    if(r_reset = '1') then 
        s_resamp <= IDLE;
    elsif(rising_edge(w_mclk)) then
        case s_resamp is
            when IDLE=>
                r_done <= '0';
                r_delay_count <= 0;
                if(r_run_sampler = '1') then
                    s_resamp <= ARM;
                    o_resampler_DnBusy <= '0';
                end if;
            when ARM=>
                --if(r_delay_count < 400) then
                 --   r_delay_count <= r_delay_count + 1;
               -- else
                  --  r_delay_count <= 0;
                    s_resamp <= RUN;
                --end if;
            when RUN =>
                r_delay_count <= 0;
                if(r_dds_done_count = '1') then
                    s_resamp <= STOP;
                end if;
            when STOP =>
                if(r_delay_count < 200) then
                    r_delay_count <= r_delay_count + 1;
                else
                    r_delay_count <= 0;
                    s_resamp <= IDLE;
                    o_resampler_DnBusy <= '1';
                    r_done <= '1';
                end if;
        end case;
            
    end if;
end process;

dds_clk_count : process (r_dds_clk, s_resamp, r_dds_clk_count)is
begin
    if(rising_edge(r_dds_clk)) then
        if(s_resamp = RUN) then
            if(r_dds_clk_count < r_sample_size) then
                r_dds_mux_enable <= '1';
                r_dds_clk_count <= r_dds_clk_count + 1;
                r_dds_counting <= '1';
            else
                r_dds_mux_enable <= '0';
                r_dds_clk_count <= 0;
                r_dds_counting <= '0';
            end if;
        end if;
    end if;
end process;

check_count_status : process (r_dds_counting, s_resamp) is
begin

    if(s_resamp = STOP) then
        r_dds_done_count <= '0';
    elsif(falling_edge(r_dds_counting)) then
        r_dds_done_count <= '1';
    end if;
end process;

acq_start : process (r_acq, r_done) is
begin
    if(r_done = '1') then
        r_run_sampler <= '0';
    elsif(rising_edge(r_acq)) then
        r_run_sampler <= '1';
    end if;
end process;


BUFGCE_inst : BUFGCE
port map (
   O => o_acquire_start_adc_control,   -- 1-bit output: Clock output
   CE => r_dds_mux_enable, -- 1-bit input: Clock enable input for I0
   I => r_dds_clk    -- 1-bit input: Primary clock
);

end Behavioral;
