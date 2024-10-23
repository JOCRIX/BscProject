-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Oct 23 21:40:42 2024
-- Host        : DESKTOP-26ONRPF running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/SampleControlTest/SampleControlTest.sim/sim_1/impl/func/xsim/MASTER_FILE_func_impl.vhd
-- Design      : MASTER_FILE
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ExternalMemoryDistribution is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    Ext_DATA_TO_INT_MEM_OBUF : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sig_PulseGen1_trig_in : out STD_LOGIC;
    Ext_ADDR_TO_EXT_MEM_OBUF : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \STATE_OUT_reg[2]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ADDR_TO_MEM_DIST_OUT : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Ext_MANUAL_STEP_IBUF_BUFG : in STD_LOGIC;
    sig_PulseGen1_BUSY : in STD_LOGIC;
    Ext_DnB_IBUF : in STD_LOGIC;
    Ext_ADC_RDY_IBUF : in STD_LOGIC;
    Ext_CLK_FROM_INT_MEM_IBUF : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end ExternalMemoryDistribution;

architecture STRUCTURE of ExternalMemoryDistribution is
  signal ADDR_EXT_MEM_DIST_TO_EXT_MEM0 : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[0]_i_1_n_0\ : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[18]_i_2_n_0\ : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[1]_i_1_n_0\ : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[2]_i_1_n_0\ : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[3]_i_1_n_0\ : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\ : STD_LOGIC;
  signal \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_2_n_0\ : STD_LOGIC;
  signal ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal CLK_TO_MEM_DIST_OUT : STD_LOGIC;
  signal \FSM_onehot_s_byte_reg_n_0_[0]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \STATE_OUT[0]_i_1_n_0\ : STD_LOGIC;
  signal \STATE_OUT[0]_i_2_n_0\ : STD_LOGIC;
  signal \STATE_OUT[0]_i_3_n_0\ : STD_LOGIC;
  signal \STATE_OUT[1]_i_1_n_0\ : STD_LOGIC;
  signal \STATE_OUT[2]_i_1_n_0\ : STD_LOGIC;
  signal \STATE_OUT[2]_i_2_n_0\ : STD_LOGIC;
  signal \STATE_OUT[2]_i_3_n_0\ : STD_LOGIC;
  signal highByte_EXT_MEM_TO_IV_SAVER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal lowByte_EXT_MEM_TO_IV_SAVER : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal lowByte_EXT_MEM_TO_IV_SAVER0 : STD_LOGIC;
  signal lowByte_EXT_MEM_TO_IV_SAVER_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal s_byte0 : STD_LOGIC;
  signal start : STD_LOGIC;
  signal trig_pulse_byte1 : STD_LOGIC;
  signal trig_pulse_byte1_i_1_n_0 : STD_LOGIC;
  signal trig_pulse_byte1_reg_n_0 : STD_LOGIC;
  signal trig_pulse_byte2 : STD_LOGIC;
  signal trig_pulse_byte2_i_1_n_0 : STD_LOGIC;
  signal trig_pulse_byte2_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[0]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[10]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[11]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[1]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[2]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[3]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[4]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[5]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[6]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[7]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[8]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \Ext_DATA_TO_INT_MEM_OBUF[9]_inst_i_1\ : label is "soft_lutpair9";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_s_byte_reg[0]\ : label is "byte1_step1:00001,byte1_step2:00010,reset:00100,byte2:01000,finished:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_s_byte_reg[1]\ : label is "byte1_step1:00001,byte1_step2:00010,reset:00100,byte2:01000,finished:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_s_byte_reg[2]\ : label is "byte1_step1:00001,byte1_step2:00010,reset:00100,byte2:01000,finished:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_s_byte_reg[3]\ : label is "byte1_step1:00001,byte1_step2:00010,reset:00100,byte2:01000,finished:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_s_byte_reg[4]\ : label is "byte1_step1:00001,byte1_step2:00010,reset:00100,byte2:01000,finished:10000,";
  attribute SOFT_HLUTNM of \STATE_OUT[0]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \STATE_OUT[2]_i_3\ : label is "soft_lutpair2";
