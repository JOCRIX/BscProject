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
        CLK         : in std_logic;
        RW          : in std_logic;
 --       ADDR_DATA   : in std_logic  := '0';
        TORAM : in std_logic_vector(15 downto 0);
        TOPORT : out std_logic_vector(15 downto 0)
        
   );
end internal_ram;

architecture Behavioral of internal_ram is

constant MAX_ADDRESS : integer := 31;
constant WRITE : std_logic := '0'; 
constant READ : std_logic := '1';


type BLOCKRAM is array(MAX_ADDRESS downto 0) of std_logic_vector(15 downto 0); --32x16 block ram type deklarering
signal RAM : BLOCKRAM := (others => (others => '0')); --Generer block ram som signal og nulstil, aka nu har vi noget ram at skrive/læse til/fra
signal test : std_logic := '0';
signal ADDRESS : integer range 0 to MAX_ADDRESS;

attribute KEEP: string;
attribute KEEP of RAM : signal is "true";
--type state_mem is (SET_ADDR, SET_DATA);
--signal state : state_mem := SET_ADDR; 

begin

memoryFSM : process (CLK, RW) is
begin
    if(rising_edge(CLK)) then
        if(RW = READ) then
            TOPORT <= RAM(ADDRESS);
        elsif(RW = WRITE) then
            if(test = '0') then
                if(to_integer(unsigned(TORAM)) <= MAX_ADDRESS) then
                    ADDRESS <= to_integer(unsigned(TORAM));
                    test <= '1';
                end if;
            elsif(test = '1') then
                RAM(ADDRESS) <= TORAM;
                test <= '0';
            end if;
        end if;
    end if;

--    if(rising_edge(CLK)) then
--        if (RW = READ) then
--            TOPORT <= RAM(ADDRESS);
--            state <= SET_ADDR;
--        elsif (RW = WRITE) then
--            case state is
--                when SET_ADDR =>
--                      if(to_integer(unsigned(TORAM)) <= MAX_ADDRESS) then
--                      ADDRESS <= to_integer(unsigned(TORAM));
--                      state <= SET_DATA;
--                      end if;
--                when SET_DATA =>
--                      RAM(ADDRESS) <= TORAM;
--                      state <= SET_ADDR;
--            end case;
--        end if;
--    end if;
end process;

end Behavioral;














