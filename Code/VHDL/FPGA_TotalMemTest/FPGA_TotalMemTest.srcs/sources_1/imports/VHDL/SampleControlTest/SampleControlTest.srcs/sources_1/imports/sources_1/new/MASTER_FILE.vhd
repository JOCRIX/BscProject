----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2024 17:26:21
-- Design Name: 
-- Module Name: MASTER_FILE - Behavioral
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
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MASTER_FILE is
    Port (
--        Ext_DATA_INPUT : in std_logic_vector(15 downto 0);
--        Ext_DATA_OUTPUT : out std_logic_vector(15 downto 0);
--        Ext_DATA_ADDR : in std_logic_vector(4 downto 0);
--        Ext_CLK_FROM_INT_MEM : in std_logic;
--        Ext_DnB : in std_logic;
--        Ext_ADC_RDY : in std_logic;
        Ext_CLK_IN : in std_logic;
        
        Ext_Mem_Addr_ext : out std_logic_vector(18 downto 0); --RAM chip address pins
        Ext_Mem_IO_ext : inout std_logic_vector(7 downto 0); --RAM chip data I/O
        Ext_Mem_nWE_ext : out std_logic;
        Ext_Mem_nCE_ext : out std_logic;
        Ext_Mem_nOE_ext : out std_logic;  
        
        -- TestPorts
--        Ext_CLK_TO_MEM_DIST : out std_logic;
--        RnW_TO_MEM_DIST : out std_logic;
        Ext_DnB : in std_logic;
        Ext_ADC_RDY : in std_logic;
--        Ext_CLK_FROM_INT_MEM : in std_logic;
--        Ext_MANUAL_STEP : in std_logic;
        
--        Ext_DATA_FROM_MEM_DIST : in std_logic_vector(3 downto 0);
--        Ext_DATA_TO_MEM_DIST : out std_logic_vector(3 downto 0);
--        Ext_ADDR_TO_MEM_DIST : out std_logic_vector(4 downto 0);
--        Ext_ADDR_FROM_INT_MEM : in std_logic_vector(4 downto 0);
--        Ext_DATA_TO_INT_MEM : out std_logic_vector(11 downto 0);
--        Ext_ADC_LOBYTE_TO_IV_SAVER : in std_logic_vector(3 downto 0);
--        Ext_ADC_HIBYTE_TO_IV_SAVER : in std_logic_vector(3 downto 0);
        EXT_ADC_DATA_TO_IVSA : in std_logic_vector(15 downto 0) := (others => '0');
        
--        Ext_MEM_DIST_TO_EXT_MEM : out std_logic_vector(7 downto 0);
        --Ext_EXT_MEM_TO_EXT_MEM_DIST : in std_logic_vector(7 downto 0);
        --Ext_Sample_nRW : out std_logic;
        --Ext_ADDR_TO_EXT_MEM : out std_logic_vector(5 downto 0);
        --Ext_CLK_TO_EXT_MEM : out std_logic;
        EXT_BUS_CLK : in std_logic := '0';
        EXT_BUS_RnW : in std_logic := '0';
        EXT_TEST_RESET : out std_logic := '0';
        EXT_COMM_IO : inout std_logic_vector(15 downto 0);
        
        Ext_STATE_OUT : out std_logic_vector(2 downto 0);
        Ext_PULSE_OUT : out std_logic
        
        --Ext_MEM_DIST_RnW_OUT : out std_logic;
        --Ext_RnW_TO_MEM_DIST : out std_logic
        
    );
end MASTER_FILE;

architecture Behavioral of MASTER_FILE is

component comm_port is
  Port (
        RW          : in std_logic    := '0';
        TOPORT      : in std_logic    := '0';
        TORAM       : out std_logic   :='0';
        IO          : inout std_logic := 'Z'
        );
end component;

component logic_reset is
  Port (
        CLK : in std_logic;
        RW : in std_logic;
        RESET : out std_logic := '0'
   );
end component;

component internal_ram is
  Port (
        CLK         : in std_logic  := '0';
        RW          : in std_logic  := '0';
        FSM_RESET   :in std_logic := '0';
        TORAM : in std_logic_vector(15 downto 0) := (others => '0');
        TOPORT : out std_logic_vector(15 downto 0) := (others => '0');
        ADDR_TO_IV_SAVER : out std_logic_vector(15 downto 0) := (others => '0');
        DATA_FROM_IV_SAVER : in std_logic_vector(15 downto 0) :=(others => '0');
        CLK_TO_IV_SAVER : out std_logic := '0'
        
   );
end component;


