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
    Port (  
            --Pulse generator for 16 CLKs on SCK
            PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT                         : out std_logic := '0';
            PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN                              : in std_logic  := '0';
            PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN                                     : in std_logic  := '0';
            PULSE_COMPLETE_PULSEGEN_1_TO_ADC_CONTROL_IN                                 : in std_logic  := '0';
            --Pulse generator for 35ns CNV pulse
            PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT                       : out std_logic := '0';
            PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN         : in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            PULSE_PULSE_OUT_PULSEGEN_2_TO_ADC_CONTROL_IN                                : in std_logic  := '0'; --Unused
            --Pulse generator for 45ns t_DCNVSCKL pulse
            PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT                  : out std_logic := '0';
            PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN    : in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN                                : in std_logic  := '0'; --Unused
            --Pulse generator for 20ns t_DSCKLCNVH pulse
            PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT                 : out std_logic := '0';
            PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN   : in std_logic  := '0'; 
            PULSE_PULSE_OUT_PULSEGEN_4_TO_ADC_CONTROL_IN                                : in std_logic  := '0'; 
            --Connections to external ADCs
            EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN                                         : in std_logic  := '0';
            EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN                                         : in std_logic  := '0';   
            EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT                                        : out std_logic := '0';
            EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT                                        : out std_logic := '0';
            EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT                          : out std_logic := '0';
            --Connections to ADC Sample Counter 
            ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                                : out std_logic_vector(15 downto 0) := (others => '0');
            ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                                : out std_logic_vector(15 downto 0) := (others => '0');
            ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                    : out std_logic := '0';
            ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                          : out std_logic := '0';
            ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN                      : in std_logic  := '0';
            --Master CLK for state machine
            MASTER_CLK_TO_ADC_CONTROL                                                   : in std_logic := '0' 
            
   );
end adc_control;

architecture Behavioral of adc_control is

signal spi_clk_busy : std_logic := '0'; 
constant IDLE : std_logic := '0';
constant BUSY : std_logic := '1';
signal spi_clk : std_logic := '0';
signal adc_1_spi_data_in : std_logic := '0';
signal serial_data_adc_1 : std_logic_vector(15 downto 0):= (others => '0');
signal serial_clk_count : integer range 0 to 16 := 0;
signal DSCKLCNVH : std_logic := '1';

signal start_acquisition : std_logic := '0';
signal acquisition_started : std_logic := '0';

signal test : std_logic := '0';

begin

--Local copy of SPI clk busy flag
spi_clk_busy <= PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN;
--SPI CLK
spi_clk <= PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN ;
--Route SPI CLK to SCK pins
EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT <= spi_clk;
EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT <= spi_clk;
--Route CNV Pulse to ADCs
EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT <= PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
--DSC pulse local
DSCKLCNVH <= PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
--Local copy of SPI data from ADC1.
adc_1_spi_data_in <= EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN;
--Route captured data to output
ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= serial_data_adc_1;

sda_clk : process (PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN) is
begin
    if(falling_edge(PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN)) then
        test <= '1';
    end if;
end process;

dcn : process (start_acquisition) is
begin
    
end process;

cnv : process (PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN) is
begin
    if(falling_edge(PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN)) then
        PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT <= '0';
        acquisition_started <= '1';
    end if;
    if(falling_edge(PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN)) then
        PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT <= '1';
        acquisition_started <= '0';
    end if; 
end process;

acquisition : process (ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN) is
begin
    if(acquisition_started = '1') then
        start_acquisition <= '0';
    elsif(rising_edge(ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN)) then
        start_acquisition <= '1';
    end if;
end process;

busy_flag : process (start_acquisition) is
begin
    if(start_acquisition = '1') then
        ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= '1';
    else
    --....
    end if;    
end process;

end Behavioral;
