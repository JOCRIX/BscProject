----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 09:28:11 PM
-- Design Name: 
-- Module Name: ADC_CONTROL_TOP - Behavioral
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

entity ADC_CONTROL_TOP is
  Port (
            MASTER_CLK_IN                                                               : in std_logic := '0';
            --MASTER_SDA_CLK_IN                                                           : in std_logic := '0';
            --Connections to external ADCs
            EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN                                     : in std_logic  := '0';
            EXT_EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN                                     : in std_logic  := '0';   
            EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT                                    : out std_logic := '0';
            EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT                                    : out std_logic := '0';
            EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT                      : out std_logic := '0';
            
            EXT_LEDS_DATA_FROM_ADC_CONTROL                                              : out std_logic_vector(15 downto 0) := (others => '0');
            --
            EXT_TEST_ACQUIRE_START                                                      :in std_logic := '0'
   );
end ADC_CONTROL_TOP;

architecture Behavioral of ADC_CONTROL_TOP is


--Pulse Gen 1 <-> ADC Control signals
signal i_PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
signal i_PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT : std_logic := '0';
signal i_PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN  :std_logic := '0';
signal i_PULSE_COMPLETE_PULSEGEN_1_TO_ADC_CONTROL_IN : std_logic := '0';

signal i_PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT   : std_logic := '0';
signal i_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
signal i_PULSE_PULSE_OUT_PULSEGEN_2_TO_ADC_CONTROL_IN   : std_logic := '0';
SIGNAL i_Unused_pulse_complete_from_pulsegen2 : std_logic;


signal i_PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT   : std_logic := '0';
signal i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
signal i_PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN   : std_logic := '0';
SIGNAL i_Unused_pulse_complete_from_pulsegen3 : std_logic;

signal i_PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT   : std_logic := '0';
signal i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
signal i_PULSE_PULSE_OUT_PULSEGEN_4_TO_ADC_CONTROL_IN   : std_logic := '0';
SIGNAL i_Unused_pulse_complete_from_pulsegen4 : std_logic;


signal i_ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER : std_logic_vector (15 downto 0) := (others => '0');
signal i_ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER : std_logic_vector (15 downto 0) := (others => '0');
signal i_ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER  : std_logic := '0';
signal i_ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER   : std_logic := '0';
signal i_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN : std_logic := '0';


signal i_MASTER_CLK_TO_ADC_CONTROL  : std_logic := '0';
signal i_MASTER_CLK_SDA_TO_ADC_CONTROL : std_logic := '0';


