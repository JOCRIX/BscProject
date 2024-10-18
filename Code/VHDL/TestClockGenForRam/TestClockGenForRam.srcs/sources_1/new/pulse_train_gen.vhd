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
        Trigger : in std_logic;
        TRIGGER_OUT : out std_logic; --test signal output
        MASTER_CLK : in std_logic;
        TestOut : out std_logic;
        RAM_CLK : out std_logic :='0' 

      );
end pulse_train_gen;

architecture Behavioral of pulse_train_gen is

constant NR_OF_CLKs : integer := 4;
signal active : std_logic := '0';
signal count : integer range 0 to 4 := 0;
signal start : std_logic := '0';
signal done : std_logic := '0';
signal dtest : std_logic := '0';

begin
--Test
TRIGGER_OUT <= Trigger;
--

trig_start : process (Trigger, done) is
begin 
    if(Trigger = '1' and done = '0') then
        start <= '1';
    elsif (Trigger = '1' and done = '1') then
        start <= '0';
        dtest <= '0';
    else
        start <='0';
    end if;    
end process;

generate_ram_clks : process (MASTER_CLK, start,Trigger) is
--variable clk_count : integer range 0 to NR_OF_CLKs := 0;
begin

if(rising_edge(MASTER_CLK)) then
    if(start = '1') then
        active <= '1';
        done <= '0';
        if(count /= NR_OF_CLKS) then
            count <= count + 1;
            --done <= '0';
        else
            count <= 0;
            done <= '1';
            active <= '0';
        end if;
    end if;
end if;

if(falling_edge(Trigger)) then
    done <= '0';
end if;

end process;
RAM_CLK <= MASTER_CLK and active;
end Behavioral;



















