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
            SET_F_IN_L : in std_logic_vector(15 downto 0); 
            SET_F_IN_H : in std_logic_vector (31 downto 16); 
            F_OUT : out std_logic_vector (31 downto 0); 
            DDS_DATA_IN : in std_logic_vector(15 downto 0);
            DAC_DATA_OUT : out std_logic_vector (15 downto 0); 
            UPDATE_F : out std_logic;  
            CLK_IN : in std_logic 
        );
end DAC_DATA_Conversion;

architecture Behavioral of DAC_DATA_Conversion is

signal sig_f_in : std_logic_vector (31 downto 0) := (others => '0');
signal sig_update_f : std_logic := '0';
signal sig_f_out : std_logic_vector (31 downto 0) := (others => '0');

begin

    sig_f_in <= SET_F_IN_H & SET_F_IN_L;    

    UPDATE_F <= sig_update_f;
    F_OUT <= sig_f_out;
    DAC_DATA_OUT <= DDS_DATA_IN xor x"8000"; 

    process(sig_f_out, sig_f_in, CLK_IN)
    begin
        if(rising_edge(CLK_IN)) then        
            if(sig_f_out /= sig_f_in) then 
                sig_f_out <= sig_f_in;      
                sig_update_f <= '1';
            else
                sig_update_f <= '0';
            end if;
        end if;
    end process;

end Behavioral;