begin
  Q(0) <= \^q\(0);
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I1 => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(0),
      I2 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[0]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0E0E0E00"
    )
        port map (
      I0 => \^q\(0),
      I1 => start,
      I2 => sig_PulseGen1_BUSY,
      I3 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I4 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      O => ADDR_EXT_MEM_DIST_TO_EXT_MEM0
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[18]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I1 => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(18),
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[18]_i_2_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I1 => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(1),
      I2 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[1]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I1 => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(2),
      I2 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[2]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I1 => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(3),
      I2 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[3]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A800A800A80000"
    )
        port map (
      I0 => trig_pulse_byte1,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I2 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I3 => sig_PulseGen1_BUSY,
      I4 => start,
      I5 => \^q\(0),
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I1 => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(4),
      I2 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      O => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_2_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[18]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => p_0_in
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => p_0_in,
      D => ADDR_TO_MEM_DIST_OUT(0),
      Q => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(0),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => p_0_in,
      D => '1',
      Q => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(18),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => p_0_in,
      D => ADDR_TO_MEM_DIST_OUT(1),
      Q => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(1),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => p_0_in,
      D => ADDR_TO_MEM_DIST_OUT(2),
      Q => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(2),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => p_0_in,
      D => ADDR_TO_MEM_DIST_OUT(3),
      Q => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(3),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => p_0_in,
      D => ADDR_TO_MEM_DIST_OUT(4),
      Q => ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE(4),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => ADDR_EXT_MEM_DIST_TO_EXT_MEM0,
      D => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[0]_i_1_n_0\,
      Q => Ext_ADDR_TO_EXT_MEM_OBUF(0),
      S => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => ADDR_EXT_MEM_DIST_TO_EXT_MEM0,
      D => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[18]_i_2_n_0\,
      Q => Ext_ADDR_TO_EXT_MEM_OBUF(5),
      R => '0'
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => ADDR_EXT_MEM_DIST_TO_EXT_MEM0,
      D => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[1]_i_1_n_0\,
      Q => Ext_ADDR_TO_EXT_MEM_OBUF(1),
      S => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => ADDR_EXT_MEM_DIST_TO_EXT_MEM0,
      D => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[2]_i_1_n_0\,
      Q => Ext_ADDR_TO_EXT_MEM_OBUF(2),
      S => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => ADDR_EXT_MEM_DIST_TO_EXT_MEM0,
      D => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[3]_i_1_n_0\,
      Q => Ext_ADDR_TO_EXT_MEM_OBUF(3),
      S => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => ADDR_EXT_MEM_DIST_TO_EXT_MEM0,
      D => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_2_n_0\,
      Q => Ext_ADDR_TO_EXT_MEM_OBUF(4),
      S => \ADDR_EXT_MEM_DIST_TO_EXT_MEM[4]_i_1_n_0\
    );
\Ext_DATA_TO_INT_MEM_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(0),
      O => Ext_DATA_TO_INT_MEM_OBUF(0)
    );
\Ext_DATA_TO_INT_MEM_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => highByte_EXT_MEM_TO_IV_SAVER(2),
      O => Ext_DATA_TO_INT_MEM_OBUF(10)
    );
\Ext_DATA_TO_INT_MEM_OBUF[11]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => highByte_EXT_MEM_TO_IV_SAVER(3),
      O => Ext_DATA_TO_INT_MEM_OBUF(11)
    );
\Ext_DATA_TO_INT_MEM_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(1),
      O => Ext_DATA_TO_INT_MEM_OBUF(1)
    );
\Ext_DATA_TO_INT_MEM_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(2),
      O => Ext_DATA_TO_INT_MEM_OBUF(2)
    );
\Ext_DATA_TO_INT_MEM_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(3),
      O => Ext_DATA_TO_INT_MEM_OBUF(3)
    );
\Ext_DATA_TO_INT_MEM_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(4),
      O => Ext_DATA_TO_INT_MEM_OBUF(4)
    );
\Ext_DATA_TO_INT_MEM_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(5),
      O => Ext_DATA_TO_INT_MEM_OBUF(5)
    );
\Ext_DATA_TO_INT_MEM_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(6),
      O => Ext_DATA_TO_INT_MEM_OBUF(6)
    );
\Ext_DATA_TO_INT_MEM_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER(7),
      O => Ext_DATA_TO_INT_MEM_OBUF(7)
    );
\Ext_DATA_TO_INT_MEM_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => highByte_EXT_MEM_TO_IV_SAVER(0),
      O => Ext_DATA_TO_INT_MEM_OBUF(8)
    );
\Ext_DATA_TO_INT_MEM_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => highByte_EXT_MEM_TO_IV_SAVER(1),
      O => Ext_DATA_TO_INT_MEM_OBUF(9)
    );
