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
        TORAM : in std_logic_vector(15 downto 0);
        TOPORT : out std_logic_vector(15 downto 0)
   );
end internal_ram;

architecture Behavioral of internal_ram is
type BLOCKRAM is array(23 downto 0) of std_logic_vector(15 downto 0); --24x16 block ram type deklarering
signal RAM : BLOCKRAM := (others => (others => '0')); --Generer block ram som signal og nulstil, aka nu har vi noget ram at skrive/læse til/fra


signal ADDRBUF_READ : integer range 0 to 23;
signal ADDRBUF_WRITE : integer range 0 to 23;

signal stage_readmem : integer range 0 to 1 := 0;
signal stage_writemem : integer range 0 to 1 := 0;

constant WRITE : std_logic := '0'; --Vi kan bruge WRITE/READ som kontrol ord i koden.
constant READ : std_logic := '1';

begin

READMEMORY : process (CLK, RW, TORAM, stage_readmem) is
begin
    if(rising_edge(clk)) then
        if (RW = READ) then
            if(stage_readmem = 0) then
                --On rising edge save TORAM address in ADDRBUF
                ADDRBUF_READ <= to_integer(unsigned(TORAM));
                --Change stage to 1.
                stage_readmem <= 1;
                elsif(stage_readmem = 1) then
                --On rising edge, get data from RAM using ADDRBUF 
                TOPORT <= RAM(ADDRBUF_READ);
                --reset stage to 0.
                stage_readmem <= 0;
            end if;
        end if;
    end if;
end process;

WRITEMEMORY : process (CLK, RW, TORAM, stage_writemem) is
begin
    if(rising_edge(clk)) then
        if(RW = WRITE) then
            if(stage_writemem = 0) then
            ADDRBUF_WRITE <= to_integer(unsigned(TORAM));
            stage_writemem <= 1;
            elsif(stage_writemem = 1) then
            RAM(ADDRBUF_WRITE) <= TORAM;
            stage_writemem <= 0;
            end if;
        end if;
    end if;

end process;

end Behavioral;














