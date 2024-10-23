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

entity pulse_train_gen_active_out is
Generic(
        NR_OF_CLKs : integer := 7 -- 35ns pulse on ACTIVE_PULSE_WIDTH_OUT       
);
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
end pulse_train_gen_active_out;

architecture Behavioral of pulse_train_gen_active_out is

--constant NR_OF_CLKs : integer := 4;
signal active : std_logic := '0';
signal count : integer range 0 to NR_OF_CLKs := 0;--4 := 0;
signal done : std_logic := '0';
signal run : std_logic := '0';
begin

--Trig_out <= Trig_in; -- test

--test <= done; --test
--PULSE_COMPLETE_OUT <= done;
--BUSY_OUT <= run;

trig_start : process (TRIGGER_IN, done) is
begin 
        
    if(done = '1') then
        run <= '0';
    elsif(rising_edge(TRIGGER_IN)) then
        run <= '1';
    end if;
   
end process;

generate_ram_clks : process (CLK_IN, TRIGGER_IN) is
begin
    if(rising_edge(CLK_IN)) then
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
PULSE_OUT  <= CLK_IN and active;
ACTIVE_PULSE_WIDTH_OUT <= active;
end Behavioral;










