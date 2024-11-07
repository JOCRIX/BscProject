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
        --i_DATA_ADC_TO_IVSA : in std_logic_vector(15 downto 0);
        i_ADC_DnB : in std_logic;
        i_ADC_RDY : in std_logic;
        
        o_Mem_Addr_ext : out std_logic_vector(18 downto 0); --RAM chip address pins
        io_Mem_IO_ext : inout std_logic_vector(7 downto 0); --RAM chip data I/O
        o_Mem_nWE_ext : out std_logic;
        o_Mem_nCE_ext : out std_logic;
        o_Mem_nOE_ext : out std_logic;
        i_XCO : in std_logic;
        o_RUN_COUNT : out std_logic;
        o_pulse_out : out std_logic

  );
end sample_control_TOP;

architecture rtl of sample_control_TOP is

--Component declarations
component comm_port
      Port (
    IO : inout std_logic;
    RW : in std_logic;
    TOPORT : in std_logic;
    TORAM : out std_logic
   );
end component comm_port;

component internal_ram
  Port (
        i_CLK : in std_logic := '0';
        i_RnW : in std_logic := '0';
        i_FSM_RESET : in std_logic := '0';
        i_TORAM : in std_logic_vector(15 downto 0) := (others => '0');
        o_TOPORT : out std_logic_vector(15 downto 0) := (others => '0');
        i_DATA_FROM_IVSA : in std_logic_vector(15 downto 0) := (others => '0');
        o_ADDR_TO_IVSA : out std_logic_vector(15 downto 0) := (others => '0');
        o_CLK_TO_IVSA : out std_logic := '0'
   );
   end component internal_ram;
   
component logic_reset
      Port (
        CLK : in std_logic;
        RW : in std_logic;
        RESET : out std_logic := '0'
   );   
end component logic_reset;

