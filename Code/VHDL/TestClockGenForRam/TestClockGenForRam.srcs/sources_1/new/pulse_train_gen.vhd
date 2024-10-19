----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2024 13:24:19
-- Design Name: 
-- Module Name: pulse_train_gen - Behavioral
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

entity pulse_train_gen is
Port (
test : out std_logic;
        Trig_in : in std_logic;
        Trig_out : out std_logic; --test signal output
        CLK_in : in std_logic;
        RAM_CLK : out std_logic :='0' 
        

      );
end pulse_train_gen;

architecture Behavioral of pulse_train_gen is

constant NR_OF_CLKs : integer := 4;
signal active : std_logic := '0';
signal count : integer range 0 to NR_OF_CLKs := 0;--4 := 0;
signal done : std_logic := '0';
signal run : std_logic := '0';
begin

Trig_out <= Trig_in; -- test

test <= done; --test

trig_start : process (Trig_in, done) is
begin 
        
    if(done = '1') then
        run <= '0';
    elsif(rising_edge(Trig_in)) then
        run <= '1';
    end if;
   
end process;

generate_ram_clks : process (CLK_in, Trig_in) is
begin
    if(rising_edge(CLK_in)) then
        if(run = '1') then
           if(count /= NR_OF_CLKS) then
            active <= '1';
            count <= count + 1;
            done <= '0';
           else
            active <= '0';
            done <= '1';
           end if;
        else
        done <= '0';
        count <= 0;
        end if;
    end if;

end process;
RAM_CLK <= CLK_in and active;
end Behavioral;










