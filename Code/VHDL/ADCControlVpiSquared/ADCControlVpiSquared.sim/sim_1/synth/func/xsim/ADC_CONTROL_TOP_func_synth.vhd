-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Nov  4 01:29:57 2024
-- Host        : DESKTOP-DNC9NIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {F:/Git
--               Projects/EIT/P7---Bsc/Code/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.sim/sim_1/synth/func/xsim/ADC_CONTROL_TOP_func_synth.vhd}
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
    spi_clk_trig_out : out STD_LOGIC;
    dcn_trig_out : out STD_LOGIC;
    data_ready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    EXT_TEST_ACQUIRE_START_IBUF_BUFG : in STD_LOGIC;
    i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : in STD_LOGIC;
    ACTIVE : in STD_LOGIC;
    i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : in STD_LOGIC;
    clk_out1 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF : in STD_LOGIC
  );
end adc_control;

architecture STRUCTURE of adc_control is
  signal \FSM_sequential_s_adc[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_adc[1]_i_1_n_0\ : STD_LOGIC;
  signal cnv_trig_out_i_1_n_0 : STD_LOGIC;
  signal \^data_ready\ : STD_LOGIC;
  signal \^dcn_trig_out\ : STD_LOGIC;
  signal dsc_pulse_done : STD_LOGIC;
  signal dsc_pulse_done_i_2_n_0 : STD_LOGIC;
  signal dsc_trig_out : STD_LOGIC;
  signal dsc_trig_out_i_1_n_0 : STD_LOGIC;
  signal s_adc : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal serial_clk_count0 : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal \serial_clk_count[0]_i_1_n_0\ : STD_LOGIC;
  signal serial_clk_count_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal serial_data_adc_10 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \serial_data_adc_1[15]_i_2_n_0\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[10]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[11]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[12]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[13]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[14]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[15]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[1]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[2]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[3]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[4]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[5]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[6]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[7]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[8]\ : STD_LOGIC;
  signal \serial_data_adc_1_reg_n_0_[9]\ : STD_LOGIC;
  signal set_spi_clk : STD_LOGIC;
  signal spi_clk_done : STD_LOGIC;
  signal \^spi_clk_trig_out\ : STD_LOGIC;
  signal spi_clk_trig_out_0 : STD_LOGIC;
  signal spi_clk_trig_out_i_1_n_0 : STD_LOGIC;
  signal start_acquisition : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_s_adc[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_s_adc[1]_i_1\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_adc_reg[0]\ : label is "acquire:11,get_data:10,idle:01,latch:00";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_adc_reg[1]\ : label is "acquire:11,get_data:10,idle:01,latch:00";
  attribute SOFT_HLUTNM of cnv_trig_out_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \serial_clk_count[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \serial_clk_count[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \serial_clk_count[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \serial_clk_count[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of spi_clk_trig_out_i_1 : label is "soft_lutpair0";
begin
  data_ready <= \^data_ready\;
  dcn_trig_out <= \^dcn_trig_out\;
  spi_clk_trig_out <= \^spi_clk_trig_out\;
\FSM_sequential_s_adc[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7370"
    )
        port map (
      I0 => set_spi_clk,
      I1 => s_adc(1),
      I2 => s_adc(0),
      I3 => dsc_pulse_done,
      O => \FSM_sequential_s_adc[0]_i_1_n_0\
    );
\FSM_sequential_s_adc[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4C4"
    )
        port map (
      I0 => spi_clk_done,
      I1 => s_adc(1),
      I2 => s_adc(0),
      I3 => start_acquisition,
      O => \FSM_sequential_s_adc[1]_i_1_n_0\
    );
\FSM_sequential_s_adc_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \FSM_sequential_s_adc[0]_i_1_n_0\,
      Q => s_adc(0),
      R => '0'
    );
\FSM_sequential_s_adc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \FSM_sequential_s_adc[1]_i_1_n_0\,
      Q => s_adc(1),
      R => '0'
    );
\adc_1_data_latched_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[0]\,
      Q => Q(0),
      R => '0'
    );
\adc_1_data_latched_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[10]\,
      Q => Q(10),
      R => '0'
    );
\adc_1_data_latched_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[11]\,
      Q => Q(11),
      R => '0'
    );
\adc_1_data_latched_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[12]\,
      Q => Q(12),
      R => '0'
    );
\adc_1_data_latched_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[13]\,
      Q => Q(13),
      R => '0'
    );
\adc_1_data_latched_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[14]\,
      Q => Q(14),
      R => '0'
    );
\adc_1_data_latched_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[15]\,
      Q => Q(15),
      R => '0'
    );
\adc_1_data_latched_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[1]\,
      Q => Q(1),
      R => '0'
    );
\adc_1_data_latched_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[2]\,
      Q => Q(2),
      R => '0'
    );
