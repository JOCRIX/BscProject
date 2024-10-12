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
        --DUMMYOUT : out std_logic; --Den her skal fjernes senere.
        CLK_EXT : in std_logic := '0';
        RW_EXT : in std_logic;
        DEBUG0_EXT : out std_logic;
        DEBUG1_EXT : out std_logic;
        DEBUG2_EXT : out std_logic;
        DEBUG3_EXT : out std_logic;
        DEBUG4_EXT : out std_logic;
        DEBUGLED_EXT : out std_logic;
        DEBUGBTN_EXT : in std_logic;
        IO_PINS_EXT : inout std_logic_vector(15 downto 0)   
  );
end sample_control_TOP;

architecture rtl of sample_control_TOP is
--Internal signals
    signal CLK_internal : std_logic := '0';
    signal RW_internal : std_logic := '0';
    signal TOPORT_internal : std_logic_vector(15 downto 0) := (others => '0');
    signal TORAM_internal : std_logic_vector(15 downto 0):= (others => '0'); 
    signal IO_PINS_internal : std_logic_vector(15 downto 0):= (others => '0');

--Component declarations
component comm_port
      Port (
    IO : inout std_logic;
    RW : in std_logic;
    --CLK : in std_logic;
    TOPORT : in std_logic;
    TORAM : out std_logic
   );
end component comm_port;

component internal_ram
  Port (
        CLK : in std_logic;
        RW : in std_logic;
        DEBUG0 : out std_logic := '0';
        DEBUG1 : out std_logic := '0';
        DEBUG2 : out std_logic := '0';
        DEBUG3 : out std_logic;
        DEBUG4 : out std_logic;
        DEBUGLED : out std_logic;
        DEBUGBTN : in std_logic;
        TORAM : in std_logic_vector(15 downto 0);
        TOPORT : out std_logic_vector(15 downto 0)
   );
   end component internal_ram;
   
begin

gen_comm_port : for index in 0 to 15 generate
    commport : comm_port
        port map(
        --CLK => CLK_EXT,
        RW => RW_EXT,
        IO => IO_PINS_EXT(index),
        TOPORT => TOPORT_internal(index),
        --RESET => RESET_LOGIC_internal,
        TORAM => TORAM_internal(index)
);
end generate gen_comm_port;

ram : internal_ram 
    port map(
    CLK => CLK_EXT,--CLK_internal,
    RW => RW_EXT,--RW_internal,
    DEBUG0 => DEBUG0_EXT,
    DEBUG1 => DEBUG1_EXT,
    DEBUG2 => DEBUG2_EXT,
    DEBUG3 => DEBUG3_EXT,
    DEBUG4 => DEBUG4_EXT,
    DEBUGBTN => DEBUGBTN_EXT,
    DEBUGLED => DEBUGLED_EXT,
    TOPORT => TOPORT_internal,
    --ADDR_ERROR => ADDR_ERROR_internal,
    --RESET => RESET_LOGIC_internal,
    TORAM => TORAM_internal
);



end rtl;

































