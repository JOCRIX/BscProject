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
           CLK_IN : in STD_LOGIC; 
           CLK_TO_DDS : out STD_LOGIC; 
           CLK_TO_DAC : out STD_LOGIC 
           );
end DAC_PRESCALER;


architecture Behavioral of DAC_PRESCALER is

signal sig_CLK_TO_DDS : std_logic := '0';    

begin
    process(CLK_IN, sig_CLK_TO_DDS)
    begin 
        if (rising_edge(CLK_IN)) then 
            sig_CLK_TO_DDS <= not sig_CLK_TO_DDS;
        end if;
    end process;
    CLK_TO_DDS <= sig_CLK_TO_DDS;   
    CLK_TO_DAC <= (not CLK_IN) and sig_CLK_TO_DDS;  
    
end Behavioral;