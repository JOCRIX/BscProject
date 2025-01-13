----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2024 08:26:44 PM
-- Design Name: 
-- Module Name: sample_control_TOP - Behavioral
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


--mx25l3273f

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;




-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity sample_control_TOP is
  Port (
        i_COMM_CLK : in std_logic := '0';
        i_COMM_RW : in std_logic;
        io_COMM_BUS : inout std_logic_vector(15 downto 0); 
        i_COMM_IX : in std_logic;  --1 means external mem, 0 means internal.
--        o_COMM_BUS : out std_logic_vector(15 downto 0);  
        --i_DATA_ADC_TO_IVSA : in std_logic_vector(15 downto 0);
        --i_SAMPLE_F : in std_logic_vector(15 downto 0);
--        o_ADDR_TEST : out std_logic_vector(18 downto 0);
        --i_ADC_DnB : in std_logic;
        --i_ADC_RDY : in std_logic;
        
        
        o_Mem_Addr_ext : out std_logic_vector(18 downto 0); --RAM chip address pins
        io_Mem_IO_ext : inout std_logic_vector(7 downto 0); --RAM chip data I/O
        o_Mem_nWE_ext : out std_logic;
        o_Mem_nCE_ext : out std_logic;
        o_Mem_nOE_ext : out std_logic;
        i_XCO : in std_logic;
        o_MDIST_BUSY : out std_logic;
        o_TRIG_ADC : out std_logic;
        o_CLK_DAC : out std_logic;
        o_DATA_DAC : out std_logic_vector(15 downto 0);
        o_DnB : out std_logic := '1';
        
        i_ADC_SDA_A : in std_logic := '0';
        i_ADC_SDA_B : in std_logic := '0';
        o_ADC_SCK_A : out std_logic := '0';
        o_ADC_SCK_B : out std_logic := '0';
        o_ADC_CNV : out std_logic := '0'
  );
end sample_control_TOP;



architecture rtl of sample_control_TOP is

component IX_MUX is
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
end component;


component internal_ram
  Port (
        i_MASTER_CLK : in std_logic;
        i_CLK_IXMUX         : in std_logic  := '0';
        i_RnW          : in std_logic  := '0';
        i_FSM_RESET   :in std_logic := '0';
        i_DATA_IXMUX : in std_logic_vector(15 downto 0) := (others => '0');
        o_DATA_IXMUX : out std_logic_vector(15 downto 0) := (others => '0');
        o_REGISTER_2 : out std_logic_vector(15 downto 0);
        o_REGISTER_3 : out std_logic_vector(15 downto 0);
        o_REGISTER_4 : out std_logic_vector(15 downto 0) := (others => '0');
        o_REGISTER_5 : out std_logic_vector(15 downto 0) := x"00FF";
        o_REGISTER_6 : out std_logic_vector(15 downto 0);
        o_REGISTER_7 : out std_logic_vector(15 downto 0);
        o_REGISTER_23 : out std_logic_vector(15 downto 0) := x"0064"
   );
   end component internal_ram;
   
   
component logic_reset
      Port (
        CLK : in std_logic;
        RW : in std_logic;
        RESET : out std_logic := '0';
        i_IX : in std_logic := '0'
   );   
end component logic_reset;

component IV_SAMPLE_CTRL is
    Port ( 
            i_CLK_IXMUX : in std_logic;
            o_DATA_IXMUX : out std_logic_vector(15 downto 0) := (others => '0');
            DATA_FROM_MEM_DIST_IN : in STD_LOGIC_VECTOR (15 downto 0);
            
            ADC_DnB : in STD_LOGIC;
            ADC_DATA_IN : in STD_LOGIC_VECTOR (15 downto 0);
            ADC_DATA_RDY_IN : in STD_LOGIC;          
            DATA_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            ADDR_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            RnW_TO_MEM_DIST_OUT : out STD_LOGIC;
            CLK_TO_MEM_DIST_OUT : out STD_LOGIC;
            i_RESET : in std_logic := '0'
            );
end component;

