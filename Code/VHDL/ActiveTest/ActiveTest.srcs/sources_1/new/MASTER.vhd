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
--        o_COMM_BUS : out std_logic_vector(15 downto 0);  
        --i_DATA_ADC_TO_IVSA : in std_logic_vector(15 downto 0);
        i_SAMPLE_F : in std_logic_vector(15 downto 0);
        i_ADC_DnB : in std_logic;
        i_ADC_RDY : in std_logic;
        
        o_Mem_Addr_ext : out std_logic_vector(18 downto 0); --RAM chip address pins
        io_Mem_IO_ext : inout std_logic_vector(7 downto 0); --RAM chip data I/O
        o_Mem_nWE_ext : out std_logic;
        o_Mem_nCE_ext : out std_logic;
        o_Mem_nOE_ext : out std_logic;
        i_XCO : in std_logic;
        o_RUN_COUNT : out std_logic;
        o_pulse_out : out std_logic;
        o_EMEM_HOLD : out std_logic
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

component EXT_MEM_COMM is
    Port ( 
            i_CLK : in std_logic := '0';
            o_CLK : out std_logic := '0';
            i_DATA : in std_logic_vector(15 downto 0) := (others => '0');
            o_DATA : out std_logic_vector (15 downto 0) := (others => '0');
            o_ADDR : out std_logic_vector (15 downto 0) := (others => '0');
            i_RESET : in std_logic := '0'
            );
end component;


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
            CLK_TO_MEM_DIST_OUT : out STD_LOGIC;
            i_RESET : in std_logic := '0'
            );
end component;

--component pulse_train_gen is
--generic( 
--        NR_OF_CLKs : integer := 4
--    );
--    port (
--        Trig_in : in std_logic := '0';
--        CLK_in : in std_logic := '0';
--        BUSY : out std_logic := '0';
--        Pulse_out : out std_logic := '0';
--        Pulse_complete : out std_logic := '0'
--    );
--end component pulse_train_gen;

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
        STATE_OUT : out std_logic_vector (2 downto 0) := (others => '0');
        i_RESET : in std_logic     
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


component pulse_gen_width_modulator_inverted is
Generic(
        NR_OF_CLKs : integer := 4;  
        HIGH_TIME : integer := 15; -- in ns, multiples of 5.
        LOW_TIME : integer := 5   -- in ns, multiples of 5.  
);
Port (
        MASTER_CLK_200MEG_IN : in std_logic := '0';
        TRIGGER   : in std_logic := '0';
        PULSE_OUT : out std_logic := '0';
        ACTIVE : out std_logic := '0'
      );
end component;

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
    
    signal w_ADC_DATA_SIM : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_ADC_DnB_n : std_logic := '1';
    
    signal count : integer range 0 to 65535 := 0;
    signal trigger : std_logic := '0';
    signal init : std_logic := '0';
    
    signal count2 : integer range 0 to 65535 := 0;
    signal divOut : std_logic := '0';
    signal dataCount : integer range 0 to 65535 := 0;
    signal countDone : std_logic := '0';
    signal CMPLT : std_logic := '0';
    signal arm : std_logic := '0';
    
    signal SAMPLE_F_u16 : integer range 0 to 65535 := 0;
begin

SAMPLE_F_u16 <= TO_INTEGER(unsigned(i_SAMPLE_F));

--w_ADC_DnB_n <= not i_ADC_DnB;
w_ADC_DnB_n <= not arm;
process(w_GRANDMASTER_CLK) is
begin
if(rising_edge(w_GRANDMASTER_CLK)) then
    if(count2 >= SAMPLE_F_u16) then
        count2 <= 0;
        divOut <= not divOut;
    else
        count2 <= count2 +1;
    end if;
end if;
end process;



process(init, divOut, i_ADC_RDY) is
begin
    if(init <= '0' or i_ADC_RDY = '1') then
        CMPLT <= '0';
        count <= 0;
    elsif(falling_edge(divOut)) then
        if(count >= 255) then
            CMPLT <= '1';
        else
            count <= count +1;
        end if;
    end if;
