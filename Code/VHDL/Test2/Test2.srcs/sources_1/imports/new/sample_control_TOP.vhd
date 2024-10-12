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
        CLK_EXT : in std_logic := '0';
        RW_EXT : in std_logic;
        IO_PINS_EXT : inout std_logic_vector(15 downto 0)   
  );
end sample_control_TOP;

architecture rtl of sample_control_TOP is
--Internal signals
    signal CLK_internal : std_logic := '0';
    signal RW_internal : std_logic := '0';
    signal RW_internal_buf : std_logic := '0';
    signal TOPORT_internal : std_logic_vector(15 downto 0) := (others => '0');
    signal TORAM_internal : std_logic_vector(15 downto 0):= (others => '0'); 
    signal IO_PINS_internal : std_logic_vector(15 downto 0):= (others => '0');
    SIGNAL ADDR_ERROR_internal :std_logic;

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
        CLK : in std_logic;
        RW : in std_logic;
        TORAM : in std_logic_vector(15 downto 0);
        TOPORT : out std_logic_vector(15 downto 0)
   );
   end component internal_ram;
   
begin
--RW_internal_buf <= not RW_EXT;
gen_comm_port : for index in 0 to 15 generate
    commport : comm_port
        port map(
        RW => RW_EXT,
        IO => IO_PINS_EXT(index),
        TOPORT => TOPORT_internal(index),
        TORAM => TORAM_internal(index)
);
end generate gen_comm_port;

ram : internal_ram 
    port map(
    CLK => CLK_EXT,--CLK_internal,
    RW => RW_EXT,--RW_internal,
    TOPORT => TOPORT_internal,
    TORAM => TORAM_internal
);

--gen_iobuf : for index in 0 to 15 generate
--  IOBUF_inst : IOBUF
--   generic map (
--      DRIVE => 12,
--      IOSTANDARD => "DEFAULT",
--      SLEW => "SLOW")
--   port map (
--      O => TORAM_internal(index),     -- Buffer output
--      IO => IO_PINS_EXT(index),   -- Buffer inout port (connect directly to top-level port)
--      I => TOPORT_internal(index),     -- Buffer input
--      T => RW_internal_buf--RW_EXT--RW_internal_buf      -- 3-state enable input, high=input, low=output 
--   );
--end generate gen_iobuf;

end rtl;

