component PARALLEL_SERIES_CONVERTER is
    Port (
        i_SET : in std_logic := '0';        --Trigger for sample parallel to series data conversion, falling edge = DATA RDY
        i_DATA_A : in std_logic_vector (15 downto 0) := (others => '0'); --Data from AD converter A
        i_DATA_B : in std_logic_vector (15 downto 0) := (others => '0'); -- Data from AD converter B
        i_RESET : in std_logic := '0'; --Reset for the module
        i_CLK : in std_logic := '0';    --Master clock input
       
        o_DATA : out std_logic_vector(15 downto 0) := (others => '0'); --Data output.
        o_SET : out std_logic := '0'    --Indicates that the output data is ready on a rising edge.
    );
end component;



component clk_wiz_0
    port(
        clk_out1 : out std_logic;
        clk_in1 : in std_logic
        );
end component;


COMPONENT dds_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_config_tvalid : IN STD_LOGIC;
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
END COMPONENT;

component EXT_MEM_RW20 is
    Port (
        i_DATA : in std_logic_vector(7 downto 0);
        o_DATA : out std_logic_vector(7 downto 0);
        o_DATA_TO_ERAM : out std_logic_vector(7 downto 0);
        i_DATA_FR_ERAM : in std_logic_vector(7 downto 0);
        i_RnW : in std_logic := '0' ;
        i_ADDR : std_logic_vector(18 downto 0);
        i_RESET : std_logic;
        
        o_ADDR_TO_ERAM : out std_logic_vector(18 downto 0);
        i_EN : in std_logic := '0' ;
        i_CLK : in std_logic := '0';
        o_nCE : out std_logic := '0';
        o_nOE : out std_logic := '1';
        o_nWE : out std_logic := '1';
        
        o_IO_BUF_CTRL : out std_logic;
        o_ACTIVE : out std_logic := '0'
    
    );
end component;

component ExternalMemDist20 is
    port (
        i_CLK : in std_logic;  --Master CLK input
        i_DATA : in std_logic_vector(15 downto 0);  --16 bit input data that is to be split
        i_ADDR : in std_logic_vector(15 downto 0);  --16 bit input ADDR.
        o_ADDR : out std_logic_vector(18 downto 0); --Output 19 bit ADDR to ext mem.
        o_DATA_EMEM : out std_logic_vector(7 downto 0); --Output 8 bit data to ext mem.
        i_DATA_EMEM : in std_logic_vector(7 downto 0); --input 8 bit data from ext mem.
        o_DATA : out std_logic_vector(15 downto 0); --output 16 bit concatenated from two 8 bit registers
        i_SET : in std_logic := '0'; --Trigger sequence to Write/Read
        o_SET : out std_logic := '0'; --Output set, triggering next block sequence.
        i_HOLD : in std_logic := '0'; --Input HOLD, FSM will not proceed when high.
        i_RnW : in std_logic := '0'; -- Input to control Read or Write data
        o_RnW : out std_logic; -- Output to control to read or write data.
        i_RESET : in std_logic := '0'; --Reset, simply resets logic.
        o_ACTIVE : out std_logic := '0'
    );
end component;

component DAC_PRESCALER is
    Port ( 
           i_CLK : in STD_LOGIC; --The clock input, this is divided down by two to generate the DAC and DDS clocks. 100 MHz for 50 MHz DAC opperation.
           o_CLK_DDS : out STD_LOGIC; -- The diveded down clock for the DDS.
           o_CLK_DAC : out STD_LOGIC -- The clock for the DAC, a delayed version of the DDS clock.
           );
end component;

component DAC_DATA_Conversion is
    port (
            i_LoByte_FWORD : in std_logic_vector(15 downto 0); --bit 0 to 15 of the 32 bit wide frequency setting word.
            i_HiByte_FWORD : in std_logic_vector (31 downto 16); --bit 16 to 31 of the 32 bit wide frequency setting word.
            o_FWORD : out std_logic_vector (47 downto 0); --The full 32 bit wide frequency setting word.
            i_DDS_DATA : in std_logic_vector(15 downto 0); --DDS output data, in two's compliment.
            o_DAC_DATA : out std_logic_vector (15 downto 0); --DDS data converted to unsigned, this is the Data for the DAC.
            o_UPDATE_F : out std_logic;  --Togles when a new frequency is to be set at the output.
            i_CLK : in std_logic -- Master clock input, (200 MHz when implemented).
        );
end component;

