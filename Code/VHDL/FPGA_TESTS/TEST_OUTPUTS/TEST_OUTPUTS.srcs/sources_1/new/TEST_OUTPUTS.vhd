----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2024 09:16:32 PM
-- Design Name: 
-- Module Name: TEST_OUTPUTS - Behavioral
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
        BTN_INPUT    : in std_logic_vector(1 downto 0) := (others => '0');
        PMOD_OUTPUTS : out std_logic_vector(7 downto 0) := (others => '0');
        STD_OUTPUTS  : out std_logic_vector(43 downto 0) := (others => '0')
  );
end TEST_OUTPUTS;

architecture Behavioral of TEST_OUTPUTS is

begin

set_outs : process (BTN_INPUT) is
begin
    if(BTN_INPUT(0) = '1' or BTN_INPUT(1) = '1') then
        STD_OUTPUTS <= (others => '1');
        PMOD_OUTPUTS <= (others => '1');
    else
        STD_OUTPUTS <= (others => '0');
        PMOD_OUTPUTS <= (others => '0');
    end if;
end process;

end Behavioral;