component IV_SAMPLE_CTRL is
  Port (
        --MASTER_CLK_IN : in std_logic;
        CLK_FROM_INT_MEM_IN : in STD_LOGIC := '0';
        ADDR_FROM_INT_MEM_IN : in STD_LOGIC_VECTOR (15 downto 0);
        DATA_TO_INT_MEM_OUT : out STD_LOGIC_VECTOR (15 downto 0);
        --ADC_TRIG_IN : in STD_LOGIC;
        DATA_FROM_MEM_DIST_IN : in STD_LOGIC_VECTOR (15 downto 0);
        
        
        ADC_DnB : in STD_LOGIC;
        ADC_DATA_IN : in STD_LOGIC_VECTOR (15 downto 0);
        ADC_DATA_RDY_IN : in STD_LOGIC;          
        DATA_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR (15 downto 0);
        ADDR_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR (15 downto 0);
        RnW_TO_MEM_DIST_OUT : out STD_LOGIC;
        CLK_TO_MEM_DIST_OUT : out STD_LOGIC
        );
end component IV_SAMPLE_CTRL;

component pulse_train_gen is
Generic(
        NR_OF_CLKs : integer := 4       
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

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

component ExternalMemoryDistribution is
  Port (
        PulseExtMemCtrlGenBusy         : in std_logic  := '0';
        PulseInExtReadWrite            : in std_logic  := '0'; -- 4 pulses for EXT memhandler 
        PulseExtReadWriteTrigger       : out std_logic := '0';
        PulseCompleteExtReadWrite      : in std_logic  := '0';
        MASTER_CLK                     : in std_logic  := '0';
        RnW                            : in std_logic  := '0'; -- '0' = write to RAM, '1' = read from RAM
        nRW_TO_EXT_MEM                 : out std_logic := '0';
        CLK_IVSAVER_TO_MEM_DIST        : in std_logic  := '0';
        ADDR_IV_SAVER_TO_EXT_MEM_DIST  : in std_logic_vector (15 downto 0) := (others => '0'); --X
        ADDR_EXT_MEM_DIST_TO_EXT_MEM   : out std_logic_vector(18 downto 0) := (others => '0'); --X
        DATA_IVSAVER_TO_EXT_MEM_DIST   : in std_logic_vector (15 downto 0) := (others => '0'); --X
        DATA_EXT_MEM_DIST_TO_EXT_MEM   : out std_logic_vector(7 downto 0)  := (others => '0');
        DATA_EXT_MEM_TO_EXT_MEM_DIST   : in std_logic_vector(7 downto 0)  := (others => '0');
        DATA_EXT_MEM_TO_IVSAVER        : out std_logic_vector(15 downto 0) := (others => '0');
        CLK_TO_EXT_MEM_READ_WRITE      : out std_logic := '0';
        STATE_OUT : out std_logic_vector (2 downto 0) := (others => '0')        
   );
end component ExternalMemoryDistribution;

component ExtMemReadWrite is
  Port (
        --SampleDIn : in std_logic_vector(15 downto 0) := (others => '0'); --Sample data input
        SampleByteToRam : in std_logic_vector(7 downto 0):=(others => '0'); --Sample Byte input
        SampleByteFromRam : out std_logic_vector(7 downto 0):= (others => '0');
       -- SampleDOut : out std_logic_vector(15 downto 0) := (others => '0'); --Stored sample data output
        SampleRW : in std_logic := '0'; --Store in, or retrieve from, RAM. This single should be '1' for WRITE mode ande '0' for mode
                                        --Coordinate this with tri-state buffer behaviour! The Xilinx primitive is inverted from this
                                        --So we add an interter to the signal in top layer or in this code. I did it in the top layer.
       -- Mode : in std_logic := '0'; -- Continous read = '1', single read = '0';
        SampleAddr : in std_logic_vector(18 downto 0) := (others => '0'); 
        CLK : in std_logic := '0';
        nCE : out std_logic := '0'; --Chip enable, '1' = Disable, '0' = Enable. 
        nOE : out std_logic := '0'; -- Output driver enable, '0' = Enabled, '1' = disabled.  Used during read.
        nWE : out std_logic := '0'; --Write enable, '0' = Read From RAM / DOUT operation.
                                    --'1' = Write to Ram / DIN operation
        --ExtMemDio : inout std_logic_vector(7 downto 0) := (others => '0');
        ExtMemDataToRam : out std_logic_vector(7 downto 0):= (others => '0');
        ExtMemDataFromRam : in std_logic_vector(7 downto 0);--:= (others => '0');
        ExtMemAdrToRam : out std_logic_vector(18 downto 0) := (others => '0');
        
        IO_BUF_CTRL : out std_logic
   );
end component ExtMemReadWrite;

--Signals to IO buffer
signal sig_ExtMemDataToRam : std_logic_vector(7 downto 0);
signal sig_ExtMemDataFromRam : std_logic_vector(7 downto 0);
signal sig_RW_FROM_EXT_MEM_DIST_TO_EXT_MEM_RW : std_logic := '0';

--Signals between Memory distribution and external memory read write
signal sig_SampleByteToRam : std_logic_vector(7 downto 0);
signal sig_SampleByteFromRam : std_logic_vector(7 downto 0);
signal sig_Sample_RW : std_logic;
signal sig_Sample_ADDR : std_logic_vector(18 downto 0);
signal sig_CLK_to_ext_mem_RW : std_logic;

--signals between memory distribution and pulse generator
signal sig_PulseGen1_trig_in : std_logic;
signal sig_PulseGen1_BUSY : std_logic;
signal sig_PulseGen1_pulse_out : std_logic;
signal sig_PulseGen1_pulse_complete : std_logic;

----signal between IV SAVER and Memory distribution
--signal sig_RnW_to_mem_dist_from_IV_SAVER : std_logic;
--signal sig_clk_to_mem_dist_from_IV_SAVER : std_logic;
--signal sig_addr_to_mem_dist_from_IV_SAVER : std_logic_vector(15 downto 0);
--signal sig_data_to_mem_dist_from_IV_SAVER : std_logic_vector(15 downto 0);
--signal sig_data_from_mem_dist_to_IV_SAVER : std_logic_vector(15 downto 0);

signal sig_GRANDMASTER_CLK : std_logic;

--signal sig_ADDR : std_logic_vector(15 downto 0) := (others => '0');


--signal sig_ADDR_DOWNSCALE : std_logic_vector (15 downto 5) := (others => '0');
signal sig_ADDR_TO_MEM_DIST : std_logic_vector(15 downto 0) := (others => '0');
--signal sig_ADDR_FROM_INT_MEM : std_logic_vector(15 downto 0) := (others => '0');
signal sig_DATA_TO_MEM_DIST : std_logic_vector(15 downto 0) := (others => '0');
signal sig_DATA_FROM_MEM_DIST : std_logic_vector(15 downto 0) := (others => '0');
--signal sig_DATA_TO_INT_MEM : std_logic_vector(15 downto 0) := (others => '0');
signal sig_ADC_DATA_TO_IV_SAVER : std_logic_vector(15 downto 0) := (others => '0');

signal sig_RnW_TO_MEM_DIST : std_logic := '0';
signal sig_CLK_TO_MEM_DIST : std_logic := '0';

signal sig_ADDR_TO_EXT_MEM : std_logic_vector(18 downto 0) := (others => '0');

signal Ext_MEM_DIST_TO_EXT_MEM : std_logic_vector(7 downto 0) := (others => '0');
signal sig_IO_BUF_CTRL : std_logic;

signal sig_MEM_CLK : std_logic := '0';

signal sig_ADDR_FR_IMEM_TO_IVSA : std_logic_vector(15 downto 0) := (others => '0');
signal sig_DATA_FR_IVSA_TO_IMEM : std_logic_vector(15 downto 0) := (others => '0');
signal sig_CLK_FR_IMEM_TO_IVSA : std_logic := '0';
signal sig_CommRnW : std_logic := '0';
signal sig_TORAM : std_logic_vector(15 downto 0) := (others => '0');
signal sig_TOPORT : std_logic_vector(15 downto 0) := (others => '0');
signal sig_COMM_IO : std_logic_vector(15 downto 0) := (others => '0');
signal sig_LOGIC_RESET : std_logic := '0';

begin

--sig_ADDR <= sig_ADDR_DOWNSCALE & Ext_ADDR_FROM_INT_MEM;
--Ext_ADDR_TO_MEM_DIST <= sig_ADDR_TO_MEM_DIST(4 downto 0);
--Ext_DATA_TO_MEM_DIST <= sig_DATA_TO_MEM_DIST(3 downto 0);
--sig_DATA_FROM_MEM_DIST(3 downto 0) <= Ext_DATA_FROM_MEM_DIST;
--Ext_DATA_TO_INT_MEM <= sig_DATA_TO_INT_MEM(11 downto 0);
--sig_ADC_DATA_TO_IV_SAVER(3 downto 0) <= Ext_ADC_LOBYTE_TO_IV_SAVER;
--sig_ADC_DATA_TO_IV_SAVER(11 downto 8) <= Ext_ADC_HIBYTE_TO_IV_SAVER;
sig_MEM_CLK <= not sig_GRANDMASTER_CLK;
--Ext_ADDR_TO_EXT_MEM(4 downto 0) <= sig_ADDR_TO_EXT_MEM(4 downto 0);
--Ext_ADDR_TO_EXT_MEM(5) <= sig_ADDR_TO_EXT_MEM(18);
Ext_PULSE_OUT <= sig_PulseGen1_pulse_out;
EXT_TEST_RESET <= sig_LOGIC_RESET;

RAM : internal_ram
    port map(
        CLK => EXT_BUS_CLK,
        RW => EXT_BUS_RnW,
        FSM_RESET => sig_LOGIC_RESET,
        TOPORT => sig_TOPORT,
        TORAM => sig_TORAM,
        ADDR_TO_IV_SAVER => sig_ADDR_FR_IMEM_TO_IVSA,
        DATA_FROM_IV_SAVER => sig_DATA_FR_IVSA_TO_IMEM,
        CLK_TO_IV_SAVER => sig_CLK_FR_IMEM_TO_IVSA
        );
 
Logic_resetter : logic_reset
    port map(
        RW => EXT_BUS_RnW,
        CLK => EXT_BUS_CLK,
        RESET => sig_LOGIC_RESET
        );

gen_comm_port : for index in 0 to 15 generate
    commport : comm_port
        port map (
            RW => EXT_BUS_RnW,
            IO => EXT_COMM_IO(index),
            TOPORT => sig_TOPORT(index),
            TORAM => sig_TORAM(index)
            );
end generate gen_comm_port;

gen_io_port_extRam : for index in 0 to 7 generate   --Output driver disabled når T = '1'. Aka vi vil læse med porten. 
   IOBUF_inst : IOBUF                               --https://docs.amd.com/r/en-US/ug953-vivado-7series-libraries/IOBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => sig_ExtMemDataFromRam(index),     -- Buffer output
      IO => Ext_Mem_IO_ext(index),   -- Buffer inout port (connect directly to top-level port)
      I => sig_ExtMemDataToRam(index),     -- Buffer input
      T => sig_IO_BUF_CTRL--i_SampleRW      -- 3-state enable input, high=input, low=output 
   );
   -- End of IOBUF_inst instantiation