component adc_resampler is
  Port (
        i_acquire_start_int_mem_reg     : in std_logic_vector(15 downto 0) := (others => '0'); --MSb controls the start
        --o_acquire_start_read_int_mem    : in std_logic := '0';
        i_sample_frq_high_int_mem_reg   : in std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_frq_low_int_mem_reg    : in std_logic_vector(15 downto 0) := (others => '0');--remove default later
        i_sample_size_int_mem_reg       : in std_logic_vector(15 downto 0) := "0000000001100100";--x"4E20"; --Default sample zie = 20000. May need to remove this when int mem is connected
        o_resampler_DnBusy              : out std_logic := '1';
        o_acquire_start_adc_control     : out std_logic := '0';
        i_reset_logic                   : in std_logic := '0';
        i_dds_clk_50MHz                 : in std_logic := '0';
        i_master_clk                    : in std_logic :='0'
   );
end component;

component adc_control is
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
end component;


component pulse_width_gen is
    Generic(
    width : integer := 40
    );
  Port (
        i_master_clk : in std_logic := '0';
        i_trigger : in std_logic    := '0';
        o_pulse   : out std_logic   := '0'
   );
end component;

component pulse_gen_width_modulator_inverted is
Generic(
        NR_OF_CLKs : integer := 7;  
        HIGH_TIME : integer := 25; -- in ns, multiples of 5.
        LOW_TIME : integer := 25   -- in ns, multiples of 5.  
);
Port (
        MASTER_CLK_200MEG_IN : in std_logic := '0';
        TRIGGER   : in std_logic := '0';
        PULSE_OUT : out std_logic := '0';
        ACTIVE : out std_logic := '0'
      );
end component;


