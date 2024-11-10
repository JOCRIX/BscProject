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

entity pulse_gen_synchronized is
Generic(
        NR_OF_CLKs : integer := 7;  
        HIGH_TIME : integer := 25; -- in ns, multiples of 5.
        LOW_TIME : integer := 25   -- in ns, multiples of 5.  
);
Port (
        i_MASTER_CLK_200MEG_IN : in std_logic := '0';
        i_TRIGGER   : in std_logic := '0';
        o_PULSE : out std_logic := '0';
        o_ACTIVE : out std_logic := '0'
      );
end pulse_gen_synchronized;

architecture RTL of pulse_gen_synchronized is

signal r_clk_count : integer range 0 to 10000 := 0;
signal r_high_clks : integer range 0 to HIGH_TIME := 0;
signal r_low_clks : integer range 0 to LOW_TIME := 0;
signal r_pulse_count :integer range 0 to NR_OF_CLKs := 0;
signal r_pulses_generated : integer range 0 to 10000 := 0;
signal r_pulse_complete : std_logic := '0';

signal r_start : std_logic := '0';
signal r_done : std_logic := '0';
signal r_gen_1_pulse : std_logic := '0';

signal r_output_state : std_logic_vector(1 downto 0) := "00"; --(2) = Triggered, (1) Done,
type toggle_output is (HIGH, LOW);
signal s_toggle : toggle_output := HIGH;
signal r_output_set : std_logic := '1';
signal r_generating_pulse : std_logic := '1';



begin

--Calculate CLKs depending on input high/low times in multiples of 5 nano seconds (1/200MHz = 5ns)
r_high_clks <= (HIGH_TIME - 5) / 5;
r_low_clks <= (LOW_TIME - 5) / 5;-- 1;--2;

trigger_counter : process (i_TRIGGER, r_done) is
begin
    if(r_done = '1') then
        r_start <= '0';
        r_output_state(1) <= '0';
    elsif(rising_edge(i_TRIGGER)) then
        r_start <= '1';
        r_output_state(1) <= '1';
    end if;
end process;

generate_all_pulses : process (i_MASTER_CLK_200MEG_IN, r_gen_1_pulse, r_pulses_generated, r_pulse_complete, r_start, r_done) is
begin

    if(r_pulse_complete = '1') then
        r_gen_1_pulse <= '0';
    elsif(r_pulses_generated = 0 and r_done = '1') then
        r_done <= '0';
    elsif(rising_edge(i_MASTER_CLK_200MEG_IN)) then
        if(r_start = '1' and r_gen_1_pulse = '0') then
            if(r_pulses_generated /= NR_OF_CLKs) then
                if(r_pulse_complete = '0') then
                    r_gen_1_pulse <= '1';
                    r_pulses_generated <= r_pulses_generated +1;
                else
                    r_gen_1_pulse <= '0';
                end if;
            else
                r_pulses_generated <= 0;
                r_done <= '1';
            end if;
        end if;
    end if;

end process;

active_sig : process(r_start, r_done) is
begin
    if(r_done = '1') then
        o_active <= '0';
    elsif(rising_edge(r_start)) then
        o_active <= '1';
    end if;
end process;

generate_single_pulse : process(i_MASTER_CLK_200MEG_IN, r_gen_1_pulse, r_pulse_complete, r_clk_count, r_high_clks, r_low_clks) is
begin
    if(rising_edge(i_MASTER_CLK_200MEG_IN)) then
        if(r_gen_1_pulse = '1') then
            if(r_pulse_complete = '0') then
                case s_toggle is
                when HIGH =>
                    if(r_clk_count /= r_high_clks) then
                        r_generating_pulse <= '1';
                        r_output_set <= '1';
                        r_clk_count <= r_clk_count + 1;
                    else
                        s_toggle <= LOW;
                        
                        r_clk_count <= 0;
                    end if;
                when LOW =>
                        r_output_set <= '0';
                    if(r_clk_count /= r_low_clks) then 
                        r_clk_count <= r_clk_count + 1;
                    else
                        r_generating_pulse <= '0';
                        s_toggle <= HIGH;
                        r_clk_count <= 0;
                        r_pulse_complete <= '1';
                    end if;   
                end case;
            end if;
        end if;
    end if;
    if(falling_edge(i_MASTER_CLK_200MEG_IN)) then
        if(r_pulse_complete = '1')then
            r_pulse_complete <= '0';
          --  done <= '0';
        end if;
    end if;
end process;

--pulse_complete : process (r_pulse_complete,i_MASTER_CLK_200MEG_IN, r_generating_pulse) is
--begin
--    if(rising_edge(i_MASTER_CLK_200MEG_IN)) then
--        if(r_generating_pulse = '1') then
--            r_pulse_complete <= '0';
--        else
--            r_pulse_complete <= '1';
--        end if;
--    end if;
--end process;

reset_output_setting : process(i_MASTER_CLK_200MEG_IN, r_pulses_generated, r_output_set, r_done, i_TRIGGER) is
begin
    
    if(i_TRIGGER = '1') then
        r_output_state(0) <= '0';
    elsif(rising_edge(r_done)) then
        r_output_state(0) <= '1';
    end if;

end process;

with r_output_state select
    o_PULSE <= r_output_set when "10",
                '0' when "01",
                '0' when others;



end RTL;










