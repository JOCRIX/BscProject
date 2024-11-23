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
            i_LoByte_FWORD : in std_logic_vector(15 downto 0); --bit 0 to 15 of the 32 bit wide frequency setting word.
            i_HiByte_FWORD : in std_logic_vector (31 downto 16); --bit 16 to 31 of the 32 bit wide frequency setting word.
            o_FWORD : out std_logic_vector (31 downto 0); --The full 32 bit wide frequency setting word.
            i_DDS_DATA : in std_logic_vector(15 downto 0); --DDS output data, in twos compliment.
            o_DAC_DATA : out std_logic_vector (15 downto 0); --DDS data converted to unsigned, this is the Data for the DAC.
            o_UPDATE_F : out std_logic;  --Togles when a new frequency is to be set at the output.
            i_CLK : in std_logic -- Master clock input, (DDS_CLK).
        );
end DAC_DATA_Conversion;

architecture Behavioral of DAC_DATA_Conversion is

signal r_F_IN : std_logic_vector (31 downto 0) := (others => '0');
signal w_update_F : std_logic := '0';
signal r_F_OUT : std_logic_vector (31 downto 0) := (others => '0');

begin

    r_F_IN <= i_HiBYTE_FWORD & i_LoBYTE_FWORD;  
    o_UPDATE_F <= w_update_f;
    o_FWORD <= r_F_OUT;
    o_DAC_DATA <= i_DDS_DATA xor x"8000"; -- Alternatively DAC_DATA_OUT(15) <= not DAC_DATA_OUT(15) would also work.
    process(r_F_OUT, r_F_IN, i_CLK)
    begin
        if(rising_edge(i_CLK)) then        -- When a rising edge on the master clock occurs, check if the current frequency setting is the same as before.
            if(r_F_OUT /= r_F_IN) then  --if it is not the same, then set the phase word to the DDS to the new value and togle the
                r_F_OUT <= r_F_IN;      --frequency update pin.
                w_update_F <= '1';
            else
                w_update_F <= '0';
            end if;
        end if;
    end process;

end Behavioral;
