----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2024 16:56:34
-- Design Name: 
-- Module Name: MASTER - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MASTER is
    Port (
        o_DDS_CLK : out std_logic := '0';
        o_DnB : out std_logic := '1';
        o_ADC_TRIG : out std_logic := '0';
        o_TRIG : out std_logic := '0';
        i_TRIG : in std_logic := '0';
        i_REF_CLK : in std_logic := '0';
        o_DAC_CLK : out std_logic;
        i_RESET : in std_logic := '0'
    );
end MASTER;

architecture Behavioral of MASTER is

component DAC_PRESCALER is
    Port ( 
           i_CLK : in STD_LOGIC; --The clock input, this is divided down by two to generate the DAC and DDS clocks. 100 MHz for 50 MHz DAC opperation.
           o_CLK_DDS : out STD_LOGIC; -- The diveded down clock for the DDS.
           o_CLK_DAC : out STD_LOGIC -- The clock for the DAC, a delayed version of the DDS clock.
           );
end component;

component adc_resampler is
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
end component;


component clk_wiz_1
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

signal w_GRANDMASTER_CLK : std_logic;
signal w_DDS_CLK : std_logic;

signal w_FWORD_Lo : std_logic_vector(15 downto 0) := "1011100001010001";
signal w_FWORD_Hi : std_logic_vector(15 downto 0) := "0000010100011110";
signal w_SSIZE : std_logic_vector(15 downto 0) := x"01F4";
signal w_acq : std_logic_vector(15 downto 0) := (others => '0');

begin

w_acq(15) <= i_TRIG;
o_TRIG <= i_TRIG;
o_DDS_CLK <= w_DDS_CLK;


PLL1 : clk_wiz_1
   port map ( 
  -- Clock out ports  
   clk_out1 => w_GRANDMASTER_CLK,
   -- Clock in ports
   clk_in1 => i_REF_CLK
 );

Prescaler : DAC_PRESCALER
    Port map ( 
           i_CLK => w_GRANDMASTER_CLK, --The clock input, this is divided down by two to generate the DAC and DDS clocks. 100 MHz for 50 MHz DAC opperation.
           o_CLK_DDS => w_DDS_CLK,-- The diveded down clock for the DDS.
           o_CLK_DAC => o_DAC_CLK -- The clock for the DAC, a delayed version of the DDS clock.
           );
    
        
        
RSMPL : adc_resampler
  Port map (
        i_acquire_start_int_mem_reg => w_acq, --MSb controls the start
        --i_acquire_start_int_mem_reg => i_TRIG,
        --o_acquire_start_read_int_mem    : in std_logic := '0';
        i_sample_frq_high_int_mem_reg => w_FWORD_Hi,--remove default later
        i_sample_frq_low_int_mem_reg => w_FWORD_Lo, --remove default later
        i_sample_size_int_mem_reg => w_SSIZE,--x"4E20"; --Default sample zie = 20000. May need to remove this when int mem is connected
        o_resampler_DnBusy => o_DnB,
        o_acquire_start_adc_control => o_ADC_TRIG,
        i_reset_logic => i_RESET,
        i_dds_clk_50MHz => w_DDS_CLK,
        i_master_clk => w_GRANDMASTER_CLK
   );


end Behavioral;
