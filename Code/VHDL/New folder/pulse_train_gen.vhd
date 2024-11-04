----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2024 13:24:19
-- Design Name: JRIX
-- Module Name: pulse_train_gen - Behavioral
-- Project Name: Impedance Analyzer
-- Target Devices: Artix 7 AT35-236
-- Tool Versions: 
-- Description: Generates "n" amount of pulses. Requires external CLK signal. Pulses are synchronous with CLK_in. "n" can be set by NR_OF_CLKs during instantiation.
--              The pulses start with a rising_edge on Trig_in. A rising edge on "Complete" indicates that it has finished pulsing.
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
Generic(
        NR_OF_CLKs : integer := 4       
);
Port (
        --test : out std_logic;
        Trig_in : in std_logic := '0';
      --  Trig_out : out std_logic; --test signal output
        CLK_in : in std_logic := '0';
        BUSY : out std_logic := '0';
        Pulse_out : out std_logic :='0';
        Pulse_complete : out std_logic := '0' 
      );
end pulse_train_gen;

architecture Behavioral of pulse_train_gen is

--constant NR_OF_CLKs : integer := 4;
signal active : std_logic := '0';
signal count : integer range 0 to NR_OF_CLKs;-- NR_OF_CLKs := 0;--4 := 0;
signal done : std_logic := '0';
signal run : std_logic := '0';
signal stop : std_logic := '0';
signal gate_output : std_logic := '0';

begin

--Trig_out <= Trig_in; -- test

--test <= done; --test
Pulse_complete <= done;
--BUSY <= run;
BUSY <= active or done;
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

stop_detect : process(active, CLK_in) is
begin
    if(active = '1') then
        if(falling_edge(CLK_in)) then
            if(count >= NR_OF_CLKs) then
                stop <= '1';
            else    
                stop <= '0';
            end if;
       end if;
       else
        stop <= '0';
    end if;        
end process;

gate_control : process (stop, active) is
begin
    if(stop = '1') then
        gate_output <= '0';
    elsif(active = '1') then
        gate_output <= '1';
    else
        gate_output <= '0';
    end if;
    
end process;

Pulse_out <= CLK_in and gate_output;
end Behavioral;










