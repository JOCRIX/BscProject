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
            --Pulse generator for 35ns CNV pulse
            PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT                       : out std_logic := '0';
            PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN         : in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            --Pulse generator for 45ns t_DCNVSCKL pulse
            PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT                  : out std_logic := '0';
            PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN    : in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            --Pulse generator for 20ns t_DSCKLCNVH pulse
            PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT                 : out std_logic := '0';
            PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN   : in std_logic  := '0'; 
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
            --Reset signal from logic resetter to ADC control
            RESET_LOGIC_LOGIC_RESETTER_TO_ADC_CONTROL                                   : in std_logic := '0';
            --Master CLK for state machine
            MASTER_CLK_TO_ADC_CONTROL                                                   : in std_logic := '0'       
   );
end adc_control;

architecture Behavioral of adc_control is

signal m_clk : std_logic := '0';

signal start_acquisition : std_logic := '0';
signal stop_acquisition : std_logic := '0';

signal serial_data_adc_1 : std_logic_vector(16 downto 0):= (others => '0'); --Must be 17 bit wide cuz offset caused by CLK counter and get_data falling/rising edge
signal serial_clk_count : integer range 0 to 32 := 16;
signal serial_data_adc_1_latched : std_logic_vector(15 downto 0):= (others => '0');

signal serial_data_adc_2 : std_logic_vector(16 downto 0):= (others => '0');
signal serial_data_adc_2_latched : std_logic_vector(15 downto 0):= (others => '0');

signal w_reset : std_logic := '0';

signal acquire_trig_in : std_logic := '0';
signal dcn_trig_out : std_logic := '0';
signal cnv_trig_out : std_logic := '0';
signal dcn_busy_in : std_logic := '0';
signal cnv_busy_in : std_logic := '0';
signal spi_clk_trig_out : std_logic := '0';
signal spi_clk : std_logic := '0';
signal spi_clk_busy : std_logic := '0';
signal counting : std_logic := '0';
constant max_clk_count : integer := 16;
signal dsc_trig_out : std_logic := '0';
signal dsc_busy_in : std_logic := '0';
signal adc_busy_status : std_logic := '0';
signal adc_1_data : std_logic := '0';
signal adc_1_data_latched : std_logic_vector(15 downto 0):= (others => '0');
signal adc_2_data : std_logic := '0';
signal adc_2_data_latched : std_logic_vector(15 downto 0):= (others => '0');
signal data_ready : std_logic := '0';

signal set_spi_clk : std_logic := '0';
signal spi_clk_done : std_logic := '0';

signal dsc_pulse_done : std_logic := '0';

type state_adc_comm_fsm is (IDLE ,ACQUIRE, GET_DATA, LATCH);
signal s_adc : state_adc_comm_fsm := IDLE;

begin

--route MASTER CLK to local
m_clk <= MASTER_CLK_TO_ADC_CONTROL ;
--Start acquisition input from sample counter
acquire_trig_in <= ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN;
--route CNV pulse gen trigger to local
PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT <= cnv_trig_out;
--route DCN pulse gen trigger to local
PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT <= dcn_trig_out;
--route DCT pulse gen busy to local
dcn_busy_in <= PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN; 
--route CNV pulse gen busy to local
cnv_busy_in <= PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
--route SPI CLK pulse gen trigger to local
PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT <= spi_clk_trig_out;
--route SPI CLK pulses to local
spi_clk <= PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN; 
--route SPI CLK busy to local
spi_clk_busy <= PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN;
--route DSC pulse gen trigger to local
PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT <= dsc_trig_out;
--route DSC pulse gen busy to local 
dsc_busy_in <= PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
--route ADC control busy flag to output
ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= adc_busy_status;
--ADC 1 data to local
adc_1_data <= EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN;
--ADC 1 latched data to output
ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= adc_1_data_latched;
--route spi_clk to output
EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT <= spi_clk;
EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT <= spi_clk;
--route CNV to external
EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT <= cnv_busy_in;
--Route data ready to output
ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= data_ready;
--ADC 2 data to local
adc_2_data <= EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN;
--ADC 2 latched data to output
ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER <= adc_2_data_latched;
--reset signal
w_reset <= RESET_LOGIC_LOGIC_RESETTER_TO_ADC_CONTROL;


adc_control : process (m_clk) is
begin
    if(w_reset = '1') then
        s_adc <= IDLE;
    elsif(rising_edge(m_clk)) then
        case s_adc is
            when IDLE =>
            if(start_acquisition = '1') then
                s_adc <= ACQUIRE;
            end if;
            when ACQUIRE =>
                adc_busy_status <= '1';
                cnv_trig_out <= '1';
                dcn_trig_out <= '1';
                if(set_spi_clk = '1') then
                    s_adc <= GET_DATA;
                    cnv_trig_out <= '0';
                    dcn_trig_out <= '0';
                end if;
            when GET_DATA=>
                spi_clk_trig_out <= '1';
                if(spi_clk_done = '1') then
                    s_adc <= LATCH;
                    spi_clk_trig_out <= '0';
                end if;
            when LATCH =>
                dsc_trig_out <= '1';
                adc_1_data_latched <= serial_data_adc_1(15 downto 0);
                adc_2_data_latched <= serial_data_adc_2(15 downto 0);
                data_ready <= '1';
                if(dsc_pulse_done = '1') then
                    dsc_trig_out <= '0';
                    adc_busy_status <= '0';
                    s_adc <= IDLE;  
                    data_ready <= '0';      
                end if;
        end case;
    end if;
end process;

dsc_check : process(dsc_busy_in, s_adc, w_reset) is
begin
    if(s_adc = IDLE or w_reset = '1') then
        dsc_pulse_done <= '0';
    elsif(falling_edge(dsc_busy_in)) then
        dsc_pulse_done <= '1';
    end if;
end process;

get_serial_data : process(spi_clk, serial_clk_count, s_adc) is
begin
    if(s_adc = GET_DATA) then
        if(rising_edge(spi_clk)) then
            if(serial_clk_count >= 0) then
                serial_data_adc_1(serial_clk_count) <= adc_1_data;
                serial_data_adc_2(serial_clk_count) <= adc_2_data;
            end if;
        end if;
    end if;
end process;

spi_clk_count : process (s_adc, spi_clk, serial_clk_count, w_reset) is
begin
    if(s_adc = LATCH or w_reset = '1') then
        serial_clk_count <= 16;
    elsif(falling_edge(spi_clk)) then
        serial_clk_count <= serial_clk_count - 1;
    end if;
end process;

spi_clk_check : process(spi_clk_busy, s_adc, w_reset) is
begin
    if(s_adc = LATCH or w_reset = '1') then
        spi_clk_done <= '0';
    elsif(falling_edge(spi_clk_busy)) then
        spi_clk_done <= '1';
    end if;
end process;

dcn_check : process (dcn_busy_in, s_adc, w_reset) is
begin
    if(s_adc = GET_DATA or w_reset = '1') then
        set_spi_clk <= '0';
    elsif(falling_edge(dcn_busy_in)) then
        set_spi_clk <= '1';
    end if;
end process;

acquisition : process (m_clk, acquire_trig_in, s_adc, w_reset) is
begin
    if(s_adc = LATCH or w_reset = '1') then
        start_acquisition <= '0';
    elsif(rising_edge(acquire_trig_in)) then
        start_acquisition <= '1';
    end if;
end process;

end Behavioral;
