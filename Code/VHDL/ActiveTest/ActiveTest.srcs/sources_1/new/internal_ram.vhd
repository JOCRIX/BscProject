----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2024 16:42:03
-- Design Name: 
-- Module Name: IV_SAMPLE_CTRL - Behavioral
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
            i_CLK : in std_logic := '0';
            i_RnW : in std_logic := '0';
            i_FSM_RESET : in std_logic := '0';
            i_TORAM : in std_logic_vector(15 downto 0) := (others => '0');
            o_TOPORT : out std_logic_vector(15 downto 0) := (others => '0');
            i_DATA_FROM_IVSA : in std_logic_vector(15 downto 0) := (others => '0');
            o_ADDR_TO_IVSA : out std_logic_vector(15 downto 0) := (others => '0');
            o_CLK_TO_IVSA : out std_logic := '0'
            );
end internal_ram;

architecture Behavioral of internal_ram is

constant MAX_ADDR_u : integer range 0 to 65535 := 23;
constant WRITE : std_logic := '0';
constant READ : std_logic := '1';

signal ADDR_u16 : integer range 0 to 65535 := 0;
signal w_DATA_IVSA : std_logic_vector(15 downto 0) := (others => '0');
signal w_DATA_EXT_MEM : std_logic_vector(15 downto 0) := (others => '0');
signal w_DATA_INT_MEM : std_logic_vector(15 downto 0) := (others => '0');

type BLOCKRAM is array(MAX_ADDR_u downto 0) of std_logic_vector(15 downto 0); 
signal RAM : BLOCKRAM := (others => (others => '0'));                

type state_mem is (SET_ADDR, SET_DATA); 
signal state : state_mem := SET_ADDR; 


begin

o_TOPORT <= w_DATA_EXT_MEM or w_DATA_INT_MEM;

FETCH_EXT_MEM_DATA : process(i_RnW, ADDR_u16, i_CLK, i_DATA_FROM_IVSA) is
begin 
    if((i_RnW = READ) and (ADDR_u16 > MAX_ADDR_u)) then
        w_DATA_EXT_MEM <= i_DATA_FROM_IVSA;
        o_CLK_TO_IVSA <= i_CLK;
    else
        w_DATA_EXT_MEM <= (others => '0');
        o_CLK_TO_IVSA <= '0';
    end if;
end process;

int_ram : process(i_CLK, i_RnW, ADDR_u16, i_FSM_RESET) is
begin
    if(rising_edge(i_CLK)) then
        if((i_RnW = READ) and (ADDR_u16 <= MAX_ADDR_u)) then
            w_DATA_INT_MEM <= RAM(ADDR_u16);
            state <= SET_ADDR;
        elsif(i_RnW = WRITE) then
            w_DATA_INT_MEM <= (others => '0');
            ADDR_u16 <= to_integer(unsigned(i_TORAM));
            o_ADDR_TO_IVSA <= i_TORAM;
            case state is
                when SET_ADDR =>
--                    w_DATA_INT_MEM <= (others => '0');
--                    ADDR_u16 <= to_integer(unsigned(i_TORAM));
--                    o_ADDR_TO_IVSA <= i_TORAM;
                    if(to_integer(unsigned(i_TORAM)) <= MAX_ADDR_u) then
                        w_DATA_INT_MEM <= (others => '0');
                        state <= SET_DATA;
                    end if;
                when SET_DATA =>
                    RAM(ADDR_u16) <= i_TORAM;
                    state <= SET_ADDR;
            end case;
        else
            w_DATA_INT_MEM <= (others => '0');
        end if;
    end if; 
    if(i_FSM_RESET = '1') then
        state <= SET_ADDR;
    end if;
end process;


end Behavioral;
