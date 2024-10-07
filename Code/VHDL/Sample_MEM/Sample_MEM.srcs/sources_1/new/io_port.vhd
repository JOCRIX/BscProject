----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2024 14:40:58
-- Design Name: 
-- Module Name: io_port - Behavioral
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

entity io_port is
  Port (
    IO_PINS : inout std_logic_vector(15 downto 0);
    RW : in std_logic;
    DATAIN : in std_logic;
    DATAOUT : out std_logic;
    CLK_IN : in std_logic;
    CLK_OUT : out std_logic
   )
end io_port;

architecture Behavioral of io_port is

begin
CLK_OUT <= CLK_IN;

DATABUS : process (RW, DATAIN, DATAOUT) is
begin
    if(RW = '1') then
        if(DATAIN = '1') then
            IO_PINS <= 'Z';
        else
            IO_PINS <= '0';
        end if;
        else
     DATAOUT <= IO_PINS;
    end if;
end process;
    
end Behavioral;