\FSM_onehot_s_byte[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => start,
      I1 => \^q\(0),
      I2 => sig_PulseGen1_BUSY,
      O => s_byte0
    );
\FSM_onehot_s_byte_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => s_byte0,
      D => \^q\(0),
      Q => \FSM_onehot_s_byte_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_s_byte_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => s_byte0,
      D => \FSM_onehot_s_byte_reg_n_0_[0]\,
      Q => trig_pulse_byte1,
      R => '0'
    );
\FSM_onehot_s_byte_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => s_byte0,
      D => trig_pulse_byte1,
      Q => lowByte_EXT_MEM_TO_IV_SAVER_0,
      R => '0'
    );
\FSM_onehot_s_byte_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => s_byte0,
      D => lowByte_EXT_MEM_TO_IV_SAVER_0,
      Q => trig_pulse_byte2,
      R => '0'
    );
\FSM_onehot_s_byte_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => s_byte0,
      D => trig_pulse_byte2,
      Q => \^q\(0),
      R => '0'
    );
\STATE_OUT[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E00"
    )
        port map (
      I0 => \^q\(0),
      I1 => start,
      I2 => sig_PulseGen1_BUSY,
      I3 => \STATE_OUT[0]_i_3_n_0\,
      O => \STATE_OUT[0]_i_1_n_0\
    );
\STATE_OUT[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I1 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I2 => \^q\(0),
      O => \STATE_OUT[0]_i_2_n_0\
    );
\STATE_OUT[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I2 => \^q\(0),
      I3 => \FSM_onehot_s_byte_reg_n_0_[0]\,
      I4 => trig_pulse_byte1,
      I5 => trig_pulse_byte2,
      O => \STATE_OUT[0]_i_3_n_0\
    );
\STATE_OUT[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I1 => trig_pulse_byte1,
      O => \STATE_OUT[1]_i_1_n_0\
    );
\STATE_OUT[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333322222220"
    )
        port map (
      I0 => start,
      I1 => sig_PulseGen1_BUSY,
      I2 => Ext_DnB_IBUF,
      I3 => \STATE_OUT[2]_i_3_n_0\,
      I4 => trig_pulse_byte2,
      I5 => \^q\(0),
      O => \STATE_OUT[2]_i_1_n_0\
    );
\STATE_OUT[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(0),
      I1 => trig_pulse_byte2,
      O => \STATE_OUT[2]_i_2_n_0\
    );
\STATE_OUT[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I1 => trig_pulse_byte1,
      O => \STATE_OUT[2]_i_3_n_0\
    );
\STATE_OUT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => \STATE_OUT[0]_i_1_n_0\,
      D => \STATE_OUT[0]_i_2_n_0\,
      Q => \STATE_OUT_reg[2]_0\(0),
      R => '0'
    );
\STATE_OUT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => \STATE_OUT[2]_i_1_n_0\,
      D => \STATE_OUT[1]_i_1_n_0\,
      Q => \STATE_OUT_reg[2]_0\(1),
      R => '0'
    );
\STATE_OUT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => \STATE_OUT[2]_i_1_n_0\,
      D => \STATE_OUT[2]_i_2_n_0\,
      Q => \STATE_OUT_reg[2]_0\(2),
      R => '0'
    );
\highByte_EXT_MEM_TO_IV_SAVER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => E(0),
      D => D(0),
      Q => highByte_EXT_MEM_TO_IV_SAVER(0),
      R => '0'
    );
\highByte_EXT_MEM_TO_IV_SAVER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => E(0),
      D => D(1),
      Q => highByte_EXT_MEM_TO_IV_SAVER(1),
      R => '0'
    );
\highByte_EXT_MEM_TO_IV_SAVER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => E(0),
      D => D(2),
      Q => highByte_EXT_MEM_TO_IV_SAVER(2),
      R => '0'
    );
\highByte_EXT_MEM_TO_IV_SAVER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => E(0),
      D => D(3),
      Q => highByte_EXT_MEM_TO_IV_SAVER(3),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0E000000"
    )
        port map (
      I0 => start,
      I1 => \^q\(0),
      I2 => sig_PulseGen1_BUSY,
      I3 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I4 => Ext_DnB_IBUF,
      O => lowByte_EXT_MEM_TO_IV_SAVER0
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(0),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(0),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(1),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(1),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(2),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(2),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(3),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(3),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(4),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(4),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(5),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(5),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(6),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(6),
      R => '0'
    );
