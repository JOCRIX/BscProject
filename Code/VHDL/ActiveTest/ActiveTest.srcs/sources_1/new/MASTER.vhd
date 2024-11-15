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
        i_ADC_DnB : in std_logic;
        --i_ADC_RDY : in std_logic;
        
        o_Mem_Addr_ext : out std_logic_vector(18 downto 0); --RAM chip address pins
        io_Mem_IO_ext : inout std_logic_vector(7 downto 0); --RAM chip data I/O
        o_Mem_nWE_ext : out std_logic;
        o_Mem_nCE_ext : out std_logic;
        o_Mem_nOE_ext : out std_logic;
        i_XCO : in std_logic;
        o_MDIST_BUSY : out std_logic;
        o_ADC_TRIG : out std_logic;
        o_CLK_DAC : out std_logic;
        o_DATA_DAC : out std_logic_vector(15 downto 0)
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
        o_REGISTER_4 : out std_logic_vector(15 downto 0) := (others => '0');
        o_REGISTER_5 : out std_logic_vector(15 downto 0) := x"00FF";
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
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
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
            o_FWORD : out std_logic_vector (31 downto 0); --The full 32 bit wide frequency setting word.
            i_DDS_DATA : in std_logic_vector(15 downto 0); --DDS output data, in two's compliment.
            o_DAC_DATA : out std_logic_vector (15 downto 0); --DDS data converted to unsigned, this is the Data for the DAC.
            o_UPDATE_F : out std_logic;  --Togles when a new frequency is to be set at the output.
            i_CLK : in std_logic -- Master clock input, (200 MHz when implemented).
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
    
    signal w_ADC_DATA_SIM : std_logic_vector(15 downto 0) := x"AAAA";
    signal w_ADC_DnB_n : std_logic := '1';
    
    signal w_FWORD_DDC_TO_DDS : std_logic_vector(31 downto 0);
    signal w_DATA_DDS_TO_DDC : std_logic_vector(15 downto 0);
    signal w_UP_F_DDC_TO_DDS : std_logic := '0';    
    
    signal count : integer range 0 to 65535 := 0;
    signal trigger : std_logic := '0';
    signal init : std_logic := '0';
    
    signal count2 : integer range 0 to 65535 := 0;
    signal divOut : std_logic := '0';
    signal dataCount : integer range 0 to 65535 := 0;
    signal countDone : std_logic := '0';
    signal CMPLT : std_logic := '0';
    signal arm : std_logic := '0';
    signal w_ADC_TRIG : std_logic := '0';
    
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
    signal w_REGISTER_23 : std_logic_vector(15 downto 0);
    signal w_REGISTER_5 : std_logic_vector(15 downto 0); 
    signal w_REGISTER_4 : std_logic_vector(15 downto 0);
    signal w_CLK_DDS : std_logic := '0';
begin



--w_LOGIC_RESET <= i_ADC_RDY;
--i_ADC_RDY <= w_LOGIC_RESET;
--o_Mem_Addr_ext <= test_ADDR_ext_mem;
--o_ADDR_TEST <= test_ADDR_ext_mem;
--o_ADDR_TEST <= "000" & w_ADDR_IVSA_TO_MDIST;


process(w_GRANDMASTER_CLK) is
begin
    if(rising_edge(w_GRANDMASTER_CLK)) then
        --SAMPLE_F_u16 <= TO_INTEGER(unsigned(i_SAMPLE_F));
        SAMPLE_F_u16 <= TO_INTEGER(unsigned(w_REGISTER_23));
    end if;
end  process;


w_ADC_DnB_n <= not arm;
o_ADC_TRIG <= w_ADC_TRIG;
w_nRnW_COMM <= not i_COMM_RW;

process(init, w_GRANDMASTER_CLK, w_LOGIC_RESET, SAMPLE_F_u16) is
variable v_DelCount : integer range 0 to 65536 := 0;
variable v_TrigCount : integer range 0 to 65536 := 0;
begin
    if(rising_edge(w_GRANDMASTER_CLK)) then
        --w_ADC_DATA_SIM <= std_logic_vector(to_unsigned(count, w_ADC_DATA_SIM'length));
        if(init = '0' or w_LOGIC_RESET = '1' or CMPLT = '1') then
            CMPLT <= '0';
            v_DelCount := 0;
            v_TrigCount := 0;
            w_ADC_TRIG <= '0';
            count <= 0;
        else
            if(v_TrigCount <= 65535) then
                case s_byte is 
                    when S1 =>
                        w_ADC_TRIG <= '1';
                        if(v_DelCount > SAMPLE_F_u16) then
                            s_byte <= S2;
                            v_DelCount := 0;
                        else
                            v_DelCount := v_DelCount +1;
                        end if;
                    when S2 =>
                        w_ADC_TRIG <= '0';
                        if(v_DelCount > SAMPLE_F_u16) then
                            v_TrigCount := v_TrigCount +1;
                            count <= v_TrigCount;
                            s_byte <= SEQ_CMPLT;
                        else
                            v_DelCount := v_DelCount+1;
                        end if;
                    when others =>
                        s_byte <= S1;
                        v_DelCount := 0;
                end case;
            else
                v_TrigCount := 0;
                v_DelCount := 0;
                CMPLT <= '1';
                s_byte <= S1;
                count <= 0;
            end if;
        end if;
    end if;
end process;
w_ADC_DATA_SIM <= std_logic_vector(to_unsigned(count, w_ADC_DATA_SIM'length));

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

        
         
w_MEM_CLK <= not w_GRANDMASTER_CLK;
w_test <= not w_IO_BUF_CTRL;


PLL_1 : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => w_GRANDMASTER_CLK,
   -- Clock in ports
   clk_in1 => i_XCO
 );

your_instance_name : dds_compiler_0
  PORT MAP (
    aclk => w_CLK_DDS,
    s_axis_config_tvalid => w_UP_F_DDC_TO_DDS,
    s_axis_config_tdata => w_FWORD_DDC_TO_DDS,
    --m_axis_data_tvalid => ,
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

--w_DATA_MDIST_TO_EMEMRW <= w_DATA_IVSA_TO_MDIST(7 downto 0);
--w_DATA_MDIST_TO_IVSA <= x"00" & w_DATA_EMEMRW_TO_MDIST;
--w_RnW_MDIST_TO_EMEMRW <= w_RnW_IVSA_TO_MDIST;
--w_ADDR_MDIST_TO_EMEMRW <= "000" & w_ADDR_IVSA_TO_MDIST;
--w_CLK_MDIST_TO_EMEMRW <= w_CLK_IVSA_TO_MDIST;


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


IV_SAVER : IV_SAMPLE_CTRL
    port map (
        i_CLK_IXMUX => w_CLK_IXMUX_TO_IVSA,
        o_DATA_IXMUX => w_DATA_IVSA_TO_IXMUX,
        DATA_FROM_MEM_DIST_IN => w_DATA_MDIST_TO_IVSA, 
        ADC_DnB => w_ADC_DnB_n,
        ADC_DATA_IN => w_ADC_DATA_SIM,
        ADC_DATA_RDY_IN => w_ADC_TRIG,
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
        o_REGISTER_4 => w_REGISTER_4,
        o_REGISTER_5 => w_REGISTER_5,
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