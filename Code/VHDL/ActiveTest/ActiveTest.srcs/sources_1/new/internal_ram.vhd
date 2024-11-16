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
        i_MASTER_CLK : in std_logic;
        i_CLK_IXMUX         : in std_logic  := '0';
        i_RnW          : in std_logic  := '0';
        i_FSM_RESET   :in std_logic := '0';
        i_DATA_IXMUX : in std_logic_vector(15 downto 0) := (others => '0');
        o_DATA_IXMUX : out std_logic_vector(15 downto 0) := (others => '0');
        
        o_REGISTER_2 : out std_logic_vector(15 downto 0);
        o_REGISTER_3 : out std_logic_vector(15 downto 0);
        o_REGISTER_4 : out std_logic_vector(15 downto 0) := (others => '0');
        o_REGISTER_5 : out std_logic_vector(15 downto 0) := x"00FF";
        o_REGISTER_6 : out std_logic_vector(15 downto 0);
        o_REGISTER_7 : out std_logic_vector(15 downto 0);
        o_REGISTER_23 : out std_logic_vector(15 downto 0) := x"0064"
   );
end internal_ram;

architecture Behavioral of internal_ram is

constant MAX_ADDRESS : integer := 31;
constant WRITE : std_logic := '0'; 
constant READ : std_logic := '1';
constant internal : std_logic := '0';
constant external : std_logic := '1';

signal r_ADDRESS : integer range 0 to MAX_ADDRESS;

type BLOCKRAM is array(MAX_ADDRESS downto 0) of std_logic_vector(15 downto 0); 
signal RAM : BLOCKRAM := (others => (others => '0'));                          

type state_mem is (SET_ADDR, SET_DATA); 
signal state : state_mem := SET_ADDR; 

begin
memoryFSM : process (i_CLK_IXMUX, i_RnW, r_ADDRESS, i_FSM_RESET) is
begin
    if(i_FSM_RESET = '1')then
        state <= SET_ADDR;
    elsif(rising_edge(i_CLK_IXMUX)) then
        if(RAM(7) = x"8000") then
            RAM(7) <= x"0000";
        end if;
            if((i_RnW = READ) and (r_ADDRESS <= MAX_ADDRESS)) then         
                o_DATA_IXMUX <= RAM(r_ADDRESS);
                state <= SET_ADDR;
            elsif(i_RnW = WRITE) then
                case state is 
                   when SET_ADDR =>
                          if(to_integer(unsigned(i_DATA_IXMUX)) <= MAX_ADDRESS) then
                          r_ADDRESS <= to_integer(unsigned(i_DATA_IXMUX));
                          o_DATA_IXMUX <= (others => '0');
                          state <= SET_DATA;
                          end if;
                    when SET_DATA =>
                          RAM(r_ADDRESS) <= i_DATA_IXMUX;
                          state <= SET_ADDR;
                   end case;
            end if;
        end if;
end process;

Update_Registers : process (i_MASTER_CLK) is
begin
    if(rising_edge(i_MASTER_CLK)) then
        o_REGISTER_2 <= RAM(2);
        o_REGISTER_3 <= RAM(3);
        o_REGISTER_4 <= RAM(4);
        o_REGISTER_5 <= RAM(5);
        o_REGISTER_6 <= RAM(6);
        o_REGISTER_7 <= RAM(7);
        o_REGISTER_23 <= RAM(23);
    end if;
end process;

end Behavioral;