----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2024 14:42:52
-- Design Name: 
-- Module Name: extmemTop - Behavioral
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

-- For Arix 7 standard templates
Library UNISIM;
use UNISIM.vcomponents.all;
--

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity extmemTop is
  Port (
        --Test Signals for memory
        RW_ext : in std_logic;
        CLK_ext : in std_logic;
        SampleDI_ext : in std_logic_vector(7 downto 0);
        SampleDO_ext : out std_logic_vector (7 downto 0);
        SampleAddr_ext : in std_logic_vector(6 downto 0); --Husk at rette størrelsen
        
        --Memory control and data signals
        ExtMemAddr_ext : out std_logic_vector(18 downto 0); --RAM chip address pins
        ExtMemIO_ext : inout std_logic_vector(7 downto 0); --RAM chip data I/O
        ExtMemnWE_ext : out std_logic;
        ExtMemnCE_ext : out std_logic;
        ExtMemnOE_ext : out std_logic  
   );
end extmemTop;

architecture Behavioral of extmemTop is

signal i_SampleAddr : std_logic_vector(18 downto 0) := (others => '0');
signal i_ExtMemWE : std_logic := '0';
signal i_ExtMemCE : std_logic := '0';
signal i_ExtMemOE : std_logic := '0';
signal i_SampleByteToRam : std_logic_vector(7 downto 0) := (others => '0');
signal i_SampleByteFromRam : std_logic_vector(7 downto 0):= (others => '0');
signal i_SampleRW : std_logic := '0';
signal i_CLK : std_logic := '0';
signal i_nCE : std_logic;
signal i_nOE : std_logic;
signal i_nWE : std_logic;
signal i_ExtMemDataToRam : std_logic_vector(7 downto 0);
signal i_ExtMemDataFromRam : std_logic_vector(7 downto 0);
signal i_ExtMemAdrToRam : std_logic_vector(18 downto 0); 
signal i_invert_t :std_logic;

--Signals for External Memory Control, 4 Pulses
signal i_Pulse4CLKs_trig_in : std_logic := '0';
signal i_Pulse4CLKs_CLK_in : std_logic := '0';
signal i_Pulse4CLKs_pulse_out : std_logic := '0';
signal i_Pulse4CLKs_pulse_complete : std_logic := '0';
--Signals for External Memory Control, 2 Pulses
signal i_Pulse2CLKs_trig_in : std_logic := '0';
signal i_Pulse2CLKs_CLK_in : std_logic := '0';
signal i_Pulse2CLKs_pulse_out : std_logic := '0';
signal i_Pulse2CLKs_pulse_complete : std_logic := '0';
--External Memory Control Data, Address and RW bit
signal i_RnW : std_logic := '0';
signal i_ADDR_IO_SAVER_TO_EXT_MEM_CTRL : std_logic_vector(15 downto 0) := (others => '0');
signal i_ADDR_EXT_MEM_CTRL_TO_EXT_MEM : std_logic_vector(18 downto 0):= (others => '0');
signal i_DATA_IOSAVER_TO_EXT_MEM_CTRL : std_logic_vector(15 downto 0) := (others => '0');
signal i_DATA_EXT_MEM_CTRL_TO_EXT_MEM : std_logic_vector(7 downto 0) := (others => '0');
signal i_DATA_EXT_MEM_TO_IOSAVER : std_logic_vector(15 downto 0) := (others => '0');
signal i_CLK_TO_EXT_MEM_READ_WRITE : std_logic := '0';


--Control circuit for Reading and Writing from/to external RAM.
component ExtMemReadWrite is
  Port (
        SampleByteToRam : in std_logic_vector(7 downto 0) := (others => '0'); --Sample data input
        SampleByteFromRam : out std_logic_vector(7 downto 0):= (others => '0');
       -- SampleDOut : out std_logic_vector(15 downto 0) := (others => '0'); --Stored sample data output
        SampleRW : in std_logic := '0'; --Store in, or retrieve from, RAM.
       -- Mode : in std_logic := '0'; -- Continous read = '1', single read = '0';
        SampleAddr : in std_logic_vector(18 downto 0) := (others => '0'); 
        CLK : in std_logic := '0';
        nCE : out std_logic := '0'; --Chip enable, '1' = Disable, '0' = Enable. 
        nOE : out std_logic := '0'; -- Output driver enable, '0' = Enabled, '1' = disabled.  Used during read.
        nWE : out std_logic := '0'; --Write enable, '0' = Read From RAM / DOUT operation.
                                    --'1' = Write to Ram / DIN operation
        ExtMemDataToRam : out std_logic_vector(7 downto 0) := (others => '0');
        ExtMemDataFromRam : in std_logic_vector(7 downto 0) := (others => '0');
        ExtMemAdrToRam : out std_logic_vector(18 downto 0) := (others => '0')
   );
end component ExtMemReadWrite;
--Pulse generators for External Memory Control
component pulse_train_gen 
Generic(
        NR_OF_CLKs : integer := 4       
);
Port(
        Trig_in : in std_logic := '0';
        CLK_in : in std_logic := '0';
        Pulse_out : out std_logic :='0';
        Pulse_complete : out std_logic := '0' 
);
end component pulse_train_gen;