\lowByte_EXT_MEM_TO_IV_SAVER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => lowByte_EXT_MEM_TO_IV_SAVER0,
      D => D(7),
      Q => lowByte_EXT_MEM_TO_IV_SAVER(7),
      R => '0'
    );
run_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => trig_pulse_byte2_reg_n_0,
      I1 => trig_pulse_byte1_reg_n_0,
      O => sig_PulseGen1_trig_in
    );
start_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => Ext_ADC_RDY_IBUF,
      I1 => Ext_CLK_FROM_INT_MEM_IBUF,
      I2 => Ext_DnB_IBUF,
      O => CLK_TO_MEM_DIST_OUT
    );
start_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_TO_MEM_DIST_OUT,
      CE => '1',
      CLR => \^q\(0),
      D => '1',
      Q => start
    );
trig_pulse_byte1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAABF0000AAA0"
    )
        port map (
      I0 => trig_pulse_byte1,
      I1 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I2 => start,
      I3 => \^q\(0),
      I4 => sig_PulseGen1_BUSY,
      I5 => trig_pulse_byte1_reg_n_0,
      O => trig_pulse_byte1_i_1_n_0
    );
trig_pulse_byte1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => '1',
      D => trig_pulse_byte1_i_1_n_0,
      Q => trig_pulse_byte1_reg_n_0,
      R => '0'
    );
trig_pulse_byte2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFCCDF0000CCC0"
    )
        port map (
      I0 => lowByte_EXT_MEM_TO_IV_SAVER_0,
      I1 => trig_pulse_byte2,
      I2 => start,
      I3 => \^q\(0),
      I4 => sig_PulseGen1_BUSY,
      I5 => trig_pulse_byte2_reg_n_0,
      O => trig_pulse_byte2_i_1_n_0
    );
trig_pulse_byte2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_MANUAL_STEP_IBUF_BUFG,
      CE => '1',
      D => trig_pulse_byte2_i_1_n_0,
      Q => trig_pulse_byte2_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IV_SAMPLE_CTRL is
  port (
    ADDR_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Ext_ADC_RDY : in STD_LOGIC;
    Ext_DnB_IBUF : in STD_LOGIC;
    Ext_ADDR_FROM_INT_MEM_IBUF : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end IV_SAMPLE_CTRL;

architecture STRUCTURE of IV_SAMPLE_CTRL is
  signal \sample_count[0]_i_2_n_0\ : STD_LOGIC;
  signal sample_count_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \sample_count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_sample_count_reg[0]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_sample_count_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_sample_count_reg[4]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[3]_i_1\ : label is "soft_lutpair1";
begin
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(0),
      I1 => Ext_ADDR_FROM_INT_MEM_IBUF(0),
      I2 => Ext_DnB_IBUF,
      O => ADDR_TO_MEM_DIST_OUT(0)
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(1),
      I1 => Ext_ADDR_FROM_INT_MEM_IBUF(1),
      I2 => Ext_DnB_IBUF,
      O => ADDR_TO_MEM_DIST_OUT(1)
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(2),
      I1 => Ext_ADDR_FROM_INT_MEM_IBUF(2),
      I2 => Ext_DnB_IBUF,
      O => ADDR_TO_MEM_DIST_OUT(2)
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(3),
      I1 => Ext_ADDR_FROM_INT_MEM_IBUF(3),
      I2 => Ext_DnB_IBUF,
      O => ADDR_TO_MEM_DIST_OUT(3)
    );
\ADDR_EXT_MEM_DIST_TO_EXT_MEM_HIGHBYTE[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(4),
      I1 => Ext_ADDR_FROM_INT_MEM_IBUF(4),
      I2 => Ext_DnB_IBUF,
      O => ADDR_TO_MEM_DIST_OUT(4)
    );
\sample_count[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_count_reg(0),
      O => \sample_count[0]_i_2_n_0\
    );
\sample_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => Ext_ADC_RDY,
      CE => '1',
      CLR => Ext_DnB_IBUF,
      D => \sample_count_reg[0]_i_1_n_7\,
      Q => sample_count_reg(0)
    );
