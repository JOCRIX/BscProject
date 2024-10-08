----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2024 14:31:03
-- Design Name: 
-- Module Name: internal_ram - Behavioral
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

entity internal_ram is
  Port (
        CLK : in std_logic;
        RW : in std_logic;
        DATAIN : in std_logic_vector(15 downto 0);
        DATAOUT : out std_logic_vector(15 downto 0)
   );
end internal_ram;

architecture Behavioral of internal_ram is
type BLOCKRAM is array(23 downto 0) of std_logic_vector(15 downto 0); --24x16 block ram type deklarering
signal RAM : BLOCKRAM := (others => (others => '0')); --Generer block ram som signal og nulstil, aka nu har vi noget ram at skrive/læse til/fra

signal ADDRBUF : integer range 0 to 23;

constant WRITE : std_logic := '0'; --Vi kan bruge WRITE/READ som kontrol ord i koden.
constant READ : std_logic := '1';

begin
MemoryControl : process (CLK, RW, DATAIN) is
    begin
    if(rising_edge(CLK)) then
      ADDRBUF <= to_integer(unsigned(DATAIN));
    end if;
    if(falling_edge(CLK)) then
        if(RW = READ)then
        DATAOUT <= RAM(ADDRBUF);
        ADDRBUF <= 0;
        elsif (RW = WRITE) then
        RAM(ADDRBUF) <= DATAIN;
        ADDRBUF <= 0;
        end if;
    end if;
end process;



end Behavioral;














