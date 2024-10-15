----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/13/2024 12:16:48 AM
-- Design Name: 
-- Module Name: logic_reset - Behavioral
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

entity logic_reset is
  Port (
        CLK : in std_logic;
        RW : in std_logic;
        RESET : out std_logic := '0'
   );
end logic_reset;

architecture Behavioral of logic_reset is

type reset_state is (R_CLK1, R_CLK2, R_CLK3, RESET_TRIGD);
signal s_reset : reset_state := R_CLK1;
signal reset_trig : std_logic := '0';
begin
--Used to reset the state machine logic inside the internal_ram on initial boot-up.
--3 clocks with RW = '1' will trigger the reset on the 4'th clock.
--The reset will go low on the 4th clock falling edge.
logic_reset_triggerFSM : process (CLK, RW, reset_trig) is 
begin
    if(rising_edge(CLK)) then
        case s_reset is
            when R_CLK1 =>
                if(RW = '1') then
                    s_reset <= R_CLK2;
                else
                    s_reset <= R_CLK1;
                end if;
            when R_CLK2 =>
                 if(RW = '1') then
                    s_reset <= R_CLK3;
                else
                    s_reset <= R_CLK1;
                end if;
            when R_CLK3 =>
                if(RW = '1') then
                    s_reset <= RESET_TRIGD;
                else
                    s_reset <= R_CLK1;
                end if;
            when RESET_TRIGD =>
                    s_reset<= R_CLK1;
                    reset_trig <= '1';
        end case;
    end if;
    if(falling_edge(CLK)) then
        if(reset_trig ='1') then
            reset_trig <= '0';
        end if;
    end if;
    
    RESET <= reset_trig; --and reset_trig_fall;
end process;



end Behavioral;
