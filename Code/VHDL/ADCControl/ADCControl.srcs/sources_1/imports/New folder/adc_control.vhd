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
            PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT                     : out std_logic := '0';
            PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN                          : in std_logic  := '0';
            PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN                                 : in std_logic  := '0';
            PULSE_COMPLETE_PULSEGEN_1_TO_ADC_CONTROL_IN                             : in std_logic  := '0';
            --Pulse generator for 35ns CNV pulse
            PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT                   : out std_logic := '0';
            PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN     : in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            PULSE_PULSE_OUT_PULSEGEN_2_TO_ADC_CONTROL_IN                            : in std_logic  := '0'; --Unused
            --Pulse generator for 45ns t_DCNVSCKL pulse
            PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT                   : out std_logic := '0';
            PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN: in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN                            : in std_logic  := '0'; --Unused
            --Connections to external ADCs
            EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN                                     : in std_logic  := '0';
            EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN                                     : in std_logic  := '0';   
            EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT                                    : out std_logic := '0';
            EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT                                    : out std_logic := '0';
            EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT                      : out std_logic := '0';
            --Connections to ADC Sample Counter 
            ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                            : out std_logic_vector(15 downto 0) := (others => '0');
            ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                            : out std_logic_vector(15 downto 0) := (others => '0');
            ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                : out std_logic := '0';
            ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER                      : out std_logic := '0';
            ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN                  : in std_logic  := '0';
            --Master CLK for state machine
            MASTER_CLK_TO_ADC_CONTROL                                               : in std_logic := '0' 
   );
end adc_control;

architecture Behavioral of adc_control is

type state_adc_ctrl is (ADC_ACQUIRE, WAIT_ADC_READY, CLK_DATA, SET_DATA_READY);
signal s_adc_ctrl : state_adc_ctrl := ADC_ACQUIRE;

signal start_acquisition : std_logic := '0';
signal reset_acquisition : std_logic := '0';

signal inverted_DCNVSCKL_PULSE : std_logic := '0';

signal start_adc_control : std_logic := '0';
signal stop_adc_control : std_logic := '0';

signal sample_data : std_logic_vector (15 downto 0) := (others => '0');

begin

--Main process for the ADC control
adc_control : process (MASTER_CLK_TO_ADC_CONTROL) is
begin
    if(rising_edge(MASTER_CLK_TO_ADC_CONTROL)) then
        if(start_acquisition = '1') then
            if(start_adc_control = '1') then
            
            end if;
        end if;
    end if;
end process;

--Ctrls the start signal for the entity.
adc_acquire_start : process (ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN, reset_acquisition) is
begin
    if(reset_acquisition = '1') then
        start_acquisition <= '0';
    elsif(rising_edge(ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN)) then
        start_acquisition <= '1';
    end if;
end process;

--Make a 35 ns CNV Pulse
--Make a signal for controlling the start of the CLK. It should be 45ns from start of acquisition. as per LTC2311 Datasheet
--Control a  signal that blankets the entire cycle time of an AD-conversion and serial CLK sequence. It's noted as t_cyc + t_DCNVSDOZ in datasheet page 22 figure 21.'
--We note it as ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER 
cnv_ctrl : process (MASTER_CLK_TO_ADC_CONTROL, start_acquisition) is
begin
    if(rising_edge(MASTER_CLK_TO_ADC_CONTROL)) then
        if(start_acquisition = '1') then
            PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT <= '1'; --Triggers 35ns pulse gen
            PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT <= '1'; --Triggers 45ns pulse gen
            ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= '1'; --Sets the busy flag
        else
            PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT <= '0';
            PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT <= '0';
            ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= '0';
        end if;
    end if; 
end process;
--Check if t_DCNVSCKL has passed

--Starts the ADC control process when the 45 ns have passed. Asynchronous reset in ADC_control process when done
dcnvsckl_time_check : process (MASTER_CLK_TO_ADC_CONTROL, PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN) is
begin
    if(stop_adc_control = '1') then
        start_adc_control <= '0';
    elsif(falling_edge(PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN)) then
        start_adc_control <= '1';
    end if;
end process;


end Behavioral;
