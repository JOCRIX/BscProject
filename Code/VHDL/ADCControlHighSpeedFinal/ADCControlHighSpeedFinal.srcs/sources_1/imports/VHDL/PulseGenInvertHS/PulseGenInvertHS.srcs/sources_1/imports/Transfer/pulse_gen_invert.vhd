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

entity pulse_gen_inverted_fixed is
Generic(
        NR_OF_CLKs : integer := 16
);
Port (
        MASTER_CLK_200MEG_IN : in std_logic := '0';
        TRIGGER   : in std_logic := '0';
        PULSE_OUT : out std_logic := '0';
        ACTIVE : out std_logic := '0'
      );
end pulse_gen_inverted_fixed;

architecture Behavioral of pulse_gen_inverted_fixed is

signal clk_count : integer range 0 to 10000 := 0;
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
signal output_set : std_logic := '1';
--signal i_active : std_logic := '0';
--signal output_set_override : std_logic := '1';


begin


--o_TRIGGER <= TRIGGER;
--Calculate CLKs depending on input high/low times in multiples of 5 nano seconds (1/200MHz = 5ns)

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

    if(pulses_generated = 0 and done = '1') then
        done <= '0';
    elsif(rising_edge(MASTER_CLK_200MEG_IN)) then
        if(start = '1') then
            if(pulses_generated /= (NR_OF_CLKs * 2) ) then
                    if(pulse_count < 1) then
                      
                        pulse_count <= pulse_count + 1;
                    else
                        pulse_count <= 0;
                          output_set <= not output_set;
                        pulses_generated <= pulses_generated + 1;
                    end if;
            else
                pulses_generated <= 0;
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

--generate_single_pulse : process(MASTER_CLK_200MEG_IN, gen_1_pulse, pulse_complete, clk_count) is
--begin
--    if(rising_edge(MASTER_CLK_200MEG_IN)) then
--        if(gen_1_pulse = '1') then
--            if(pulse_complete = '0') then
--                --pulse_complete <= '0';
--                case s_toggle is
--                when HIGH =>
--                        output_set <= '1';
--                        s_toggle <= LOW;
--                when LOW =>
--                        pulse_complete <= '1';
--                        output_set <= '0';
--                        s_toggle <= HIGH;
--                end case;
--            end if;
--        end if;
--    end if;
--    if(falling_edge(MASTER_CLK_200MEG_IN)) then
--        if(pulse_complete = '1')then
--            pulse_complete <= '0';
--          --  done <= '0';
--        end if;
--    end if;
--end process;

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
                '1' when "01",
                '1' when others;



end Behavioral;