\adc_1_data_latched_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[3]\,
      Q => Q(3),
      R => '0'
    );
\adc_1_data_latched_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[4]\,
      Q => Q(4),
      R => '0'
    );
\adc_1_data_latched_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[5]\,
      Q => Q(5),
      R => '0'
    );
\adc_1_data_latched_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[6]\,
      Q => Q(6),
      R => '0'
    );
\adc_1_data_latched_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[7]\,
      Q => Q(7),
      R => '0'
    );
\adc_1_data_latched_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[8]\,
      Q => Q(8),
      R => '0'
    );
\adc_1_data_latched_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => dsc_trig_out,
      D => \serial_data_adc_1_reg_n_0_[9]\,
      Q => Q(9),
      R => '0'
    );
cnv_trig_out_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F40"
    )
        port map (
      I0 => set_spi_clk,
      I1 => s_adc(0),
      I2 => s_adc(1),
      I3 => \^dcn_trig_out\,
      O => cnv_trig_out_i_1_n_0
    );
cnv_trig_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => cnv_trig_out_i_1_n_0,
      Q => \^dcn_trig_out\,
      R => '0'
    );
dsc_pulse_done_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_adc(0),
      I1 => s_adc(1),
      O => dsc_pulse_done_i_2_n_0
    );
dsc_pulse_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
      CE => '1',
      CLR => dsc_pulse_done_i_2_n_0,
      D => '1',
      Q => dsc_pulse_done
    );
dsc_trig_out_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD01"
    )
        port map (
      I0 => dsc_pulse_done,
      I1 => s_adc(0),
      I2 => s_adc(1),
      I3 => \^data_ready\,
      O => dsc_trig_out_i_1_n_0
    );
dsc_trig_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => dsc_trig_out_i_1_n_0,
      Q => \^data_ready\,
      R => '0'
    );
\serial_clk_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => serial_clk_count_reg(0),
      O => \serial_clk_count[0]_i_1_n_0\
    );
\serial_clk_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => serial_clk_count_reg(1),
      I1 => serial_clk_count_reg(0),
      O => serial_clk_count0(1)
    );
\serial_clk_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => serial_clk_count_reg(2),
      I1 => serial_clk_count_reg(0),
      I2 => serial_clk_count_reg(1),
      O => serial_clk_count0(2)
    );
\serial_clk_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => serial_clk_count_reg(3),
      I1 => serial_clk_count_reg(1),
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(2),
      O => serial_clk_count0(3)
    );
\serial_clk_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => serial_clk_count_reg(4),
      I1 => serial_clk_count_reg(2),
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(1),
      I4 => serial_clk_count_reg(3),
      O => serial_clk_count0(4)
    );
\serial_clk_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => serial_clk_count_reg(2),
      I1 => serial_clk_count_reg(0),
      I2 => serial_clk_count_reg(1),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(4),
      I5 => serial_clk_count_reg(5),
      O => serial_clk_count0(5)
    );
\serial_clk_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => '1',
      CLR => dsc_trig_out,
      D => \serial_clk_count[0]_i_1_n_0\,
      Q => serial_clk_count_reg(0)
    );
\serial_clk_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => '1',
      CLR => dsc_trig_out,
      D => serial_clk_count0(1),
      Q => serial_clk_count_reg(1)
    );
\serial_clk_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => '1',
      CLR => dsc_trig_out,
      D => serial_clk_count0(2),
      Q => serial_clk_count_reg(2)
    );
\serial_clk_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => '1',
      CLR => dsc_trig_out,
      D => serial_clk_count0(3),
      Q => serial_clk_count_reg(3)
    );
\serial_clk_count_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => '1',
      D => serial_clk_count0(4),
      PRE => dsc_trig_out,
      Q => serial_clk_count_reg(4)
    );
\serial_clk_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => '1',
      CLR => dsc_trig_out,
      D => serial_clk_count0(5),
      Q => serial_clk_count_reg(5)
    );
\serial_data_adc_1[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \serial_data_adc_1[15]_i_2_n_0\,
      I1 => serial_clk_count_reg(3),
      I2 => serial_clk_count_reg(1),
      I3 => serial_clk_count_reg(0),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(0)
    );
\serial_data_adc_1[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => serial_clk_count_reg(2),
      I1 => serial_clk_count_reg(3),
      I2 => \serial_data_adc_1[15]_i_2_n_0\,
      I3 => serial_clk_count_reg(1),
      I4 => serial_clk_count_reg(0),
      O => serial_data_adc_10(10)
    );
\serial_data_adc_1[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => serial_clk_count_reg(2),
      I1 => serial_clk_count_reg(3),
      I2 => serial_clk_count_reg(1),
      I3 => \serial_data_adc_1[15]_i_2_n_0\,
      I4 => serial_clk_count_reg(0),
      O => serial_data_adc_10(11)
    );