--Internal signals
    signal TOPORT_internal : std_logic_vector(15 downto 0) := x"AAAA";
    signal TORAM_internal : std_logic_vector(15 downto 0):= x"AAAA"; 
    signal w_LOGIC_RESET : std_logic := '0';
    
    --IX_MUX to IVSA
    signal w_CLK_IXMUX_TO_IVSA : std_logic := '0';
    signal w_DATA_IVSA_TO_IXMUX : std_logic_vector(15 downto 0);
    --IX_MUX  to IMEM
    signal w_CLK_IXMUX_TO_IMEM : std_logic := '0';
    signal w_DATA_IXMUX_TO_IMEM : std_logic_vector(15 downto 0);
    signal w_DATA_IMEM_TO_IXMUX : std_logic_vector(15 downto 0);
    signal w_RnW_IXMUX_TO_IMEM : std_logic;
    
    --IVSA and MDIST wires
    signal w_DATA_IVSA_TO_MDIST :std_logic_vector(15 downto 0) := x"AAAA";
    signal w_DATA_MDIST_TO_IVSA : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_ADDR_IVSA_TO_MDIST : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_RnW_IVSA_TO_MDIST : std_logic := '0';
    signal w_CLK_IVSA_TO_MDIST : std_logic := '0';
    
    --MDIST and EMEMRW wires
    signal w_RnW_MDIST_TO_EMEMRW : std_logic := '0';
    signal w_ADDR_MDIST_TO_EMEMRW : std_logic_vector(18 downto 0) := (others => '0');
    signal w_DATA_MDIST_TO_EMEMRW : std_logic_vector(7 downto 0) := (others => '0');
    signal w_DATA_EMEMRW_TO_MDIST : std_logic_vector(7 downto 0) := (others => '0');
    signal w_CLK_MDIST_TO_EMEMRW : std_logic := '0';
    
    --Clocks
    signal w_MEM_CLK : std_logic := '0';
    signal w_GRANDMASTER_CLK : std_logic := '0';
    
    --MDSIT and pulsegen
    signal w_PulseGen1_trig_in : std_logic := '0';
    signal w_PulseGen1_BUSY : std_logic := '0';
    signal w_PulseGen1_Pulse_out : std_logic := '0';
    signal w_PulseGen1_pulse_complete : std_logic := '0';

    signal w_EMEMRW_HOLD : std_logic := '0';

    -- MISC
    signal w_MDIST_STATE : std_logic_vector (2 downto 0) := (others => '0');

    --EMEMRW and external RAM
    signal w_DATA_EMEMRW_TO_EMEM : std_logic_vector(7 downto 0) := (others => '0');
    signal w_DATA_EMEM_TO_EMEMRW : std_logic_vector(7 downto 0) := (others => '0');
    signal w_IO_BUF_CTRL : std_logic := '0';

    --signal buf : std_logic_vector(15 downto 0) := (others => '0');
    signal w_test : std_logic := '0';
    
    signal w_ADC_DATA_SIMA : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_ADC_DATA_SIMB : std_logic_vector(15 downto 0) := x"BBBB";
    signal w_ADC_DnB_n : std_logic := '1';
    signal w_ADC_DnB : std_logic := '1';
    
    signal w_FWORD_DDC_TO_DDS : std_logic_vector(47 downto 0);
    signal w_DATA_DDS_TO_DDC : std_logic_vector(15 downto 0);
    signal w_UP_F_DDC_TO_DDS : std_logic := '0';    
    
    signal countA : integer range 0 to 65535 := 0;
    signal countB : integer range 0 to 65535 := 20000;
    signal trigger : std_logic := '0';
    signal init : std_logic := '0';
    
    signal count2 : integer range 0 to 65535 := 0;
    signal divOut : std_logic := '0';
    signal dataCount : integer range 0 to 65535 := 0;
    signal countDone : std_logic := '0';
    signal CMPLT : std_logic := '0';
    signal arm : std_logic := '0';
    signal w_ADC_TRIG : std_logic := '0';
    signal w_ADC_nTRIG : std_logic := '1';
    
    --signal test_ADDR_ext_mem : std_logic_vector(18 downto 0);
    
    signal SAMPLE_F_u16 : integer range 0 to 65535 := 0;
    type byte_state is (S1, S2, S3, S4, S5, S6, S7, SEQ_CMPLT);
    signal s_byte : byte_state := S1;
    --signal i_ADC_RDY : std_logic := '0';
    
    signal w_TestToRam : std_logic_vector(15 downto 0);
    signal w_TestToPort : std_logic_vector(15 downto 0);
    
    signal w_Test1 : std_logic_vector(15 downto 0);
    signal w_Test2 : std_logic_vector(15 downto 0);
    signal w_MDIST_BUSY : std_logic;
    signal w_nRnW_COMM : std_logic;
    
    signal w_REGISTER_2 : std_logic_vector(15 downto 0);
    signal w_REGISTER_3 : std_logic_vector(15 downto 0);
    signal w_REGISTER_4 : std_logic_vector(15 downto 0);
    signal w_REGISTER_5 : std_logic_vector(15 downto 0); 
    signal w_REGISTER_6 : std_logic_vector(15 downto 0);
    signal w_REGISTER_7 : std_logic_vector(15 downto 0);
    signal w_REGISTER_23 : std_logic_vector(15 downto 0);
    
    signal w_CLK_DDS : std_logic := '0';
    
    signal w_DATA_A_ADC_TO_PSC : std_logic_vector(15 downto 0);
    signal w_DATA_B_ADC_TO_PSC : std_logic_vector(15 downto 0);
    signal w_DATA_PSC_TO_IVSA : std_logic_vector(15 downto 0);
    signal w_TRIG_PSC_TO_IVSA : std_logic;
    signal w_DAC_DDS_mValid : std_logic;
    
    signal w_SET_ADCCTRL_TO_PSC : std_logic := '0';
    
    signal w_ADC_ACQ_RSMPL_TO_ADCTRL : std_logic := '0';
    
    signal w_PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
    signal w_PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT : std_logic := '0';
    signal w_PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN  :std_logic := '0';
    
    signal w_PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT   : std_logic := '0';
    signal w_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
    
    signal w_PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT   : std_logic := '0';
    signal w_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
    
    signal w_PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT   : std_logic := '0';
    signal w_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : std_logic := '0';
    
    signal w_ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER : std_logic_vector (15 downto 0) := (others => '0');
    signal w_ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER : std_logic_vector (15 downto 0) := (others => '0');
    signal w_ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER  : std_logic := '0';
    signal w_ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER   : std_logic := '0';
    signal w_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN : std_logic := '0';
    
    --signal i_RESET_LOGIC_LOGIC_RESETTER_TO_ADC_CONTROL : std_logic := '0';
    
    signal i_MASTER_CLK_TO_ADC_CONTROL  : std_logic := '0';
    signal i_MASTER_CLK_SDA_TO_ADC_CONTROL : std_logic := '0';
        
    

begin

w_nRnW_COMM <= not i_COMM_RW;


PLL_1 : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => w_GRANDMASTER_CLK,
   -- Clock in ports
   clk_in1 => i_XCO
 );