component adc_control
    port(
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
            PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN     : in std_logic  := '0'; --ACTIVE_PULSE_WIDTH_OUT in Pulse_train_gen_active_out
            PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN                            : in std_logic  := '0'; --Unused
            --Pulse generator for 20ns t_DSCKLCNVH pulse
            PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT                 : out std_logic := '0';
            PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN   : in std_logic  := '0'; 
            PULSE_PULSE_OUT_PULSEGEN_4_TO_ADC_CONTROL_IN                                : in std_logic  := '0'; 
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
end component adc_control;

component pulse_train_gen
    Generic(
        NR_OF_CLKs : integer := 6       
);
Port (
        --test : out std_logic;
        Trig_in : in std_logic := '0';
      --  Trig_out : out std_logic; --test signal output
        CLK_in : in std_logic := '0';
        BUSY : out std_logic := '0';
        Pulse_out : out std_logic :='0';
        Pulse_complete : out std_logic := '0' 
      );
end component pulse_train_gen;

--component pulse_gen_invert
--    Generic(
--        NR_OF_CLKs : integer := 6       
--);
--Port (
--        --test : out std_logic;
--        Trig_in : in std_logic := '0';
--      --  Trig_out : out std_logic; --test signal output
--        CLK_in : in std_logic := '0';
--        BUSY : out std_logic := '0';
--        Pulse_out : out std_logic :='0';
--        Pulse_complete : out std_logic := '0' 
--      );
--end component pulse_gen_invert;

component pulse_gen_width_modulator_inverted
Generic(
        NR_OF_CLKs : integer := 16;  
        HIGH_TIME : integer := 25; -- in ns, multiples of 5.
        LOW_TIME : integer := 25   -- in ns, multiples of 5.  
);
Port (
        MASTER_CLK_200MEG_IN : in std_logic := '0';
        TRIGGER   : in std_logic := '0';
        PULSE_OUT : out std_logic := '0';
        ACTIVE : out std_logic := '0'
      );
end component pulse_gen_width_modulator_inverted;


component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

begin
--Simulation stuff
i_MASTER_CLK_TO_ADC_CONTROL <= MASTER_CLK_IN;
--i_MASTER_CLK_SDA_TO_ADC_CONTROL <= MASTER_SDA_CLK_IN; 

--test CNV
i_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN <= EXT_TEST_ACQUIRE_START;

--Test
--EXT_DCN_OUT <= i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;

--test data,
EXT_LEDS_DATA_FROM_ADC_CONTROL <= i_ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER;

--Cnv pulse out
EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT <= i_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;

--DSC pulse out
--EXT_DSC_OUT <= i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;

adc_ctrl1 : adc_control
    port map(
        PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT => i_PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
        PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN => i_PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN,
        PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN => i_PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN,
        PULSE_COMPLETE_PULSEGEN_1_TO_ADC_CONTROL_IN => i_PULSE_COMPLETE_PULSEGEN_1_TO_ADC_CONTROL_IN,
        
        PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT => i_PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
        PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        PULSE_PULSE_OUT_PULSEGEN_2_TO_ADC_CONTROL_IN => i_PULSE_PULSE_OUT_PULSEGEN_2_TO_ADC_CONTROL_IN,
        
        PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT => i_PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT,
        PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN => i_PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN,
        
        PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT => i_PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT,
        PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        PULSE_PULSE_OUT_PULSEGEN_4_TO_ADC_CONTROL_IN  => i_PULSE_PULSE_OUT_PULSEGEN_4_TO_ADC_CONTROL_IN,
        
        EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN => EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN,
        EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN => EXT_EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN,
        EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT,
        EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT,
        EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT => EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT,
        ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER =>i_ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER,
        ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => i_ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER,
        ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => i_ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER,
        ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => i_ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER,
        ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN => i_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN,
        MASTER_CLK_TO_ADC_CONTROL => i_MASTER_CLK_TO_ADC_CONTROL 
    );

pulse_gen_1_SDACLK : pulse_gen_width_modulator_inverted
Generic map(
        NR_OF_CLKs => 16,  
        HIGH_TIME => 20, --20, had to "calibrate" due to actual implementation
        LOW_TIME =>25    
)
Port map(
        MASTER_CLK_200MEG_IN => i_MASTER_CLK_TO_ADC_CONTROL,
        TRIGGER => i_PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
        PULSE_OUT => i_PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN,
        ACTIVE => i_PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN
      );

pulse_gen_2_35ns_CNV : pulse_train_gen -- Must be clocked with 200MHz to produce a 35ns busy pulse
       Generic map (
        NR_OF_CLKs => 6      
        )
        Port map (
        --test : out std_logic;
        Trig_in => i_PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      --  Trig_out : out std_logic; --test signal output
        CLK_in => i_MASTER_CLK_TO_ADC_CONTROL,
        BUSY => i_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        Pulse_out => i_PULSE_PULSE_OUT_PULSEGEN_2_TO_ADC_CONTROL_IN,
        Pulse_complete => i_Unused_pulse_complete_from_pulsegen2 
      );

pulse_gen_3_45ns_DCN : pulse_train_gen -- Must be clocked with 200MHz
       Generic map (
            NR_OF_CLKs => 5
        )
        Port map (
        --test : out std_logic;
        Trig_in => i_PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT,
      --  Trig_out : out std_logic; --test signal output
        CLK_in => i_MASTER_CLK_TO_ADC_CONTROL,
        BUSY => i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        Pulse_out => i_PULSE_PULSE_OUT_PULSEGEN_3_TO_ADC_CONTROL_IN,
        Pulse_complete => i_Unused_pulse_complete_from_pulsegen3 
      );
      
pulse_gen_4_45ns : pulse_train_gen -- Must be clocked with 200MHz
       Generic map (
        NR_OF_CLKs => 5      
        )
        Port map (
        --test : out std_logic;
        Trig_in => i_PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT,
      --  Trig_out : out std_logic; --test signal output
        CLK_in => i_MASTER_CLK_TO_ADC_CONTROL,
        BUSY => i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        Pulse_out => i_PULSE_PULSE_OUT_PULSEGEN_4_TO_ADC_CONTROL_IN,
        Pulse_complete => i_Unused_pulse_complete_from_pulsegen4 
      );      
      
--200MHz CLK(50% DC) and 20MHz(48.3% DC) CLK

--     master_of_clk : clk_wiz_0
--   port map ( 
--  -- Clock out ports  
--   clk_out1 => i_MASTER_CLK_TO_ADC_CONTROL,
--   -- Clock in ports
--   clk_in1 =>MASTER_CLK_IN
-- ); 
      

end Behavioral;
