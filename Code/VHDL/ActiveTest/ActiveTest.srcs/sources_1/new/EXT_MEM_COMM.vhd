----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2024 16:42:03
-- Design Name: 
-- Module Name: IV_SAMPLE_CTRL - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EXT_MEM_COMM is
    Port ( 
            i_CLK : in std_logic := '0';
            o_CLK : out std_logic := '0';
            i_DATA : in std_logic_vector(15 downto 0) := (others => '0');
            o_DATA : out std_logic_vector (15 downto 0) := (others => '0');
            o_ADDR : out std_logic_vector (15 downto 0) := (others => '0');
            i_RESET : in std_logic := '0'
            );
end EXT_MEM_COMM;

architecture Behavioral of EXT_MEM_COMM is

signal r_ADDR_COUNT_u32 : integer range 0 to 65535 := 0;

begin

o_CLK <= i_CLK;
o_DATA <= i_DATA;
o_ADDR <= std_logic_vector(to_unsigned(r_ADDR_COUNT_u32, o_ADDR'length));

SET_ADDR : process(i_CLK, i_RESET) is
begin
    if(i_RESET = '1') then
        r_ADDR_COUNT_u32 <= 0;
    elsif(falling_edge(i_CLK)) then
        r_ADDR_COUNT_u32 <= r_ADDR_COUNT_u32+1;
    end if;

end process;


end Behavioral;
