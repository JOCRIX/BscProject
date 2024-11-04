----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2024 08:21:32 PM
-- Design Name: 
-- Module Name: samplemem - Behavioral
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

entity ExtMemReadWrite is
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
end ExtMemReadWrite;

architecture Behavioral of ExtMemReadWrite is

constant READ : std_logic := '0';
constant WRITE : std_logic := '1';

signal ToExtMemLowByte : std_logic_vector(7 downto 0) := (others => '0');
signal ToExtMemHighByte : std_logic_vector(7 downto 0) := (others => '0');
signal MemAddress : std_logic_vector(18 downto 0) := (others => '0');

type state_ext_mem_write is (WriteStep1, WriteStep2, WriteStep3, WriteStep4);
type state_ext_mem_read is (ReadStep1, ReadStep2, ReadStep3, ReadStep4);
signal s_write : state_ext_mem_write := WriteStep1;
signal s_read : state_ext_mem_read := ReadStep1;
begin
    IO_BUF_CTRL <= not SampleRW;
    --Never disable chip.
    nCE <= '0'; 
    --Split data into two bytes
    --ToExtMemHighByte <= SampleDIn(15 downto 8); 
    --ToExtMemLowByte <= SampleDIn(7 downto 0);
    
    --Test Stuff. 8 bits only.
   -- MemAddress(6 downto 0) <= SampleAddr(6 downto 0);
   -- MemAddress(18 downto 7) <= (others => '0');
   MemAddress <= SampleAddr;
    --MemAddress<= SampleAddr;
ExtMemCtrl : process (CLK) is
begin
    if(rising_edge(CLK)) then
        if(SampleRW = WRITE) then
            case s_write is
            when WriteStep1 =>
                ExtMemAdrToRam <= MemAddress;
                nOE <= '1'; --Disable output drivers.
                s_write <= WriteStep2;
            when WriteStep2 =>                
                nWE <= '0'; --Enable write mode.
                s_write <= WriteStep3;
            when WriteStep3 => 
                ExtMemDataToRam <= SampleByteToRam;--ToExtMemLowByte;--Set DATA to IO pins, low byte only for now
                s_write <= WriteStep4;
            when WriteStep4 =>
                nWE <= '1'; --Disable write mode. CLKs data into ram on rising edge of nWE.
                s_write <= WriteStep1;
            end case;
        else
          case s_read is
             when ReadStep1 =>
                nWE <= '1'; --Enable read mode.
                ExtMemAdrToRam <= MemAddress;
                s_read <= ReadStep2;
            when ReadStep2 =>
                 nOE <= '0';
                 s_read <= ReadStep3;                        
            when ReadStep3 =>
                --Skip CLK for timing.
                s_read <= ReadStep4;
            when ReadStep4 =>    
                --Data should be valid with correct CLK
                SampleByteFromRam <= ExtMemDataFromRam;
                nOE <= '1'; -- CLK data out on rising of nOE.
                s_read <= ReadStep1;
          end case; 
        end if;
    end if;
end process;
    
end Behavioral;
