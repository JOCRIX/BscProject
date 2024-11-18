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
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
use UNISIM.vcomponents.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IX_MUX is
    Port ( 
            i_MASTER_CLK : in std_logic;
            i_CLK : in std_logic := '0';
            o_CLK_IVSA : out std_logic := '0';
            o_CLK_IMEM : out std_logic := '0';
            i_DATA_IO : in std_logic_vector(15 downto 0) := (others => '0');
            o_DATA_IO : out std_logic_vector (15 downto 0) := (others => '0');
            i_DATA_IVSA : in std_logic_vector(15 downto 0) := (others => '0');
            i_DATA_IMEM : in std_logic_vector(15 downto 0) := (others => '0');
            o_DATA_IMEM : out std_logic_vector(15 downto 0) := (others => '0');
            i_IX : in std_logic := '0'

            );
end IX_MUX;

architecture Behavioral of IX_MUX is

constant internal : std_logic := '0';
constant external : std_logic := '1';

signal w_IX_n : std_logic;

begin

w_IX_n <= not i_IX;

--IMEM_CLK_MUX : BUFGCE 
--port map (
--    O => o_CLK_IMEM,
--    CE => w_IX_n,
--    I => i_CLK
--    );
    
--XMEM_CLK_MUX : BUFGCE 
--port map (
--    O => o_CLK_IVSA,
--    CE =>i_IX,
--    I => i_CLK
--    );

XMEM_CLK_MUX : process(i_MASTER_CLK) is
begin
    if(rising_edge(i_MASTER_CLK)) then
        if(i_IX = EXTERNAL) then
            o_CLK_IVSA <= i_CLK;
        else
            o_CLK_IVSA <= '0';
        end if;
    end if;
end process;

IMEM_CLK_MUX : process(i_MASTER_CLK) is
begin
    if(rising_edge(i_MASTER_CLK)) then
        if(i_IX = INTERNAL) then
            o_CLK_IMEM <= i_CLK;
        else
            o_CLK_IMEM <= '0';
        end if;
    end if;
end process;


o_DATA_IO_MUX : process(i_IX, i_DATA_IMEM, i_DATA_IVSA) is
begin
    case i_IX is
        when INTERNAL =>
            o_DATA_IO <= i_DATA_IMEM;
        when EXTERNAL =>
            o_DATA_IO <= i_DATA_IVSA;
    end case;
end process;

o_DATA_IMEM_MUX :  process(i_IX, i_DATA_IO) is
begin
    case i_IX is
        when INTERNAL =>
            o_DATA_IMEM <= i_DATA_IO;
        when EXTERNAL =>
            o_DATA_IMEM <= (others => '0');
    end case;
end process;


end Behavioral;
