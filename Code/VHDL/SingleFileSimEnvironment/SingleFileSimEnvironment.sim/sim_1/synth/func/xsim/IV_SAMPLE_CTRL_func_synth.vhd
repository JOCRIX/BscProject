-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Nov  4 00:36:28 2024
-- Host        : DESKTOP-S99FO1K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/SingleFileSimEnvironment/SingleFileSimEnvironment.sim/sim_1/synth/func/xsim/IV_SAMPLE_CTRL_func_synth.vhd
-- Design      : IV_SAMPLE_CTRL
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IV_SAMPLE_CTRL is
  port (
    CLK_FROM_INT_MEM_IN : in STD_LOGIC;
    ADDR_FROM_INT_MEM_IN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    DATA_TO_INT_MEM_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DATA_FROM_MEM_DIST_IN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ADC_DnB : in STD_LOGIC;
    ADC_DATA_IN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ADC_DATA_RDY_IN : in STD_LOGIC;
    DATA_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ADDR_TO_MEM_DIST_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RnW_TO_MEM_DIST_OUT : out STD_LOGIC;
    CLK_TO_MEM_DIST_OUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of IV_SAMPLE_CTRL : entity is true;
end IV_SAMPLE_CTRL;

architecture STRUCTURE of IV_SAMPLE_CTRL is
  signal ADC_DATA_IN_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ADC_DATA_RDY_IN_IBUF : STD_LOGIC;
  signal ADC_DATA_RDY_IN_IBUF_BUFG : STD_LOGIC;
  signal ADDR_FROM_INT_MEM_IN_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ADDR_TO_MEM_DIST_OUT_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CLK_FROM_INT_MEM_IN_IBUF : STD_LOGIC;
  signal CLK_TO_MEM_DIST_OUT_OBUF : STD_LOGIC;
  signal DATA_FROM_MEM_DIST_IN_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DATA_TO_INT_MEM_OUT_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DATA_TO_MEM_DIST_OUT_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal RnW_TO_MEM_DIST_OUT_OBUF : STD_LOGIC;
  signal \sample_count[0]_i_2_n_0\ : STD_LOGIC;
  signal sample_count_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \sample_count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \sample_count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \sample_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \sample_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \sample_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_sample_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[0]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[10]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[11]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[12]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[13]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[14]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[15]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[1]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[3]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[4]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[5]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[6]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[7]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[8]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ADDR_TO_MEM_DIST_OUT_OBUF[9]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of CLK_TO_MEM_DIST_OUT_OBUF_inst_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[0]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[10]_inst_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[11]_inst_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[12]_inst_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[13]_inst_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[14]_inst_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[1]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[2]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[3]_inst_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[4]_inst_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[5]_inst_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[6]_inst_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[7]_inst_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[8]_inst_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \DATA_TO_INT_MEM_OUT_OBUF[9]_inst_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[0]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[10]_inst_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[11]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[12]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[13]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[14]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[15]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[1]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[2]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[3]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[4]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[5]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[6]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[7]_inst_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[8]_inst_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \DATA_TO_MEM_DIST_OUT_OBUF[9]_inst_i_1\ : label is "soft_lutpair13";
begin
\ADC_DATA_IN_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(0),
      O => ADC_DATA_IN_IBUF(0)
    );
\ADC_DATA_IN_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(10),
      O => ADC_DATA_IN_IBUF(10)
    );
\ADC_DATA_IN_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(11),
      O => ADC_DATA_IN_IBUF(11)
    );
\ADC_DATA_IN_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(12),
      O => ADC_DATA_IN_IBUF(12)
    );
\ADC_DATA_IN_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(13),
      O => ADC_DATA_IN_IBUF(13)
    );
\ADC_DATA_IN_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(14),
      O => ADC_DATA_IN_IBUF(14)
    );
\ADC_DATA_IN_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(15),
      O => ADC_DATA_IN_IBUF(15)
    );
\ADC_DATA_IN_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(1),
      O => ADC_DATA_IN_IBUF(1)
    );
\ADC_DATA_IN_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(2),
      O => ADC_DATA_IN_IBUF(2)
    );
\ADC_DATA_IN_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(3),
      O => ADC_DATA_IN_IBUF(3)
    );
\ADC_DATA_IN_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(4),
      O => ADC_DATA_IN_IBUF(4)
    );
