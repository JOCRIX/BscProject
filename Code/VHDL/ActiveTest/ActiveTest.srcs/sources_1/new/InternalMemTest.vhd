----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2024 00:39:22
-- Design Name: 
-- Module Name: InternalMemTest - Behavioral
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

entity InternalMemTest is
  Port (
        i_CLK_COMM        : in std_logic  := '0';
        i_RnW          : in std_logic  := '0';
        i_FSM_RESET   :in std_logic := '0';
        i_DATA_IO : in std_logic_vector(15 downto 0) := (others => '0');
        o_DATA_IO : out std_logic_vector(15 downto 0) := (others => '0');
        i_DATA_IVSA : in std_logic_vector(15 downto 0) := (others => '0');
        o_CLK_IVSA : out std_logic := '0';
        i_IX : in std_logic := '0'
   );
end InternalMemTest;

architecture Behavioral of InternalMemTest is

constant MAX_ADDR_u : natural range 0 to 65535 := 23;
constant WRITE : std_logic := '0';
constant READ : std_logic := '1';
constant INTERNAL : std_logic := '0';
constant EXTERNAL : std_logic := '1';

signal ADDR_u16 : natural range 0 to 65535 := 0;

signal w_DATA_IMEM : std_logic_vector(15 downto 0);
signal w_DATA_XMEM : std_logic_vector(15 downto 0);


type BLOCKRAM is array(MAX_ADDR_u downto 0) of std_logic_vector(15 downto 0); 
signal RAM : BLOCKRAM := (others => (others => '0'));                

type state_mem is (SET_ADDR, SET_DATA); 
signal state : state_mem := SET_ADDR; 

begin

o_DATA_IO <= w_DATA_IMEM or w_DATA_XMEM;

xmem : process (i_RnW, ADDR_u16, i_CLK_COMM, i_DATA_IVSA, i_IX) is
begin
    if((i_RnW = READ) and (i_IX = EXTERNAL)) then
        w_DATA_XMEM <= i_DATA_IVSA;
        o_CLK_IVSA <= I_CLK_COMM;
    else
        w_DATA_XMEM <= (others => '0');
        o_CLK_IVSA <= '0';
    end if;
end process;

int_ram : process(i_CLK_COMM, i_RnW, ADDR_u16, i_FSM_RESET, i_DATA_IO, i_IX) is
begin
    if(i_FSM_RESET = '1') then
        state <= SET_ADDR;
    elsif(rising_edge(i_CLK_COMM)) then
        if(i_IX = INTERNAL) then
            if((i_RnW = READ) and (ADDR_u16 <= MAX_ADDR_u)) then
                w_DATA_IMEM <= RAM(ADDR_u16);
                state <= SET_ADDR;
            elsif(i_RnW = WRITE) then
                w_DATA_IMEM <= (others => '0');
                ADDR_u16 <= to_integer(unsigned(i_DATA_IO));
                
                case state is
                    when SET_ADDR =>
                        if(to_integer(unsigned(i_DATA_IO)) <= MAX_ADDR_u) then
                            w_DATA_IMEM <= (others => '0');
                            state <= SET_DATA;
                        end if;
                    when SET_DATA =>
                        RAM(ADDR_u16) <= i_DATA_IO;
                        state <= SET_ADDR;
                end case;
            else
                w_DATA_IMEM <= (others => '0');
            end if;
        else
            w_DATA_IMEM <= (others => '0');
        end if;
    end if;
end process;

--memoryFSM : process (i_CLK_COMM, i_RnW, ADDR_u16, i_FSM_RESET) is
--begin
--    if(rising_edge(i_CLK_COMM)) then
--        if((i_RnW = READ) and (ADDR_u16 <= MAX_ADDR_u)) then         
--            o_DATA_IO <= RAM(ADDR_u16);
--            state <= SET_ADDR;
--        elsif(i_RnW = WRITE) then
--            case state is 
--               when SET_ADDR =>
--                      if(to_integer(unsigned(i_DATA_IO)) <= MAX_ADDR_u) then
--                      ADDR_u16 <= to_integer(unsigned(i_DATA_IO));
--                      o_DATA_IO <= (others => '0');
--                      state <= SET_DATA;
--                      end if;
--                when SET_DATA =>
--                      RAM(ADDR_u16) <= i_DATA_IO;
--                      state <= SET_ADDR;
--               end case;
--        end if;
--    end if;
--    if(i_FSM_RESET = '1') then  
--        state <= SET_ADDR;   
--    end if;
--end process;




end Behavioral;