\serial_data_adc_1[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => serial_clk_count_reg(0),
      I1 => serial_clk_count_reg(1),
      I2 => serial_clk_count_reg(2),
      I3 => serial_clk_count_reg(3),
      I4 => \serial_data_adc_1[15]_i_2_n_0\,
      O => serial_data_adc_10(12)
    );
\serial_data_adc_1[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => serial_clk_count_reg(1),
      I1 => \serial_data_adc_1[15]_i_2_n_0\,
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(13)
    );
\serial_data_adc_1[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => \serial_data_adc_1[15]_i_2_n_0\,
      I1 => serial_clk_count_reg(1),
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(14)
    );
\serial_data_adc_1[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => serial_clk_count_reg(1),
      I1 => \serial_data_adc_1[15]_i_2_n_0\,
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(15)
    );
\serial_data_adc_1[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => serial_clk_count_reg(5),
      I1 => serial_clk_count_reg(4),
      I2 => s_adc(0),
      I3 => s_adc(1),
      O => \serial_data_adc_1[15]_i_2_n_0\
    );
\serial_data_adc_1[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => serial_clk_count_reg(3),
      I1 => serial_clk_count_reg(2),
      I2 => serial_clk_count_reg(1),
      I3 => \serial_data_adc_1[15]_i_2_n_0\,
      I4 => serial_clk_count_reg(0),
      O => serial_data_adc_10(1)
    );
\serial_data_adc_1[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => serial_clk_count_reg(3),
      I1 => serial_clk_count_reg(2),
      I2 => \serial_data_adc_1[15]_i_2_n_0\,
      I3 => serial_clk_count_reg(1),
      I4 => serial_clk_count_reg(0),
      O => serial_data_adc_10(2)
    );
\serial_data_adc_1[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => serial_clk_count_reg(3),
      I1 => serial_clk_count_reg(2),
      I2 => serial_clk_count_reg(1),
      I3 => \serial_data_adc_1[15]_i_2_n_0\,
      I4 => serial_clk_count_reg(0),
      O => serial_data_adc_10(3)
    );
\serial_data_adc_1[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => serial_clk_count_reg(0),
      I1 => serial_clk_count_reg(1),
      I2 => serial_clk_count_reg(2),
      I3 => serial_clk_count_reg(3),
      I4 => \serial_data_adc_1[15]_i_2_n_0\,
      O => serial_data_adc_10(4)
    );
\serial_data_adc_1[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => serial_clk_count_reg(1),
      I1 => \serial_data_adc_1[15]_i_2_n_0\,
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(5)
    );
\serial_data_adc_1[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => \serial_data_adc_1[15]_i_2_n_0\,
      I1 => serial_clk_count_reg(1),
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(6)
    );
\serial_data_adc_1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => serial_clk_count_reg(1),
      I1 => \serial_data_adc_1[15]_i_2_n_0\,
      I2 => serial_clk_count_reg(0),
      I3 => serial_clk_count_reg(3),
      I4 => serial_clk_count_reg(2),
      O => serial_data_adc_10(7)
    );
\serial_data_adc_1[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => serial_clk_count_reg(1),
      I1 => serial_clk_count_reg(0),
      I2 => serial_clk_count_reg(2),
      I3 => serial_clk_count_reg(3),
      I4 => \serial_data_adc_1[15]_i_2_n_0\,
      O => serial_data_adc_10(8)
    );
\serial_data_adc_1[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => serial_clk_count_reg(2),
      I1 => serial_clk_count_reg(3),
      I2 => serial_clk_count_reg(1),
      I3 => \serial_data_adc_1[15]_i_2_n_0\,
      I4 => serial_clk_count_reg(0),
      O => serial_data_adc_10(9)
    );
\serial_data_adc_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(0),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[0]\,
      R => '0'
    );
\serial_data_adc_1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(10),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[10]\,
      R => '0'
    );
\serial_data_adc_1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(11),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[11]\,
      R => '0'
    );
\serial_data_adc_1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(12),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[12]\,
      R => '0'
    );
\serial_data_adc_1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(13),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[13]\,
      R => '0'
    );
\serial_data_adc_1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(14),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[14]\,
      R => '0'
    );
\serial_data_adc_1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(15),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[15]\,
      R => '0'
    );
\serial_data_adc_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(1),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[1]\,
      R => '0'
    );
\serial_data_adc_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(2),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[2]\,
      R => '0'
    );
\serial_data_adc_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(3),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[3]\,
      R => '0'
    );
\serial_data_adc_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(4),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[4]\,
      R => '0'
    );
\serial_data_adc_1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(5),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[5]\,
      R => '0'
    );