\sample_count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \sample_count_reg[0]_i_1_n_0\,
      CO(2 downto 0) => \NLW_sample_count_reg[0]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \sample_count_reg[0]_i_1_n_4\,
      O(2) => \sample_count_reg[0]_i_1_n_5\,
      O(1) => \sample_count_reg[0]_i_1_n_6\,
      O(0) => \sample_count_reg[0]_i_1_n_7\,
      S(3 downto 1) => sample_count_reg(3 downto 1),
      S(0) => \sample_count[0]_i_2_n_0\
    );
\sample_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => Ext_ADC_RDY,
      CE => '1',
      CLR => Ext_DnB_IBUF,
      D => \sample_count_reg[0]_i_1_n_6\,
      Q => sample_count_reg(1)
    );
\sample_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => Ext_ADC_RDY,
      CE => '1',
      CLR => Ext_DnB_IBUF,
      D => \sample_count_reg[0]_i_1_n_5\,
      Q => sample_count_reg(2)
    );
\sample_count_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => Ext_ADC_RDY,
      CE => '1',
      D => \sample_count_reg[0]_i_1_n_4\,
      PRE => Ext_DnB_IBUF,
      Q => sample_count_reg(3)
    );
\sample_count_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => Ext_ADC_RDY,
      CE => '1',
      D => \sample_count_reg[4]_i_1_n_7\,
      PRE => Ext_DnB_IBUF,
      Q => sample_count_reg(4)
    );
\sample_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_count_reg[0]_i_1_n_0\,
      CO(3 downto 0) => \NLW_sample_count_reg[4]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_sample_count_reg[4]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \sample_count_reg[4]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => sample_count_reg(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_train_gen is
  port (
    sig_PulseGen1_BUSY : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Ext_PULSE_OUT_OBUF : out STD_LOGIC;
    sig_PulseGen1_trig_in : in STD_LOGIC;
    Ext_CLK_IN_IBUF_BUFG : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    Ext_DnB_IBUF : in STD_LOGIC;
    Ext_CLK_IN_IBUF : in STD_LOGIC
  );
end pulse_train_gen;

architecture STRUCTURE of pulse_train_gen is
  signal active : STD_LOGIC;
  signal active_i_1_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal done : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal \^sig_pulsegen1_busy\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of active_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \highByte_EXT_MEM_TO_IV_SAVER[3]_i_1\ : label is "soft_lutpair13";
begin
  sig_PulseGen1_BUSY <= \^sig_pulsegen1_busy\;
Ext_CLK_TO_EXT_MEM_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Ext_CLK_IN_IBUF,
      I1 => active,
      O => Ext_PULSE_OUT_OBUF
    );
active_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFB00"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => \^sig_pulsegen1_busy\,
      I4 => active,
      O => active_i_1_n_0
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_CLK_IN_IBUF_BUFG,
      CE => '1',
      D => active_i_1_n_0,
      Q => active,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5100"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => \^sig_pulsegen1_busy\,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => \^sig_pulsegen1_busy\,
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
      I3 => \^sig_pulsegen1_busy\,
      O => \count[2]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_CLK_IN_IBUF_BUFG,
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
      C => Ext_CLK_IN_IBUF_BUFG,
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
      C => Ext_CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => count(2),
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => count(1),
      I3 => \^sig_pulsegen1_busy\,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Ext_CLK_IN_IBUF_BUFG,
      CE => '1',
      D => done_i_1_n_0,
      Q => done,
      R => '0'
    );
\highByte_EXT_MEM_TO_IV_SAVER[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^sig_pulsegen1_busy\,
      I1 => Q(0),
      I2 => Ext_DnB_IBUF,
      O => E(0)
    );
