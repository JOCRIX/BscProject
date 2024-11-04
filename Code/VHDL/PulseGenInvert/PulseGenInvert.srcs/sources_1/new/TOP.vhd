----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2024 04:24:10 PM
-- Design Name: 
-- Module Name: TOP - Behavioral
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

entity TOP is
  Port ( 
        MASTER_CLK_IN : in std_logic := '0';
        SCK_OUT       : out std_logic := '0';
        ACQUIRE_START : in std_logic := '0'
        
  );
end TOP;

architecture Behavioral of TOP is

signal i_SCK_CLK : std_logic := '0';

signal i_dummy1 : std_logic := '0';
signal i_dummy2 : std_logic := '0';

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

component pulse_gen_width_modulator_inverted is
Generic(
        NR_OF_CLKs : integer := 7;  
        HIGH_TIME : integer := 25; -- in ns, multiples of 5.
        LOW_TIME : integer := 25   -- in ns, multiples of 5.  
);
Port (
        MASTER_CLK_200MEG_IN : in std_logic := '0';
        TRIGGER   : in std_logic := '0';
        PULSE_OUT : out std_logic := '0';
        ACTIVE : out std_logic := '0'
      );
end component;

begin
--i_SCK_CLK<= MASTER_CLK_IN ;

your_instance_name : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => i_SCK_CLK,
   -- Clock in ports
   clk_in1 => MASTER_CLK_IN
 );


pulse_gen_SDA_CLK : pulse_gen_width_modulator_inverted 
Generic map(
        NR_OF_CLKs => 16, 
        HIGH_TIME => 25,
        LOW_TIME => 25   
)
Port map(
        --test : out std_logic;
        TRIGGER => ACQUIRE_START,
      --  Trig_out : out std_logic; --test signal output
        MASTER_CLK_200MEG_IN => i_SCK_CLK,
        PULSE_OUT=> SCK_OUT, 
        ACTIVE => i_dummy2
 );

end Behavioral;