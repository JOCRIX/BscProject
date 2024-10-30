-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Oct 30 14:04:07 2024
-- Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/EIT
--               GIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.sim/sim_1/synth/func/xsim/ADC_CONTROL_TOP_func_synth.vhd}
-- Design      : ADC_CONTROL_TOP
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adc_control is
  port (
    PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT : out STD_LOGIC;
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT : out STD_LOGIC;
    clk_out1 : in STD_LOGIC;
    EXT_DCN_OUT_OBUF : in STD_LOGIC;
    EXT_TEST_ACQUIRE_START_IBUF_BUFG : in STD_LOGIC;
    output_logic : in STD_LOGIC_VECTOR ( 0 to 0 );
    Pulse_complete : in STD_LOGIC
  );
end adc_control;

architecture STRUCTURE of adc_control is
  signal clks_start : STD_LOGIC;
  signal clks_start_i_1_n_0 : STD_LOGIC;
  signal start_acquisition : STD_LOGIC;
  signal start_adc_control : STD_LOGIC;
begin
PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => start_acquisition,
      Q => PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      R => '0'
    );
PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => '0',
      CE => '1',
      D => '0',
      PRE => clks_start,
      Q => PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT
    );
clks_start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03AAAAAA"
    )
        port map (
      I0 => clks_start,
      I1 => output_logic(0),
      I2 => Pulse_complete,
      I3 => start_adc_control,
      I4 => start_acquisition,
      O => clks_start_i_1_n_0
    );
clks_start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => clks_start_i_1_n_0,
      Q => clks_start,
      R => '0'
    );
start_acquisition_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_TEST_ACQUIRE_START_IBUF_BUFG,
      CE => '1',
      D => '1',
      Q => start_acquisition,
      R => '0'
    );
start_adc_control_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_DCN_OUT_OBUF,
      CE => '1',
      D => '1',
      Q => start_adc_control,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0_clk_wiz is
  port (
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clk_wiz_0_clk_wiz;

architecture STRUCTURE of clk_wiz_0_clk_wiz is
  signal clk_in1_clk_wiz_0 : STD_LOGIC;
  signal clk_out1_clk_wiz_0 : STD_LOGIC;
  signal clk_out2_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_clk_wiz_0 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_LOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_wiz_0,
      O => clkfbout_buf_clk_wiz_0
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clk_in1_clk_wiz_0
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out1_clk_wiz_0,
      O => clk_out1
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out2_clk_wiz_0,
      O => clk_out2
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "HIGH",
      CLKFBOUT_MULT_F => 50.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 83.333000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 3.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 30,
      CLKOUT1_DUTY_CYCLE => 0.483000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_wiz_0,
      CLKFBOUT => clkfbout_clk_wiz_0,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_clk_wiz_0,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_out1_clk_wiz_0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_out2_clk_wiz_0,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => NLW_mmcm_adv_inst_LOCKED_UNCONNECTED,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_gen_invert is
  port (
    active_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    Pulse_complete : out STD_LOGIC;
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF : out STD_LOGIC;
    PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT : in STD_LOGIC;
    clk_out2 : in STD_LOGIC
  );
end pulse_gen_invert;

architecture STRUCTURE of pulse_gen_invert is
  signal \^pulse_complete\ : STD_LOGIC;
  signal \active_i_1__1_n_0\ : STD_LOGIC;
  signal \^active_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clear : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_2_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal done_i_1_n_0 : STD_LOGIC;
  signal output_logic : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal stop : STD_LOGIC;
  signal stop_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[2]_i_3\ : label is "soft_lutpair0";
begin
  Pulse_complete <= \^pulse_complete\;
  active_reg_0(0) <= \^active_reg_0\(0);
Pulse_out: unisim.vcomponents.LUT4
    generic map(
      INIT => X"400F"
    )
        port map (
      I0 => stop,
      I1 => clk_out2,
      I2 => output_logic(0),
      I3 => \^active_reg_0\(0),
      O => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF
    );
\active_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF7FFF0000"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => count_reg(2),
      I3 => count_reg(3),
      I4 => output_logic(0),
      I5 => \^active_reg_0\(0),
      O => \active_i_1__1_n_0\
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => \active_i_1__1_n_0\,
      Q => \^active_reg_0\(0),
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(0),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      O => \p_0_in__0\(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => output_logic(0),
      O => clear
    );
\count[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => count_reg(2),
      I3 => count_reg(3),
      O => \count[2]_i_2_n_0\
    );
\count[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => count_reg(2),
      O => \p_0_in__0\(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => count_reg(2),
      I3 => count_reg(3),
      O => \count[3]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => \count[2]_i_2_n_0\,
      D => \count[0]_i_1_n_0\,
      Q => count_reg(0),
      R => clear
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => \count[2]_i_2_n_0\,
      D => \p_0_in__0\(1),
      Q => count_reg(1),
      R => clear
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => \count[2]_i_2_n_0\,
      D => \p_0_in__0\(2),
      Q => count_reg(2),
      R => clear
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => \count[3]_i_1_n_0\,
      Q => count_reg(3),
      R => clear
    );
done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => count_reg(2),
      I3 => count_reg(3),
      I4 => output_logic(0),
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => done_i_1_n_0,
      Q => \^pulse_complete\,
      R => '0'
    );
\output_logic_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
      CE => '1',
      CLR => \^pulse_complete\,
      D => '1',
      Q => output_logic(0)
    );
