-- Code your testbench here
library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity XOR_Gate_Project_Testbench is --Testbenches har ingen I/O
end entity XOR_Gate_Project_Testbench;

architecture behave of XOR_Gate_Project_Testbench is
signal r_In1, r_In2, w_Out : std_logic; --vores stimuli inputs
begin

DUT : entity work.XOR_Gate_Project 
	port map(
    	i_sw_1 => r_In1,
        i_sw_2 => r_In2,
        led_out => w_Out);
        
process is
begin
--skal teste alle kombinationer af inputs til systemet
r_In1 <= '0';
r_In2 <= '0';
wait for 10 ns;

r_In1 <= '1';
r_In2 <= '0';
wait for 10 ns;

r_In1 <= '0';
r_In2 <= '1';
wait for 10 ns;

r_In1 <= '1';
r_In2 <= '1';
wait for 10 ns;--lad simuleringen køre i lidt ekstra tid
wait for 10 ns;
finish; -- enden på simuleringen

end process;

end behave;