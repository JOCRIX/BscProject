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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adc_resampler is
  Port (
        i_acquire_start_int_mem_reg     : std_logic_vector(15 downto 0) := (others => '0'); --MSb controls the start
        i_sample_frq_high_int_mem_reg   : std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_frq_low_int_mem_reg    : std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_size_int_mem_reg       : std_logic_vector(15 downto 0) := x"4E20"; --Default sample zie = 20000. May need to remove this when int mem is connected
        i_adc_control_busy              : std_logic := '0';
        o_iv_arm                        : std_logic := '0';
        o_acquire_adc_control_start     : std_logic := '0';
        i_reset_logic                   : std_logic := '0';
        i_master_clk                    : std_logic :='0'
   );
end adc_resampler;

architecture Behavioral of adc_resampler is

--Direct Digital Synthesizer (DDS) instantiation.


signal r_sample_frq : std_logic_vector(31 downto 0 );
signal r_sample_size : integer range 65535 downto 0;
signal w_adc_busy : std_logic := '0';
signal r_run_sampler : std_logic := '0';
signal r_done : std_logic := '0';
signal r_acq : std_logic := '0';
signal r_reset : std_logic := '0';

begin
--Get sample frequency
r_sample_frq <= i_sample_frq_high_int_mem_reg & i_sample_frq_low_int_mem_reg; 
--Get sample size
r_sample_size <= to_integer(unsigned(i_sample_size_int_mem_reg));
--local busy flag
w_adc_busy <= i_adc_control_busy;
--local acquire start
r_acq <= i_acquire_start_int_mem_reg(15); 
--local reset
r_reset <= i_reset_logic;

run_flags_sampler : process (i_master_clk, r_acq, r_done, r_reset) is
begin
if(r_reset = '1') then
    r_run_sampler <= '0';
elsif(rising_edge(i_master_clk)) then
    if(r_acq = '1') then
        r_run_sampler <= '1';
    elsif(r_done = '1') then
        r_run_sampler <= '0';
    else
        r_run_sampler <= '0';
    end if;
end if;



end process;

end Behavioral;