run_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sig_PulseGen1_trig_in,
      CE => '1',
      CLR => done,
      D => '1',
      Q => \^sig_pulsegen1_busy\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MASTER_FILE is
  port (
    Ext_CLK_IN : in STD_LOGIC;
    Ext_DnB : in STD_LOGIC;
    Ext_ADC_RDY : in STD_LOGIC;
    Ext_CLK_FROM_INT_MEM : in STD_LOGIC;
    Ext_MANUAL_STEP : in STD_LOGIC;
    Ext_ADDR_FROM_INT_MEM : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Ext_DATA_TO_INT_MEM : out STD_LOGIC_VECTOR ( 11 downto 0 );
    Ext_ADC_DATA_TO_IV_SAVER : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Ext_EXT_MEM_TO_EXT_MEM_DIST : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Ext_Sample_nRW : out STD_LOGIC;
    Ext_ADDR_TO_EXT_MEM : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Ext_CLK_TO_EXT_MEM : out STD_LOGIC;
    Ext_STATE_OUT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Ext_PULSE_OUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MASTER_FILE : entity is true;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ of MASTER_FILE : entity is std.standard.true;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ of MASTER_FILE : entity is std.standard.true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of MASTER_FILE : entity is "a847dde1";
end MASTER_FILE;

architecture STRUCTURE of MASTER_FILE is
  signal ADDR_TO_MEM_DIST_OUT : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal Ext_ADC_RDY_IBUF : STD_LOGIC;
  signal Ext_ADC_RDY_IBUF_BUFG : STD_LOGIC;
  signal Ext_ADDR_FROM_INT_MEM_IBUF : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal Ext_ADDR_TO_EXT_MEM_OBUF : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Ext_CLK_FROM_INT_MEM_IBUF : STD_LOGIC;
  signal Ext_CLK_IN_IBUF : STD_LOGIC;
  signal Ext_CLK_IN_IBUF_BUFG : STD_LOGIC;
  signal Ext_DATA_TO_INT_MEM_OBUF : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal Ext_DnB_IBUF : STD_LOGIC;
  signal Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Ext_MANUAL_STEP_IBUF : STD_LOGIC;
  signal Ext_MANUAL_STEP_IBUF_BUFG : STD_LOGIC;
  signal Ext_PULSE_OUT_OBUF : STD_LOGIC;
  signal Ext_STATE_OUT_OBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Ext_Sample_nRW_OBUF : STD_LOGIC;
  signal highByte_EXT_MEM_TO_IV_SAVER : STD_LOGIC;
  signal highByte_EXT_MEM_TO_IV_SAVER0 : STD_LOGIC;
  signal sig_PulseGen1_BUSY : STD_LOGIC;
  signal sig_PulseGen1_trig_in : STD_LOGIC;
  signal \Ext_ADDR_FROM_INT_MEM^Mid\: STD_LOGIC_VECTOR ( 4 downto 0);
  signal \Ext_DnB^Mid\ : STD_LOGIC;
  signal \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\: STD_LOGIC_VECTOR ( 7 downto 0);
begin
  \Ext_ADDR_FROM_INT_MEM^Mid\(4 downto 0) <= Ext_ADDR_FROM_INT_MEM(4 downto 0);
  \Ext_DnB^Mid\ <= Ext_DnB;
  \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(7 downto 0) <= Ext_EXT_MEM_TO_EXT_MEM_DIST(7 downto 0);
\pullup_Ext_DnB^Midinst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_DnB^Mid\
    );
\pullup_Ext_ADDR_FROM_INT_MEM^Mid_0inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_ADDR_FROM_INT_MEM^Mid\(0)
    );
\pullup_Ext_ADDR_FROM_INT_MEM^Mid_1inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_ADDR_FROM_INT_MEM^Mid\(1)
    );
\pullup_Ext_ADDR_FROM_INT_MEM^Mid_2inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_ADDR_FROM_INT_MEM^Mid\(2)
    );
\pullup_Ext_ADDR_FROM_INT_MEM^Mid_3inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_ADDR_FROM_INT_MEM^Mid\(3)
    );
\pullup_Ext_ADDR_FROM_INT_MEM^Mid_4inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_ADDR_FROM_INT_MEM^Mid\(4)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_0inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(0)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_1inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(1)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_2inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(2)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_3inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(3)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_4inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(4)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_5inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(5)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_6inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(6)
    );
\pullup_Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid_7inst\: unisim.vcomponents.PULLUP
    port map (
      O => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(7)
    );
pullup_Ext_ADC_DATA_TO_IV_SAVER_0inst: unisim.vcomponents.PULLUP
    port map (
      O => Ext_ADC_DATA_TO_IV_SAVER(0)
    );
pullup_Ext_ADC_DATA_TO_IV_SAVER_1inst: unisim.vcomponents.PULLUP
    port map (
      O => Ext_ADC_DATA_TO_IV_SAVER(1)
    );
pullup_Ext_ADC_DATA_TO_IV_SAVER_2inst: unisim.vcomponents.PULLUP
    port map (
      O => Ext_ADC_DATA_TO_IV_SAVER(2)
    );
pullup_Ext_ADC_DATA_TO_IV_SAVER_3inst: unisim.vcomponents.PULLUP
    port map (
      O => Ext_ADC_DATA_TO_IV_SAVER(3)
    );
