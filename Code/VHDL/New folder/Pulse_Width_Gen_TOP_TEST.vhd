----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2024 11:56:36
-- Design Name: 
-- Module Name: Pulse_Width_Gen_TOP_TEST - Behavioral
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

entity Pulse_Width_Gen_TOP_TEST is
  Port ( 
        EXT_TRIGGER_IN                : in std_logic := '0';


        EXT_ACTIVE_PULSE_WIDTH_OUT    : out std_logic := '0';
        EXT_MASTER_CLK_IN             : in std_logic;
        EXT_PULSE_OUT                 : out std_logic :='0'
        );
end Pulse_Width_Gen_TOP_TEST;

architecture Behavioral of Pulse_Width_Gen_TOP_TEST is

component pulse_train_gen_active_out is
  Port (
        --test : out std_logic;
        TRIGGER_IN                : in std_logic := '0';
      --  Trig_out : out std_logic; --test signal output
        CLK_IN                    : in std_logic := '0';
        --BUSY_OUT                  : out std_logic := '0';
        ACTIVE_PULSE_WIDTH_OUT    : out std_logic := '0';
        PULSE_OUT                 : out std_logic :='0'
        --PULSE_COMPLETE_OUT        : out std_logic := '0' 
   );
end component pulse_train_gen_active_out;

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

signal i_CLK_IN_PULSE_TRAIN_GEN_ACTIVE_OUT_TO_INSTANTIATED_CLK_OUT : std_logic;

begin

pulsegen : pulse_train_gen_active_out
    port map(
        TRIGGER_IN => EXT_TRIGGER_IN,
        CLK_IN => i_CLK_IN_PULSE_TRAIN_GEN_ACTIVE_OUT_TO_INSTANTIATED_CLK_OUT,
        ACTIVE_PULSE_WIDTH_OUT => EXT_ACTIVE_PULSE_WIDTH_OUT,
        PULSE_OUT => EXT_PULSE_OUT 
    );
    
main_clk : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => i_CLK_IN_PULSE_TRAIN_GEN_ACTIVE_OUT_TO_INSTANTIATED_CLK_OUT,
   -- Clock in ports
   clk_in1 =>  EXT_MASTER_CLK_IN
 );


end Behavioral;
