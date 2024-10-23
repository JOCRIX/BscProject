----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2024 09:14:05 PM
-- Design Name: 
-- Module Name: adc_control - Behavioral
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
--The entity is for controlling a LTC2311 ADC.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adc_control is
    Port (  PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_OUT   : out std_logic := '0';
            PULSE_CLK_SPI_PULSEGEN_OUT_TO_ADC_CONTROL_IN        : in std_logic  := '0';
            PULSE_BUSY_PULSEGEN_TO_ADC_CONTROL_IN               : in std_logic  := '0';
            PULSE_COMPLETE_PULSEGEN_TO_ADC_CONTROL_IN           : in std_logic  := '0';
            EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN                 : in std_logic  := '0';
            EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN                 : in std_logic  := '0';   
            EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT                : out std_logic := '0';
            EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT                : out std_logic := '0';
            EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT  : out std_logic := '0';
            ADC_A_DATA_ADC_CONTROL_TO_IV_SAVER_OUT              : out std_logic_vector(15 downto 0) := (others => '0');
            ADC_B_DATA_ADC_CONTROL_TO_IV_SAVER_OUT              : out std_logic_vector(15 downto 0) := (others => '0');
            ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_IV_SAVER_OUT  : out std_logic := '0';
            ADC_ACQUIRE_START_INT_MEM_TO_ADC_CONTROL_IN         : in std_logic  := '0'
   );
end adc_control;

architecture Behavioral of adc_control is


begin

adc_acquire : process (ADC_ACQUIRE_START_INT_MEM_TO_ADC_CONTROL_IN) is
begin
if(rising_edge(ADC_ACQUIRE_START_INT_MEM_TO_ADC_CONTROL_IN))then
            
end if;
end process;

--gen_cnv_pulse : process () is
--begin

--end process;


end Behavioral;
