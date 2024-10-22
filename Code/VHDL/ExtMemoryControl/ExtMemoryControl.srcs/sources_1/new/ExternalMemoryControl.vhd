----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2024 13:54:16
-- Design Name: 
-- Module Name: ExternalMemoryControl - Behavioral
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

entity ExternalMemoryDistribution is
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
        CLK_TO_EXT_MEM_READ_WRITE      : out std_logic := '0'
   );
end ExternalMemoryDistribution;

architecture Behavioral of ExternalMemoryDistribution is

constant WRITE : std_logic := '0';
constant READ : std_logic := '1';
signal lowByte_To_EXT_MEM : std_logic_vector(7 downto 0) := (Others => '0');
signal highByte_TO_EXT_MEM : std_logic_vector(7 downto 0) := (Others => '0');
signal lowByte_EXT_MEM_TO_IV_SAVER : std_logic_vector(7 downto 0) := (Others => '0');
signal highByte_EXT_MEM_TO_IV_SAVER : std_logic_vector(7 downto 0) := (Others => '0');

signal lowAddressBits : std_logic_vector(2 downto 0) := "000";
signal highAddressBits : std_logic_vector(2 downto 0):= "100";
signal start : std_logic := '0';

signal ADDR_EXT_MEM_DIST_TO_EXT_MEM_LOWBYTE : std_logic_vector(18 downto 0) := (others => '0');
signal ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE : std_logic_vector(18 downto 0) := (others => '0');

signal trig_pulse_byte1 : std_logic := '0';
signal trig_pulse_byte2 : std_logic := '0';

type byte_state is (BYTE1_STEP1, BYTE1_STEP2, RESET, BYTE2, FINISHED);
signal s_byte : byte_state := BYTE1_STEP1;

begin
--Load 8 LSb's from data going to RAM
lowByte_To_EXT_MEM(7 downto 0) <= DATA_IVSAVER_TO_EXT_MEM_DIST (7 downto 0);
--Load 8 MSb's from data going to RAM
highByte_To_EXT_MEM(7 downto 0) <= DATA_IVSAVER_TO_EXT_MEM_DIST (15 downto 8); 
--Concatenate '000' with ADDR_IV_SAVER_TO_EXT_MEM_DIST for data bits 7..0 address
ADDR_EXT_MEM_DIST_TO_EXT_MEM_LOWBYTE <= lowAddressbits & ADDR_IV_SAVER_TO_EXT_MEM_DIST; 
--Concatenate '100' with ADDR_IV_SAVER_TO_EXT_MEM_DIST for data bits 15..8 address
ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE <= highAddressbits & ADDR_IV_SAVER_TO_EXT_MEM_DIST;
--Put read low and high bytes into DATA_EXT_MEM_TO_IVSAVER
DATA_EXT_MEM_TO_IVSAVER <= highByte_EXT_MEM_TO_IV_SAVER & lowByte_EXT_MEM_TO_IV_SAVER;
--Invert RW signal for EXT MEM module
nRW_TO_EXT_MEM <= not RnW;

mem_ctrl_trigger : process (CLK_IVSAVER_TO_MEM_DIST, s_byte) is
begin
    if(s_byte = FINISHED) then
        start <= '0';
    elsif(rising_edge(CLK_IVSAVER_TO_MEM_DIST)) then
        start <= '1';
    end if;
end process;

mem_ctrl_gen_clk_byte1 : process (trig_pulse_byte1, trig_pulse_byte2) is --Generate 4 pulses til byte 1
begin
    if(trig_pulse_byte1 = '1' xor trig_pulse_byte2 = '1') then
        PulseExtReadWriteTrigger <= '1';
    else
        PulseExtReadWriteTrigger <= '0';
    end if;
end process;

mem_ctrl : process (start,PulseInExtReadWrite, MASTER_CLK) is
begin

if(start = '1' or s_byte = FINISHED) then
    if(rising_edge(MASTER_CLK)) then
        if(PulseExtMemCtrlGenBusy   = '0') then 
            if(RnW = write) then
                case s_byte is
                when BYTE1_STEP1 => 
                    DATA_EXT_MEM_DIST_TO_EXT_MEM <= lowByte_To_EXT_MEM;
                    ADDR_EXT_MEM_DIST_TO_EXT_MEM <= ADDR_EXT_MEM_DIST_TO_EXT_MEM_LOWBYTE;
                    s_byte <= BYTE1_STEP2;
                when BYTE1_STEP2 =>
                    trig_pulse_byte1 <= '1';
                    s_byte <= RESET;
                when RESET =>
                    trig_pulse_byte2 <= '0';
                    trig_pulse_byte1 <= '0';
                    DATA_EXT_MEM_DIST_TO_EXT_MEM <= highByte_To_EXT_MEM;
                    ADDR_EXT_MEM_DIST_TO_EXT_MEM <= ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE;
                    s_byte <= BYTE2;
                when BYTE2 => 
                    trig_pulse_byte2 <= '1';
                    s_byte <= FINISHED;
                when FINISHED =>
                    trig_pulse_byte1 <= '0';
                    trig_pulse_byte2 <= '0';
                    s_byte <= BYTE1_STEP1;
                end case;            
            else
                case s_byte is
                when BYTE1_STEP1 => 
                    ADDR_EXT_MEM_DIST_TO_EXT_MEM <= ADDR_EXT_MEM_DIST_TO_EXT_MEM_LOWBYTE;
                    s_byte <= BYTE1_STEP2;
                when BYTE1_STEP2 =>
                    trig_pulse_byte1 <= '1';
                    s_byte <= RESET;
                when RESET =>
                    trig_pulse_byte2 <= '0';
                    trig_pulse_byte1 <= '0';
                    lowByte_EXT_MEM_TO_IV_SAVER <= DATA_EXT_MEM_TO_EXT_MEM_DIST;
                    ADDR_EXT_MEM_DIST_TO_EXT_MEM <= ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE;
                    s_byte <= BYTE2;
                when BYTE2 => 
                    trig_pulse_byte2 <= '1';
                    s_byte <= FINISHED;
                when FINISHED =>
                    highByte_EXT_MEM_TO_IV_SAVER <= DATA_EXT_MEM_TO_EXT_MEM_DIST;
                    trig_pulse_byte1 <= '0';
                    trig_pulse_byte2 <= '0';
                    s_byte <= BYTE1_STEP1;
                end case;            
            end if;
        end if;
   end if;
end if;
end process;


end Behavioral;
