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

--The communication port between FPGA and MCU has been implemented as a Finite State Machine (FSM)

entity comm_port is
  Port (
        RW          : in std_logic    := '0';
        TOPORT      : in std_logic    := '0';
        TORAM       : out std_logic   := '0';
        IO          : inout std_logic := 'Z'
        );
end comm_port;

architecture Behavioral of comm_port is

constant WRITE : std_logic := '0'; --Write to port
constant READ  : std_logic := '1'; --Read from port

begin


--	IO <= TOPORT when RW = '1' else 'Z';
--	TORAM <= IO;

--IO <= 'Z' when TOPORT = '1' and RW = '1' else '0';

TORAM <= IO; 

comm_port : process (RW, TOPORT, IO) is
begin
     if (RW = READ) then --Write from RAM To IO PINS (MCU is reading from RAM)
        --TORAM <= IO;
        if (TOPORT = '1') then
            IO <= 'Z';
        else
            IO <= '0';
        end if;
     else --(RW = WRITE) then --Write to RAM from IO PINS (MCU wants to write to RAM)
        IO <= 'Z'; 
    end if;
end process;

end Behavioral;





