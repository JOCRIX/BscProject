----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2024 13:04:44
-- Design Name: 
-- Module Name: pulse_TOP_test - Behavioral
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

entity pulse_TOP_test is
  Port (
        EXT_Trig_in : in std_logic := '0';
        EXT_Trig_out : out std_logic; --test signal output
        EXT_CLK_in : in std_logic := '0';
        EXT_Pulse_out : out std_logic :='0';
        EXT_Pulse_complete : out std_logic := '0' 
   );
end pulse_TOP_test;

architecture Behavioral of pulse_TOP_test is

component pulse_train_gen
Generic(
        NR_OF_CLKs : integer := 4       
);
Port(
            --test : out std_logic;
        Trig_in : in std_logic := '0';
        Trig_out : out std_logic; --test signal output
        CLK_in : in std_logic := '0';
        Pulse_out : out std_logic :='0';
        Pulse_complete : out std_logic := '0' 
);
end component pulse_train_gen;

begin

testpulse : pulse_train_gen
Generic map(
    NR_OF_CLKs => 7
)
Port map(
    Trig_in => EXT_Trig_in,
    Trig_out => EXT_Trig_out,
    CLK_in => EXT_CLK_in,
    Pulse_out => EXT_Pulse_out,
    Pulse_complete => EXT_Pulse_complete
);
end Behavioral;