\ADC_DATA_IN_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(5),
      O => ADC_DATA_IN_IBUF(5)
    );
\ADC_DATA_IN_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(6),
      O => ADC_DATA_IN_IBUF(6)
    );
\ADC_DATA_IN_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(7),
      O => ADC_DATA_IN_IBUF(7)
    );
\ADC_DATA_IN_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(8),
      O => ADC_DATA_IN_IBUF(8)
    );
\ADC_DATA_IN_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_IN(9),
      O => ADC_DATA_IN_IBUF(9)
    );
ADC_DATA_RDY_IN_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => ADC_DATA_RDY_IN_IBUF,
      O => ADC_DATA_RDY_IN_IBUF_BUFG
    );
ADC_DATA_RDY_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => ADC_DATA_RDY_IN,
      O => ADC_DATA_RDY_IN_IBUF
    );
ADC_DnB_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => ADC_DnB,
      O => RnW_TO_MEM_DIST_OUT_OBUF
    );
\ADDR_FROM_INT_MEM_IN_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(0),
      O => ADDR_FROM_INT_MEM_IN_IBUF(0)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(10),
      O => ADDR_FROM_INT_MEM_IN_IBUF(10)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(11),
      O => ADDR_FROM_INT_MEM_IN_IBUF(11)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(12),
      O => ADDR_FROM_INT_MEM_IN_IBUF(12)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(13),
      O => ADDR_FROM_INT_MEM_IN_IBUF(13)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(14),
      O => ADDR_FROM_INT_MEM_IN_IBUF(14)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(15),
      O => ADDR_FROM_INT_MEM_IN_IBUF(15)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(1),
      O => ADDR_FROM_INT_MEM_IN_IBUF(1)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(2),
      O => ADDR_FROM_INT_MEM_IN_IBUF(2)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(3),
      O => ADDR_FROM_INT_MEM_IN_IBUF(3)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(4),
      O => ADDR_FROM_INT_MEM_IN_IBUF(4)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(5),
      O => ADDR_FROM_INT_MEM_IN_IBUF(5)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(6),
      O => ADDR_FROM_INT_MEM_IN_IBUF(6)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(7),
      O => ADDR_FROM_INT_MEM_IN_IBUF(7)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(8),
      O => ADDR_FROM_INT_MEM_IN_IBUF(8)
    );
\ADDR_FROM_INT_MEM_IN_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ADDR_FROM_INT_MEM_IN(9),
      O => ADDR_FROM_INT_MEM_IN_IBUF(9)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(0),
      O => ADDR_TO_MEM_DIST_OUT(0)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(0),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(0),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(0)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(10),
      O => ADDR_TO_MEM_DIST_OUT(10)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(10),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(10),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(10)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(11),
      O => ADDR_TO_MEM_DIST_OUT(11)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[11]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(11),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(11),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(11)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(12),
      O => ADDR_TO_MEM_DIST_OUT(12)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[12]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(12),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(12),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(12)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(13),
      O => ADDR_TO_MEM_DIST_OUT(13)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[13]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(13),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(13),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(13)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(14),
      O => ADDR_TO_MEM_DIST_OUT(14)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[14]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(14),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(14),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(14)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(15),
      O => ADDR_TO_MEM_DIST_OUT(15)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[15]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(15),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(15),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(15)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(1),
      O => ADDR_TO_MEM_DIST_OUT(1)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(1),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(1),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(1)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(2),
      O => ADDR_TO_MEM_DIST_OUT(2)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(2),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(2),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(2)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(3),
      O => ADDR_TO_MEM_DIST_OUT(3)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(3),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(3),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(3)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(4),
      O => ADDR_TO_MEM_DIST_OUT(4)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(4),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(4),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(4)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(5),
      O => ADDR_TO_MEM_DIST_OUT(5)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(5),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(5),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(5)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(6),
      O => ADDR_TO_MEM_DIST_OUT(6)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(6),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(6),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(6)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(7),
      O => ADDR_TO_MEM_DIST_OUT(7)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(7),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(7),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(7)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(8),
      O => ADDR_TO_MEM_DIST_OUT(8)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(8),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(8),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(8)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ADDR_TO_MEM_DIST_OUT_OBUF(9),
      O => ADDR_TO_MEM_DIST_OUT(9)
    );
\ADDR_TO_MEM_DIST_OUT_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => sample_count_reg(9),
      I1 => ADDR_FROM_INT_MEM_IN_IBUF(9),
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => ADDR_TO_MEM_DIST_OUT_OBUF(9)
    );