pulse_gen_1_SPICLK : pulse_gen_width_modulator_inverted
Generic map(
        NR_OF_CLKs => 16,  
        HIGH_TIME =>20,-- 20, --20, had to "calibrate" due to actual implementation
        LOW_TIME =>25--25    
)
Port map(
        MASTER_CLK_200MEG_IN => w_GRANDMASTER_CLK,
        TRIGGER => w_PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
        PULSE_OUT => w_PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN,
        ACTIVE => w_PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN
      );
      
pulse_gen_2_CNV : pulse_width_gen 
    Generic map(
    width => 35
    )
    Port map (
        i_master_clk => w_GRANDMASTER_CLK,
        i_trigger => w_PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
        o_pulse => w_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
   );

pulse_gen_3_DCN : pulse_width_gen 
    Generic map(
    width => 30
    )
    Port map (
        i_master_clk => w_GRANDMASTER_CLK,
        i_trigger => w_PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT,
        o_pulse => w_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
   );

pulse_gen_4_DSC : pulse_width_gen 
    Generic map(
    width => 30
    )
    Port map (
        i_master_clk => w_GRANDMASTER_CLK,
        i_trigger => w_PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT,
        o_pulse => w_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
   );


PSC_1 : PARALLEL_SERIES_CONVERTER
    Port map(
        i_SET => w_ADC_TRIG,        --Trigger for sample parallel to series data conversion, falling edge = DATA RDY
        i_DATA_A => w_ADC_DATA_SIMA, --Data from AD converter A
        i_DATA_B => w_ADC_DATA_SIMB,  -- Data from AD converter B
        i_RESET => w_LOGIC_RESET,  --Reset for the module
        i_CLK => w_GRANDMASTER_CLK,    --Master clock input
       
        o_DATA => w_DATA_PSC_TO_IVSA, --Data output.
        o_SET => w_TRIG_PSC_TO_IVSA    --Indicates that the output data is ready on a rising edge.
    );

adc_ctrl1 : adc_control
    port map(
        PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT => w_PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
        PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN => w_PULSE_CLK_SPI_PULSEGEN_1_OUT_TO_ADC_CONTROL_IN,
        PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN => w_PULSE_BUSY_PULSEGEN_1_TO_ADC_CONTROL_IN,
        
        PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT => w_PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
        PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => w_PULSE_CNV_PULSE_PULSEGEN_2_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        
        PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT => w_PULSE_TRIGGER_DCNVSCKL_PULSE_ADC_CONTROL_TO_PULSEGEN_3_OUT,
        PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => w_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        
        PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT => w_PULSE_TRIGGER_DSCKLCNVH_PULSE_ADC_CONTROL_TO_PULSEGEN_4_OUT,
        PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => w_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
        
        RESET_LOGIC_LOGIC_RESETTER_TO_ADC_CONTROL => w_LOGIC_RESET,
        
        EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN => i_ADC_SDA_A,
        EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN => i_ADC_SDA_B,
        EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT => o_ADC_SCK_A,
        EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT => o_ADC_SCK_B,
        EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT => o_ADC_CNV,
        ADC_A_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => w_ADC_DATA_SIMA,
        ADC_B_DATA_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => w_ADC_DATA_SIMB,
        ADC_A_AND_B_DATA_READY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => w_SET_ADCCTRL_TO_PSC,
        --ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER => i_ADC_CONTROL_BUSY_ADC_CONTROL_TO_ADC_SAMPLE_COUNTER,
        ADC_ACQUIRE_START_ADC_SAMPLE_COUNTER_TO_ADC_CONTROL_IN => w_ADC_TRIG,
        MASTER_CLK_TO_ADC_CONTROL => w_GRANDMASTER_CLK 
    );


        
DDS_DAC : dds_compiler_0
  PORT MAP (
    aclk => w_CLK_DDS,
    s_axis_config_tvalid => w_UP_F_DDC_TO_DDS,
    s_axis_config_tdata => w_FWORD_DDC_TO_DDS,
    m_axis_data_tvalid => w_DAC_DDS_mValid,
    m_axis_data_tdata => w_DATA_DDS_TO_DDC
  );

DAC_DATA_CONVERTER : DAC_DATA_Conversion  --DDC short for DAC DATA CONVERTERR
    port map(
            i_LoByte_FWORD => w_REGISTER_4,
            i_HiByte_FWORD => w_REGISTER_5,
            o_FWORD => w_FWORD_DDC_TO_DDS,
            i_DDS_DATA => w_DATA_DDS_TO_DDC,
            o_DAC_DATA => o_DATA_DAC,
            o_UPDATE_F => w_UP_F_DDC_TO_DDS,
            --i_CLK  => w_GRANDMASTER_CLK
            i_CLK => w_CLK_DDS
        );



