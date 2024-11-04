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
        CLK_EXT : in std_logic := '0';
        RW_EXT : in std_logic;
        TEST_RESET : out std_logic;
        IO_PINS_EXT : inout std_logic_vector(15 downto 0);   
        IVSA_DATA : in std_logic_vector(15 downto 0);
        IVSA_ADDR : out std_logic_vector(7 downto 0);
        CLK_TO_IVSA :  out std_logic
  );
end sample_control_TOP;

architecture rtl of sample_control_TOP is
--Internal signals
    signal CLK_internal : std_logic := '0';
    signal RW_internal : std_logic := '0';
    signal TOPORT_internal : std_logic_vector(15 downto 0) := (others => '0');
    signal TORAM_internal : std_logic_vector(15 downto 0):= (others => '0'); 
    signal IO_PINS_internal : std_logic_vector(15 downto 0):= (others => '0');
    signal LOGIC_RESET_internal : std_logic := '0';
    signal sig_IVSA_ADDR : std_logic_vector(15 downto 0) := (others => '0');
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
        CLK         : in std_logic  := '0';
        RW          : in std_logic  := '0';
        FSM_RESET   :in std_logic := '0';
        TORAM : in std_logic_vector(15 downto 0) := (others => '0');
        TOPORT : out std_logic_vector(15 downto 0) := (others => '0');
        ADDR_TO_IV_SAVER : out std_logic_vector(15 downto 0) := (others => '0');
        DATA_FROM_IV_SAVER : in std_logic_vector(15 downto 0) :=(others => '0');
        CLK_TO_IV_SAVER : out std_logic := '0'
        
   );
   end component internal_ram;
   
component logic_reset
      Port (
        CLK : in std_logic;
        RW : in std_logic;
        RESET : out std_logic := '0'
   );   
end component logic_reset;

begin

TEST_RESET <= LOGIC_RESET_internal;
IVSA_ADDR <= sig_IVSA_ADDR(7 downto 0);

logic_resetter : logic_reset
    port map(
    RW => RW_EXT,
    CLK => CLK_EXT,
    RESET => LOGIC_RESET_internal
    );

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
    CLK => CLK_EXT,
    FSM_RESET => LOGIC_RESET_internal,
    RW => RW_EXT,
    TOPORT => TOPORT_internal,
    TORAM => TORAM_internal,
    ADDR_TO_IV_SAVER => sig_IVSA_ADDR,
    DATA_FROM_IV_SAVER => IVSA_DATA,
    CLK_TO_IV_SAVER => CLK_TO_IVSA
);




end rtl;

































