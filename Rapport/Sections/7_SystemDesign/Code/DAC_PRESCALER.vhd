----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2024 13:23:48
-- Design Name: 
-- Module Name: DAC_PRESCALER - Behavioral
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

entity DAC_PRESCALER is
    Port ( 
           i_CLK : in STD_LOGIC; --200 Mhz input clock.
           o_CLK_DDS : out STD_LOGIC; -- The diveded down clock for the DDS.
           o_CLK_DAC : out STD_LOGIC -- The clock for the DAC, a delayed version of the DDS clock.
           );
end DAC_PRESCALER;

architecture Behavioral of DAC_PRESCALER is

signal w_CLK_TO_DDS : std_logic := '0';    
begin

o_CLK_DDS <= w_CLK_TO_DDS;
o_CLK_DAC <= not w_CLK_TO_DDS;

DDS_DAC_PRESCALER : process(i_CLK, w_CLK_TO_DDS) is
variable v_Count : natural range 0 to 1023 := 0;
begin
    if(rising_edge(i_CLK)) then
        if(v_Count < 4) then  --Configured for 20 MHz here.
            v_Count := v_Count +1;
        else
            v_Count := 0;
            w_CLK_TO_DDS <= not w_CLK_TO_DDS;
        end if;
    end if;
end process;

end Behavioral;
