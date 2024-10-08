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
    CLK : in std_logic;
    IO_PINS : inout std_logic;
    RW : in std_logic;
    TOPORT : in std_logic;
    TORAM : out std_logic
   );
end io_port;

architecture Behavioral of io_port is

signal stage_read : integer range 0 to 1 := 0;
signal stage_write : integer range 0 to 1 := 0;
constant WRITE : std_logic := '0';
constant READ : std_logic := '1';

begin

READFROMRAM : process (RW, TOPORT, IO_PINS, CLK, stage_read) is
begin
    if(RW = READ and stage_read = 0) then
       IO_PINS <= 'Z';
        if(rising_edge(CLK)) then
        TORAM <= IO_PINS;
        end if;
        if(falling_edge(CLK)) then
        stage_read <= 1;
        end if;
        
     elsif (RW = READ and stage_read = 1) then
       
       if(rising_edge(CLK)) then
        if(TOPORT ='1') then
        IO_PINS <= 'Z';
        else
        IO_PINS <= '0';
        end if;
        end if;
       if (falling_edge(CLK)) then
        stage_read <= 0;
        end if;
      end if;
end process;


WRITETORAM : process (RW, TOPORT, IO_PINS, CLK, stage_write) is
begin
    if(RW = WRITE and stage_write = 0) then
        IO_PINS <= 'Z';
        if(rising_edge(CLK)) then
        TORAM <= IO_PINS;
        end if;
        if(falling_edge(CLK)) then
        stage_write <= 1;
        end if;
    elsif(RW = WRITE and stage_write = 1) then
        if(rising_edge(CLK)) then
        TORAM <= IO_PINS;
        end if;
        if(falling_edge(CLK)) then
        stage_write <= 0;
        end if;
    end if;
end process;

    
end Behavioral;

--DATABUS : process (RW, RAMTOPORT, IO_PINS, stage) is
--begin
--    if(RW = '1') then
--        if(RAMTOPORT = '1') then
--            IO_PINS <= 'Z';
--        else
--            IO_PINS <= '0';
--        end if;
--        else
--     PORTTORAM <= IO_PINS;
--    end if;
--end process;






