--External Memory Controller, splits the 16 bit data into 2 bytes and turns the 16 bit addresses into the appropriate addresses for 2 bytes.
component ExternalMemoryControl
    Port(
        PulseInMemoryControl           : in std_logic := '0'; -- 2 pulses for memory control
        PulseCompleteMemoryControl     : in std_logic := '0';
        PulseInExtReadWrite            : in std_logic := '0'; -- 4 pulses for EXT memhandler 
        PulseCompleteExtReadWrite      : in std_logic := '0';
        RnW                            : in std_logic := '0'; -- '0' = write to RAM, '1' = read from RAM
        ADDR_IO_SAVER_TO_EXT_MEM_CTRL  : in std_logic_vector(15 downto 0) := (others => '0');
        ADDR_EXT_MEM_CTRL_TO_EXT_MEM   : out std_logic_vector(18 downto 0) := (others => '0');
        DATA_IOSAVER_TO_EXT_MEM_CTRL   : in std_logic_vector(15 downto 0) := (others => '0');
        DATA_EXT_MEM_CTRL_TO_EXT_MEM   : out std_logic_vector(7 downto 0) := (others => '0');
        DATA_EXT_MEM_TO_IOSAVER        : out std_logic_vector(15 downto 0):= (others => '0');
        CLK_TO_EXT_MEM_READ_WRITE      : out std_logic := '0'
    );
end component ExternalMemoryControl;

begin

--Connect signals to whereever they gotta go.
    i_SampleRW <= not RW_ext; 
    --i_invert_t <= not i_SampleRW;
    i_CLK <= CLK_ext;
    i_SampleByteToRam(7 downto 0) <= SampleDI_ext;
    SampleDO_ext <= i_SampleByteFromRam; 
    i_SampleAddr(6 downto 0) <= SampleAddr_ext; -- husk og ret
    ExtMemAddr_ext <= i_ExtMemAdrToRam; 
    ExtMemnWE_ext <= i_ExtMemWE;
    ExtMemnCE_ext <= i_ExtMemCE;
    ExtMemnOE_ext <= i_ExtMemOE;
--

extmem_read_write : ExtMemReadWrite
    port map(
        SampleByteToRam => i_SampleByteToRam, --Sample data input
        SampleByteFromRam => i_SampleByteFromRam, --Sample data output(From RAM)
        SampleRW => i_SampleRW, --Read or write from RAM
        SampleAddr => i_SampleAddr, --Address of sample
        CLK => i_CLK,  --Clk
        nCE => i_ExtMemCE, --Chip enable
        nOE => i_ExtMemOE, --Output driver enable
        nWE => i_ExtMemWE, --Write or read
        ExtMemDataToRam => i_ExtMemDataToRam, --to tri-state buffer INPUT
        ExtMemDataFromRam => i_ExtMemDataFromRam, --To tri-state buffer output
        ExtMemAdrToRam => i_ExtMemAdrToRam --To RAM address pins.
    );

  -- IOBUF: Single-ended Bi-directional Buffer
   --        Artix-7
   -- Xilinx HDL Language Template, version 2024.1
gen_io_port_extRam : for index in 0 to 7 generate   --Output driver disabled når T = '1'. Aka vi vil læse med porten. 
   IOBUF_inst : IOBUF                               --https://docs.amd.com/r/en-US/ug953-vivado-7series-libraries/IOBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => i_ExtMemDataFromRam(index),     -- Buffer output
      IO => ExtMemIo_ext(index),   -- Buffer inout port (connect directly to top-level port)
      I => i_ExtMemDataToRam(index),     -- Buffer input
      T => RW_ext--i_SampleRW      -- 3-state enable input, high=input, low=output 
   );
   -- End of IOBUF_inst instantiation
end generate gen_io_port_extRam; 
--External memory controller. Interfaces with EXTMEM_read_write and pulse_gen_4_clks, pulse_gen_2_clks and IOSAVER.
extmem_controller : ExternalMemoryControl
port map(
    PulseInMemoryControl => i_Pulse2CLKs_pulse_out,
    PulseCompleteMemoryControl => i_Pulse2CLKs_pulse_complete,
    PulseInExtReadWrite => i_Pulse4CLKs_pulse_out,
    PulseCompleteExtReadWrite => i_Pulse4CLKs_pulse_complete,
    RnW => i_RnW,
    ADDR_IO_SAVER_TO_EXT_MEM_CTRL => i_ADDR_IO_SAVER_TO_EXT_MEM_CTRL,
    ADDR_EXT_MEM_CTRL_TO_EXT_MEM => i_ADDR_EXT_MEM_CTRL_TO_EXT_MEM,
    DATA_IOSAVER_TO_EXT_MEM_CTRL => i_DATA_IOSAVER_TO_EXT_MEM_CTRL,
    DATA_EXT_MEM_CTRL_TO_EXT_MEM => i_DATA_EXT_MEM_TO_IOSAVER,
    CLK_TO_EXT_MEM_READ_WRITE => i_CLK_TO_EXT_MEM_READ_WRITE
   
);
--Pulse generators for ExternalMemoryControl
pulse_gen_4_clks : pulse_train_gen 
Generic map(
    NR_OF_CLKs => 4
)
Port map(
    Trig_in => i_Pulse4CLKs_trig_in,
    CLK_in => i_Pulse4CLKs_CLK_in,
    Pulse_out => i_Pulse4CLKs_pulse_out,
    Pulse_complete => i_Pulse4CLKs_pulse_complete
);
pulse_gen_2_clks : pulse_train_gen 
Generic map(
    NR_OF_CLKs => 2
)
Port map(
    Trig_in => i_Pulse2CLKs_trig_in,
    CLK_in => i_Pulse2CLKs_CLK_in,
    Pulse_out => i_Pulse2CLKs_pulse_out,
    Pulse_complete => i_Pulse2CLKs_pulse_complete
);



end Behavioral;