end process;
w_ADC_DATA_SIM <= std_logic_vector(to_unsigned(count, w_ADC_DATA_SIM'length));


MUX_ADC_TRIGGER : process(init) is
begin
    if(init = '1') then
        trigger <= divOut;
    else
        trigger <= '0';
    end if;
end process;

ARM_ADC : process(i_ADC_DnB, CMPLT) is
begin
    if(CMPLT = '1') then
        arm <= '0';
    elsif(rising_edge(i_ADC_DnB)) then
        arm <= '1';
    end if;
end process;

SETTLE_MEM : process(w_GRANDMASTER_CLK, arm) is
    variable v_Count : natural range 0 to 1000 := 0;
begin
    if(rising_edge(w_GRANDMASTER_CLK)) then
        if(arm = '1') then
            if(v_Count >=100) then
                init <= '1';
            else
                v_Count := v_Count +1;
            end if;
        else
            v_Count := 0;
            init <= '0';
        end if;
    end if;            
end process;


          
--w_ADC_DATA_SIM <= std_logic_vector(to_unsigned(count, w_ADC_DATA_SIM'length));
--w_ADC_DATA_SIM <= x"AAAA";




--process(w_ADC_DnB_n) is
--begin
--    if (w_ADC_DnB_n = '0') then
--        trigger <= divOut;
--    else
--        trigger <= '0';
--    end if;
--end process;


        
         
w_MEM_CLK <= not w_GRANDMASTER_CLK;
--w_MEM_CLK <= not i_XCO;
--o_pulse_out <= trigger;
o_pulse_out <= arm;
w_test <= not w_IO_BUF_CTRL;

--buf <= i_DATA_ADC_TO_IVSA;


PLL_1 : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => w_GRANDMASTER_CLK,
   -- Clock in ports
   clk_in1 => i_XCO
 );

--PulseGen1 : pulse_train_gen 
--Generic map(
--    NR_OF_CLKs => 4
--)
--Port map(
--    Trig_in => w_PulseGen1_trig_in,
--    CLK_in => w_GRANDMASTER_CLK, -- 12 MHz crystal, can be configured for other clocks too.
--    BUSY => w_PulseGen1_BUSY,
--    Pulse_out => w_PulseGen1_pulse_out,
--    Pulse_complete => w_PulseGen1_pulse_complete
--);



PulseGen2 : pulse_gen_width_modulator_inverted
Generic map(
        NR_OF_CLKs => 5,  
        HIGH_TIME => 15, -- in ns, multiples of 5.
        LOW_TIME => 5   -- in ns, multiples of 5.  
)
Port map (
        MASTER_CLK_200MEG_IN => w_GRANDMASTER_CLK,
        TRIGGER   => w_PulseGen1_trig_in,
        PULSE_OUT => w_PulseGen1_pulse_out,
        ACTIVE => w_PulseGen1_BUSY
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

--EXT_MEM_RW1 : ExtMemReadWrite
--    port map (
--        --To external memory
--        ExtMemDataToRam => w_DATA_EMEMRW_TO_EMEM,
--        ExtMemDataFromRam => w_DATA_EMEM_TO_EMEMRW,
--        ExtMemAdrToRam => o_Mem_Addr_ext,
--        nCE => o_Mem_nCE_ext,
--        nOE => o_Mem_nOE_ext,
--        nWE => o_Mem_nWE_ext, 
--        IO_BUF_CTRL => w_IO_BUF_CTRL,
--        --From memory distribution
--        SampleByteToRam => w_DATA_MDIST_TO_EMEMRW,
--        SampleByteFromRam => w_DATA_EMEMRW_TO_MDIST,
--        SampleRW => w_nRW_MDIST_TO_EMEMRW,
--        SampleAddr => w_ADDR_MDIST_TO_EMEMRW,
--        CLK => w_CLK_MDIST_TO_EMEMRW
--        );

--MEM_DIST1 :ExternalMemoryDistribution
--    port map (
--        --Memory Distribution to and  from External Memory Read Write control
--        DATA_EXT_MEM_DIST_TO_EXT_MEM => w_DATA_MDIST_TO_EMEMRW,
--        DATA_EXT_MEM_TO_EXT_MEM_DIST => w_DATA_EMEMRW_TO_MDIST,
--        nRW_TO_EXT_MEM => w_nRW_MDIST_TO_EMEMRW,
--        ADDR_EXT_MEM_DIST_TO_EXT_MEM => w_ADDR_MDIST_TO_EMEMRW,
--        CLK_TO_EXT_MEM_READ_WRITE => w_CLK_MDIST_TO_EMEMRW,
--        --Memory Distribution to and from pulse generator:
--        PulseExtReadWriteTrigger => w_PulseGen1_trig_in,
--        PulseExtMemCtrlGenBusy => w_PulseGen1_BUSY,
--        PulseInExtReadWrite => w_PulseGen1_pulse_out,
--        PulseCompleteExtReadWrite => w_PulseGen1_pulse_complete,
--        --IV Saver to and from Memory Distribution:
--        RnW => w_RnW_IVSA_TO_MDIST,
--        CLK_IVSAVER_TO_MEM_DIST => w_CLK_IVSA_TO_MDIST,
--        ADDR_IV_SAVER_TO_EXT_MEM_DIST => w_ADDR_IVSA_TO_MDIST,
--        DATA_IVSAVER_TO_EXT_MEM_DIST => w_DATA_IVSA_TO_MDIST,
--        --DATA_IVSAVER_TO_EXT_MEM_DIST => w_ADC_DATA_SIM,
--        DATA_EXT_MEM_TO_IVSAVER => w_DATA_MDIST_TO_IVSA,
--        --Master clock
--        MASTER_CLK => w_MEM_CLK,
        
--        STATE_OUT => w_MDIST_STATE,
                
--        i_reset => i_ADC_RDY
--        );

ext_memRW : EXT_MEM_RW20
    port map(
        i_DATA => w_DATA_MDIST_TO_EMEMRW,
        o_DATA  => w_DATA_EMEMRW_TO_MDIST,
        o_DATA_TO_ERAM => w_DATA_EMEMRW_TO_EMEM,
        i_DATA_FR_ERAM => w_DATA_EMEM_TO_EMEMRW,
        i_RnW => w_RnW_MDIST_TO_EMEMRW,
        i_ADDR => w_ADDR_MDIST_TO_EMEMRW,
        i_RESET => i_ADC_RDY,
        
        o_ADDR_TO_ERAM => o_Mem_Addr_ext,
        i_EN => w_CLK_MDIST_TO_EMEMRW,
        i_CLK => w_GRANDMASTER_CLK,
        o_nCE => o_Mem_nCE_ext,
        o_nOE => o_Mem_nOE_ext,
        o_nWE => o_Mem_nWE_ext,
        
        o_IO_BUF_CTRL => w_IO_BUF_CTRL,
        o_ACTIVE => w_EMEMRW_HOLD
    );

--w_DATA_MDIST_TO_EMEMRW <= w_DATA_IVSA_TO_MDIST(7 downto 0);
--w_DATA_MDIST_TO_IVSA <= x"00" & w_DATA_EMEMRW_TO_MDIST;
--w_RnW_MDIST_TO_EMEMRW <= w_RnW_IVSA_TO_MDIST;
--w_ADDR_MDIST_TO_EMEMRW <= "000" & w_ADDR_IVSA_TO_MDIST;
--w_CLK_MDIST_TO_EMEMRW <= w_CLK_IVSA_TO_MDIST;

o_EMEM_HOLD <= w_EMEMRW_HOLD;



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
        i_RESET => i_ADC_RDY, --Reset, simply resets logic.
        o_ACTIVE => o_RUN_COUNT
    );
    

IV_SAVER : IV_SAMPLE_CTRL
    port map (
            --MASTER_CLK_IN : in std_logic;
        CLK_FROM_INT_MEM_IN => w_CLK_IMEM_TO_IVSA,
        ADDR_FROM_INT_MEM_IN => w_ADDR_IMEM_TO_IVSA,
        DATA_TO_INT_MEM_OUT => w_DATA_IVSA_TO_IMEM,
        DATA_FROM_MEM_DIST_IN => w_DATA_MDIST_TO_IVSA,
        --DATA_FROM_MEM_DIST_IN => w_ADC_DATA_SIM,
                
        ADC_DnB => w_ADC_DnB_n,
        --ADC_DATA_IN => i_DATA_ADC_TO_IVSA,
        ADC_DATA_IN => w_ADC_DATA_SIM,
        --ADC_DATA_RDY_IN => i_ADC_RDY,       
        ADC_DATA_RDY_IN => trigger,   
        DATA_TO_MEM_DIST_OUT => w_DATA_IVSA_TO_MDIST,
        ADDR_TO_MEM_DIST_OUT => w_ADDR_IVSA_TO_MDIST,
        RnW_TO_MEM_DIST_OUT => w_RnW_IVSA_TO_MDIST,
        CLK_TO_MEM_DIST_OUT => w_CLK_IVSA_TO_MDIST,
        i_RESET => i_ADC_RDY
    );

--ram : internal_ram 
--    port map(
--    i_CLK => i_COMM_CLK,
--    i_FSM_RESET => LOGIC_RESET_internal,
--    i_RnW => i_COMM_RW,
--    o_TOPORT => TOPORT_internal,
--    i_TORAM => TORAM_internal,
--    o_ADDR_TO_IVSA => w_ADDR_IMEM_TO_IVSA,
--    i_DATA_FROM_IVSA => w_DATA_IVSA_TO_IMEM,
--    --DATA_FROM_IV_SAVER => w_ADC_DATA_SIM,
--    o_CLK_TO_IVSA => w_CLK_IMEM_TO_IVSA
----    ADDR_TO_IV_SAVER => sig_IVSA_ADDR,
----    DATA_FROM_IV_SAVER => IVSA_DATA,
----    CLK_TO_IV_SAVER => CLK_TO_IVSA
--);

ext_ram : EXT_MEM_COMM 
    port map(
        i_CLK => i_COMM_CLK,
        o_CLK => w_CLK_IMEM_TO_IVSA,
        i_DATA => w_DATA_IVSA_TO_IMEM,
        o_DATA => TOPORT_internal,
        o_ADDR => w_ADDR_IMEM_TO_IVSA,
        i_RESET => i_ADC_RDY
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