----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2024 16:42:03
-- Design Name: 
-- Module Name: IV_SAMPLE_CTRL - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IV_SAMPLE_CTRL is
    Port ( 
            --MASTER_CLK_IN : in std_logic;
            CLK_FROM_INT_MEM_IN : in STD_LOGIC;
            ADDR_FROM_INT_MEM_IN : in STD_LOGIC_VECTOR (15 downto 0);
            DATA_TO_INT_MEM_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            --ADC_TRIG_IN : in STD_LOGIC;
            DATA_FROM_MEM_DIST_IN : in STD_LOGIC_VECTOR (15 downto 0);
            
            
            ADC_DnB : in STD_LOGIC;
            ADC_DATA_IN : in STD_LOGIC_VECTOR (15 downto 0);
            ADC_DATA_RDY_IN : in STD_LOGIC;          
            DATA_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            ADDR_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            RnW_TO_MEM_DIST_OUT : out STD_LOGIC;
            CLK_TO_MEM_DIST_OUT : out STD_LOGIC;
            i_RESET : in std_logic := '0'
            );
end IV_SAMPLE_CTRL;

architecture Behavioral of IV_SAMPLE_CTRL is
    constant MAX_ADDR_DATA : integer := 15;
    signal sig_ADC_ADDR : std_logic_vector(MAX_ADDR_DATA downto 0) := (others => '0');
    signal sig_ADC_DATA : std_logic_vector(MAX_ADDR_DATA downto 0) := (others => '0');
    signal sample_count : integer range 0 to 65535 := 0;
    signal sig_ADC_CLK_to_mem_dist : std_logic := '0';
    signal sig_RnW_to_mem_dist_out : STD_LOGIC := '0';
    
    signal sig_int_mem_ADDR : std_logic_vector(MAX_ADDR_DATA downto 0) := (others => '0');
    signal sig_int_mem_DATA : std_logic_vector(MAX_ADDR_DATA downto 0) := (others => '0');
    signal sig_CLK_from_int_mem : std_logic := '0';
    signal sig_RnW_to_mem_dist_out_nB : std_logic := '0';
begin

CLK_TO_MEM_DIST_OUT <= sig_ADC_CLK_to_mem_dist or sig_CLK_from_int_mem;
ADDR_TO_MEM_DIST_OUT <= sig_ADC_ADDR or sig_int_mem_ADDR;
DATA_TO_MEM_DIST_OUT <= sig_ADC_DATA;
RnW_TO_MEM_DIST_OUT <= sig_RnW_to_mem_dist_out or sig_RnW_to_mem_dist_out_nB;
DATA_TO_INT_MEM_OUT <= sig_int_mem_DATA;



DATA_ADDR_sample_mode: process(ADC_DnB, sig_ADC_ADDR, ADC_DATA_IN, ADC_DATA_RDY_IN, sample_count)
begin
    if (ADC_DnB = '0') then
        sig_ADC_ADDR <= std_logic_vector(to_unsigned(sample_count, sig_ADC_ADDR'length));
        sig_ADC_DATA <= ADC_DATA_IN;
        --sig_ADC_DATA <= std_logic_vector(to_unsigned(sample_count, sig_ADC_DATA'length));
        sig_ADC_CLK_to_mem_dist <= ADC_DATA_RDY_IN;
        sig_RnW_to_mem_dist_out <= '0';
    else
        sig_ADC_ADDR <= (others => '0');
        sig_ADC_CLK_to_mem_dist <= '0';
        sig_ADC_DATA <= (others => '0');
        sig_RnW_to_mem_dist_out <= '1';
    end if;
end process;

ADDR_COUNT_sample_mode: process(i_RESET, ADC_DATA_RDY_IN, sample_count)
begin
    if(i_RESET = '1') then
        sample_count <= 0;
    elsif(falling_edge(ADC_DATA_RDY_IN)) then
        if (sample_count <= 40000) then
            sample_count <= sample_count + 1;
        else
            sample_count <= 65535;
        end if;
    end if;
end process;

DATA_ADDR_read_mode: process(ADC_DnB, CLK_FROM_INT_MEM_IN, ADDR_FROM_INT_MEM_IN, DATA_FROM_MEM_DIST_IN)
begin
    if(ADC_DnB = '1') then
        sig_int_mem_ADDR <= ADDR_FROM_INT_MEM_IN;
        sig_int_mem_DATA <= DATA_FROM_MEM_DIST_IN;
        sig_CLK_from_int_mem <= CLK_FROM_INT_MEM_IN;
        sig_RnW_to_mem_dist_out_nB <= '1';
    else
        sig_int_mem_ADDR <= (others => '0');
        sig_int_mem_DATA <= (others => '0');
        sig_CLK_from_int_mem <= '0';
        sig_RnW_to_mem_dist_out_nB <= '0'; 
    end if;
end process;

end Behavioral;
