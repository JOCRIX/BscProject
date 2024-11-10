----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2024 12:46:13 AM
-- Design Name: 
-- Module Name: pulse_wdith_gen_TOP - Behavioral
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

entity pulse_wdith_gen_TOP is
  Port (
        E_MASTER_CLK : in std_logic :='0';
        E_PULSE_OUT : out std_logic := '0';
        E_TRIGGER_OUT : out std_logic := '0';
        E_TRIGGER_IN : in std_logic :='0'
   );
end pulse_wdith_gen_TOP;

architecture Behavioral of pulse_wdith_gen_TOP is

signal w_mega_uber_clk : std_logic := '0';

component pulse_width_gen is
    Generic(
    width : integer := 75
    );
  Port (
        i_master_clk : in std_logic := '0';
        i_trigger : in std_logic    := '0';
        o_trigger : out std_logic := '0';
        o_pulse   : out std_logic   := '0'
   );
end component pulse_width_gen;

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

begin

--E_TRIGGER_OUT <= w_trigger_out;

pulsegen : pulse_width_gen
    Generic map(
        width => 40
        )
    Port map(
    i_master_clk =>w_mega_uber_clk, 
    o_pulse => E_PULSE_OUT,
    o_trigger => E_TRIGGER_OUT,
    i_trigger =>E_TRIGGER_IN
    );


your_instance_name : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => w_mega_uber_clk,
   -- Clock in ports
   clk_in1 => E_MASTER_CLK
 );

end Behavioral;
