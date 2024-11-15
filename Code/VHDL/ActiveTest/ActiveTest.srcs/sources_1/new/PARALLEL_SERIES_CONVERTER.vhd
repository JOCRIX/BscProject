----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2024 21:01:44
-- Design Name: 
-- Module Name: PARALLEL_SERIES_CONVERTER - Behavioral
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

entity PARALLEL_SERIES_CONVERTER is
    Port (
        i_SET : in std_logic := '0';        --Trigger for sample parallel to series data conversion, falling edge = DATA RDY
        i_DATA_A : in std_logic_vector (15 downto 0) := (others => '0'); --Data from AD converter A
        i_DATA_B : in std_logic_vector (15 downto 0) := (others => '0'); -- Data from AD converter B
        i_RESET : in std_logic := '0'; --Reset for the module
        i_CLK : in std_logic := '0';    --Master clock input
       
        o_DATA : out std_logic_vector(15 downto 0) := (others => '0'); --Data output.
        o_SET : out std_logic := '0'    --Indicates that the output data is ready on a rising edge.
    );
end PARALLEL_SERIES_CONVERTER;

architecture Behavioral of PARALLEL_SERIES_CONVERTER is

constant RUN : std_logic := '1';
constant CMPLT : std_logic := '1';
constant SET : std_logic := '1';

signal w_RUN : std_logic := '0';
signal w_CMPLT : std_logic := '0';

signal r_A_REG : std_logic_vector(15 downto 0) := (others  => '0');
signal r_B_REG : std_logic_vector(15 downto 0) := (others => '0');

type FSM_state is (S1, S2, S3, S4, S5, S6, S7, S8, SEQ_CMPLT);
signal state : FSM_STATE := S1;

begin

Initialize : process(w_CMPLT, i_RESET, i_SET) is
begin
    if(w_CMPLT = CMPLT or i_RESET = '1') then
        w_RUN <= '0';
        r_A_REG <= (others => '0');
        r_B_REG <= (others => '0');
    elsif(falling_edge(i_SET)) then
        w_RUN <= RUN;
        r_A_REG <= i_DATA_A;
        r_B_REG <= i_DATA_B;
    end if;
end process;

FSM_Par_to_Ser_Conv : process(i_CLK) is
variable v_Count : natural range 0 to 255 := 0;
begin
    if(rising_edge(i_CLK)) then
        if(w_RUN = RUN) then
            case state is
                when S1 =>
                    o_DATA <= r_A_REG;
                    if(v_Count > 1) then
                        v_Count := 0;
                        state <= S2;
                    else
                        v_Count := v_Count +1;
                    end if;
                when S2 =>
                    o_SET <= SET;
                    state <= S3;
                when S3 =>
                    if(v_Count > 9) then
                        v_Count := 0;
                        state <= S4;
                        o_SET <= '0';
                    else
                        v_Count := v_Count +1;
                    end if;
                when S4 =>
                    if(v_Count > 9) then
                        v_Count := 0;
                        state <= S5;
                    else
                        v_Count := v_Count +1;
                    end if;
                when S5 =>
                    o_DATA <= r_B_REG;
                    if(v_Count > 1) then
                        v_Count := 0;
                        state <= S6;
                    else
                        v_Count := v_Count +1;
                    end if;
                when S6 =>
                    o_SET <= SET;
                    state <= S7;
                when S7 =>
                    if(v_Count > 9) then
                        v_Count := 0;
                        state <= S8;
                        o_SET <= '0';
                    else
                        v_Count := v_Count +1;
                    end if;
                when S8 =>
                    if(v_Count > 9) then
                        v_Count := 0;
                        state <= SEQ_CMPLT;
                    else
                        v_Count := v_Count +1;
                    end if;
                when others =>
                    w_CMPLT <= CMPLT;
            end case;
        else
            w_CMPLT <= '0';
            v_Count := 0;
            o_SET <= '0';
            state <= S1;
        end if;
    end if;
end process;
    
    
end Behavioral;