component IV_SAMPLE_CTRL is
    Port ( 
            --MASTER_CLK_IN : in std_logic;
            CLK_FROM_INT_MEM_IN : in STD_LOGIC;
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
end component;

component pulse_train_gen is
generic( 
        NR_OF_CLKs : integer := 4
    );
    port (
        Trig_in : in std_logic := '0';
        CLK_in : in std_logic := '0';
        BUSY : out std_logic := '0';
        Pulse_out : out std_logic := '0';
        Pulse_complete : out std_logic := '0'
    );
end component pulse_train_gen;

component clk_wiz_0
    port(
        clk_out1 : out std_logic;
        clk_in1 : in std_logic
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

    
--Internal signals
    signal TOPORT_internal : std_logic_vector(15 downto 0) := x"AAAA";
    signal TORAM_internal : std_logic_vector(15 downto 0):= x"AAAA"; 
    signal LOGIC_RESET_internal : std_logic := '0';
    
    --IMEM and IVSA wires
    signal w_ADDR_IMEM_TO_IVSA : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_DATA_IVSA_TO_IMEM : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_CLK_IMEM_TO_IVSA : std_logic := '0';
    
    --IVSA and MDIST wires
    signal w_DATA_IVSA_TO_MDIST :std_logic_vector(15 downto 0) := x"AAAA";
    signal w_DATA_MDIST_TO_IVSA : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_ADDR_IVSA_TO_MDIST : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_RnW_IVSA_TO_MDIST : std_logic := '0';
    signal w_CLK_IVSA_TO_MDIST : std_logic := '0';
    
    --MDIST and EMEMRW wires
    signal w_nRW_MDIST_TO_EMEMRW : std_logic := '0';
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

    -- MISC
    signal w_MDIST_STATE : std_logic_vector (2 downto 0) := (others => '0');

    --EMEMRW and external RAM
    signal w_DATA_EMEMRW_TO_EMEM : std_logic_vector(7 downto 0) := (others => '0');
    signal w_DATA_EMEM_TO_EMEMRW : std_logic_vector(7 downto 0) := (others => '0');
    signal w_IO_BUF_CTRL : std_logic := '0';

    --signal buf : std_logic_vector(15 downto 0) := (others => '0');
    signal w_test : std_logic := '0';
    
    signal w_ADC_DATA_SIM : std_logic_vector(15 downto 0) := x"AAAA";
    
    signal count : integer range 0 to 20000 := 24;
    signal trigger : std_logic := '0';
    signal startCount : std_logic := '0';
    
    signal count2 : integer range 0 to 10000 := 0;
    signal divOut : std_logic := '0';
--    signal IVDATACOUNT : integer range 0 to 20000 := 0;
    signal countDone : std_logic := '0';
begin

process(i_XCO) is
begin
if(rising_edge(i_XCO)) then
    count2 <= count2 +1;
    if(count2 >= 120) then
    count2 <= 0;
    divOut <= not divOut;
    end if;
end if;
end process;

process(i_ADC_RDY, divOut, startCount, count, countDone, trigger) is
begin
    if(countDone = '1') then
        startCount <= '0';
    elsif(rising_edge(i_ADC_RDY)) then
        startCount <= '1';
    end if;
    
    if(rising_edge(divOut)) then
        if (startCount = '1') then
            count <= count + 1;
            if (count >= 200) then
                countDone <= '1';
            else
                countDone <= '0';
            end if;
        else
            count <= 0;
            countDone <= '0';
        end if;
    end if;
end process;

process(startCount, divOut) is
begin
    if(startCount = '1') then
        trigger <= divOut;
    end if;
end process;

process(trigger, count, w_ADC_DATA_SIM) is
begin
    if(falling_edge(trigger)) then
        w_ADC_DATA_SIM <= std_logic_vector(to_unsigned(count, w_ADC_DATA_SIM'length));
    end if;
end process;
        
          

--w_MEM_CLK <= not w_GRANDMASTER_CLK;
w_MEM_CLK <= not i_XCO;
o_pulse_out <= trigger;
w_test <= not w_IO_BUF_CTRL;
o_RUN_COUNT <= startCount;
--buf <= i_DATA_ADC_TO_IVSA;


PLL_1 : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => w_GRANDMASTER_CLK,
   -- Clock in ports
   clk_in1 => i_XCO
 );

PulseGen1 : pulse_train_gen 
Generic map(
    NR_OF_CLKs => 4
)
Port map(
    Trig_in => w_PulseGen1_trig_in,
    CLK_in => i_XCO, -- 12 MHz crystal, can be configured for other clocks too.
    BUSY => w_PulseGen1_BUSY,
    Pulse_out => w_PulseGen1_pulse_out,
    Pulse_complete => w_PulseGen1_pulse_complete
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

EXT_MEM_RW1 : ExtMemReadWrite
    port map (
        --To external memory
        ExtMemDataToRam => w_DATA_EMEMRW_TO_EMEM,
        ExtMemDataFromRam => w_DATA_EMEM_TO_EMEMRW,
        ExtMemAdrToRam => o_Mem_Addr_ext,
        nCE => o_Mem_nCE_ext,
        nOE => o_Mem_nOE_ext,
        nWE => o_Mem_nWE_ext, 
        IO_BUF_CTRL => w_IO_BUF_CTRL,
        --From memory distribution
        SampleByteToRam => w_DATA_MDIST_TO_EMEMRW,
        SampleByteFromRam => w_DATA_EMEMRW_TO_MDIST,
        SampleRW => w_nRW_MDIST_TO_EMEMRW,
        SampleAddr => w_ADDR_MDIST_TO_EMEMRW,
        CLK => w_CLK_MDIST_TO_EMEMRW
        );

MEM_DIST1 :ExternalMemoryDistribution
    port map (
        --Memory Distribution to and  from External Memory Read Write control
        DATA_EXT_MEM_DIST_TO_EXT_MEM => w_DATA_MDIST_TO_EMEMRW,
        DATA_EXT_MEM_TO_EXT_MEM_DIST => w_DATA_EMEMRW_TO_MDIST,
        nRW_TO_EXT_MEM => w_nRW_MDIST_TO_EMEMRW,
        ADDR_EXT_MEM_DIST_TO_EXT_MEM => w_ADDR_MDIST_TO_EMEMRW,
        CLK_TO_EXT_MEM_READ_WRITE => w_CLK_MDIST_TO_EMEMRW,
        --Memory Distribution to and from pulse generator:
        PulseExtReadWriteTrigger => w_PulseGen1_trig_in,
        PulseExtMemCtrlGenBusy => w_PulseGen1_BUSY,
        PulseInExtReadWrite => w_PulseGen1_pulse_out,
        PulseCompleteExtReadWrite => w_PulseGen1_pulse_complete,
        --IV Saver to and from Memory Distribution:
        RnW => w_RnW_IVSA_TO_MDIST,
        CLK_IVSAVER_TO_MEM_DIST => w_CLK_IVSA_TO_MDIST,
        ADDR_IV_SAVER_TO_EXT_MEM_DIST => w_ADDR_IVSA_TO_MDIST,
        --DATA_IVSAVER_TO_EXT_MEM_DIST => w_DATA_IVSA_TO_MDIST,
        DATA_IVSAVER_TO_EXT_MEM_DIST => w_ADC_DATA_SIM,
        DATA_EXT_MEM_TO_IVSAVER => w_DATA_MDIST_TO_IVSA,
        --Master clock
        MASTER_CLK => w_MEM_CLK,
        
        STATE_OUT => w_MDIST_STATE        
        );



IV_SAVER : IV_SAMPLE_CTRL
    port map (
            --MASTER_CLK_IN : in std_logic;
        CLK_FROM_INT_MEM_IN => w_CLK_IMEM_TO_IVSA,
        ADDR_FROM_INT_MEM_IN => w_ADDR_IMEM_TO_IVSA,
        DATA_TO_INT_MEM_OUT => w_DATA_IVSA_TO_IMEM,
        DATA_FROM_MEM_DIST_IN => w_DATA_MDIST_TO_IVSA,
        --DATA_FROM_MEM_DIST_IN => w_ADC_DATA_SIM,
                
        ADC_DnB => i_ADC_DnB,
        --ADC_DATA_IN => i_DATA_ADC_TO_IVSA,
        ADC_DATA_IN => w_ADC_DATA_SIM,
        --ADC_DATA_RDY_IN => i_ADC_RDY,       
        ADC_DATA_RDY_IN => trigger,   
        DATA_TO_MEM_DIST_OUT => w_DATA_IVSA_TO_MDIST,
        ADDR_TO_MEM_DIST_OUT => w_ADDR_IVSA_TO_MDIST,
        RnW_TO_MEM_DIST_OUT => w_RnW_IVSA_TO_MDIST,
        CLK_TO_MEM_DIST_OUT => w_CLK_IVSA_TO_MDIST
    );

ram : internal_ram 
    port map(
    i_CLK => i_COMM_CLK,
    i_FSM_RESET => LOGIC_RESET_internal,
    i_RnW => i_COMM_RW,
    o_TOPORT => TOPORT_internal,
    i_TORAM => TORAM_internal,
    o_ADDR_TO_IVSA => w_ADDR_IMEM_TO_IVSA,
    i_DATA_FROM_IVSA => w_DATA_IVSA_TO_IMEM,
    --DATA_FROM_IV_SAVER => w_ADC_DATA_SIM,
    o_CLK_TO_IVSA => w_CLK_IMEM_TO_IVSA
--    ADDR_TO_IV_SAVER => sig_IVSA_ADDR,
--    DATA_FROM_IV_SAVER => IVSA_DATA,
--    CLK_TO_IV_SAVER => CLK_TO_IVSA
);


logic_resetter : logic_reset
    port map(
    RW => i_COMM_RW,
    CLK => i_COMM_CLK,
    RESET => LOGIC_RESET_internal
    );

gen_comm_port : for index in 0 to 15 generate
    commport : comm_port
        port map(
        RW => i_COMM_RW,
        IO => io_COMM_BUS(index),
        TOPORT => TOPORT_internal(index),
        TORAM => TORAM_internal(index)
);
end generate gen_comm_port;



end rtl;