stop0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(0),
      I2 => count_reg(1),
      I3 => count_reg(3),
      O => p_0_in
    );
stop_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^active_reg_0\(0),
      O => stop_i_1_n_0
    );
stop_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk_out2,
      CE => '1',
      CLR => stop_i_1_n_0,
      D => p_0_in,
      Q => stop
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_train_gen is
  port (
    EXT_CNV_OUT_OBUF : out STD_LOGIC;
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT : in STD_LOGIC;
    clk_out1 : in STD_LOGIC
  );
end pulse_train_gen;

architecture STRUCTURE of pulse_train_gen is
  signal active : STD_LOGIC;
  signal active_i_1_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \done_i_1__0_n_0\ : STD_LOGIC;
  signal done_reg_n_0 : STD_LOGIC;
  signal run : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of active_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \done_i_1__0\ : label is "soft_lutpair1";
begin
EXT_CNV_OUT_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => active,
      I1 => done_reg_n_0,
      O => EXT_CNV_OUT_OBUF
    );
active_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFBF00"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => run,
      I4 => active,
      O => active_i_1_n_0
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => active_i_1_n_0,
      Q => active,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1500"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => run,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => run,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6C00"
    )
        port map (
      I0 => count(1),
      I1 => count(2),
      I2 => count(0),
      I3 => run,
      O => \count[2]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => count(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => count(2),
      R => '0'
    );
\done_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => run,
      O => \done_i_1__0_n_0\
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \done_i_1__0_n_0\,
      Q => done_reg_n_0,
      R => '0'
    );
run_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      CE => '1',
      CLR => done_reg_n_0,
      D => '1',
      Q => run
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \pulse_train_gen__parameterized1\ is
  port (
    EXT_DCN_OUT_OBUF : out STD_LOGIC;
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT : in STD_LOGIC;
    clk_out1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \pulse_train_gen__parameterized1\ : entity is "pulse_train_gen";
end \pulse_train_gen__parameterized1\;

architecture STRUCTURE of \pulse_train_gen__parameterized1\ is
  signal active : STD_LOGIC;
  signal \active_i_1__0_n_0\ : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \done_i_1__1_n_0\ : STD_LOGIC;
  signal done_reg_n_0 : STD_LOGIC;
  signal run : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \active_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \done_i_1__1\ : label is "soft_lutpair3";
begin
EXT_DCN_OUT_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => active,
      I1 => done_reg_n_0,
      O => EXT_DCN_OUT_OBUF
    );
\active_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF7F00"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => run,
      I4 => active,
      O => \active_i_1__0_n_0\
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \active_i_1__0_n_0\,
      Q => active,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D500"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => run,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E600"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => run,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F800"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => run,
      O => \count[2]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\done_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => run,
      O => \done_i_1__1_n_0\
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \done_i_1__1_n_0\,
      Q => done_reg_n_0,
      R => '0'
    );
