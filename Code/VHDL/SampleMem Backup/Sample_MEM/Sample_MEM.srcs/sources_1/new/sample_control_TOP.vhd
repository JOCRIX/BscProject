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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sample_control_TOP is
  Port (
        CLK_EXT : in std_logic;
        RW_EXT : in std_logic;
        IO_PINS_EXT : inout std_logic_vector(15 downto 0)     
  );
end sample_control_TOP;

architecture rtl of sample_control_TOP is
--Internal signals
    signal CLK_internal : std_logic;
    signal RW_internal : std_logic;
    signal DataIn_internal : std_logic_vector(15 downto 0);
    signal DataOut_internal : std_logic_vector(15 downto 0); 
    signal IO_PINS_internal : std_logic_vector(15 downto 0);

--Component declarations
component io_port
      Port (
    IO_PINS : inout std_logic;
    RW : in std_logic;
    DATAIN : in std_logic;
    DATAOUT : out std_logic
   );
end component io_port;

component internal_ram
  Port (
        CLK : in std_logic;
        RW : in std_logic;
        DATAIN : in std_logic_vector(15 downto 0);
        DATAOUT : out std_logic_vector(15 downto 0)
   );
   end component internal_ram;
    
begin

     --CLK_internal <= CLK_EXT;
     --RW_internal <= RW_EXT;

--Generate 16 instances of the IO buffer (io_port) component
gen_io_bufs : for index in 0 to 15 generate
    io_buf : io_port
    port map(
      RW => RW_EXT,--RW_internal,--RW_EXT,
      --DATAIN => DataIn_internal(index),
      --DATAOUT => DataOut_internal(index),
      DATAIN => DataOut_internal(index),
      DATAOUT => DataIn_internal(index),
      IO_PINS => IO_PINS_EXT(index)
    );
end generate gen_io_bufs;


ram : internal_ram 
    port map(
    CLK => CLK_EXT,--CLK_internal,
    RW => RW_EXT,--RW_internal,
    DATAIN => DataIn_internal,
    DATAOUT => DataOut_internal
);



end rtl;

