DAC_PRESCALER1 : DAC_PRESCALER
    Port map ( 
           i_CLK => w_GRANDMASTER_CLK,
           o_CLK_DDS => w_CLK_DDS,
           o_CLK_DAC => o_CLK_DAC
           );



gen_io_port_extRam : for index in 0 to 7 generate   --Output driver disabled når T = '1'. Aka vi vil læse med porten. 
   IOBUF_inst : IOBUF                               --https://docs.amd.com/r/en-US/ug953-vivado-7series-libraries/IOBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => w_DATA_EMEM_TO_EMEMRW(index),     -- Buffer output
      IO => io_Mem_IO_ext(index),   -- Buffer inout port (connect directly to top-level port)
      I => w_DATA_EMEMRW_TO_EMEM(index),     -- Buffer input
      T => w_IO_BUF_CTRL--i_SampleRW      -- 3-state enable input, high=input, low=output 
      --T => w_test
   );
   -- End of IOBUF_inst instantiation
end generate gen_io_port_extRam; 



ext_memRW : EXT_MEM_RW20
    port map(
        i_DATA => w_DATA_MDIST_TO_EMEMRW,
        o_DATA  => w_DATA_EMEMRW_TO_MDIST,
        o_DATA_TO_ERAM => w_DATA_EMEMRW_TO_EMEM,
        i_DATA_FR_ERAM => w_DATA_EMEM_TO_EMEMRW,
        i_RnW => w_RnW_MDIST_TO_EMEMRW,
        i_ADDR => w_ADDR_MDIST_TO_EMEMRW,
        i_RESET => w_LOGIC_RESET,
        
        o_ADDR_TO_ERAM => o_Mem_Addr_ext,
        --o_ADDR_TO_ERAM => test_ADDR_ext_mem,
        i_EN => w_CLK_MDIST_TO_EMEMRW,
        i_CLK => w_GRANDMASTER_CLK,
        o_nCE => o_Mem_nCE_ext,
        o_nOE => o_Mem_nOE_ext,
        o_nWE => o_Mem_nWE_ext,
        
        o_IO_BUF_CTRL => w_IO_BUF_CTRL,
        o_ACTIVE => w_EMEMRW_HOLD
    );


MEM_DIST1 : ExternalMemDist20
    port map (
        i_CLK => w_GRANDMASTER_CLK, --Master CLK input
        i_DATA => w_DATA_IVSA_TO_MDIST,  --16 bit input data that is to be split
        i_ADDR => w_ADDR_IVSA_TO_MDIST,  --16 bit input ADDR.
        o_ADDR => w_ADDR_MDIST_TO_EMEMRW, --Output 19 bit ADDR to ext mem.
        o_DATA_EMEM => w_DATA_MDIST_TO_EMEMRW, --Output 8 bit data to ext mem.
        i_DATA_EMEM => w_DATA_EMEMRW_TO_MDIST, --input 8 bit data from ext mem.
        o_DATA => w_DATA_MDIST_TO_IVSA, --output 16 bit concatenated from two 8 bit registers
        i_SET => w_CLK_IVSA_TO_MDIST, --Trigger sequence to Write/Read
        o_SET => w_CLK_MDIST_TO_EMEMRW, --Output set, triggering next block sequence.
        i_HOLD => w_EMEMRW_HOLD, --Input HOLD, FSM will not proceed when high.
        i_RnW  => w_RnW_IVSA_TO_MDIST, -- Input to control Read or Write data
        o_RnW => w_RnW_MDIST_TO_EMEMRW, -- Output to control to read or write data.
        i_RESET => w_LOGIC_RESET, --Reset, simply resets logic.
        o_ACTIVE => o_MDIST_BUSY
    );
    
    
--w_ADC_nTRIG <= w_ADC_ACQ_RSMPL_TO_ADCTRL;
--w_ADC_TRIG <= not w_ADC_nTRIG;
w_ADC_TRIG <= not w_ADC_ACQ_RSMPL_TO_ADCTRL;
o_TRIG_ADC <= w_ADC_ACQ_RSMPL_TO_ADCTRL;

