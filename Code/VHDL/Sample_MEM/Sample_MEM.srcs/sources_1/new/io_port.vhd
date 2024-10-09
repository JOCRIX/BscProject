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

signal stage : integer range 0 to 1 := 0;

constant WRITE : std_logic := '0';
constant READ : std_logic := '1';

begin

PORTCONTROL : process (RW, TOPORT, IO_PINS, CLK, stage) is
begin
    --Default all IO_PINS to high-Z state
    IO_PINS <= 'Z';
    --Read From Ram, Write to Port Operation
    if (RW = READ) then
        if(stage = 0) then
            if (rising_edge(CLK)) then
                TORAM <= IO_PINS;
            end if;
            if (falling_edge(CLK)) then
                stage <= 1;
            end if;
        elsif(stage = 1) then --Drive IO_PINS with TOPORT data from RAM.
            if (rising_edge(CLK)) then
                if(TOPORT = '1') then --IO_PIN should remain high-Z if data = 1, pull-up required to write 1.
                    IO_PINS <= 'Z'; 
                else --Active drive low if data = 0.
                    IO_PINS <= '0';
                end if;
            end if;
            if (falling_edge(CLK)) then --Reset to step 1 for new operation.
                stage <= 0;
            end if;
        end if;
    --Write to Ram, Read from Port Operation
    elsif (RW = WRITE) then
        if (stage = 0) then
            IO_PINS <= 'Z'; -- Default IO_PIN to high-Z.
            if(rising_edge(CLK)) then --Clock ADDR into ram on first rising edge
                TORAM <= IO_PINS;
            end if;
            if(falling_edge(CLK)) then --Step 0 complete, initiate step 1 on next rising edge
                stage <= 1;
            end if;
        elsif(stage = 1) then
            if(rising_edge(CLK)) then --Clock DATA into RAM on second rising edge
                TORAM <= IO_PINS;
            end if;
            if(falling_edge(CLK)) then --Step 1 complete, reset to step 0 for new operation.
            stage <= 0;
            end if;
        end if;
    end if;

end process;


--READFROMRAM : process (RW, TOPORT, IO_PINS, CLK, stage_read) is
--begin
--    if(RW = READ and stage_read = 0) then
--       IO_PINS <= 'Z';
--        if(rising_edge(CLK)) then
--            TORAM <= IO_PINS;
--        end if;
--        if(falling_edge(CLK)) then
--            stage_read <= 1;
--        end if;
        
--     elsif (RW = READ and stage_read = 1) then
       
--       if(rising_edge(CLK)) then
--        if(TOPORT ='1') then
--            IO_PINS <= 'Z';
--         else
--            IO_PINS <= '0';
--         end if;
--        end if;
--       if (falling_edge(CLK)) then
--        stage_read <= 0;
--        end if;
--      end if;
--end process;

--WRITETORAM : process (RW, TOPORT, IO_PINS, CLK, stage_write) is
--begin
--    if(RW = WRITE and stage_write = 0) then
--        IO_PINS <= 'Z';
--        if(rising_edge(CLK)) then
--        TORAM <= IO_PINS;
--        end if;
--        if(falling_edge(CLK)) then
--        stage_write <= 1;
--        end if;
--    elsif(RW = WRITE and stage_write = 1) then
--        if(rising_edge(CLK)) then
--        TORAM <= IO_PINS;
--        end if;
--        if(falling_edge(CLK)) then
--        stage_write <= 0;
--        end if;
--    end if;
--end process;

    
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






