end generate gen_io_port_extRam; 

EXT_MEM_RW1 : ExtMemReadWrite
    port map (
        --To external memory
        ExtMemDataToRam => sig_ExtMemDataToRam,
        ExtMemDataFromRam => sig_ExtMemDataFromRam,
        ExtMemAdrToRam => Ext_Mem_Addr_ext,
        nCE => Ext_Mem_nCE_ext,
        nOE => Ext_Mem_nOE_ext,
        nWE => Ext_Mem_nWE_ext, 
        IO_BUF_CTRL => sig_IO_BUF_CTRL,
        --From memory distribution
        SampleByteToRam => sig_SampleByteToRam,
        SampleByteFromRam => sig_SampleByteFromRam,
        SampleRW => sig_Sample_RW,
        SampleAddr => sig_Sample_ADDR,
        CLK => sig_CLK_to_ext_mem_RW
        );
        
MEM_DIST1 :ExternalMemoryDistribution
    port map (
--        --Memory Distribution to and  from External Memory Read Write control
--        DATA_EXT_MEM_DIST_TO_EXT_MEM => sig_SampleByteToRam,
--        DATA_EXT_MEM_TO_EXT_MEM_DIST => sig_SampleByteFromRam,
--        nRW_TO_EXT_MEM => sig_Sample_RW,
--        ADDR_EXT_MEM_DIST_TO_EXT_MEM => sig_Sample_ADDR,
--        CLK_TO_EXT_MEM_READ_WRITE => sig_CLK_to_ext_mem_RW,
--        --Memory Distribution to and from pulse generator:
--        PulseExtReadWriteTrigger => sig_PulseGen1_trig_in,
--        PulseExtMemCtrlGenBusy => sig_PulseGen1_BUSY,
--        PulseInExtReadWrite => sig_PulseGen1_pulse_out,
--        PulseCompleteExtReadWrite => sig_PulseGen1_pulse_complete,
--        --IV Saver to and from Memory Distribution:
--        RnW => sig_RnW_to_mem_dist_from_IV_SAVER,
--        CLK_IVSAVER_TO_MEM_DIST => sig_clk_to_mem_dist_from_IV_SAVER,
--        ADDR_IV_SAVER_TO_EXT_MEM_DIST => sig_addr_to_mem_dist_from_IV_SAVER,
--        DATA_IVSAVER_TO_EXT_MEM_DIST => sig_data_to_mem_dist_from_IV_SAVER,
--        DATA_EXT_MEM_TO_IVSAVER => sig_data_from_mem_dist_to_IV_SAVER,
--        --Master clock
--        MASTER_CLK => sig_GRANDMASTER_CLK

        --Memory Distribution to and  from External Memory Read Write control
        DATA_EXT_MEM_DIST_TO_EXT_MEM => sig_SampleByteToRam,
        DATA_EXT_MEM_TO_EXT_MEM_DIST => sig_SampleByteFromRam,
        nRW_TO_EXT_MEM => sig_Sample_RW,
        ADDR_EXT_MEM_DIST_TO_EXT_MEM => sig_Sample_ADDR,
        CLK_TO_EXT_MEM_READ_WRITE => sig_CLK_to_ext_mem_RW,
        --Memory Distribution to and from pulse generator:
        PulseExtReadWriteTrigger => sig_PulseGen1_trig_in,
        PulseExtMemCtrlGenBusy => sig_PulseGen1_BUSY,
        PulseInExtReadWrite => sig_PulseGen1_pulse_out,
        PulseCompleteExtReadWrite => sig_PulseGen1_pulse_complete,
        --IV Saver to and from Memory Distribution:
        RnW => sig_RnW_TO_MEM_DIST,
        CLK_IVSAVER_TO_MEM_DIST => sig_CLK_TO_MEM_DIST,
        ADDR_IV_SAVER_TO_EXT_MEM_DIST => sig_ADDR_TO_MEM_DIST,
        DATA_IVSAVER_TO_EXT_MEM_DIST => sig_DATA_TO_MEM_DIST,
        DATA_EXT_MEM_TO_IVSAVER => sig_DATA_FROM_MEM_DIST,
        --Master clock
        MASTER_CLK => sig_MEM_CLK,
        
        STATE_OUT => Ext_STATE_OUT        
        );
   
   
