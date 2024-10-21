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
        PulseInMemoryControl           : in std_logic := '0'; -- 2 pulses for memory control
        PulseMemoryControlTrigger      : out std_logic := '0';
        PulseCompleteMemoryControl     : in std_logic := '0';
        PulseInExtReadWrite            : in std_logic := '0'; -- 4 pulses for EXT memhandler 
        PulseExtReadWriteTrigger       : out std_logic := '0';
        PulseCompleteExtReadWrite      : in std_logic := '0';
        RnW                            : in std_logic := '0'; -- '0' = write to RAM, '1' = read from RAM
        CLK_IVSAVER_TO_MEM_DIST        : in std_logic := '0';
        ADDR_IV_SAVER_TO_EXT_MEM_DIST  : in std_logic_vector(15 downto 0) := (others => '0'); --X
        ADDR_EXT_MEM_DIST_TO_EXT_MEM   : out std_logic_vector(18 downto 0) := (others => '0'); --X
        DATA_IVSAVER_TO_EXT_MEM_DIST   : in std_logic_vector(15 downto 0) := (others => '0'); --X
        DATA_EXT_MEM_DIST_TO_EXT_MEM   : out std_logic_vector(7 downto 0) := (others => '0');
        DATA_EXT_MEM_TO_IVSAVER        : out std_logic_vector(15 downto 0):= (others => '0');
        CLK_TO_EXT_MEM_READ_WRITE      : out std_logic := '0'
   );
end ExternalMemoryDistribution;

architecture Behavioral of ExternalMemoryDistribution is

constant WRITE : std_logic := '0';
constant READ : std_logic := '1';
signal lowByte_To_EXT_MEM : std_logic_vector(7 downto 0) := (Others => '0');
signal highByte_TO_EXT_MEM : std_logic_vector(7 downto 0) := (Others => '0');
signal lowAddressBits : std_logic_vector(2 downto 0) := "000";
signal highAddressBits : std_logic_vector(2 downto 0):= "100";
--signal ADDR_EXT_MEM : std_log ic_vector(18 downto 0) := (Others => '0');
signal start : std_logic := '0';
signal stop : std_logic := '0';
signal done : std_logic := '0';

type ctrl_state is (WRITEBYTE, READBYTE);
type byte_state is (BYTE1, BYTE2);
signal s_ctrl : ctrl_state := WRITEBYTE;
signal s_byte : byte_state := BYTE1;

begin
--Load 8 LSb's from data going to RAM
lowByte_To_EXT_MEM(7 downto 0) <= DATA_IVSAVER_TO_EXT_MEM_DIST (7 downto 0);
--Load 8 MSb's from data going to RAM
highByte_To_EXT_MEM(7 downto 0) <= DATA_IVSAVER_TO_EXT_MEM_DIST (15 downto 8); 
--Concatenate '000' with ADDR_IV_SAVER_TO_EXT_MEM_DIST for data bits 7..0 address
ADDR_EXT_MEM_DIST_TO_EXT_MEM <= lowAddressbits & ADDR_IV_SAVER_TO_EXT_MEM_DIST; 
--Concatenate '100' with ADDR_IV_SAVER_TO_EXT_MEM_DIST for data bits 15..8 address
ADDR_EXT_MEM_DIST_TO_EXT_MEM <= highAddressbits & ADDR_IV_SAVER_TO_EXT_MEM_DIST;

mem_ctrl_trigger : process (CLK_IVSAVER_TO_MEM_DIST, done) is
begin
    if(done = '1') then
        start <= '0';
    elsif(rising_edge(CLK_IVSAVER_TO_MEM_DIST)) then
        start <= '1';
    end if;
end process;

mem_ctrl_gen_clk : process (start) is
begin
    if(rising_edge(start)) then
        PulseMemoryControlTrigger <= '0';
    end if;
end process;

mem_ctrl : process (PulseInMemoryControl) is
begin

if(rising_edge(PulseInMemoryControl)) then
    if(RnW = write) then
        case s_byte is
        when BYTE1 => 
            
            
        when BYTE2 => 
            
        end case;            
    else
    
    end if;
end if;


--if(RnW = WRITE) then
--    ADDR_EXT_MEM := lowAddressBits & ADDR_IV_SAVER_TO_EXT_MEM_DIST;
--else
--    ADDR_EXT_MEM := highAddressBits & ADDR_IV_SAVER_TO_EXT_MEM_DIST;
--end if;

end process;


end Behavioral;