CLK_FROM_INT_MEM_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK_FROM_INT_MEM_IN,
      O => CLK_FROM_INT_MEM_IN_IBUF
    );
CLK_TO_MEM_DIST_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => CLK_TO_MEM_DIST_OUT_OBUF,
      O => CLK_TO_MEM_DIST_OUT
    );
CLK_TO_MEM_DIST_OUT_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => ADC_DATA_RDY_IN_IBUF,
      I1 => CLK_FROM_INT_MEM_IN_IBUF,
      I2 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => CLK_TO_MEM_DIST_OUT_OBUF
    );
\DATA_FROM_MEM_DIST_IN_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(0),
      O => DATA_FROM_MEM_DIST_IN_IBUF(0)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(10),
      O => DATA_FROM_MEM_DIST_IN_IBUF(10)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(11),
      O => DATA_FROM_MEM_DIST_IN_IBUF(11)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(12),
      O => DATA_FROM_MEM_DIST_IN_IBUF(12)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(13),
      O => DATA_FROM_MEM_DIST_IN_IBUF(13)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(14),
      O => DATA_FROM_MEM_DIST_IN_IBUF(14)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(15),
      O => DATA_FROM_MEM_DIST_IN_IBUF(15)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(1),
      O => DATA_FROM_MEM_DIST_IN_IBUF(1)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(2),
      O => DATA_FROM_MEM_DIST_IN_IBUF(2)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(3),
      O => DATA_FROM_MEM_DIST_IN_IBUF(3)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(4),
      O => DATA_FROM_MEM_DIST_IN_IBUF(4)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(5),
      O => DATA_FROM_MEM_DIST_IN_IBUF(5)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(6),
      O => DATA_FROM_MEM_DIST_IN_IBUF(6)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(7),
      O => DATA_FROM_MEM_DIST_IN_IBUF(7)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(8),
      O => DATA_FROM_MEM_DIST_IN_IBUF(8)
    );
\DATA_FROM_MEM_DIST_IN_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DATA_FROM_MEM_DIST_IN(9),
      O => DATA_FROM_MEM_DIST_IN_IBUF(9)
    );
\DATA_TO_INT_MEM_OUT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(0),
      O => DATA_TO_INT_MEM_OUT(0)
    );
\DATA_TO_INT_MEM_OUT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(0),
      O => DATA_TO_INT_MEM_OUT_OBUF(0)
    );
\DATA_TO_INT_MEM_OUT_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(10),
      O => DATA_TO_INT_MEM_OUT(10)
    );
\DATA_TO_INT_MEM_OUT_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(10),
      O => DATA_TO_INT_MEM_OUT_OBUF(10)
    );
\DATA_TO_INT_MEM_OUT_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(11),
      O => DATA_TO_INT_MEM_OUT(11)
    );
\DATA_TO_INT_MEM_OUT_OBUF[11]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(11),
      O => DATA_TO_INT_MEM_OUT_OBUF(11)
    );
\DATA_TO_INT_MEM_OUT_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(12),
      O => DATA_TO_INT_MEM_OUT(12)
    );
\DATA_TO_INT_MEM_OUT_OBUF[12]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(12),
      O => DATA_TO_INT_MEM_OUT_OBUF(12)
    );
\DATA_TO_INT_MEM_OUT_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(13),
      O => DATA_TO_INT_MEM_OUT(13)
    );
\DATA_TO_INT_MEM_OUT_OBUF[13]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(13),
      O => DATA_TO_INT_MEM_OUT_OBUF(13)
    );
\DATA_TO_INT_MEM_OUT_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(14),
      O => DATA_TO_INT_MEM_OUT(14)
    );
\DATA_TO_INT_MEM_OUT_OBUF[14]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(14),
      O => DATA_TO_INT_MEM_OUT_OBUF(14)
    );
\DATA_TO_INT_MEM_OUT_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(15),
      O => DATA_TO_INT_MEM_OUT(15)
    );
\DATA_TO_INT_MEM_OUT_OBUF[15]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(15),
      O => DATA_TO_INT_MEM_OUT_OBUF(15)
    );
\DATA_TO_INT_MEM_OUT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(1),
      O => DATA_TO_INT_MEM_OUT(1)
    );
