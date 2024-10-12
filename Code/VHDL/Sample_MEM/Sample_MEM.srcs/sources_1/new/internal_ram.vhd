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
        CLK         : in std_logic  := '0';
        RW          : in std_logic  := '0';
        TORAM : in std_logic_vector(15 downto 0);    
        TOPORT : out std_logic_vector(15 downto 0) := (others => '0')
        
   );
end internal_ram;

architecture Behavioral of internal_ram is

constant MAX_ADDRESS : integer := 31;
constant WRITE : std_logic := '0'; 
constant READ : std_logic := '1';


type BLOCKRAM is array(MAX_ADDRESS downto 0) of std_logic_vector(15 downto 0); --32x16 block ram type deklarering
signal RAM : BLOCKRAM := (others => (others => '0')); --Generer block ram som signal og nulstil, aka nu har vi noget ram at skrive/læse til/fra

signal ADDRESS : integer range 0 to MAX_ADDRESS;

type m_state is (SET_ADDR, SET_DATA);
signal state : m_state; 


begin

memoryFSM : process (CLK, RW) is
begin

    if (rising_edge(CLK)) then
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
end process;

end Behavioral;



--memoryFSM : process (CLK, RW) is
--begin
--    if(RW = READ) then
--        if(rising_edge(CLK)) then
--            TOPORT <= RAM(ADDRESS);
--            state <= SET_ADDR;
--        end if;
--     elsif(RW = WRITE) then
--        if(rising_edge(CLK)) then
--            case state is
--                when SET_ADDR =>
--                      if(to_integer(unsigned(TORAM)) <= MAX_ADDRESS) then
--                      ADDRESS <= to_integer(unsigned(TORAM));
--                      TOPORT <= (others => '0'); 
--                      state <= SET_DATA;         
--                      end if;                    
--                when SET_DATA =>                 
--                      RAM(ADDRESS) <= TORAM;
--                      state <= SET_ADDR;
--            end case;
--        end if;
--    end if;
--end process;










