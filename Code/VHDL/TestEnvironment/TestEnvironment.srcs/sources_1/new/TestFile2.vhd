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

entity TestFile2 is
    Port ( 
            i_XCO : in std_logic := '0';
            i_ADC_RDY : in std_logic := '0'
            );
end TestFile2;

architecture Behavioral of TestFile2 is

    signal w_ADC_DATA_SIM : std_logic_vector(15 downto 0) := x"AAAA";
    
    signal count : integer range 0 to 20000 := 24;
    signal trigger : std_logic := '0';
    signal startCount : std_logic := '0';
    
    signal count2 : integer range 0 to 10000 := 0;
    signal divOut : std_logic := '0';
--    signal IVDATACOUNT : integer range 0 to 20000 := 0;
    signal countDone : std_logic := '0';


begin
process(i_XCO) is
begin
if(rising_edge(i_XCO)) then
    count2 <= count2 +1;
    if(count2 >= 4) then
    count2 <= 0;
    divOut <= not divOut;
    end if;
end if;
end process;

process(i_ADC_RDY, divOut, startCount, count, countDone, trigger) is
begin
    if(countDone = '1') then
        startCount <= '0';
    elsif(rising_edge(i_ADC_RDY)) then
        startCount <= '1';
    end if;
    
    if(rising_edge(divOut)) then
        if (startCount = '1') then
            count <= count + 1;
            if (count >= 10024) then
                countDone <= '1';
            else
                countDone <= '0';
            end if;
        else
            count <= 0;
            countDone <= '0';
        end if;
    end if;
end process;

process(startCount, divOut) is
begin
    if(startCount = '1') then
        trigger <= divOut;
    end if;
end process;

process(trigger, count, w_ADC_DATA_SIM) is
begin
    if(falling_edge(trigger)) then
        w_ADC_DATA_SIM <= std_logic_vector(to_unsigned(count, w_ADC_DATA_SIM'length));
    end if;
end process;


end Behavioral;
