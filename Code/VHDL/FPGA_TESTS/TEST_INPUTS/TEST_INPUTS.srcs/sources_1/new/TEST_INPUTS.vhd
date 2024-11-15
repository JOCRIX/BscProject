----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2024 09:42:27 PM
-- Design Name: 
-- Module Name: TEST_INPUTS - Behavioral
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

entity TEST_OUTPUTS is
  Port ( 
        LED_OUTPUTS    : out std_logic_vector(1 downto 0) := (others => '0');
        PMOD_INPUTS : in std_logic_vector(7 downto 0) := (others => '0');
        STD_INPUTS  : in std_logic_vector(43 downto 0) := (others => '0')
  );
end TEST_OUTPUTS;

architecture Behavioral of TEST_OUTPUTS is

begin

set_outs : process (PMOD_INPUTS, STD_INPUTS) is

begin
    if(STD_INPUTS(0) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
    elsif(STD_INPUTS(1) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
        elsif(STD_INPUTS(2) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(3) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(4) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(5) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(6) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(7) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(8) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(9) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(10) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(11) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(12) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(13) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(14) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(15) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(16) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(17) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(18) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(19) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(20) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(21) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(22) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(23) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
                    elsif(STD_INPUTS(24) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(25) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(26) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(27) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(28) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(29) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
                    elsif(STD_INPUTS(30) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(31) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(32) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(33) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(34) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(35) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
                    elsif(STD_INPUTS(36) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(37) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(38) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(39) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(40) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(41) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
                    elsif(STD_INPUTS(42) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(STD_INPUTS(43) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(PMOD_INPUTS(0) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(PMOD_INPUTS(1) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(PMOD_INPUTS(2) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(PMOD_INPUTS(3) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
                    elsif(PMOD_INPUTS(4) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(PMOD_INPUTS(5) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
            elsif(PMOD_INPUTS(6) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
                    elsif(PMOD_INPUTS(7) = '1') then
        LED_OUTPUTS(0) <= '1';
        LED_OUTPUTS(1) <= '1';
        else
                LED_OUTPUTS(0) <= '0';
        LED_OUTPUTS(1) <= '0';
    end if;
 
end process;

end Behavioral;