run_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      CE => '1',
      CLR => done_reg_n_0,
      D => '1',
      Q => run
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0 is
  port (
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clk_wiz_0;

architecture STRUCTURE of clk_wiz_0 is
begin
inst: entity work.clk_wiz_0_clk_wiz
     port map (
      clk_in1 => clk_in1,
      clk_out1 => clk_out1,
      clk_out2 => clk_out2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ADC_CONTROL_TOP is
  port (
    MASTER_CLK_IN : in STD_LOGIC;
    EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN : in STD_LOGIC;
    EXT_EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN : in STD_LOGIC;
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT : out STD_LOGIC;
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT : out STD_LOGIC;
    EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT : out STD_LOGIC;
    EXT_CNV_OUT : out STD_LOGIC;
    EXT_DCN_OUT : out STD_LOGIC;
    EXT_TEST_ACQUIRE_START : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ADC_CONTROL_TOP : entity is true;
end ADC_CONTROL_TOP;

architecture STRUCTURE of ADC_CONTROL_TOP is
  signal EXT_CNV_OUT_OBUF : STD_LOGIC;
  signal EXT_DCN_OUT_OBUF : STD_LOGIC;
  signal EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF : STD_LOGIC;
  signal EXT_TEST_ACQUIRE_START_IBUF : STD_LOGIC;
  signal EXT_TEST_ACQUIRE_START_IBUF_BUFG : STD_LOGIC;
  signal PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT : STD_LOGIC;
  signal PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT : STD_LOGIC;
  signal Pulse_complete : STD_LOGIC;
  signal clk_out1 : STD_LOGIC;
  signal clk_out2 : STD_LOGIC;
  signal output_logic : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute IMPORTED_FROM : string;
  attribute IMPORTED_FROM of your_instance_name : label is "c:/EIT GIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.gen/sources_1/ip/clk_wiz_0_1/clk_wiz_0.dcp";
  attribute IMPORTED_TYPE : string;
  attribute IMPORTED_TYPE of your_instance_name : label is "CHECKPOINT";
  attribute IS_IMPORTED : boolean;
  attribute IS_IMPORTED of your_instance_name : label is std.standard.true;
  attribute syn_black_box : string;
  attribute syn_black_box of your_instance_name : label is "TRUE";
begin
EXT_CNV_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EXT_CNV_OUT_OBUF,
      O => EXT_CNV_OUT
    );
EXT_DCN_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EXT_DCN_OUT_OBUF,
      O => EXT_DCN_OUT
    );
EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT
    );
EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      O => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT
    );
EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      O => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT
    );
EXT_TEST_ACQUIRE_START_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => EXT_TEST_ACQUIRE_START_IBUF,
      O => EXT_TEST_ACQUIRE_START_IBUF_BUFG
    );
EXT_TEST_ACQUIRE_START_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => EXT_TEST_ACQUIRE_START,
      O => EXT_TEST_ACQUIRE_START_IBUF
    );
adc_ctrl1: entity work.adc_control
     port map (
      EXT_DCN_OUT_OBUF => EXT_DCN_OUT_OBUF,
      EXT_TEST_ACQUIRE_START_IBUF_BUFG => EXT_TEST_ACQUIRE_START_IBUF_BUFG,
      PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT => PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT => PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
      Pulse_complete => Pulse_complete,
      clk_out1 => clk_out1,
      output_logic(0) => output_logic(1)
    );
pulse_gen_1_SDACLK: entity work.pulse_gen_invert
     port map (
      EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT => PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
      Pulse_complete => Pulse_complete,
      active_reg_0(0) => output_logic(1),
      clk_out2 => clk_out2
    );
pulse_gen_2_35ns: entity work.pulse_train_gen
     port map (
      EXT_CNV_OUT_OBUF => EXT_CNV_OUT_OBUF,
      PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT => PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      clk_out1 => clk_out1
    );
pulse_gen_3_45ns: entity work.\pulse_train_gen__parameterized1\
     port map (
      EXT_DCN_OUT_OBUF => EXT_DCN_OUT_OBUF,
      PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT => PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
      clk_out1 => clk_out1
    );
your_instance_name: entity work.clk_wiz_0
     port map (
      clk_in1 => MASTER_CLK_IN,
      clk_out1 => clk_out1,
      clk_out2 => clk_out2
    );
end STRUCTURE;
