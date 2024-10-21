----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2024 13:25:44
-- Design Name: 
-- Module Name: read_write_repeat - Behavioral
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

entity read_write_repeat is
  Port (
        Trigger : in std_logic;
        MASTER_CLK : in std_logic;
        RAM_CLK : out std_logic
   );
end read_write_repeat;

architecture Behavioral of read_write_repeat is

constant NR_OF_CLKS : integer := 4;

type state_ram_clks is (CLK1, CLK2, CLK3, CLK4); 
signal s_clk : state_ram_clks := CLK1;

begin

generate_ram_clks : process (Trigger) is
variable count : integer := 0;
begin
    if(rising_edge(MASTER_CLK) and count /= 4) then
        count := count + 1;
        RAM_CLK <= MASTER_CLK;
    elsif(count = 4) then
        RAM_CLK <= '0';
        count := 0;
    end if;

end process;





end Behavioral;