\serial_data_adc_1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(6),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[6]\,
      R => '0'
    );
\serial_data_adc_1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(7),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[7]\,
      R => '0'
    );
\serial_data_adc_1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(8),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[8]\,
      R => '0'
    );
\serial_data_adc_1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      CE => serial_data_adc_10(9),
      D => D(0),
      Q => \serial_data_adc_1_reg_n_0_[9]\,
      R => '0'
    );
set_spi_clk_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_adc(1),
      I1 => s_adc(0),
      O => spi_clk_trig_out_0
    );
set_spi_clk_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
      CE => '1',
      CLR => spi_clk_trig_out_0,
      D => '1',
      Q => set_spi_clk
    );
spi_clk_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ACTIVE,
      CE => '1',
      CLR => dsc_trig_out,
      D => '1',
      Q => spi_clk_done
    );
spi_clk_trig_out_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F704"
    )
        port map (
      I0 => spi_clk_done,
      I1 => s_adc(1),
      I2 => s_adc(0),
      I3 => \^spi_clk_trig_out\,
      O => spi_clk_trig_out_i_1_n_0
    );
spi_clk_trig_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => spi_clk_trig_out_i_1_n_0,
      Q => \^spi_clk_trig_out\,
      R => '0'
    );
start_acquisition_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_adc(0),
      I1 => s_adc(1),
      O => dsc_trig_out
    );
start_acquisition_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => EXT_TEST_ACQUIRE_START_IBUF_BUFG,
      CE => '1',
      CLR => dsc_trig_out,
      D => '1',
      Q => start_acquisition
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0_clk_wiz is
  port (
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clk_wiz_0_clk_wiz;

architecture STRUCTURE of clk_wiz_0_clk_wiz is
  signal clk_in1_clk_wiz_0 : STD_LOGIC;
  signal clk_out1_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_clk_wiz_0 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED : STD_LOGIC;
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
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 62.500000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 83.333000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 3.750000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
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
      CLKOUT1 => NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED,
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
entity pulse_gen_width_modulator_inverted is
  port (
    ACTIVE : out STD_LOGIC;
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF : out STD_LOGIC;
    clk_out1 : in STD_LOGIC;
    spi_clk_trig_out : in STD_LOGIC
  );
end pulse_gen_width_modulator_inverted;

architecture STRUCTURE of pulse_gen_width_modulator_inverted is
  signal clk_count : STD_LOGIC;
  signal \clk_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \clk_count[0]_i_7_n_0\ : STD_LOGIC;
  signal clk_count_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \clk_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \clk_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal done : STD_LOGIC;
  signal done0 : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_i_2_n_0 : STD_LOGIC;
  signal done_i_3_n_0 : STD_LOGIC;
  signal gen_1_pulse : STD_LOGIC;
  signal gen_1_pulse1 : STD_LOGIC;
  signal gen_1_pulse_i_1_n_0 : STD_LOGIC;
  signal output_set_i_1_n_0 : STD_LOGIC;
  signal output_set_reg_n_0 : STD_LOGIC;
  signal output_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \pulse_complete__0_i_1_n_0\ : STD_LOGIC;
  signal pulse_complete_i_1_n_0 : STD_LOGIC;
  signal \pulse_complete_reg__1\ : STD_LOGIC;
  signal pulse_complete_reg_n_0 : STD_LOGIC;
  signal pulses_generated0 : STD_LOGIC;
  signal \pulses_generated[0]_i_5_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_6_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_7_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_8_n_0\ : STD_LOGIC;
  signal pulses_generated_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \pulses_generated_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \pulses_generated_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal s_toggle : STD_LOGIC;
  signal s_toggle4_out : STD_LOGIC;
  signal s_toggle_i_1_n_0 : STD_LOGIC;
  signal \NLW_clk_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_clk_count_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_pulses_generated_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pulses_generated_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \clk_count_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of gen_1_pulse_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \pulse_complete__0_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pulses_generated[0]_i_4\ : label is "soft_lutpair5";
  attribute ADDER_THRESHOLD of \pulses_generated_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \pulses_generated_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulses_generated_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulses_generated_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of s_toggle_i_1 : label is "soft_lutpair4";
begin
ACTIVE_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => output_state(1),
      CE => '1',
      CLR => done,
      D => '1',
      Q => ACTIVE
    );
EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => output_state(1),
      I1 => output_state(0),
      I2 => output_set_reg_n_0,
      O => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF
    );
\clk_count[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002002"
    )
        port map (
      I0 => gen_1_pulse,
      I1 => pulse_complete_reg_n_0,
      I2 => clk_count_reg(2),
      I3 => s_toggle,
      I4 => \clk_count[0]_i_4_n_0\,
      O => s_toggle4_out
    );
\clk_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gen_1_pulse,
      I1 => pulse_complete_reg_n_0,
      O => clk_count
    );
