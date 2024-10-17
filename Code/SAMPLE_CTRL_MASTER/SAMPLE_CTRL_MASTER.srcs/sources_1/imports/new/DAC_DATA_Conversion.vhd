----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2024 11:55:09
-- Design Name: 
-- Module Name: DAC_DATA_Conversion - Behavioral
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

entity DAC_DATA_Conversion is
    port (
            --SET_F_IN_L : in std_logic_vector(15 downto 0); --bit 0 to 15 of the 32 bit wide frequency setting word.
            SET_F_IN_H : in std_logic_vector (31 downto 16); --bit 16 to 31 of the 32 bit wide frequency setting word.
            F_OUT : out std_logic_vector (31 downto 0); --The full 32 bit wide frequency setting word.
            DDS_DATA_IN : in std_logic_vector(15 downto 0); --DDS output data, in two's compliment.
            DAC_DATA_OUT : out std_logic_vector (15 downto 0); --DDS data converted to unsigned, this is the Data for the DAC.
            UPDATE_F : out std_logic;  --Togles when a new frequency is to be set at the output.
            CLK_IN : in std_logic -- Master clock input, (100 MHz when implemented).
        );
end DAC_DATA_Conversion;

architecture Behavioral of DAC_DATA_Conversion is

signal sig_f_in : std_logic_vector (31 downto 0) := (others => '0');
signal sig_update_f : std_logic := '0';
signal sig_f_out : std_logic_vector (31 downto 0) := (others => '0');

begin

    -- If the DDS is to be set using two interal 16 bit registers, outcomment the current concatenation.
    --sig_f_in <= SET_F_IN_H & SET_F_IN_L;        -- "Incomment" here
    sig_f_in <= SET_F_IN_H & "0000000000000000";  -- Outcomment here
    UPDATE_F <= sig_update_f;
    F_OUT <= sig_f_out;
    DAC_DATA_OUT <= DDS_DATA_IN xor x"8000"; -- Alternatively DAC_DATA_OUT(15) <= not DAC_DATA_OUT(15) would also work.
    -- convert the twos compliment DDS DATA to unsigned, the DAC requires unsigned.
    process(sig_f_out, sig_f_in, CLK_IN)
    begin
        if(rising_edge(CLK_IN)) then        -- When a rising edge on the master clock occurs, check if the current frequency setting is the same as before.
            if(sig_f_out /= sig_f_in) then  --if it is not the same, then set the phase word to the DDS to the new value and togle the
                sig_f_out <= sig_f_in;      --frequency update pin.
                sig_update_f <= '1';
            else
                sig_update_f <= '0';
            end if;
        end if;
    end process;

end Behavioral;
