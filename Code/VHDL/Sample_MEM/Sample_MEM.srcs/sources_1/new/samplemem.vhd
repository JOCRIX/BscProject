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

entity samplemem is
  Port (
        SampleDIn : in std_logic_vector(15 downto 0) := (others => '0'); --Sample data input
       -- SampleDOut : out std_logic_vector(15 downto 0) := (others => '0'); --Stored sample data output
       -- SampleRW : in std_logic := '0'; --Store in, or retrieve from, RAM.
       -- Mode : in std_logic := '0'; -- Continous read = '1', single read = '0';
        SampleAddr : in std_logic_vector(18 downto 0) := (others => '0'); 
        CLK : in std_logic := '0';
        nCE : out std_logic := '1'; --Chip enable, '1' = Enabled, '0' = disable. 
        nOE : out std_logic := '0'; -- Output driver enable, '0' = Enabled, '1' = disabled.  Used during read.
        nWE : out std_logic := '0'; --Write enable, '0' = Read From RAM / DOUT operation.
                                    --'1' = Write to Ram / DIN operation
        ExtMemDio : out std_logic_vector(7 downto 0) := (others => '0');
        ExtMemAdr : out std_logic_vector(18 downto 0) := (others => '0')
   );
end samplemem;

architecture Behavioral of samplemem is

constant READ : std_logic := '1';
constant WRITE : std_logic := '1';

signal ToExtMemLowByte : std_logic_vector(7 downto 0) := (others => '0');
signal ToExtMemHighByte : std_logic_vector(7 downto 0) := (others => '0');
signal MemAddress : std_logic_vector(18 downto 0) := (others => '0');
type state_ext_mem is (WriteExtMemByte1, WriteExtMemByte2, ReadExtMemByte1,ReadExtMemByte2);
signal state : state_ext_mem := WriteExtMemByte1;

begin
    --Never disable chip.
    nCE <= '1'; 
    --Split data into two bytes
    ToExtMemHighByte <= SampleDIn(15 downto 8); 
    ToExtMemLowByte <= SampleDIn(7 downto 0);
    MemAddress<= SampleAddr;
ExtMemCtrl : process (CLK) is
begin
    if(rising_edge(CLK)) then
        case state is
            when WriteExtMemByte1 =>
                ExtMemAdr <= MemAddress;
            when WriteExtMemByte2 =>                
            
            when ReadExtMemByte1 =>
            
            when ReadExtMemByte2 =>
        end case;
    end if;
end process;
    
end Behavioral;
