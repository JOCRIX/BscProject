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
    CLK : in std_logic := '0';     --CLK input from MCU
    IO_PINS : inout std_logic := 'Z'; 
    RW : in std_logic := '0';      --Read/Write Control
    TOPORT : in std_logic := '0';  --Data to be written to I/O pins
    TORAM : out std_logic := '0');
end comm_port;

architecture Behavioral of comm_port is

--State machine state declarations
type state_type is (IDLE, READ_RAM, WRITE_RAM, WAIT_STATE1, WAIT_STATE_W_1, WAIT_STATE_R_1);--, WRITE); -- ADDRESS_DATA); -- 3 states, do fuck-all, READ or WRITE.
signal state : state_type := IDLE; --Our state variable, default to IDLE.

begin

PORTCONTROLFSM : process (CLK, TOPORT)
begin 
    if(rising_edge(CLK)) then
        case state is
            when IDLE =>
                TORAM <= IO_PINS;
                IO_PINS <= 'Z';
                state <= WAIT_STATE1;
                
            when WAIT_STATE1 =>
                if(RW = '0') then
                    state <= WRITE_RAM;
                elsif (RW ='1') then
                    state <= WAIT_STATE_R_1;--READ_RAM; 
                end if;
                
            when WRITE_RAM =>
                TORAM <= IO_PINS;
                state <= WAIT_STATE_W_1;
                
            when WAIT_STATE_W_1 =>
                state <= IDLE;
            
            when READ_RAM =>
                if(TOPORT = '1') then 
                 IO_PINS <= 'Z'; --Set I/O pin into high-Z, pull-up resistor needed for '1'.
                 else
                 IO_PINS <= '0'; --Set I/O pin Low
                 end if;
                 --state <=WAIT_STATE_R_1;
                 state <= IDLE;
                 
            when WAIT_STATE_R_1 =>
                state <= READ_RAM;
                --state <= IDLE;      
        end case;
    end if;
end process;

--    PORTCONTROLFSM : process (CLK)
--    begin
--        if rising_edge(CLK) then
--            case state is
--                when IDLE =>
--                    IO_PINS <= 'Z';   -- Set IO_PINS to high-impedance
--                    if RW = '0' then  -- Check for Write operation
--                        state <= SEND_ADDRESS; -- Go to address sending state
--                    elsif RW = '1' then -- Check for Read operation
--                        state <= READ_DATA;    -- Go to read data state
--                    end if;

--                when SEND_ADDRESS =>
--                    TORAM <= IO_PINS;    -- Read address from IO_PINS
--                    IO_PINS <= 'Z';      -- Tri-state the IO_PINS
--                    state <= CONFIRM_ADDRESS;   -- Move to the confirm address state

--                when CONFIRM_ADDRESS =>
--                    -- Logic to confirm address can go here
--                    state <= SEND_DATA;   -- Move to the data sending state

--                when SEND_DATA =>
--                    TORAM <= IO_PINS;    -- Read data from IO_PINS
--                    IO_PINS <= 'Z';      -- Tri-state the IO_PINS
--                    state <= CONFIRM_DATA;   -- Move to the confirm data state

--                when CONFIRM_DATA =>
--                    -- Logic to confirm data can go here
--                    state <= IDLE;        -- Go back to IDLE

--                when READ_DATA =>
--                    -- Logic for reading data from RAM and sending it to TOPORT
--                    TOPORT <= TORAM;      -- Read from RAM (assuming TORAM holds the read data)
--                    IO_PINS <= 'Z';       -- Tri-state the IO_PINS
--                    state <= IDLE;        -- Go back to IDLE

--            end case;
--        end if;
--    end process;




--PORTCONTROLFSM : process (CLK, RW, TOPORT) -- State machine will switch states on each CLK
--begin
--    if(rising_edge(CLK)) then
--        case state is
--            when IDLE => --Idle, wait for clk
--                TORAM <= IO_PINS;
--                IO_PINS <= 'Z';      -- Default IO to High-Z
--                if(RW = '1') then
--                    state <= READ_RAM;
--                elsif(RW = '0') then
--                    state <= WRITE_RAM;
--                end if; 
--            when WRITE_RAM =>
--                TORAM <= IO_PINS;
--                state <= IDLE;
--            when READ_RAM =>
--                 if(TOPORT = '1') then 
--                 IO_PINS <= 'Z'; --Set I/O pin into high-Z, pull-up resistor needed for '1'.
--               else
--                 IO_PINS <= '0'; --Set I/O pin Low
--               end if;
--               state <= IDLE;
--        end case;
--    end if;

--end process;

end Behavioral;


--PORTCONTROLFSM : process (CLK) -- State machine will switch states on each CLK
--begin
--    if(rising_edge(CLK)) then
--        case state is
--            when IDLE =>
--                IO_PINS <= 'Z';      -- Default IO to High-Z
--                --TORAM <= IO_PINS;
--                if(RW = '1') then    --Set FSM to Read operation and send ADDRESS to memory
--                    state <= READ;
--                elsif(RW = '0') then -- Set FSM to Write Operation and send ADDRESS to memory
--                    state <= WRITE;
--                end if;
--            when READ =>            --Read from RAM and send to I/O
--                if(TOPORT = '1') then 
--                    IO_PINS <= 'Z'; --Set I/O pin into high-Z, pull-up resistor needed for '1'.
--                else
--                    IO_PINS <= '0'; --Set I/O pin L
--                end if;
--                state <= IDLE;
--            when WRITE =>
--                TORAM <= IO_PINS; 
--                state <= IDLE;      --Go back to High-Z.
--        end case;
--    end if;