\clk_count[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \clk_count[0]_i_6_n_0\,
      I1 => clk_count_reg(5),
      I2 => clk_count_reg(4),
      I3 => clk_count_reg(7),
      I4 => clk_count_reg(6),
      I5 => \clk_count[0]_i_7_n_0\,
      O => \clk_count[0]_i_4_n_0\
    );
\clk_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_reg(0),
      O => \clk_count[0]_i_5_n_0\
    );
\clk_count[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_count_reg(9),
      I1 => clk_count_reg(8),
      I2 => clk_count_reg(11),
      I3 => clk_count_reg(10),
      O => \clk_count[0]_i_6_n_0\
    );
\clk_count[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => clk_count_reg(0),
      I1 => clk_count_reg(12),
      I2 => clk_count_reg(13),
      I3 => clk_count_reg(3),
      I4 => clk_count_reg(1),
      O => \clk_count[0]_i_7_n_0\
    );
\clk_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_7\,
      Q => clk_count_reg(0),
      R => s_toggle4_out
    );
\clk_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_count_reg[0]_i_3_n_0\,
      CO(2) => \clk_count_reg[0]_i_3_n_1\,
      CO(1) => \clk_count_reg[0]_i_3_n_2\,
      CO(0) => \clk_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \clk_count_reg[0]_i_3_n_4\,
      O(2) => \clk_count_reg[0]_i_3_n_5\,
      O(1) => \clk_count_reg[0]_i_3_n_6\,
      O(0) => \clk_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => clk_count_reg(3 downto 1),
      S(0) => \clk_count[0]_i_5_n_0\
    );
\clk_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_5\,
      Q => clk_count_reg(10),
      R => s_toggle4_out
    );
\clk_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_4\,
      Q => clk_count_reg(11),
      R => s_toggle4_out
    );
\clk_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[12]_i_1_n_7\,
      Q => clk_count_reg(12),
      R => s_toggle4_out
    );
\clk_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_clk_count_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \clk_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_clk_count_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \clk_count_reg[12]_i_1_n_6\,
      O(0) => \clk_count_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => clk_count_reg(13 downto 12)
    );
\clk_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[12]_i_1_n_6\,
      Q => clk_count_reg(13),
      R => s_toggle4_out
    );
\clk_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_6\,
      Q => clk_count_reg(1),
      R => s_toggle4_out
    );
\clk_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_5\,
      Q => clk_count_reg(2),
      R => s_toggle4_out
    );
\clk_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_4\,
      Q => clk_count_reg(3),
      R => s_toggle4_out
    );
\clk_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_7\,
      Q => clk_count_reg(4),
      R => s_toggle4_out
    );
\clk_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_reg[0]_i_3_n_0\,
      CO(3) => \clk_count_reg[4]_i_1_n_0\,
      CO(2) => \clk_count_reg[4]_i_1_n_1\,
      CO(1) => \clk_count_reg[4]_i_1_n_2\,
      CO(0) => \clk_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_reg[4]_i_1_n_4\,
      O(2) => \clk_count_reg[4]_i_1_n_5\,
      O(1) => \clk_count_reg[4]_i_1_n_6\,
      O(0) => \clk_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => clk_count_reg(7 downto 4)
    );
\clk_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_6\,
      Q => clk_count_reg(5),
      R => s_toggle4_out
    );
\clk_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_5\,
      Q => clk_count_reg(6),
      R => s_toggle4_out
    );
\clk_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_4\,
      Q => clk_count_reg(7),
      R => s_toggle4_out
    );
\clk_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_7\,
      Q => clk_count_reg(8),
      R => s_toggle4_out
    );
\clk_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_reg[4]_i_1_n_0\,
      CO(3) => \clk_count_reg[8]_i_1_n_0\,
      CO(2) => \clk_count_reg[8]_i_1_n_1\,
      CO(1) => \clk_count_reg[8]_i_1_n_2\,
      CO(0) => \clk_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_reg[8]_i_1_n_4\,
      O(2) => \clk_count_reg[8]_i_1_n_5\,
      O(1) => \clk_count_reg[8]_i_1_n_6\,
      O(0) => \clk_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => clk_count_reg(11 downto 8)
    );
\clk_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_6\,
      Q => clk_count_reg(9),
      R => s_toggle4_out
    );
done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => output_state(1),
      I1 => gen_1_pulse,
      I2 => done0,
      I3 => done,
      O => done_i_1_n_0
    );
done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => done_i_3_n_0,
      I1 => pulses_generated_reg(4),
      I2 => done,
      I3 => pulse_complete_reg_n_0,
      O => done_i_2_n_0
    );