Ext_ADC_RDY_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Ext_ADC_RDY_IBUF,
      O => Ext_ADC_RDY_IBUF_BUFG
    );
Ext_ADC_RDY_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Ext_ADC_RDY,
      O => Ext_ADC_RDY_IBUF
    );
\Ext_ADDR_FROM_INT_MEM_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_ADDR_FROM_INT_MEM^Mid\(0),
      O => Ext_ADDR_FROM_INT_MEM_IBUF(0)
    );
\Ext_ADDR_FROM_INT_MEM_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_ADDR_FROM_INT_MEM^Mid\(1),
      O => Ext_ADDR_FROM_INT_MEM_IBUF(1)
    );
\Ext_ADDR_FROM_INT_MEM_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_ADDR_FROM_INT_MEM^Mid\(2),
      O => Ext_ADDR_FROM_INT_MEM_IBUF(2)
    );
\Ext_ADDR_FROM_INT_MEM_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_ADDR_FROM_INT_MEM^Mid\(3),
      O => Ext_ADDR_FROM_INT_MEM_IBUF(3)
    );
\Ext_ADDR_FROM_INT_MEM_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_ADDR_FROM_INT_MEM^Mid\(4),
      O => Ext_ADDR_FROM_INT_MEM_IBUF(4)
    );
\Ext_ADDR_TO_EXT_MEM_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_ADDR_TO_EXT_MEM_OBUF(0),
      O => Ext_ADDR_TO_EXT_MEM(0)
    );
\Ext_ADDR_TO_EXT_MEM_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_ADDR_TO_EXT_MEM_OBUF(1),
      O => Ext_ADDR_TO_EXT_MEM(1)
    );
\Ext_ADDR_TO_EXT_MEM_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_ADDR_TO_EXT_MEM_OBUF(2),
      O => Ext_ADDR_TO_EXT_MEM(2)
    );
\Ext_ADDR_TO_EXT_MEM_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_ADDR_TO_EXT_MEM_OBUF(3),
      O => Ext_ADDR_TO_EXT_MEM(3)
    );
\Ext_ADDR_TO_EXT_MEM_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_ADDR_TO_EXT_MEM_OBUF(4),
      O => Ext_ADDR_TO_EXT_MEM(4)
    );
\Ext_ADDR_TO_EXT_MEM_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_ADDR_TO_EXT_MEM_OBUF(5),
      O => Ext_ADDR_TO_EXT_MEM(5)
    );
Ext_CLK_FROM_INT_MEM_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Ext_CLK_FROM_INT_MEM,
      O => Ext_CLK_FROM_INT_MEM_IBUF
    );
Ext_CLK_IN_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Ext_CLK_IN_IBUF,
      O => Ext_CLK_IN_IBUF_BUFG
    );
Ext_CLK_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Ext_CLK_IN,
      O => Ext_CLK_IN_IBUF
    );
Ext_CLK_TO_EXT_MEM_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Ext_PULSE_OUT_OBUF,
      O => Ext_CLK_TO_EXT_MEM
    );
\Ext_DATA_TO_INT_MEM_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(0),
      O => Ext_DATA_TO_INT_MEM(0)
    );
\Ext_DATA_TO_INT_MEM_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(10),
      O => Ext_DATA_TO_INT_MEM(10)
    );
\Ext_DATA_TO_INT_MEM_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(11),
      O => Ext_DATA_TO_INT_MEM(11)
    );
\Ext_DATA_TO_INT_MEM_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(1),
      O => Ext_DATA_TO_INT_MEM(1)
    );
\Ext_DATA_TO_INT_MEM_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(2),
      O => Ext_DATA_TO_INT_MEM(2)
    );
\Ext_DATA_TO_INT_MEM_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(3),
      O => Ext_DATA_TO_INT_MEM(3)
    );
\Ext_DATA_TO_INT_MEM_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(4),
      O => Ext_DATA_TO_INT_MEM(4)
    );
\Ext_DATA_TO_INT_MEM_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(5),
      O => Ext_DATA_TO_INT_MEM(5)
    );
\Ext_DATA_TO_INT_MEM_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(6),
      O => Ext_DATA_TO_INT_MEM(6)
    );
\Ext_DATA_TO_INT_MEM_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(7),
      O => Ext_DATA_TO_INT_MEM(7)
    );
\Ext_DATA_TO_INT_MEM_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(8),
      O => Ext_DATA_TO_INT_MEM(8)
    );
