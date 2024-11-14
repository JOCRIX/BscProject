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
        o_acquire_start_read_int_mem    : in std_logic := '0';
        i_sample_frq_high_int_mem_reg   : in std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_frq_low_int_mem_reg    : in std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_size_int_mem_reg       : in std_logic_vector(15 downto 0) := x"4E20"; --Default sample zie = 20000. May need to remove this when int mem is connected
        i_adc_control_busy              : in std_logic := '0';
        o_resampler_busy                : out std_logic := '0';
        o_acquire_start_adc_control     : out std_logic := '0';
        i_reset_logic                   : in std_logic := '0';
        i_dds_clk_50MHz                 : in std_logic := '0';
        --TEST_DDS_OUT                    : out std_logic;
        i_master_clk                    : in std_logic :='0'
   );
end adc_resampler;

architecture Behavioral of adc_resampler is
--Direct digital synthesis component
component dds_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_config_tvalid : IN STD_LOGIC;
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
end component;

--50MHz CLK for testing
component clk_wiz_0
port
 (
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

--500ns delay pulse
component pulse_width_gen
    Generic(
    width : integer := 100  
    );
  Port (
        i_master_clk : in std_logic := '0';
        i_trigger : in std_logic    := '0';
        o_pulse   : out std_logic   := '0'
   );
end component pulse_width_gen;

signal r_sample_size : integer range 65535 downto 0;
signal w_adc_busy : std_logic := '0';
signal r_run_sampler : std_logic := '0';
signal r_arm_sampler : std_logic := '0';
signal r_done : std_logic := '0';
signal r_acq : std_logic := '0';
signal r_reset : std_logic := '0';
signal r_pulse_500ns_trig : std_logic := '0';
signal r_pulse_500ns : std_logic := '0';
signal w_mclk : std_logic ;
--DDS signaler, unused
signal m_axis_config_tvalid : std_logic;
signal  m_axis_data_tvalid : std_logic;
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
signal r_run_adc_trigger : std_logic := '0';
signal r_adc_trig_done : std_logic := '0';
signal r_dds_clk_count : integer range 0 to 65535:= 0;
signal r_acquire_ack : std_logic := '0';
signal r_sampler_armed : std_logic := '0';
signal r_dds_mux_enable : std_logic := '0';

signal r_test_clk : std_logic := '0';


begin

--Direct Digital Synthesizer (DDS) instantiation.
sample_clk : dds_compiler_0
  PORT MAP (
    aclk => i_dds_clk_50MHz,
    s_axis_config_tvalid => s_axis_config_tvalid,
    s_axis_config_tdata => r_dds_frq_word,
    m_axis_data_tvalid => m_axis_data_tvalid,
    m_axis_data_tdata => m_axis_data_tdata
  );
--50MHz CLK for testing
--dds_50_MHz_clk : clk_wiz_0
--   port map ( 
--  -- Clock out ports  
--   clk_out1 => i_dds_clk_50MHz,
--   -- Clock in ports
--   clk_in1 => i_master_clk 
-- );
pulse_gen_500ns_delay : pulse_width_gen
    generic map (
        width => 500
        )
    port map(
        i_master_clk => i_master_clk,
        i_trigger => r_pulse_500ns_trig,
        o_pulse => r_pulse_500ns
    );
                

--DDS clk is MSb of m_axis_data_tdata
--DDS clock to local
--r_dds_clk <= m_axis_data_tdata(15);
--set frq word to DDS
--r_dds_frq_word(47 downto 0) <= i_sample_frq_high_int_mem_reg & i_sample_frq_low_int_mem_reg & x"0000";
r_dds_frq_word <= "000001010001111010111000010100011110111010011000";
--Get sample size
r_sample_size <= to_integer(unsigned(i_sample_size_int_mem_reg));
--local busy flag
w_adc_busy <= i_adc_control_busy;
--local acquire start
r_acq <= i_acquire_start_int_mem_reg(15); 
--local reset
r_reset <= i_reset_logic;
--local master clk
w_mclk <= i_master_clk;
--local acquire acknowledge
r_acquire_ack <= o_acquire_start_read_int_mem;

resampler : process (w_mclk, r_reset, s_resamp, r_arm_sampler, r_pulse_500ns_trig) is
begin
    if(r_reset = '1') then 
        s_resamp <= IDLE;
    elsif(rising_edge(w_mclk)) then
        case s_resamp is
            when IDLE =>
                if(r_arm_sampler = '1') then --Arm(500ns delay) and set busy flag
                    s_resamp <= ARM;
                    o_resampler_busy <= '1';
                else
                    o_resampler_busy <= '0';
                end if;
            when ARM =>
                if(r_pulse_500ns_trig = '0') then
                    s_resamp <= RUN;
                end if;
            when RUN =>
            if(r_adc_trig_done = '0') then
                r_run_adc_trigger <= '1';
            else
              s_resamp <= STOP;
            end if;
            when STOP   =>         
        end case;
    end if;
end process;

trig_adc_control : process (r_dds_clk, r_run_adc_trigger, r_dds_clk_count)is
begin
    if(rising_edge(r_dds_clk)) then
        if(r_run_adc_trigger = '1') then
            if(r_dds_clk_count < (r_sample_size + 1)) then -- needs +1 because BUFGMUX is 1 clk behind
                r_dds_mux_enable <= '1';
                r_dds_clk_count <= r_dds_clk_count + 1;
                r_adc_trig_done <= '0';
            else
                r_dds_mux_enable <= '0';
                r_dds_clk_count <= 0;
                r_adc_trig_done <= '1';
            end if;
        else
            r_adc_trig_done <= '0';
        end if;
    end if;
end process;

   dds_clk_mux : BUFGMUX
   port map (
      O => o_acquire_start_adc_control,   -- 1-bit output: Clock output
      I1 => r_dds_clk, -- 1-bit input: Clock input (S=0)
      I0 => r_test_clk, -- 1-bit input: Clock input (S=1)
      S => r_dds_mux_enable    -- 1-bit input: Clock select
   );

arm_sampler : process (r_arm_sampler, r_pulse_500ns, r_reset) is
begin
    if(r_arm_sampler = '1') then
        r_pulse_500ns_trig <= '1';
        r_sampler_armed <= '1';
    elsif(r_reset = '1') then
        r_pulse_500ns_trig <= '0';
    elsif(falling_edge(r_pulse_500ns)) then
        r_pulse_500ns_trig <= '0';
        r_sampler_armed <= '0';
    end if;
end process;

trigger_sampler_set_flags : process (i_master_clk, r_acq, r_done, r_reset, r_sampler_armed) is
begin
    if(rising_edge(i_master_clk)) then
        if(r_acq = '1') then
            r_arm_sampler <= '1';
        elsif(r_sampler_armed = '1') then
            r_arm_sampler <= '0';
        elsif(r_done = '1') then
            r_arm_sampler <= '0';
        elsif(r_reset = '1') then
            r_arm_sampler <= '0';
        end if;
    end if;
end process;

end Behavioral;