\DATA_TO_INT_MEM_OUT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(1),
      O => DATA_TO_INT_MEM_OUT_OBUF(1)
    );
\DATA_TO_INT_MEM_OUT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(2),
      O => DATA_TO_INT_MEM_OUT(2)
    );
\DATA_TO_INT_MEM_OUT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(2),
      O => DATA_TO_INT_MEM_OUT_OBUF(2)
    );
\DATA_TO_INT_MEM_OUT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(3),
      O => DATA_TO_INT_MEM_OUT(3)
    );
\DATA_TO_INT_MEM_OUT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(3),
      O => DATA_TO_INT_MEM_OUT_OBUF(3)
    );
\DATA_TO_INT_MEM_OUT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(4),
      O => DATA_TO_INT_MEM_OUT(4)
    );
\DATA_TO_INT_MEM_OUT_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(4),
      O => DATA_TO_INT_MEM_OUT_OBUF(4)
    );
\DATA_TO_INT_MEM_OUT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(5),
      O => DATA_TO_INT_MEM_OUT(5)
    );
\DATA_TO_INT_MEM_OUT_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(5),
      O => DATA_TO_INT_MEM_OUT_OBUF(5)
    );
\DATA_TO_INT_MEM_OUT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(6),
      O => DATA_TO_INT_MEM_OUT(6)
    );
\DATA_TO_INT_MEM_OUT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(6),
      O => DATA_TO_INT_MEM_OUT_OBUF(6)
    );
\DATA_TO_INT_MEM_OUT_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(7),
      O => DATA_TO_INT_MEM_OUT(7)
    );
\DATA_TO_INT_MEM_OUT_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(7),
      O => DATA_TO_INT_MEM_OUT_OBUF(7)
    );
\DATA_TO_INT_MEM_OUT_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(8),
      O => DATA_TO_INT_MEM_OUT(8)
    );
\DATA_TO_INT_MEM_OUT_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(8),
      O => DATA_TO_INT_MEM_OUT_OBUF(8)
    );
\DATA_TO_INT_MEM_OUT_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_INT_MEM_OUT_OBUF(9),
      O => DATA_TO_INT_MEM_OUT(9)
    );
\DATA_TO_INT_MEM_OUT_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RnW_TO_MEM_DIST_OUT_OBUF,
      I1 => DATA_FROM_MEM_DIST_IN_IBUF(9),
      O => DATA_TO_INT_MEM_OUT_OBUF(9)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(0),
      O => DATA_TO_MEM_DIST_OUT(0)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(0),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(0)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(10),
      O => DATA_TO_MEM_DIST_OUT(10)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(10),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(10)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(11),
      O => DATA_TO_MEM_DIST_OUT(11)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[11]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(11),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(11)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(12),
      O => DATA_TO_MEM_DIST_OUT(12)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[12]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(12),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(12)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(13),
      O => DATA_TO_MEM_DIST_OUT(13)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[13]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(13),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(13)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(14),
      O => DATA_TO_MEM_DIST_OUT(14)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[14]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(14),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(14)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(15),
      O => DATA_TO_MEM_DIST_OUT(15)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[15]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(15),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(15)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(1),
      O => DATA_TO_MEM_DIST_OUT(1)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(1),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(1)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(2),
      O => DATA_TO_MEM_DIST_OUT(2)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(2),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(2)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(3),
      O => DATA_TO_MEM_DIST_OUT(3)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(3),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(3)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(4),
      O => DATA_TO_MEM_DIST_OUT(4)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(4),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(4)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(5),
      O => DATA_TO_MEM_DIST_OUT(5)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(5),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(5)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(6),
      O => DATA_TO_MEM_DIST_OUT(6)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(6),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(6)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(7),
      O => DATA_TO_MEM_DIST_OUT(7)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(7),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(7)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(8),
      O => DATA_TO_MEM_DIST_OUT(8)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(8),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(8)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DATA_TO_MEM_DIST_OUT_OBUF(9),
      O => DATA_TO_MEM_DIST_OUT(9)
    );
\DATA_TO_MEM_DIST_OUT_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ADC_DATA_IN_IBUF(9),
      I1 => RnW_TO_MEM_DIST_OUT_OBUF,
      O => DATA_TO_MEM_DIST_OUT_OBUF(9)
    );