done_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \pulses_generated[0]_i_5_n_0\,
      I1 => pulses_generated_reg(5),
      I2 => pulses_generated_reg(3),
      I3 => pulses_generated_reg(7),
      I4 => pulses_generated_reg(6),
      I5 => \pulses_generated[0]_i_7_n_0\,
      O => done_i_3_n_0
    );
done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      CLR => done_i_2_n_0,
      D => done_i_1_n_0,
      Q => done
    );
gen_1_pulse_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F8FC"
    )
        port map (
      I0 => done_i_3_n_0,
      I1 => output_state(1),
      I2 => gen_1_pulse,
      I3 => done,
      I4 => pulses_generated_reg(4),
      O => gen_1_pulse_i_1_n_0
    );
gen_1_pulse_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      CLR => pulse_complete_reg_n_0,
      D => gen_1_pulse_i_1_n_0,
      Q => gen_1_pulse
    );
output_set_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0CCCFCCCACCCECC"
    )
        port map (
      I0 => clk_count_reg(2),
      I1 => output_set_reg_n_0,
      I2 => pulse_complete_reg_n_0,
      I3 => gen_1_pulse,
      I4 => s_toggle,
      I5 => \clk_count[0]_i_4_n_0\,
      O => output_set_i_1_n_0
    );
output_set_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => output_set_i_1_n_0,
      Q => output_set_reg_n_0,
      R => '0'
    );
\output_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => done,
      CE => '1',
      CLR => spi_clk_trig_out,
      D => '1',
      Q => output_state(0)
    );
\output_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spi_clk_trig_out,
      CE => '1',
      CLR => done,
      D => '1',
      Q => output_state(1)
    );
\pulse_complete__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \clk_count[0]_i_4_n_0\,
      I1 => gen_1_pulse,
      I2 => s_toggle,
      I3 => clk_count_reg(2),
      I4 => pulse_complete_reg_n_0,
      O => \pulse_complete__0_i_1_n_0\
    );
pulse_complete_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \pulse_complete_reg__1\,
      I1 => pulse_complete_reg_n_0,
      O => pulse_complete_i_1_n_0
    );
pulse_complete_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => pulse_complete_i_1_n_0,
      Q => pulse_complete_reg_n_0,
      R => '0'
    );
\pulse_complete_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \pulse_complete__0_i_1_n_0\,
      Q => \pulse_complete_reg__1\,
      R => '0'
    );
\pulses_generated[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => pulse_complete_reg_n_0,
      I1 => gen_1_pulse1,
      I2 => pulses_generated_reg(4),
      I3 => \pulses_generated[0]_i_5_n_0\,
      I4 => \pulses_generated[0]_i_6_n_0\,
      I5 => \pulses_generated[0]_i_7_n_0\,
      O => done0
    );
\pulses_generated[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000EF0000"
    )
        port map (
      I0 => done_i_3_n_0,
      I1 => pulses_generated_reg(4),
      I2 => done,
      I3 => pulse_complete_reg_n_0,
      I4 => output_state(1),
      I5 => gen_1_pulse,
      O => pulses_generated0
    );
\pulses_generated[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => output_state(1),
      I1 => gen_1_pulse,
      O => gen_1_pulse1
    );
\pulses_generated[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pulses_generated_reg(9),
      I1 => pulses_generated_reg(8),
      I2 => pulses_generated_reg(11),
      I3 => pulses_generated_reg(10),
      O => \pulses_generated[0]_i_5_n_0\
    );
\pulses_generated[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pulses_generated_reg(5),
      I1 => pulses_generated_reg(3),
      I2 => pulses_generated_reg(7),
      I3 => pulses_generated_reg(6),
      O => \pulses_generated[0]_i_6_n_0\
    );
\pulses_generated[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => pulses_generated_reg(0),
      I1 => pulses_generated_reg(12),
      I2 => pulses_generated_reg(13),
      I3 => pulses_generated_reg(2),
      I4 => pulses_generated_reg(1),
      O => \pulses_generated[0]_i_7_n_0\
    );
\pulses_generated[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pulses_generated_reg(0),
      O => \pulses_generated[0]_i_8_n_0\
    );
\pulses_generated_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_7\,
      Q => pulses_generated_reg(0),
      R => done0
    );
\pulses_generated_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pulses_generated_reg[0]_i_3_n_0\,
      CO(2) => \pulses_generated_reg[0]_i_3_n_1\,
      CO(1) => \pulses_generated_reg[0]_i_3_n_2\,
      CO(0) => \pulses_generated_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pulses_generated_reg[0]_i_3_n_4\,
      O(2) => \pulses_generated_reg[0]_i_3_n_5\,
      O(1) => \pulses_generated_reg[0]_i_3_n_6\,
      O(0) => \pulses_generated_reg[0]_i_3_n_7\,
      S(3 downto 1) => pulses_generated_reg(3 downto 1),
      S(0) => \pulses_generated[0]_i_8_n_0\
    );