\Ext_DATA_TO_INT_MEM_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_DATA_TO_INT_MEM_OBUF(9),
      O => Ext_DATA_TO_INT_MEM(9)
    );
Ext_DnB_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => \Ext_DnB^Mid\,
      O => Ext_DnB_IBUF
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(0),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(0)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(1),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(1)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(2),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(2)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(3),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(3)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(4),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(4)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(5),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(5)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(6),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(6)
    );
\Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => \Ext_EXT_MEM_TO_EXT_MEM_DIST^Mid\(7),
      O => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(7)
    );
Ext_MANUAL_STEP_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Ext_MANUAL_STEP_IBUF,
      O => Ext_MANUAL_STEP_IBUF_BUFG
    );
Ext_MANUAL_STEP_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Ext_MANUAL_STEP,
      O => Ext_MANUAL_STEP_IBUF
    );
Ext_PULSE_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Ext_PULSE_OUT_OBUF,
      O => Ext_PULSE_OUT
    );
\Ext_STATE_OUT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_STATE_OUT_OBUF(0),
      O => Ext_STATE_OUT(0)
    );
\Ext_STATE_OUT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_STATE_OUT_OBUF(1),
      O => Ext_STATE_OUT(1)
    );
\Ext_STATE_OUT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Ext_STATE_OUT_OBUF(2),
      O => Ext_STATE_OUT(2)
    );
Ext_Sample_nRW_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Ext_Sample_nRW_OBUF,
      O => Ext_Sample_nRW
    );
Ext_Sample_nRW_OBUF_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Ext_DnB_IBUF,
      O => Ext_Sample_nRW_OBUF
    );
IV_SAVER1: entity work.IV_SAMPLE_CTRL
     port map (
      ADDR_TO_MEM_DIST_OUT(4 downto 0) => ADDR_TO_MEM_DIST_OUT(4 downto 0),
      Ext_ADC_RDY => Ext_ADC_RDY_IBUF_BUFG,
      Ext_ADDR_FROM_INT_MEM_IBUF(4 downto 0) => Ext_ADDR_FROM_INT_MEM_IBUF(4 downto 0),
      Ext_DnB_IBUF => Ext_DnB_IBUF
    );
MEM_DIST1: entity work.ExternalMemoryDistribution
     port map (
      ADDR_TO_MEM_DIST_OUT(4 downto 0) => ADDR_TO_MEM_DIST_OUT(4 downto 0),
      D(7 downto 0) => Ext_EXT_MEM_TO_EXT_MEM_DIST_IBUF(7 downto 0),
      E(0) => highByte_EXT_MEM_TO_IV_SAVER0,
      Ext_ADC_RDY_IBUF => Ext_ADC_RDY_IBUF,
      Ext_ADDR_TO_EXT_MEM_OBUF(5 downto 0) => Ext_ADDR_TO_EXT_MEM_OBUF(5 downto 0),
      Ext_CLK_FROM_INT_MEM_IBUF => Ext_CLK_FROM_INT_MEM_IBUF,
      Ext_DATA_TO_INT_MEM_OBUF(11 downto 0) => Ext_DATA_TO_INT_MEM_OBUF(11 downto 0),
      Ext_DnB_IBUF => Ext_DnB_IBUF,
      Ext_MANUAL_STEP_IBUF_BUFG => Ext_MANUAL_STEP_IBUF_BUFG,
      Q(0) => highByte_EXT_MEM_TO_IV_SAVER,
      \STATE_OUT_reg[2]_0\(2 downto 0) => Ext_STATE_OUT_OBUF(2 downto 0),
      sig_PulseGen1_BUSY => sig_PulseGen1_BUSY,
      sig_PulseGen1_trig_in => sig_PulseGen1_trig_in
    );
PulseGen1: entity work.pulse_train_gen
     port map (
      E(0) => highByte_EXT_MEM_TO_IV_SAVER0,
      Ext_CLK_IN_IBUF => Ext_CLK_IN_IBUF,
      Ext_CLK_IN_IBUF_BUFG => Ext_CLK_IN_IBUF_BUFG,
      Ext_DnB_IBUF => Ext_DnB_IBUF,
      Ext_PULSE_OUT_OBUF => Ext_PULSE_OUT_OBUF,
      Q(0) => highByte_EXT_MEM_TO_IV_SAVER,
      sig_PulseGen1_BUSY => sig_PulseGen1_BUSY,
      sig_PulseGen1_trig_in => sig_PulseGen1_trig_in
    );
end STRUCTURE;
