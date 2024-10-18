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

type clk_gen is (CLK1, CLK2, CLK3, CLK4);
signal s_gen : clk_gen := CLK1;
signal trig_state : std_logic := '0';


begin
--Test
TRIGGER_OUT <= Trigger;
TestOut <= trig_state;
--


trig_start : process (Trigger) is
--variable trigger_state : std_logic := '0';
begin
    if(rising_edge(Trigger)) then 
        trig_state <= '1';
        end if;
    if(Trigger = '0') then
        trig_state <= '0';
    end if;
   -- if(falling_edge(Trigger)) then
   --     trig_State <= '0';
   -- end if; 
end process;

generate_ram_clks : process (MASTER_CLK, trig_state, active) is
variable clk_count : integer range 0 to NR_OF_CLKs := 0;

begin
    if(rising_edge(MASTER_CLK)) then-- and trig_state = '1') then
        if(trig_state = '1') then
        if(count /= NR_OF_CLKS) then
            count <= count + 1;
            active <= '1';
        else
        active <= '0';
        count <= 0;
        end if;
        end if;
    end if;
    RAM_CLK <= active and MASTER_CLK;
end process;

end Behavioral;



