\pulses_generated_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_5\,
      Q => pulses_generated_reg(10),
      R => done0
    );
\pulses_generated_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_4\,
      Q => pulses_generated_reg(11),
      R => done0
    );
\pulses_generated_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[12]_i_1_n_7\,
      Q => pulses_generated_reg(12),
      R => done0
    );
\pulses_generated_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulses_generated_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_pulses_generated_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \pulses_generated_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_pulses_generated_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \pulses_generated_reg[12]_i_1_n_6\,
      O(0) => \pulses_generated_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => pulses_generated_reg(13 downto 12)
    );
\pulses_generated_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[12]_i_1_n_6\,
      Q => pulses_generated_reg(13),
      R => done0
    );
\pulses_generated_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_6\,
      Q => pulses_generated_reg(1),
      R => done0
    );
\pulses_generated_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_5\,
      Q => pulses_generated_reg(2),
      R => done0
    );
\pulses_generated_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_4\,
      Q => pulses_generated_reg(3),
      R => done0
    );
\pulses_generated_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_7\,
      Q => pulses_generated_reg(4),
      R => done0
    );
\pulses_generated_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulses_generated_reg[0]_i_3_n_0\,
      CO(3) => \pulses_generated_reg[4]_i_1_n_0\,
      CO(2) => \pulses_generated_reg[4]_i_1_n_1\,
      CO(1) => \pulses_generated_reg[4]_i_1_n_2\,
      CO(0) => \pulses_generated_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulses_generated_reg[4]_i_1_n_4\,
      O(2) => \pulses_generated_reg[4]_i_1_n_5\,
      O(1) => \pulses_generated_reg[4]_i_1_n_6\,
      O(0) => \pulses_generated_reg[4]_i_1_n_7\,
      S(3 downto 0) => pulses_generated_reg(7 downto 4)
    );
\pulses_generated_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_6\,
      Q => pulses_generated_reg(5),
      R => done0
    );
\pulses_generated_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_5\,
      Q => pulses_generated_reg(6),
      R => done0
    );
\pulses_generated_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_4\,
      Q => pulses_generated_reg(7),
      R => done0
    );
\pulses_generated_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_7\,
      Q => pulses_generated_reg(8),
      R => done0
    );
\pulses_generated_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulses_generated_reg[4]_i_1_n_0\,
      CO(3) => \pulses_generated_reg[8]_i_1_n_0\,
      CO(2) => \pulses_generated_reg[8]_i_1_n_1\,
      CO(1) => \pulses_generated_reg[8]_i_1_n_2\,
      CO(0) => \pulses_generated_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulses_generated_reg[8]_i_1_n_4\,
      O(2) => \pulses_generated_reg[8]_i_1_n_5\,
      O(1) => \pulses_generated_reg[8]_i_1_n_6\,
      O(0) => \pulses_generated_reg[8]_i_1_n_7\,
      S(3 downto 0) => pulses_generated_reg(11 downto 8)
    );
\pulses_generated_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_6\,
      Q => pulses_generated_reg(9),
      R => done0
    );
s_toggle_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFF0100"
    )
        port map (
      I0 => \clk_count[0]_i_4_n_0\,
      I1 => clk_count_reg(2),
      I2 => pulse_complete_reg_n_0,
      I3 => gen_1_pulse,
      I4 => s_toggle,
      O => s_toggle_i_1_n_0
    );
s_toggle_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => s_toggle_i_1_n_0,
      Q => s_toggle,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_train_gen is
  port (
    EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF : out STD_LOGIC;
    dcn_trig_out : in STD_LOGIC;
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
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_reg_n_0 : STD_LOGIC;
  signal run : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of active_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair6";
begin
EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => active,
      I1 => done_reg_n_0,
      O => EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF
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
done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => run,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => done_i_1_n_0,
      Q => done_reg_n_0,
      R => '0'
    );
run_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => dcn_trig_out,
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
    i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : out STD_LOGIC;
    dcn_trig_out : in STD_LOGIC;
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
  signal \done_i_1__0_n_0\ : STD_LOGIC;
  signal done_reg_n_0 : STD_LOGIC;
  signal run : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \active_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \done_i_1__0\ : label is "soft_lutpair8";
begin
\active_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFDF00"
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
      INIT => X"5D00"
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
      INIT => X"4600"
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
      INIT => X"7800"
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
\done_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
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
      C => dcn_trig_out,
      CE => '1',
      CLR => done_reg_n_0,
      D => '1',
      Q => run
    );
