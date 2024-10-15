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

-- Remember to check for Pullups / Pulldowns on unused IO pins during testing if some are left open!
-- You WILL have issues if you don't control their state when you leave them open.
-- I.e. you write to address "010" on the MCU because you only want to test with 3 pins, but you left PULLUPS activated 
-- On the remaining pins. You will write to an address you don't intend to and you will not realize it!! REMEMBER!!

entity internal_ram is
  Port (
        CLK         : in std_logic  := '0';
        RW          : in std_logic  := '0';
        FSM_RESET   :in std_logic := '0';
        TORAM : in std_logic_vector(15 downto 0) := (others => '0');
        TOPORT : out std_logic_vector(15 downto 0) := (others => '0')
        
   );
end internal_ram;

architecture Behavioral of internal_ram is

constant MAX_ADDRESS : integer := 31;
constant WRITE : std_logic := '0'; 
constant READ : std_logic := '1';

signal ADDRESS : integer range 0 to MAX_ADDRESS;

type BLOCKRAM is array(MAX_ADDRESS downto 0) of std_logic_vector(15 downto 0); 
signal RAM : BLOCKRAM := (others => (others => '0'));                          

type state_mem is (SET_ADDR, SET_DATA); 
signal state : state_mem := SET_ADDR; 

begin
memoryFSM : process (CLK, RW, ADDRESS, FSM_RESET) is
begin
    if(rising_edge(CLK)) then
        if(RW = READ) then         
            TOPORT <= RAM(ADDRESS);
            state <= SET_ADDR;
        elsif(RW = WRITE) then
            case state is 
               when SET_ADDR =>
                      if(to_integer(unsigned(TORAM)) <= MAX_ADDRESS) then
                      ADDRESS <= to_integer(unsigned(TORAM));
                      TOPORT <= (others => '0');
                      state <= SET_DATA;
                      end if;
                when SET_DATA =>
                      RAM(ADDRESS) <= TORAM;
                      state <= SET_ADDR;
               end case;
        end if;
    end if;
    if(FSM_RESET = '1') then  
        state <= SET_ADDR;   
    end if;
end process;


end Behavioral;














