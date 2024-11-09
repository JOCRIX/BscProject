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
        i_DATA : in std_logic_vector(7 downto 0);
        o_DATA : out std_logic_vector(7 downto 0);
        o_DATA_TO_ERAM : out std_logic_vector(7 downto 0);
        i_DATA_FR_ERAM : in std_logic_vector(7 downto 0);
        i_RnW : in std_logic := '0' ;
        i_ADDR : std_logic_vector(18 downto 0);
        i_RESET : std_logic;
        
        o_ADDR_TO_ERAM : out std_logic_vector(18 downto 0);
        i_EN : in std_logic := '0' ;
        i_CLK : in std_logic := '0';
        o_nCE : out std_logic := '0';
        o_nOE : out std_logic := '1';
        o_nWE : out std_logic := '1';
        
        o_IO_BUF_CTRL : out std_logic;
        o_ACTIVE : out std_logic := '0'
    );
end EXT_MEM_RW20;

architecture Behavioral of EXT_MEM_RW20 is

signal w_iDATA : std_logic_vector(7 downto 0);
signal w_oDATA : std_logic_vector(7 downto 0);
signal w_oADDR : std_logic_vector(18 downto 0);


constant READ : std_logic := '1';
constant WRITE : std_logic := '0';

constant RUN : std_logic := '1';
constant CMPLT : std_logic := '1';

signal count_u16 : natural range 0 to 65535 := 0;
signal w_RUN : std_logic := '0';
signal w_CMPLT : std_Logic := '0';
signal w_IDLE : std_logic := '0';

begin


w_iDATA <= i_DATA;
o_DATA <= w_oDATA;
o_ADDR_TO_ERAM <= w_oADDR;
o_nCE <= '0';
o_ACTIVE <= w_RUN or w_CMPLT;

Initialize : process(W_CMPLT, i_EN, i_RESET) is
begin
    if(w_CMPLT = CMPLT or i_RESET = '1') then
        w_RUN <= '0';
    elsif(rising_edge(i_EN)) then
        w_RUN <= RUN;
    end if;
end process;



ExtMem_Comm : process(w_RUN, i_CLK, i_RnW) is
    variable v_Count : natural range 0 to 65535 := 0;
begin
    if(rising_edge(i_CLK)) then
        if(w_RUN = RUN) then
            v_Count := v_Count +1;
            count_u16 <= V_Count;
            if(i_RnW = READ) then
                o_nOE <= '0';
                if(v_Count =2) then
                    o_IO_BUF_CTRL <= '1';
                elsif(v_Count = 3) then
                    w_oADDR <= i_ADDR;
                elsif(v_Count = 6) then
                    w_oDATA <= i_DATA_FR_ERAM;
                    w_CMPLT <= '1';
                else
                    w_IDLE <= '1';
                end if;
            else
                if(v_Count <= 1) then
                    w_oADDR <= i_ADDR;
                    o_nOE <= '1';
                    o_DATA_TO_ERAM <= w_iDATA;
                elsif(v_Count = 2) then
                    o_nWE <= '0';
                elsif(v_Count = 4) then
                    o_IO_BUF_CTRL <= '0';
                elsif(v_Count = 5) then
                    o_nWE <= '1';
                elsif(v_Count = 6) then
                    o_IO_BUF_CTRL <= '1';
                    w_CMPLT <= '1';
                else
                    w_IDLE <= '1';
                end if;
            end if;
        else
            w_IDLE <= '0';
            w_CMPLT <= '0';
            v_Count := 0;
        end if;
    end if;
end process;                    

end Behavioral;