RnW_TO_MEM_DIST_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => RnW_TO_MEM_DIST_OUT_OBUF,
      O => RnW_TO_MEM_DIST_OUT
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
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[0]_i_1_n_7\,
      Q => sample_count_reg(0)
    );
\sample_count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \sample_count_reg[0]_i_1_n_0\,
      CO(2) => \sample_count_reg[0]_i_1_n_1\,
      CO(1) => \sample_count_reg[0]_i_1_n_2\,
      CO(0) => \sample_count_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \sample_count_reg[0]_i_1_n_4\,
      O(2) => \sample_count_reg[0]_i_1_n_5\,
      O(1) => \sample_count_reg[0]_i_1_n_6\,
      O(0) => \sample_count_reg[0]_i_1_n_7\,
      S(3 downto 1) => sample_count_reg(3 downto 1),
      S(0) => \sample_count[0]_i_2_n_0\
    );
\sample_count_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[8]_i_1_n_5\,
      Q => sample_count_reg(10)
    );
\sample_count_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[8]_i_1_n_4\,
      Q => sample_count_reg(11)
    );
\sample_count_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[12]_i_1_n_7\,
      Q => sample_count_reg(12)
    );
\sample_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_count_reg[8]_i_1_n_0\,
      CO(3) => \NLW_sample_count_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \sample_count_reg[12]_i_1_n_1\,
      CO(1) => \sample_count_reg[12]_i_1_n_2\,
      CO(0) => \sample_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \sample_count_reg[12]_i_1_n_4\,
      O(2) => \sample_count_reg[12]_i_1_n_5\,
      O(1) => \sample_count_reg[12]_i_1_n_6\,
      O(0) => \sample_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => sample_count_reg(15 downto 12)
    );
\sample_count_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[12]_i_1_n_6\,
      Q => sample_count_reg(13)
    );
\sample_count_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[12]_i_1_n_5\,
      Q => sample_count_reg(14)
    );
\sample_count_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[12]_i_1_n_4\,
      Q => sample_count_reg(15)
    );
\sample_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[0]_i_1_n_6\,
      Q => sample_count_reg(1)
    );
\sample_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[0]_i_1_n_5\,
      Q => sample_count_reg(2)
    );
\sample_count_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      D => \sample_count_reg[0]_i_1_n_4\,
      PRE => RnW_TO_MEM_DIST_OUT_OBUF,
      Q => sample_count_reg(3)
    );
\sample_count_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      D => \sample_count_reg[4]_i_1_n_7\,
      PRE => RnW_TO_MEM_DIST_OUT_OBUF,
      Q => sample_count_reg(4)
    );
\sample_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_count_reg[0]_i_1_n_0\,
      CO(3) => \sample_count_reg[4]_i_1_n_0\,
      CO(2) => \sample_count_reg[4]_i_1_n_1\,
      CO(1) => \sample_count_reg[4]_i_1_n_2\,
      CO(0) => \sample_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \sample_count_reg[4]_i_1_n_4\,
      O(2) => \sample_count_reg[4]_i_1_n_5\,
      O(1) => \sample_count_reg[4]_i_1_n_6\,
      O(0) => \sample_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => sample_count_reg(7 downto 4)
    );
\sample_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[4]_i_1_n_6\,
      Q => sample_count_reg(5)
    );
\sample_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[4]_i_1_n_5\,
      Q => sample_count_reg(6)
    );
\sample_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[4]_i_1_n_4\,
      Q => sample_count_reg(7)
    );
\sample_count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[8]_i_1_n_7\,
      Q => sample_count_reg(8)
    );
\sample_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_count_reg[4]_i_1_n_0\,
      CO(3) => \sample_count_reg[8]_i_1_n_0\,
      CO(2) => \sample_count_reg[8]_i_1_n_1\,
      CO(1) => \sample_count_reg[8]_i_1_n_2\,
      CO(0) => \sample_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \sample_count_reg[8]_i_1_n_4\,
      O(2) => \sample_count_reg[8]_i_1_n_5\,
      O(1) => \sample_count_reg[8]_i_1_n_6\,
      O(0) => \sample_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => sample_count_reg(11 downto 8)
    );
\sample_count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => ADC_DATA_RDY_IN_IBUF_BUFG,
      CE => '1',
      CLR => RnW_TO_MEM_DIST_OUT_OBUF,
      D => \sample_count_reg[8]_i_1_n_6\,
      Q => sample_count_reg(9)
    );
end STRUCTURE;
