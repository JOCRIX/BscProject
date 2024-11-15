----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2024 23:04:35
-- Design Name: 
-- Module Name: IVSA20 - Behavioral
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
use ieee.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IVSA20 is
    Port (
        i_ADC_DATA_RDY : in std_logic := '0';
        i_DATA_ADC : in std_logic_vector(15 downto 0);
        i_ADC_DnB : in std_logic := '0';
        i_MASTER_CLK : in std_logic := '0';
        
        o_DATA_MDIST : out std_logic_vector(15 downto 0);
        o_ADDR_MDIST : out std_logic_vector(15 downto 0);
        i_DATA_MDIST : in std_logic_vector(15 downto 0);
        i_HOLD : in std_logic := '0';
        o_CLK_MDIST : out std_logic := '0';
        o_RnW_MDIST : out std_logic := '0';
        
        i_CLK_MCU : in std_logic := '0';
        o_DATA_MCU : out std_logic_vector(15 downto 0);
        i_IX : in std_logic := '0';
        i_RESET : in std_logic := '0'
        
        
        
    );
end IVSA20;

architecture Behavioral of IVSA20 is

constant internal : std_logic := '0';
constant external : std_logic := '1';
constant CMPLT : std_logic := '1';
constant RUN : std_logic := '1';
constant HOLD : std_logic := '1';

signal w_CMPLT : std_logic := '0';
signal w_RUN : std_logic := '0';
signal w_INIT : std_logic := '0';

signal r_ADDR_MDIST : std_logic_vector(15 downto 0);

signal r_ADC_RUN : std_logic := '0';
signal r_MCU_RUN : std_logic := '0';

type byte_state is (S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, SEQ_CMPLT);
signal s_byte : byte_state := S1;

begin


o_RnW_MDIST <= i_ADC_DnB;
w_RUN <= r_ADC_RUN or r_MCU_RUN;

initialize_ADC : process(i_ADC_DATA_RDY, w_CMPLT, i_RESET) is
begin
    if((i_RESET = '1') or (w_CMPLT = CMPLT)) then
        r_ADC_RUN <= '0';
    elsif(rising_edge(i_ADC_DATA_RDY)) then
        r_ADC_RUN <= RUN;
    end if;
end process;

initialize_MCU : process(i_CLK_MCU, w_CMPLT, i_RESET, i_ADC_DnB, i_IX) is
begin
    if((i_RESET = '1') or (w_CMPLT = CMPLT)) then
        r_MCU_RUN <= '0';
    elsif(rising_edge(i_CLK_MCU)) then
        if((i_ADC_DnB = '1') and (i_IX = EXTERNAL)) then
            r_MCU_RUN <= RUN;
        else
            r_MCU_RUN <= '0';
        end if;
    end if;
end process;



process(i_MASTER_CLK, i_RESET) is
variable v_Count : natural range 0 to 100 := 0;
variable addr_count : natural range 0 to 65535 := 0;
begin 
    if(i_RESET = '1') then
        addr_count := 0;
        w_CMPLT <= '0';
        v_Count := 0;
        o_DATA_MDIST <= (others => '0');
        o_DATA_MCU <= (others => '0');
        o_CLK_MDIST <= '0';
        s_byte <= S1;
    elsif(rising_edge(i_MASTER_CLK)) then
        if(w_RUN = RUN) then
            if(i_HOLD /= HOLD) then
                if(i_ADC_DnB = '0') then
                    case s_byte is
                        when S1 =>
                            if(i_ADC_DATA_RDY = '1') then
                            o_DATA_MDIST <= i_DATA_ADC;
                            o_ADDR_MDIST <= std_logic_vector(to_unsigned(addr_count, o_ADDR_MDIST'length));
                            s_byte <= S2;
                            end if;
                        when S2 =>
                            if(v_Count > 2) then
                                v_Count := 0;
                                s_byte <= S3;
                                o_CLK_MDIST <= '1';
                            else
                                v_Count := v_Count +1;
                            end if;
                        when S3 =>
                            o_CLK_MDIST <= '0';
                            w_CMPLT <= CMPLT;
                            s_byte <= SEQ_CMPLT;
                            addr_count := addr_count +1; 
                        when others =>
                            w_CMPLT <= CMPLT;
                    end case;
                else
                    if(i_IX = EXTERNAL) then
                        case s_byte is
                            when S1 =>
                                if(i_CLK_MCU = '1') then
                                    o_ADDR_MDIST <= std_logic_vector(to_unsigned(addr_count, o_ADDR_MDIST'length));
                                    s_byte <= S2;
                                end if;
                            when S2 =>
                                if(v_Count > 2) then
                                    o_CLK_MDIST <= '1';
                                    v_Count := 0;
                                    s_byte <= S3;
                                 else
                                    v_Count := v_Count +1;
                                end if;
                            when S3 =>
                                o_CLK_MDIST <= '1';
                                o_DATA_MCU <= i_DATA_MDIST;
                                addr_count := 0;
                                w_CMPLT <= CMPLT;
                                s_byte <= SEQ_CMPLT;
                            when others => 
                                w_CMPLT <= CMPLT;
                        end case;
                    else
                        o_DATA_MCU <= (others => '0');
                        addr_count := 0;
                    end if;
                end if;
            end if;
        else
            w_CMPLT <= '0';
            o_CLK_MDIST <= '0';
            s_byte <= S1;
            v_Count := 0;
        end if;
    end if;
end process;
                                




end Behavioral;