PulseGen1 : pulse_train_gen 
Generic map(
    NR_OF_CLKs => 4
)
Port map(
    Trig_in => sig_PulseGen1_trig_in,
    CLK_in => sig_GRANDMASTER_CLK, -- 12 MHz crystal, can be configured for other clocks too.
    BUSY => sig_PulseGen1_BUSY,
    Pulse_out => sig_PulseGen1_pulse_out,
    Pulse_complete => sig_PulseGen1_pulse_complete
);

IV_SAVER1 : IV_SAMPLE_CTRL
Port map(
    --connections between memory distribution and IV SAVER
--    RnW_TO_MEM_DIST_OUT => sig_RnW_to_mem_dist_from_IV_SAVER,
--    CLK_TO_MEM_DIST_OUT => sig_clk_to_mem_dist_from_IV_SAVER,
--    ADDR_TO_MEM_DIST_OUT => sig_addr_to_mem_dist_from_IV_SAVER,
--    DATA_TO_MEM_DIST_OUT => sig_data_to_mem_dist_from_IV_SAVER,
--    DATA_FROM_MEM_DIST_IN => sig_data_from_mem_dist_to_IV_SAVER,

    RnW_TO_MEM_DIST_OUT => sig_RnW_TO_MEM_DIST,
    CLK_TO_MEM_DIST_OUT => sig_CLK_TO_MEM_DIST,
    ADDR_TO_MEM_DIST_OUT => sig_ADDR_TO_MEM_DIST,
    DATA_TO_MEM_DIST_OUT => sig_DATA_TO_MEM_DIST,
    DATA_FROM_MEM_DIST_IN => sig_DATA_FROM_MEM_DIST,
    
    --Connections to ext. ports.
    CLK_FROM_INT_MEM_IN => sig_CLK_FR_IMEM_TO_IVSA,
    ADDR_FROM_INT_MEM_IN => sig_ADDR_FR_IMEM_TO_IVSA,
    DATA_TO_INT_MEM_OUT => sig_DATA_FR_IVSA_TO_IMEM,
    ADC_DnB => Ext_DnB,
    ADC_DATA_IN => sig_ADC_DATA_TO_IV_SAVER,
    ADC_DATA_RDY_IN => Ext_ADC_RDY
    );

PLL_1 : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => sig_GRANDMASTER_CLK,
   -- Clock in ports
   clk_in1 => Ext_CLK_IN
 );
 
end Behavioral;