set_spi_clk_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => active,
      I1 => done_reg_n_0,
      O => i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \pulse_train_gen__parameterized1_0\ is
  port (
    i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : out STD_LOGIC;
    data_ready : in STD_LOGIC;
    clk_out1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \pulse_train_gen__parameterized1_0\ : entity is "pulse_train_gen";
end \pulse_train_gen__parameterized1_0\;

architecture STRUCTURE of \pulse_train_gen__parameterized1_0\ is
  signal active : STD_LOGIC;
  signal \active_i_1__1_n_0\ : STD_LOGIC;
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
  attribute SOFT_HLUTNM of \active_i_1__1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \done_i_1__1\ : label is "soft_lutpair10";
begin
\active_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFDF00"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => run,
      I4 => active,
      O => \active_i_1__1_n_0\
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \active_i_1__1_n_0\,
      Q => active,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5D00"
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
      INIT => X"4600"
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
      INIT => X"7800"
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
      INIT => X"2000"
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
dsc_pulse_done_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => active,
      I1 => done_reg_n_0,
      O => i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
    );
run_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => data_ready,
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
    clk_in1 : in STD_LOGIC
  );
end clk_wiz_0;

architecture STRUCTURE of clk_wiz_0 is
begin
inst: entity work.clk_wiz_0_clk_wiz
     port map (
      clk_in1 => clk_in1,
      clk_out1 => clk_out1
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
    EXT_LEDS_DATA_FROM_ADC_CONTROL : out STD_LOGIC_VECTOR ( 15 downto 0 );
    EXT_TEST_ACQUIRE_START : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ADC_CONTROL_TOP : entity is true;
end ADC_CONTROL_TOP;

architecture STRUCTURE of ADC_CONTROL_TOP is
  signal ACTIVE : STD_LOGIC;
  signal EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF : STD_LOGIC;
  signal EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF : STD_LOGIC;
  signal EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF : STD_LOGIC;
  signal EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EXT_TEST_ACQUIRE_START_IBUF : STD_LOGIC;
  signal EXT_TEST_ACQUIRE_START_IBUF_BUFG : STD_LOGIC;
  signal clk_out1 : STD_LOGIC;
  signal data_ready : STD_LOGIC;
  signal dcn_trig_out : STD_LOGIC;
  signal i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : STD_LOGIC;
  signal i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN : STD_LOGIC;
  signal spi_clk_trig_out : STD_LOGIC;
  attribute IMPORTED_FROM : string;
  attribute IMPORTED_FROM of master_of_clk : label is "f:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp";
  attribute IMPORTED_TYPE : string;
  attribute IMPORTED_TYPE of master_of_clk : label is "CHECKPOINT";
  attribute IS_IMPORTED : boolean;
  attribute IS_IMPORTED of master_of_clk : label is std.standard.true;
  attribute syn_black_box : string;
  attribute syn_black_box of master_of_clk : label is "TRUE";
begin
EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF,
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
EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN,
      O => EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(0),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(0)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(10),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(10)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(11),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(11)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(12),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(12)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(13),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(13)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(14),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(14)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(15),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(15)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(1),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(1)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(2),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(2)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(3),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(3)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(4),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(4)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(5),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(5)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(6),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(6)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(7),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(7)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(8),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(8)
    );
\EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(9),
      O => EXT_LEDS_DATA_FROM_ADC_CONTROL(9)
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
      ACTIVE => ACTIVE,
      D(0) => EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF,
      EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      EXT_TEST_ACQUIRE_START_IBUF_BUFG => EXT_TEST_ACQUIRE_START_IBUF_BUFG,
      Q(15 downto 0) => EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF(15 downto 0),
      clk_out1 => clk_out1,
      data_ready => data_ready,
      dcn_trig_out => dcn_trig_out,
      i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
      i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
      spi_clk_trig_out => spi_clk_trig_out
    );
master_of_clk: entity work.clk_wiz_0
     port map (
      clk_in1 => MASTER_CLK_IN,
      clk_out1 => clk_out1
    );
pulse_gen_1_SDACLK: entity work.pulse_gen_width_modulator_inverted
     port map (
      ACTIVE => ACTIVE,
      EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF => EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
      clk_out1 => clk_out1,
      spi_clk_trig_out => spi_clk_trig_out
    );
pulse_gen_2_35ns_CNV: entity work.pulse_train_gen
     port map (
      EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF => EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF,
      clk_out1 => clk_out1,
      dcn_trig_out => dcn_trig_out
    );
pulse_gen_3_45ns_DCN: entity work.\pulse_train_gen__parameterized1\
     port map (
      clk_out1 => clk_out1,
      dcn_trig_out => dcn_trig_out,
      i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
    );
pulse_gen_4_45ns: entity work.\pulse_train_gen__parameterized1_0\
     port map (
      clk_out1 => clk_out1,
      data_ready => data_ready,
      i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN => i_PULSE_DSCKLCNVH_PULSE_PULSEGEN_4_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN
    );
end STRUCTURE;
