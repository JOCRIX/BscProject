----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2024 12:28:53 AM
-- Design Name: 
-- Module Name: pulse_width_gen - Behavioral
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

entity pulse_width_gen is
    Generic(
    width : integer := 40
    );
  Port (
        i_master_clk : in std_logic := '0';
        i_trigger : in std_logic    := '0';
        o_trigger : out std_logic := '0';
        o_pulse   : out std_logic   := '0'
   );
end pulse_width_gen;

architecture Behavioral of pulse_width_gen is

signal r_counter : integer range 0 to 10000 := 0;
signal r_count_to : integer range 0 to 10000 := 0;
signal r_run : std_logic := '0';
signal r_start : std_logic := '0';
signal r_done : std_logic := '0';

begin

r_count_to <= (width / 5);

o_trigger <= i_trigger; 

trigger : process (i_trigger, r_done) is
begin
    if(r_done = '1') then
        r_start <= '0';
    elsif(rising_edge(i_trigger))then
        if(r_start = '0') then
            r_start <= '1';
        end if;
    end if;
end process;

gen_pulse : process (i_master_clk, r_counter, r_start) is
begin

if(rising_edge(i_master_clk)) then
    if(r_start = '1') then
        if(r_counter < r_count_to) then
            r_counter <= r_counter + 1;
            o_pulse <= '1';
            r_done <= '0';
        else
            r_counter <= 0;
            o_pulse <= '0';
            r_done <= '1';
        end if;
    else
        r_done <= '0';
    end if;
end if;


end process;



end Behavioral;
