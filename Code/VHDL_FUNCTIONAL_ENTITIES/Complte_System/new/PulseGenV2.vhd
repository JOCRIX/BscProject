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

entity pulse_gen_width_modulator_inverted is
Generic(
        NR_OF_CLKs : integer := 4;  
        HIGH_TIME : integer := 15; -- in ns, multiples of 5.
        LOW_TIME : integer := 5   -- in ns, multiples of 5.  
);
Port (
        MASTER_CLK_200MEG_IN : in std_logic := '0';
        TRIGGER   : in std_logic := '0';
        PULSE_OUT : out std_logic := '0';
        ACTIVE : out std_logic := '0'
      );
end pulse_gen_width_modulator_inverted;

architecture Behavioral of pulse_gen_width_modulator_inverted is

signal clk_count : integer range 0 to 10000 := 0;
signal high_clks : integer range 0 to HIGH_TIME := 0;
signal low_clks : integer range 0 to LOW_TIME := 0;
signal pulse_count :integer range 0 to NR_OF_CLKs := 0;
signal pulses_generated : integer range 0 to 10000 := 0;
signal pulse_complete : std_logic := '0';

signal start : std_logic := '0';
--signal stop : std_logic := '0';
--signal idle : std_logic := '1';
signal done : std_logic := '0';
signal gen_1_pulse : std_logic := '0';



signal output_state : std_logic_vector(1 downto 0) := "00"; --(2) = Triggered, (1) Done,
--signal PULSE_CLKS_GENERATED : std_logic := '0';
type toggle_output is (HIGH, LOW);
signal s_toggle : toggle_output := HIGH;
signal output_set : std_logic := '0';
--signal i_active : std_logic := '0';
--signal output_set_override : std_logic := '1';


begin

--Calculate CLKs depending on input high/low times in multiples of 5 nano seconds (1/200MHz = 5ns)
high_clks <= (HIGH_TIME / 5) -3;
low_clks <= (LOW_TIME / 5);-- 1;--2;

trigger_counter : process (TRIGGER, done) is
begin
    if(done = '1') then
        start <= '0';
        output_state(1) <= '0';
    elsif(rising_edge(TRIGGER)) then
        start <= '1';
        output_state(1) <= '1';
    end if;
end process;

generate_all_pulses : process (MASTER_CLK_200MEG_IN, gen_1_pulse, pulses_generated, pulse_complete, start,done) is
begin

    if(pulse_complete = '1') then
        gen_1_pulse <= '0';
    elsif(pulses_generated = 0 and done = '1') then
        done <= '0';
    elsif(rising_edge(MASTER_CLK_200MEG_IN)) then
        if(start = '1' and gen_1_pulse = '0') then
            if(pulses_generated /= NR_OF_CLKs) then
                --done <= '0';
                --i_active <= '1';
                if(pulse_complete = '0') then
                    gen_1_pulse <= '1';
                    pulses_generated <= pulses_generated +1;
                else
                    gen_1_pulse <= '0';
                end if;
            else
                pulses_generated <= 0;
                --i_active <= '0';
                done <= '1';
            end if;
        end if;
    end if;

end process;

active_sig : process(start, done) is
begin
    if(done = '1') then
        active <= '0';
    elsif(rising_edge(start)) then
        active <= '1';
    end if;
end process;

generate_single_pulse : process(MASTER_CLK_200MEG_IN, gen_1_pulse, pulse_complete, clk_count, high_clks, low_clks) is
begin
    if(rising_edge(MASTER_CLK_200MEG_IN)) then
        if(gen_1_pulse = '1') then
            if(pulse_complete = '0') then
                --pulse_complete <= '0';
                case s_toggle is
                when HIGH =>
                    if(clk_count /= high_clks) then
                        output_set <= '0';
                        clk_count <= clk_count + 1;
                    else
                        s_toggle <= LOW;
                        clk_count <= 0;
                    end if;
                when LOW =>
                    output_set <= '1';
                    if(clk_count /= low_clks) then 
                        clk_count <= clk_count + 1;
                    else
                        pulse_complete <= '1';
                        output_set <= '0';
                        s_toggle <= HIGH;
                        clk_count <= 0;
                        --gen_1_pulse <= '0';
                    end if;   
                end case;
            end if;
        end if;
    end if;
    if(falling_edge(MASTER_CLK_200MEG_IN)) then
        if(pulse_complete = '1')then
            pulse_complete <= '0';
          --  done <= '0';
        end if;
    end if;
end process;

reset_output_setting : process(MASTER_CLK_200MEG_IN, pulses_generated, output_set, done, TRIGGER) is
begin
    
    if(TRIGGER = '1') then
        output_state(0) <= '0';
    elsif(rising_edge(done)) then
        output_state(0) <= '1';
    end if;

end process;

with output_state select
    PULSE_OUT <= output_set when "10",
                '0' when "01",
                '0' when others;



end Behavioral;