ADC_RESAMPLER1 : adc_resampler 
    port map (
            i_acquire_start_int_mem_reg => w_REGISTER_7,  
            --o_acquire_start_read_int_mem    : in std_logic := '0';
            i_sample_frq_high_int_mem_reg => w_REGISTER_3,
            i_sample_frq_low_int_mem_reg => w_REGISTER_2,
            i_sample_size_int_mem_reg => w_REGISTER_6,
            o_resampler_DnBusy => w_ADC_DnB,
            o_acquire_start_adc_control => w_ADC_ACQ_RSMPL_TO_ADCTRL,
            i_reset_logic => w_LOGIC_RESET,
            i_dds_clk_50MHz => w_CLK_DDS,
            i_master_clk => w_GRANDMASTER_CLK
        );



IV_SAVER : IV_SAMPLE_CTRL
    port map (
        i_CLK_IXMUX => w_CLK_IXMUX_TO_IVSA,
        o_DATA_IXMUX => w_DATA_IVSA_TO_IXMUX,
        DATA_FROM_MEM_DIST_IN => w_DATA_MDIST_TO_IVSA, 
        --ADC_DnB => w_ADC_DnB_n,
        ADC_DnB => w_ADC_DnB,
        --ADC_DATA_IN => w_ADC_DATA_SIM,
        ADC_DATA_IN => w_DATA_PSC_TO_IVSA,
        --ADC_DATA_RDY_IN => w_ADC_TRIG,
        ADC_DATA_RDY_IN => w_TRIG_PSC_TO_IVSA,
        DATA_TO_MEM_DIST_OUT => w_DATA_IVSA_TO_MDIST,
        ADDR_TO_MEM_DIST_OUT => w_ADDR_IVSA_TO_MDIST,
        RnW_TO_MEM_DIST_OUT => w_RnW_IVSA_TO_MDIST,
        CLK_TO_MEM_DIST_OUT => w_CLK_IVSA_TO_MDIST,
        i_RESET => w_LOGIC_RESET
    );
    

IMEM : Internal_ram 
    port map(
        i_MASTER_CLK => w_GRANDMASTER_CLK,
        i_CLK_IXMUX => w_CLK_IXMUX_TO_IMEM,
        i_RnW => I_COMM_RW,
        i_FSM_RESET => w_LOGIC_RESET,
        i_DATA_IXMUX => w_DATA_IXMUX_TO_IMEM,
        o_DATA_IXMUX => w_DATA_IMEM_TO_IXMUX,
        o_REGISTER_2 => w_REGISTER_2,
        o_REGISTER_3 => w_REGISTER_3,
        o_REGISTER_4 => w_REGISTER_4,
        o_REGISTER_5 => w_REGISTER_5,
        o_REGISTER_6 => w_REGISTER_6,
        o_REGISTER_7 => w_REGISTER_7,
        o_REGISTER_23 => w_REGISTER_23
        
    );
   


IX_MUX1 : IX_MUX
    port map(
        i_MASTER_CLK => w_GRANDMASTER_CLK,
        i_CLK => i_COMM_CLK,
        o_CLK_IVSA => w_CLK_IXMUX_TO_IVSA,
        o_CLK_IMEM => w_CLK_IXMUX_TO_IMEM,
        i_DATA_IO => TORAM_internal,
        o_DATA_IO => TOPORT_internal,
        i_DATA_IVSA => w_DATA_IVSA_TO_IXMUX,
        i_DATA_IMEM => w_DATA_IMEM_TO_IXMUX,
        o_DATA_IMEM => w_DATA_IXMUX_TO_IMEM,
        i_IX => i_COMM_IX
        
    );
        
logic_resetter : logic_reset
    port map(
        RW => i_COMM_RW,
        CLK => i_COMM_CLK,
        RESET => w_LOGIC_RESET,
        i_IX => i_COMM_IX
    );



gen_comm_port : for index in 0 to 15 generate   --Output driver disabled når T = '1'. Aka vi vil læse med porten. 
   IOBUF_inst : IOBUF                               --https://docs.amd.com/r/en-US/ug953-vivado-7series-libraries/IOBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => TORAM_internal(index),    
      IO => io_COMM_BUS(index),  
      I => TOPORT_internal(index), 
      T => w_nRnW_COMM
   );

end generate gen_comm_port; 


end rtl;