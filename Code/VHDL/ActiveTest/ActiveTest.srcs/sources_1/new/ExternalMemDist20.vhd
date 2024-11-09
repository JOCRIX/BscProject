----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2024 23:04:26
-- Design Name: 
-- Module Name: ExternalMemDist20 - Behavioral
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

entity ExternalMemDist20 is
    port (
        i_CLK : in std_logic;  --Master CLK input
        i_DATA : in std_logic_vector(15 downto 0);  --16 bit input data that is to be split
        i_ADDR : in std_logic_vector(15 downto 0);  --16 bit input ADDR.
        o_ADDR : out std_logic_vector(18 downto 0); --Output 19 bit ADDR to ext mem.
        o_DATA_EMEM : out std_logic_vector(7 downto 0); --Output 8 bit data to ext mem.
        i_DATA_EMEM : in std_logic_vector(7 downto 0); --input 8 bit data from ext mem.
        o_DATA : out std_logic_vector(15 downto 0); --output 16 bit concatenated from two 8 bit registers
        i_SET : in std_logic := '0'; --Trigger sequence to Write/Read
        o_SET : out std_logic := '0'; --Output set, triggering next block sequence.
        i_HOLD : in std_logic := '0'; --Input HOLD, FSM will not proceed when high.
        i_RnW : in std_logic := '0'; -- Input to control Read or Write data
        o_RnW : out std_logic; -- Output to control to read or write data.
        i_RESET : in std_logic := '0' --Reset, simply resets logic.
    );
end ExternalMemDist20;

architecture Behavioral of ExternalMemDist20 is

signal w_LoBYTE : std_logic_vector(7 downto 0);
signal w_HiBYTE : std_logic_vector(7 downto 0);
signal w_LoADDR : std_logic_vector(18 downto 0);
signal w_HiADDR : std_logic_vector(18 downto 0);

signal w_iLoBYTE : std_logic_vector(7 downto 0);
signal w_iHiBYTE : std_logic_vector(7 downto 0);

constant READ : std_logic := '1';
constant WRITE : std_logic := '0';
constant HOLD : std_logic := '1';

constant RUN : std_logic := '1';                    --Indicate when to run
constant CMPLT : std_logic := '1';                  --Indicate then sequenctiel logic is complete i.e. CMPLT

signal count_u16 : natural range 0 to 65535 := 0;
signal w_RUN : std_logic := '0';
signal w_CMPLT : std_Logic := '0';
signal w_IDLE : std_logic := '0';

type byte_state is (S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, SEQ_CMPLT);
signal s_byte : byte_state := S1;


begin

w_LoBYTE <= i_DATA(7 downto 0);
w_HiBYTE <= i_DATA(15 downto 8);
w_LoADDR <= "000" & i_ADDR;
w_HiADDR <= "100" & i_ADDR;

o_RnW <= i_RnW;
o_DATA <= w_iHiBYTE & w_iLoBYTE;

Initialize : process(W_CMPLT, i_SET, i_RESET) is
begin
    if(w_CMPLT = CMPLT or i_RESET = '1') then
        w_RUN <= '0';
    elsif(rising_edge(i_SET)) then
        w_RUN <= RUN;
    end if;
end process;


DistributeDATA : process(i_RnW, i_CLK, w_RUN, i_HOLD, s_byte) is
variable v_Count : natural range 0 to 65535 := 0;
begin
    if(rising_edge(i_CLK)) then
        if(w_RUN = RUN) then
            if (i_HOLD /= HOLD) then
                if(i_RnW = WRITE) then
                    CASE s_byte is
                        when S1 =>
                            o_ADDR <= w_LoADDR;
                            o_DATA_EMEM <= w_LoBYTE;
                            s_byte <= S2;
                        when S2 =>
                            s_byte <= S3;
                        when S3 =>
                            o_SET <= '1';
                            s_byte <= S4;
                        when S4 =>
                            s_byte <= S5;
                        when S5 => 
                            o_SET <= '0';
                            o_ADDR <= w_HiADDR;
                            o_DATA_EMEM <= w_HiBYTE;
                            s_byte <= S6;
                        when S6 =>
                            v_Count := v_Count +1;
                            if(v_Count > 2) then
                                s_byte <= S7;
                            end if;
                        when S7 =>
                            o_SET <= '1';
                            s_BYTE <= SEQ_CMPLT;
                        when others =>
                            w_CMPLT <= '1';
                    end case;
                else
                    CASE s_byte is
                        when S1 =>
                            o_ADDR <= w_LoADDR;
                            s_byte <= S2;
                        when S2 =>
                            s_byte <= S3;
                        when S3 =>
                            o_SET <= '1';
                            s_byte <= S4;
                        when S4 =>
                            s_byte <= S5;
                        when S5 =>
                            o_SET <= '0';
                            w_iLoBYTE <= i_DATA_EMEM;
                            s_byte <= S6;
                        when S6 =>
                            v_Count := v_Count +1; 
                            if(v_Count > 2) then
                                s_byte <= S7;
                            end if;
                        when S7 =>
                            o_ADDR <= w_HiADDR;
                            s_byte <= S8;
                        when S8 =>
                            s_byte <= S9;
                        when S9 =>
                            o_SET <= '1';
                            s_byte <= S10;
                        when S10 =>
                            s_byte <= S11;
                        when S11 =>
                            o_SET <= '0';
                            w_iHiBYTE <= i_DATA_EMEM;
                            s_BYTE <= SEQ_CMPLT;
                        when others =>
                            w_CMPLT <= '1';
                        end case;
                end if;
            else
                w_IDLE <= '1';
            end if;
        else
            w_CMPLT <= '0';
            o_SET <= '0';
            s_byte <= S1;
            v_Count := 0;
        end if;
    end if;
end process;
        


end Behavioral;






