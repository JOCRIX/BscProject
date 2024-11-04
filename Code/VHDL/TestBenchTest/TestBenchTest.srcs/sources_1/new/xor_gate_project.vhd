-- Code your design here
library ieee;
use ieee.std_logic_1164.all;


entity XOR_Gate_Project is
	port(
    	i_sw_1 : in std_logic;
        i_sw_2 : in std_logic;
        led_out 	: out std_logic
    );
end entity XOR_Gate_Project;

architecture RTL of XOR_Gate_Project is
begin
	led_out <= i_sw_1 xor i_sw_2;
end RTL;