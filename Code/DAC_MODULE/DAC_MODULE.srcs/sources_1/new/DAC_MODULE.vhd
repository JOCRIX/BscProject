----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2024 16:02:38
-- Design Name: 
-- Module Name: DAC_MODULE - Behavioral
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


--
entity DAC_MODULE is
    Port ( 
    Ext_CLK_IN : in STD_LOGIC;
    Ext_CLK_TO_DAC : out std_logic;
    Ext_SET_F_IN : in std_logic_vector(31 downto 16);
    Ext_DAC_DATA : out std_logic_vector(15 downto 0)
    );
end DAC_MODULE;

architecture rtl of DAC_MODULE is

component clk_wiz_0 --Set up the clock wiz as a component.
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

COMPONENT dds_compiler_0 --Set up the DDS as a component
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_config_tvalid : IN STD_LOGIC;
    s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
END COMPONENT;

component DAC_PRESCALER is -- Set up the DAC/DDS prescaller as a component.
    Port (
           CLK_IN : in STD_LOGIC; --The clock input, this is divided down by two to generate the DAC and DDS clocks. 100 MHz for 50 MHz DAC opperation.
           CLK_TO_DDS : out STD_LOGIC; -- The diveded down clock for the DDS.
           CLK_TO_DAC : out STD_LOGIC -- The clock for the DAC, a delayed version of the DDS clock.
           );
end component;    

component DAC_DATA_Conversion is
    port (
            --SET_F_IN_L : in std_logic_vector(15 downto 0); --bit 0 to 15 of the 32 bit wide frequency setting word.
            SET_F_IN_H : in std_logic_vector (31 downto 16); --bit 16 to 31 of the 32 bit wide frequency setting word.
            F_OUT : out std_logic_vector (31 downto 0); --The full 32 bit wide frequency setting word.
            DDS_DATA_IN : in std_logic_vector(15 downto 0); --DDS output data, in two's compliment.
            DAC_DATA_OUT : out std_logic_vector (15 downto 0); --DDS data converted to unsigned, this is the Data for the DAC.
            UPDATE_F : out std_logic;  --Togles when a new frequency is to be set at the output.
            CLK_IN : in std_logic -- Master clock input, (100 MHz when implemented).
            );
end component;


signal sig_clk_prescaller_to_DDS : std_logic := '0';  -- Connects the prescaller clock the DDS clock.
signal sig_clk_to_DAC_prescaler : std_logic := '0'; --connects the prescaller delayed clock to the DAC clock.
signal sig_prescaller_to_DDS : std_logic_vector (31 downto 0) := (others => '0'); --used to connect the phase word of the prescaller to the DDS.
signal dummy1 : std_logic;  --Simply used to connect an unused pin of the DDS.
signal sig_dds_data_to_DAC : std_logic_vector(15 downto 0); -- Connects the DDS two's compliment output data to the prescaller.
signal sig_update_f : std_logic; -- connects the update phase word indicater from the prescaller to the DDS.
signal sig_clk_to_DAC : std_logic := '0';

begin
Ext_CLK_TO_DAC <= sig_clk_to_DAC;

PLL1 : clk_wiz_0 -- Clocking wiz, used to set-up a pll to generate the master clock for the DDS prescaller.
   port map ( 
  -- Clock out ports  
   clk_out1 => sig_clk_to_DAC_prescaler,
   -- Clock in ports
   clk_in1 => Ext_CLK_IN
 );
 
DAC_Prescaler1 : DAC_PRESCALER  --make connections between signals and the prescaller module.
    port map (
    CLK_IN => sig_clk_to_DAC_prescaler, --Connect the master clock from the PLL to the clock input.
    CLK_TO_DDS => sig_clk_prescaller_to_DDS, -- Connect the output DDS clock to the DDS_clock signal.
    CLK_TO_DAC => sig_clk_to_DAC -- Connect the output DAC clock to the DAC_CLOCK signal.
    );
    
DAC_DATA_Converter1 : DAC_DATA_Conversion
    port map (
    CLK_IN => sig_clk_to_DAC,
    SET_F_IN_H => Ext_SET_F_IN, -- Connect the external dipswitches to bit 31 downto 16 of the phase word.
    --SET_F_IN_H => YOUR REGISTER HERE;
    --SET_F_IN_L => YOUR REGISTER HERE;
    F_OUT => sig_prescaller_to_DDS, -- Connect the 32 bit wide phase word from the prescaller to the DDS phase word signal.
    DDS_DATA_IN => sig_dds_data_to_DAC, -- connect the output data of the DDS to the prescaller to convert it from two's compliment to unsigned.
    DAC_DATA_OUT => Ext_DAC_DATA, -- Connect the unsigned DAC data to the external DAC pins.
    UPDATE_F => sig_update_f -- Connect the indication of new phase word to the update phase word signal.
    );
    
DDS1 : dds_compiler_0 -- make connections between the signals and the DDS module.
  PORT MAP (
    aclk => sig_clk_prescaller_to_DDS, 
    s_axis_config_tvalid => sig_update_f,
    s_axis_config_tdata => sig_prescaller_to_DDS,
    m_axis_data_tvalid => dummy1,
    m_axis_data_tdata => sig_dds_data_to_DAC
  );
  


end rtl;