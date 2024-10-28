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

entity pulse_gen_polarity is
Generic(
        NR_OF_CLKs : integer := 16;
        IDLE_POLARITY : std_logic := '0'; --Start in logic '1' or '0'
        RUN_POLARITY : std_logic := '0'   --First pulse should be  '1' or '0'    
);
Port (
        --test : out std_logic;
        Trigger : in std_logic := '0';
      --  Trig_out : out std_logic; --test signal output
        CLK : in std_logic := '0';
        BUSY : out std_logic := '0';
        Pulse_out : out std_logic :='0';
        Pulse_complete : out std_logic := '0' 
      );
end pulse_gen_polarity;

architecture Behavioral of pulse_gen_polarity is

--constant NR_OF_CLKs : integer := 4;
signal active : std_logic := '0';
signal count : integer range 0 to NR_OF_CLKs := 0;--4 := 0;
signal done : std_logic := '0';
signal run : std_logic := '0';
signal stop : std_logic := '0';
signal gate_output : std_logic := '0';
signal clk_polarity_incoming : std_logic := '0';

signal set_clk_run_polarity : std_logic := '0';
signal set_output_polarity : std_logic_vector(2 downto 0) := "000"; --bit 0 = actual run state, bit 1 = idle polarity, bit 2 = invert run polarity
signal invert_output : std_logic := '0';

begin

--Set polarities
set_output_polarity(0) <= run; 
set_output_polarity(1) <= IDLE_POLARITY;
set_output_polarity(2) <= invert_output;
set_clk_run_polarity <= RUN_POLARITY;
--set_output_polarity(3) <= clk_polarity_incoming;

Pulse_complete <= done;
--BUSY <= run;
BUSY <= active or done;
trig_start : process (Trigger, done) is
begin 
        
    if(done = '1') then
        run <= '0';
    elsif(rising_edge(Trigger)) then
        run <= '1';
    end if;
   
end process;

generate_ram_clks : process (CLK, Trigger) is
begin
    if(rising_edge(CLK)) then
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

stop_detect : process(active, CLK) is
begin
    if(active = '1') then
        if(falling_edge(CLK)) then
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

check_and_set_polarity_clk : process (Trigger,CLK) is
begin
    if(rising_edge(Trigger)) then
        if(CLK /= set_clk_run_polarity) then
            invert_output <= '1';
        else
            invert_output <= '0';
        end if;
    end if;

end process;


with set_output_polarity select
     Pulse_out <= '1' when "010",
                  '0' when "000",
                  '1' when "110",
                  '0' when "100",
                  CLK and gate_output when "011",
                  CLK and gate_output when "001",
                  not(CLK and gate_output) when "111",
                  not(CLK and gate_output) when "101",
                  '0' when others;


--Pulse_out <= CLK and gate_output;

end Behavioral;










