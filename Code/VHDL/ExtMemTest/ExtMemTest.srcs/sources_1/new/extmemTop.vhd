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
signal i_SampleDI : std_logic_vector(15 downto 0):= (others => '0');
signal i_SampleDO : std_logic_vector(7 downto 0):= (others => '0');
signal i_SampleRW : std_logic := '0';
signal i_CLK : std_logic := '0';
signal i_nCE : std_logic;
signal i_nOE : std_logic;
signal i_nWE : std_logic;
signal i_ExtMemDo : std_logic_vector(7 downto 0);
signal i_ExtMemDi : std_logic_vector(7 downto 0);
signal i_ExtMemAdr : std_logic_vector(18 downto 0); 
signal i_invert_t :std_logic;

component samplemem is
  Port (
        SampleDIn : in std_logic_vector(15 downto 0) := (others => '0'); --Sample data input
        SampleDO : out std_logic_vector(7 downto 0):= (others => '0');
       -- SampleDOut : out std_logic_vector(15 downto 0) := (others => '0'); --Stored sample data output
        SampleRW : in std_logic := '0'; --Store in, or retrieve from, RAM.
       -- Mode : in std_logic := '0'; -- Continous read = '1', single read = '0';
        SampleAddr : in std_logic_vector(18 downto 0) := (others => '0'); 
        CLK : in std_logic := '0';
        nCE : out std_logic := '0'; --Chip enable, '1' = Disable, '0' = Enable. 
        nOE : out std_logic := '0'; -- Output driver enable, '0' = Enabled, '1' = disabled.  Used during read.
        nWE : out std_logic := '0'; --Write enable, '0' = Read From RAM / DOUT operation.
                                    --'1' = Write to Ram / DIN operation
        ExtMemDo : out std_logic_vector(7 downto 0) := (others => '0');
        ExtMemDi : in std_logic_vector(7 downto 0) := (others => '0');
        ExtMemAdr : out std_logic_vector(18 downto 0) := (others => '0')
   );
end component samplemem;


begin

--Connect signals to whereever they gotta go.
    i_SampleRW <= not RW_ext; 
    --i_invert_t <= not i_SampleRW;
    i_CLK <= CLK_ext;
    i_SampleDI(7 downto 0) <= SampleDI_ext;
    SampleDO_ext <= i_SampleDO; 
    i_SampleAddr(6 downto 0) <= SampleAddr_ext; 
    ExtMemAddr_ext <= i_ExtMemAdr; 
    ExtMemnWE_ext <= i_ExtMemWE;
    ExtMemnCE_ext <= i_ExtMemCE;
    ExtMemnOE_ext <= i_ExtMemOE;
--

extmem : samplemem
    port map(
        SampleDIn => i_SampleDI, --Sample data input
        SampleDO => i_SampleDO, --Sample data output(From RAM)
        SampleRW => i_SampleRW, --Read or write from RAM
        SampleAddr => i_SampleAddr, --Address of sample
        CLK => i_CLK,  --Clk
        nCE => i_ExtMemCE, --Chip enable
        nOE => i_ExtMemOE, --Output driver enable
        nWE => i_ExtMemWE, --Write or read
        ExtMemDo => i_ExtMemDo, --to tri-state buffer INPUT
        ExtMemDi => i_ExtMemDi, --To tri-state buffer output
        ExtMemAdr => i_ExtMemAdr --To RAM address pins.
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
      O => i_ExtMemDi(index),     -- Buffer output
      IO => ExtMemIo_ext(index),   -- Buffer inout port (connect directly to top-level port)
      I => i_ExtMemDo(index),     -- Buffer input
      T => RW_ext--i_SampleRW      -- 3-state enable input, high=input, low=output 
   );
  
   -- End of IOBUF_inst instantiation
end generate gen_io_port_extRam; 


end Behavioral;
