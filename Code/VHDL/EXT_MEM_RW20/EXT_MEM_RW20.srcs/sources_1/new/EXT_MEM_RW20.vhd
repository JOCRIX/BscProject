----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2024 16:10:36
-- Design Name: 
-- Module Name: EXT_MEM_RW20 - Behavioral
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

entity EXT_MEM_RW20 is
    Port (
        i_DATA : in std_logic_vector(15 downto 0);
        o_DATA : out std_logic_vector(15 downto 0);
        o_DATA_TO_ERAM : out std_logic_vector(7 downto 0);
        i_DATA_FR_ERAM : in std_logic_vector(7 downto 0);
        i_WnR : in std_logic;
        i_ADDR : std_logic_vector(15 downto 0);
        
        o_ADDR_TO_ERAM : out std_logic_vector(18 downto 0);
        i_EN : in std_logic;
        i_CLK : in std_logic;
        o_nCE : out std_logic;
        o_nOE : out std_logic;
        o_nWE : out std_logic;
        
        o_IO_BUF_CTRL : out std_logic 
    
    );
end EXT_MEM_RW20;

architecture Behavioral of EXT_MEM_RW20 is

signal w_iDATA : std_logic_vector(7 downto 0);
signal w_oDATA : std_logic_vector(7 downto 0);

constant c_READ : std_logic := '0';
constant c_WRITE : std_logic := '1';

constant c_RUN : std_logic := '1';
constant c_CMPLT : std_logic := '1';

signal count_u16 : natural range 0 to 65535 := 0;
signal w_RUN : std_logic := '0';
signal w_CMPLT : std_Logic := '0';

begin

w_iDATA <= i_DATA(7 downto 0);
o_DATA <= w_oDATA(7 downto 0);

Initialize : process(W_CMPLT, i_EN) is
begin
    if(w_CMPLT = c_CMPLT) then
        w_RUN <= '0';
    elsif(rising_edge(i_EN)) then
        w_RUN <= '1';
    end if;
end process;






end Behavioral;
