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

--attribute dont_touch : string;
--attribute dont_touch of adc_busy_status : signal is "true";
--attribute dont_touch of counting : signal is "true";
--attribute dont_touch of dcn_trig_out: signal is "true";
--attribute dont_touch of cnv_trig_out : signal is "true";
--attribute dont_touch of run_acquisition : signal is "true";
--attribute dont_touch of data_ready : signal is "true";
--attribute dont_touch of dsc_trig_out : signal is "true";


signal run_acquisition : std_logic := '0';

signal serial_data_adc_1 : std_logic_vector(15 downto 0):= (others => '0');
signal serial_clk_count : integer range 0 to 32 := 0;
signal serial_data_adc_1_latched : std_logic_vector(15 downto 0):= (others => '0');

signal acquire_trig_in : std_logic := '0';
signal dcn_trig_out : std_logic := '0';
signal cnv_trig_out : std_logic := '0';
signal dcn_busy_in : std_logic := '0';
signal cnv_busy_in : std_logic := '0';
signal spi_clk_trig_out : std_logic := '0';
signal spi_clk : std_logic := '0';
signal counting : std_logic := '0';
constant max_clk_count : integer := 16;
signal dsc_trig_out : std_logic := '0';
signal dsc_busy_in : std_logic := '0';
signal adc_busy_status : std_logic := '0';
signal adc_1_data : std_logic := '0';
signal data_ready : std_logic := '0';


begin

--Start acquisition input from sample counter
acquire_trig_in <= ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN;
--route CNV and DCN pulsegen triggers to local input
PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT <= cnv_trig_out;
PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT <= dcn_trig_out;
--route CNV and DCN pulse busy flags to local input
dcn_busy_in <= PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
cnv_busy_in <= PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN; 
--route CNV pulse to output
EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT <= cnv_busy_in;
--route SPI CLK trigger output
PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT  <= spi_clk_trig_out;
--route SPI CLK to local
spi_clk <= PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN;
--route SPI CLK to output
EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT <= spi_clk;
EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT <= spi_clk;
--route DSC pulsegen trigger to local
PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT <= dsc_trig_out;
--route DSC pulse busy flag to local
dsc_busy_in <= PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
--route ADC control busy flag to output
ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= adc_busy_status;
--route ADC 1 data to local
adc_1_data <= EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN;
--route ADC 1 data to output port
ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= serial_data_adc_1_latched;
--route data ready to output port
ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= data_ready;


--latch data and set data ready to sample control
latch_data_ready : process (dsc_busy_in, run_acquisition) is
begin
    if(falling_edge(dsc_busy_in)) then
        serial_data_adc_1_latched <= serial_data_adc_1;
        data_ready <= '1';
    end if;
    if(rising_edge(run_acquisition)) then
        data_ready <= '0';
    end if;
end process;
--get data
get_serial_data : process (spi_clk, serial_clk_count) is
begin
    if(rising_edge(spi_clk)) then
        if(serial_clk_count > 0) then
            serial_data_adc_1(serial_clk_count - 1) <= adc_1_data;
        end if;
    end if;
end process;

--set ADC busy on CNV rising and clear on DSC falling
control_busy : process (dsc_busy_in, cnv_busy_in)
begin
    if(rising_edge(cnv_busy_in)) then
        adc_busy_status <= '1';
    end if;
    if(falling_edge(dsc_busy_in)) then 
        adc_busy_status <= '0';
    end if;
end process;
--trigger DSC pulse when SPI CLK finish, clear on DSC busy low
trigger_dsc : process (counting, dsc_busy_in) is
begin
    if(falling_edge(counting)) then
        dsc_trig_out <= '1';
    end if;
    if(falling_edge(dsc_busy_in)) then
        dsc_trig_out <= '0';
    end if;
end process;

--count the number of SPI CLKs and control "counting" flag. Clear count on DSC falling
clk_counter : process (spi_clk, serial_clk_count, dsc_busy_in) is
begin
    if(falling_edge(dsc_busy_in)) then
        serial_clk_count <= 0;
    end if;
    if(rising_edge(spi_clk)) then
        if(serial_clk_count = max_clk_count) then
            counting <= '0';
        end if;
    end if;
    if(falling_edge(spi_clk)) then
        if(serial_clk_count /= max_clk_count) then
            serial_clk_count <= serial_clk_count + 1;
            counting <= '1';
        end if;
    end if;
end process;

--start SPI CLKs after DCN pulse finish, clear on rising on SPI CLK
trigger_spi_clk : process (dcn_busy_in, spi_clk) is
begin
    if(falling_edge(dcn_busy_in)) then
        spi_clk_trig_out <= '1';
    end if;
    if(rising_edge(spi_clk)) then
        spi_clk_trig_out <= '0';
    end if;
end process;

--start DCN pulse after CNV finish, finish on DCN busy low
trigger_dcn : process (run_acquisition) is
begin
    if(rising_edge(run_acquisition)) then
        dcn_trig_out <= '1';
    end if;
    if(falling_edge(run_acquisition)) then
        dcn_trig_out <= '0';
    end if;
end process;

--Start 35 ns CNV pulse 
trigger_cnv : process (run_acquisition) is
begin
    if(rising_edge(run_acquisition)) then
        cnv_trig_out <= '1';
    end if;
    if(falling_edge(run_acquisition)) then
        cnv_trig_out <= '0';
    end if;
end process;
--Start ADC acquisition and conversion 
acquisition : process (acquire_trig_in) is
begin
    if(rising_edge(acquire_trig_in)) then
        if(adc_busy_status = '0') then -- if ADC busy then acquire disable
           run_acquisition <= '1';
        end if;
    end if;
    if(falling_edge(acquire_trig_in)) then
        run_acquisition <= '0';
    end if;
end process;

end Behavioral;
