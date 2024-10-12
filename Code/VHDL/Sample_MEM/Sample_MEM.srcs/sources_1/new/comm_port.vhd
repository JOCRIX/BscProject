----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2024 04:30:05 PM
-- Design Name: 
-- Module Name: comm_port - Behavioral
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

--This is the output port (1 of 16 pins) for the RAM.
--The .vhd will synthesize a tri-state buffer w. open drain connection for output.
--Pull-Up required for logic '1' output.

--MCU should _always_ be in INPUT mode BEFORE setting RW = '1' to ensure no MCU pins are at logic '1' output.
--While comm_port is driving a pin to '0'.
entity comm_port is
  Port (
        RW          : in std_logic    := '0';
        TOPORT      : in std_logic    := '0';
        TORAM       : out std_logic   :='0';
        IO          : inout std_logic := 'Z'
        );
end comm_port;

architecture Behavioral of comm_port is

constant WRITE : std_logic := '0'; --Write to port
constant READ  : std_logic := '1'; --Read from port

begin

comm_port : process (RW, TOPORT, IO) is
begin
     if (RW = READ) then       --Write from RAM to I/O pins (MCU is reading from RAM)
        if (TOPORT = '1') then --A logic '1' on the port is the output going High-Z
            IO <= 'Z';         --The I/O port requires pull-up resistor to produce a logic '1'.
        else
            IO <= '0';         --Actively pulls I/O pin low.
        end if;
     elsif (RW = WRITE) then   --Write to RAM from I/O pins. (MCU wants to write to RAM)
        TORAM <= IO;    
    end if;
end process;

end Behavioral;





