-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Oct 12 18:41:57 2024
-- Host        : DESKTOP-DNC9NIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {F:/Git
--               Projects/EIT/P7---Bsc/Code/VHDL/Sample_MEM/Sample_MEM.sim/sim_1/synth/func/xsim/sample_control_TOP_func_synth.vhd}
-- Design      : sample_control_TOP
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity internal_ram is
  port (
    \TOPORT_reg[0]_0\ : out STD_LOGIC;
    \TOPORT_reg[1]_0\ : out STD_LOGIC;
    \TOPORT_reg[2]_0\ : out STD_LOGIC;
    \TOPORT_reg[3]_0\ : out STD_LOGIC;
    \TOPORT_reg[4]_0\ : out STD_LOGIC;
    \TOPORT_reg[5]_0\ : out STD_LOGIC;
    \TOPORT_reg[6]_0\ : out STD_LOGIC;
    \TOPORT_reg[7]_0\ : out STD_LOGIC;
    \TOPORT_reg[8]_0\ : out STD_LOGIC;
    \TOPORT_reg[9]_0\ : out STD_LOGIC;
    \TOPORT_reg[10]_0\ : out STD_LOGIC;
    \TOPORT_reg[11]_0\ : out STD_LOGIC;
    \TOPORT_reg[12]_0\ : out STD_LOGIC;
    \TOPORT_reg[13]_0\ : out STD_LOGIC;
    \TOPORT_reg[14]_0\ : out STD_LOGIC;
    \TOPORT_reg[15]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end internal_ram;

architecture STRUCTURE of internal_ram is
  signal ADDRESS : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ADDRESS0 : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_n_1\ : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_n_2\ : STD_LOGIC;
  signal \ADDRESS0__4_carry__0_n_3\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_1_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_2_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_3_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_4_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_5_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_6_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_i_7_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_n_0\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_n_1\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_n_2\ : STD_LOGIC;
  signal \ADDRESS0__4_carry_n_3\ : STD_LOGIC;
  signal \ADDRESS[4]_i_1_n_0\ : STD_LOGIC;
  signal TOPORT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TOPORT0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal test_i_1_n_0 : STD_LOGIC;
  signal test_reg_n_0 : STD_LOGIC;
  signal \NLW_ADDRESS0__4_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ADDRESS0__4_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of \ADDRESS0__4_carry\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \ADDRESS0__4_carry__0\ : label is 11;
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_31_0_0 : label is 512;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_31_0_0 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of RAM_reg_0_31_0_0 : label is "RAM_SP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_31_0_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_31_0_0 : label is 31;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_31_0_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_31_0_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_31_0_0 : label is 0;
  attribute RTL_RAM_BITS of RAM_reg_0_31_10_10 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_10_10 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_10_10 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_10_10 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_10_10 : label is 31;
  attribute ram_offset of RAM_reg_0_31_10_10 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_10_10 : label is 10;
  attribute ram_slice_end of RAM_reg_0_31_10_10 : label is 10;
  attribute RTL_RAM_BITS of RAM_reg_0_31_11_11 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_11_11 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_11_11 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_11_11 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_11_11 : label is 31;
  attribute ram_offset of RAM_reg_0_31_11_11 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_11_11 : label is 11;
  attribute ram_slice_end of RAM_reg_0_31_11_11 : label is 11;
  attribute RTL_RAM_BITS of RAM_reg_0_31_12_12 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_12_12 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_12_12 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_12_12 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_12_12 : label is 31;
  attribute ram_offset of RAM_reg_0_31_12_12 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_12_12 : label is 12;
  attribute ram_slice_end of RAM_reg_0_31_12_12 : label is 12;
  attribute RTL_RAM_BITS of RAM_reg_0_31_13_13 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_13_13 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_13_13 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_13_13 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_13_13 : label is 31;
  attribute ram_offset of RAM_reg_0_31_13_13 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_13_13 : label is 13;
  attribute ram_slice_end of RAM_reg_0_31_13_13 : label is 13;
  attribute RTL_RAM_BITS of RAM_reg_0_31_14_14 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_14_14 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_14_14 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_14_14 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_14_14 : label is 31;
  attribute ram_offset of RAM_reg_0_31_14_14 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_14_14 : label is 14;
  attribute ram_slice_end of RAM_reg_0_31_14_14 : label is 14;
  attribute RTL_RAM_BITS of RAM_reg_0_31_15_15 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_15_15 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_15_15 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_15_15 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_15_15 : label is 31;
  attribute ram_offset of RAM_reg_0_31_15_15 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_15_15 : label is 15;
  attribute ram_slice_end of RAM_reg_0_31_15_15 : label is 15;
  attribute RTL_RAM_BITS of RAM_reg_0_31_1_1 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_1_1 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_1_1 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_1_1 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_1_1 : label is 31;
  attribute ram_offset of RAM_reg_0_31_1_1 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_1_1 : label is 1;
  attribute ram_slice_end of RAM_reg_0_31_1_1 : label is 1;
  attribute RTL_RAM_BITS of RAM_reg_0_31_2_2 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_2_2 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_2_2 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_2_2 : label is 31;
  attribute ram_offset of RAM_reg_0_31_2_2 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_2_2 : label is 2;
  attribute ram_slice_end of RAM_reg_0_31_2_2 : label is 2;
  attribute RTL_RAM_BITS of RAM_reg_0_31_3_3 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_3_3 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_3_3 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_3_3 : label is 31;
  attribute ram_offset of RAM_reg_0_31_3_3 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_3_3 : label is 3;
  attribute ram_slice_end of RAM_reg_0_31_3_3 : label is 3;
  attribute RTL_RAM_BITS of RAM_reg_0_31_4_4 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_4_4 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_4_4 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_4_4 : label is 31;
  attribute ram_offset of RAM_reg_0_31_4_4 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_4_4 : label is 4;
  attribute ram_slice_end of RAM_reg_0_31_4_4 : label is 4;
  attribute RTL_RAM_BITS of RAM_reg_0_31_5_5 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_5_5 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_5_5 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_5_5 : label is 31;
  attribute ram_offset of RAM_reg_0_31_5_5 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_5_5 : label is 5;
  attribute ram_slice_end of RAM_reg_0_31_5_5 : label is 5;
  attribute RTL_RAM_BITS of RAM_reg_0_31_6_6 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_6_6 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_6_6 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_6_6 : label is 31;
  attribute ram_offset of RAM_reg_0_31_6_6 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_6_6 : label is 6;
  attribute ram_slice_end of RAM_reg_0_31_6_6 : label is 6;
  attribute RTL_RAM_BITS of RAM_reg_0_31_7_7 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_7_7 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_7_7 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_7_7 : label is 31;
  attribute ram_offset of RAM_reg_0_31_7_7 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_7_7 : label is 7;
  attribute ram_slice_end of RAM_reg_0_31_7_7 : label is 7;
  attribute RTL_RAM_BITS of RAM_reg_0_31_8_8 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_8_8 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_8_8 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_8_8 : label is 31;
  attribute ram_offset of RAM_reg_0_31_8_8 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_8_8 : label is 8;
  attribute ram_slice_end of RAM_reg_0_31_8_8 : label is 8;
  attribute RTL_RAM_BITS of RAM_reg_0_31_9_9 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_9_9 : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_9_9 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_9_9 : label is 31;
  attribute ram_offset of RAM_reg_0_31_9_9 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_9_9 : label is 9;
  attribute ram_slice_end of RAM_reg_0_31_9_9 : label is 9;
begin
\ADDRESS0__4_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ADDRESS0__4_carry_n_0\,
      CO(2) => \ADDRESS0__4_carry_n_1\,
      CO(1) => \ADDRESS0__4_carry_n_2\,
      CO(0) => \ADDRESS0__4_carry_n_3\,
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => \ADDRESS0__4_carry_i_1_n_0\,
      DI(1) => \ADDRESS0__4_carry_i_2_n_0\,
      DI(0) => \ADDRESS0__4_carry_i_3_n_0\,
      O(3 downto 0) => \NLW_ADDRESS0__4_carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \ADDRESS0__4_carry_i_4_n_0\,
      S(2) => \ADDRESS0__4_carry_i_5_n_0\,
      S(1) => \ADDRESS0__4_carry_i_6_n_0\,
      S(0) => \ADDRESS0__4_carry_i_7_n_0\
    );
\ADDRESS0__4_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \ADDRESS0__4_carry_n_0\,
      CO(3) => ADDRESS0,
      CO(2) => \ADDRESS0__4_carry__0_n_1\,
      CO(1) => \ADDRESS0__4_carry__0_n_2\,
      CO(0) => \ADDRESS0__4_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ADDRESS0__4_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \ADDRESS0__4_carry__0_i_1_n_0\,
      S(2) => \ADDRESS0__4_carry__0_i_2_n_0\,
      S(1) => \ADDRESS0__4_carry__0_i_3_n_0\,
      S(0) => \ADDRESS0__4_carry__0_i_4_n_0\
    );
\ADDRESS0__4_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => I1(14),
      I1 => I1(15),
      O => \ADDRESS0__4_carry__0_i_1_n_0\
    );
\ADDRESS0__4_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => I1(12),
      I1 => I1(13),
      O => \ADDRESS0__4_carry__0_i_2_n_0\
    );
\ADDRESS0__4_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => I1(10),
      I1 => I1(11),
      O => \ADDRESS0__4_carry__0_i_3_n_0\
    );
\ADDRESS0__4_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => I1(8),
      I1 => I1(9),
      O => \ADDRESS0__4_carry__0_i_4_n_0\
    );
\ADDRESS0__4_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => I1(4),
      I1 => I1(5),
      O => \ADDRESS0__4_carry_i_1_n_0\
    );
\ADDRESS0__4_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => I1(2),
      I1 => I1(3),
      O => \ADDRESS0__4_carry_i_2_n_0\
    );
\ADDRESS0__4_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => I1(0),
      I1 => I1(1),
      O => \ADDRESS0__4_carry_i_3_n_0\
    );
\ADDRESS0__4_carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => I1(6),
      I1 => I1(7),
      O => \ADDRESS0__4_carry_i_4_n_0\
    );
\ADDRESS0__4_carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => I1(4),
      I1 => I1(5),
      O => \ADDRESS0__4_carry_i_5_n_0\
    );
\ADDRESS0__4_carry_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => I1(2),
      I1 => I1(3),
      O => \ADDRESS0__4_carry_i_6_n_0\
    );
\ADDRESS0__4_carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => I1(0),
      I1 => I1(1),
      O => \ADDRESS0__4_carry_i_7_n_0\
    );
\ADDRESS[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => test_reg_n_0,
      I1 => ADDRESS0,
      I2 => RW_EXT_IBUF,
      O => \ADDRESS[4]_i_1_n_0\
    );
\ADDRESS_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => I1(0),
      Q => ADDRESS(0),
      R => '0'
    );
\ADDRESS_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => I1(1),
      Q => ADDRESS(1),
      R => '0'
    );
\ADDRESS_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => I1(2),
      Q => ADDRESS(2),
      R => '0'
    );
\ADDRESS_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => I1(3),
      Q => ADDRESS(3),
      R => '0'
    );
\ADDRESS_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => I1(4),
      Q => ADDRESS(4),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(0),
      O => \TOPORT_reg[0]_0\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(10),
      O => \TOPORT_reg[10]_0\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(11),
      O => \TOPORT_reg[11]_0\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(12),
      O => \TOPORT_reg[12]_0\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(13),
      O => \TOPORT_reg[13]_0\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(14),
      O => \TOPORT_reg[14]_0\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(15),
      O => \TOPORT_reg[15]_0\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(1),
      O => \TOPORT_reg[1]_0\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(2),
      O => \TOPORT_reg[2]_0\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(3),
      O => \TOPORT_reg[3]_0\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(4),
      O => \TOPORT_reg[4]_0\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(5),
      O => \TOPORT_reg[5]_0\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(6),
      O => \TOPORT_reg[6]_0\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(7),
      O => \TOPORT_reg[7]_0\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(8),
      O => \TOPORT_reg[8]_0\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(9),
      O => \TOPORT_reg[9]_0\
    );
RAM_reg_0_31_0_0: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(0),
      O => TOPORT0(0),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_0_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => test_reg_n_0,
      I1 => RW_EXT_IBUF,
      O => p_0_in
    );
RAM_reg_0_31_10_10: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(10),
      O => TOPORT0(10),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_11_11: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(11),
      O => TOPORT0(11),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_12_12: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(12),
      O => TOPORT0(12),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_13_13: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(13),
      O => TOPORT0(13),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_14_14: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(14),
      O => TOPORT0(14),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_15_15: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(15),
      O => TOPORT0(15),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_1_1: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(1),
      O => TOPORT0(1),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_2_2: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(2),
      O => TOPORT0(2),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_3_3: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(3),
      O => TOPORT0(3),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_4_4: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(4),
      O => TOPORT0(4),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_5_5: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(5),
      O => TOPORT0(5),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_6_6: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(6),
      O => TOPORT0(6),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_7_7: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(7),
      O => TOPORT0(7),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_8_8: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(8),
      O => TOPORT0(8),
      WCLK => CLK,
      WE => p_0_in
    );
RAM_reg_0_31_9_9: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => ADDRESS(4),
      D => I1(9),
      O => TOPORT0(9),
      WCLK => CLK,
      WE => p_0_in
    );
\TOPORT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(0),
      Q => TOPORT(0),
      R => '0'
    );
\TOPORT_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(10),
      Q => TOPORT(10),
      R => '0'
    );
\TOPORT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(11),
      Q => TOPORT(11),
      R => '0'
    );
\TOPORT_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(12),
      Q => TOPORT(12),
      R => '0'
    );
\TOPORT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(13),
      Q => TOPORT(13),
      R => '0'
    );
\TOPORT_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(14),
      Q => TOPORT(14),
      R => '0'
    );
\TOPORT_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(15),
      Q => TOPORT(15),
      R => '0'
    );
\TOPORT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(1),
      Q => TOPORT(1),
      R => '0'
    );
\TOPORT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(2),
      Q => TOPORT(2),
      R => '0'
    );
\TOPORT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(3),
      Q => TOPORT(3),
      R => '0'
    );
\TOPORT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(4),
      Q => TOPORT(4),
      R => '0'
    );
\TOPORT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(5),
      Q => TOPORT(5),
      R => '0'
    );
\TOPORT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(6),
      Q => TOPORT(6),
      R => '0'
    );
\TOPORT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(7),
      Q => TOPORT(7),
      R => '0'
    );
\TOPORT_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(8),
      Q => TOPORT(8),
      R => '0'
    );
\TOPORT_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(9),
      Q => TOPORT(9),
      R => '0'
    );
test_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C2"
    )
        port map (
      I0 => ADDRESS0,
      I1 => test_reg_n_0,
      I2 => RW_EXT_IBUF,
      O => test_i_1_n_0
    );
test_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => test_i_1_n_0,
      Q => test_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sample_control_TOP is
  port (
    CLK_EXT : in STD_LOGIC;
    RW_EXT : in STD_LOGIC;
    IO_PINS_EXT : inout STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sample_control_TOP : entity is true;
end sample_control_TOP;

architecture STRUCTURE of sample_control_TOP is
  signal CLK_EXT_IBUF : STD_LOGIC;
  signal CLK_EXT_IBUF_BUFG : STD_LOGIC;
  signal IO_PINS_EXT_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \IO_PINS_EXT_IOBUF[0]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[10]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[11]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[12]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[13]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[14]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[15]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[2]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[3]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[4]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[5]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[7]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[8]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[9]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[0]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[10]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[11]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[12]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[13]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[14]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[15]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[1]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[2]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[3]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[4]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[5]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[6]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[7]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[8]\ : STD_LOGIC;
  signal \IO_PINS_EXT_TRI[9]\ : STD_LOGIC;
  signal RW_EXT_IBUF : STD_LOGIC;
  signal RW_EXT_IBUF_BUFG : STD_LOGIC;
  signal ram_n_0 : STD_LOGIC;
  signal ram_n_1 : STD_LOGIC;
  signal ram_n_10 : STD_LOGIC;
  signal ram_n_11 : STD_LOGIC;
  signal ram_n_12 : STD_LOGIC;
  signal ram_n_13 : STD_LOGIC;
  signal ram_n_14 : STD_LOGIC;
  signal ram_n_15 : STD_LOGIC;
  signal ram_n_2 : STD_LOGIC;
  signal ram_n_3 : STD_LOGIC;
  signal ram_n_4 : STD_LOGIC;
  signal ram_n_5 : STD_LOGIC;
  signal ram_n_6 : STD_LOGIC;
  signal ram_n_7 : STD_LOGIC;
  signal ram_n_8 : STD_LOGIC;
  signal ram_n_9 : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[0]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[0]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[10]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[10]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[11]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[11]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[12]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[12]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[13]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[13]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[14]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[14]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[15]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[15]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[1]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[1]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[2]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[2]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[3]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[3]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[4]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[4]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[5]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[5]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[6]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[6]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[7]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[7]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[8]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[8]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[9]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[9]_inst_i_2\ : label is "VCC:GE GND:CLR";
begin
pullup_IO_PINS_EXT_0inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(0)
    );
pullup_IO_PINS_EXT_1inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(1)
    );
pullup_IO_PINS_EXT_2inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(2)
    );
pullup_IO_PINS_EXT_3inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(3)
    );
pullup_IO_PINS_EXT_4inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(4)
    );
pullup_IO_PINS_EXT_5inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(5)
    );
pullup_IO_PINS_EXT_6inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(6)
    );
pullup_IO_PINS_EXT_7inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(7)
    );
pullup_IO_PINS_EXT_8inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(8)
    );
pullup_IO_PINS_EXT_9inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(9)
    );
pullup_IO_PINS_EXT_10inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(10)
    );
pullup_IO_PINS_EXT_11inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(11)
    );
pullup_IO_PINS_EXT_12inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(12)
    );
pullup_IO_PINS_EXT_13inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(13)
    );
pullup_IO_PINS_EXT_14inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(14)
    );
pullup_IO_PINS_EXT_15inst: unisim.vcomponents.PULLUP
    port map (
      O => IO_PINS_EXT(15)
    );
CLK_EXT_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_EXT_IBUF,
      O => CLK_EXT_IBUF_BUFG
    );
CLK_EXT_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK_EXT,
      O => CLK_EXT_IBUF
    );
\IO_PINS_EXT_IOBUF[0]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(0),
      O => IO_PINS_EXT_IBUF(0),
      T => \IO_PINS_EXT_TRI[0]\
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[0]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[0]\
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_0,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[0]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[10]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(10),
      O => IO_PINS_EXT_IBUF(10),
      T => \IO_PINS_EXT_TRI[10]\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[10]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[10]\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_10,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[10]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[11]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(11),
      O => IO_PINS_EXT_IBUF(11),
      T => \IO_PINS_EXT_TRI[11]\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[11]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[11]\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_11,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[11]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[12]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(12),
      O => IO_PINS_EXT_IBUF(12),
      T => \IO_PINS_EXT_TRI[12]\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[12]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[12]\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_12,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[12]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[13]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(13),
      O => IO_PINS_EXT_IBUF(13),
      T => \IO_PINS_EXT_TRI[13]\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[13]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[13]\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_13,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[13]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[14]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(14),
      O => IO_PINS_EXT_IBUF(14),
      T => \IO_PINS_EXT_TRI[14]\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[14]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[14]\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_14,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[14]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[15]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(15),
      O => IO_PINS_EXT_IBUF(15),
      T => \IO_PINS_EXT_TRI[15]\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[15]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[15]\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_15,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[15]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[1]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(1),
      O => IO_PINS_EXT_IBUF(1),
      T => \IO_PINS_EXT_TRI[1]\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[1]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[1]\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_1,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[1]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[2]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(2),
      O => IO_PINS_EXT_IBUF(2),
      T => \IO_PINS_EXT_TRI[2]\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[2]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[2]\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_2,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[2]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[3]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(3),
      O => IO_PINS_EXT_IBUF(3),
      T => \IO_PINS_EXT_TRI[3]\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[3]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[3]\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_3,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[3]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[4]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(4),
      O => IO_PINS_EXT_IBUF(4),
      T => \IO_PINS_EXT_TRI[4]\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[4]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[4]\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_4,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[4]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[5]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(5),
      O => IO_PINS_EXT_IBUF(5),
      T => \IO_PINS_EXT_TRI[5]\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[5]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[5]\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_5,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[5]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[6]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(6),
      O => IO_PINS_EXT_IBUF(6),
      T => \IO_PINS_EXT_TRI[6]\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[6]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[6]\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_6,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[6]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[7]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(7),
      O => IO_PINS_EXT_IBUF(7),
      T => \IO_PINS_EXT_TRI[7]\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[7]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[7]\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_7,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[7]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[8]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(8),
      O => IO_PINS_EXT_IBUF(8),
      T => \IO_PINS_EXT_TRI[8]\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[8]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[8]\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_8,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[8]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[9]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(9),
      O => IO_PINS_EXT_IBUF(9),
      T => \IO_PINS_EXT_TRI[9]\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[9]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[9]\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_9,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[9]_inst_i_2_n_0\
    );
RW_EXT_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => RW_EXT_IBUF,
      O => RW_EXT_IBUF_BUFG
    );
RW_EXT_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RW_EXT,
      O => RW_EXT_IBUF
    );
ram: entity work.internal_ram
     port map (
      CLK => CLK_EXT_IBUF_BUFG,
      E(0) => RW_EXT_IBUF_BUFG,
      I1(15 downto 0) => IO_PINS_EXT_IBUF(15 downto 0),
      RW_EXT_IBUF => RW_EXT_IBUF,
      \TOPORT_reg[0]_0\ => ram_n_0,
      \TOPORT_reg[10]_0\ => ram_n_10,
      \TOPORT_reg[11]_0\ => ram_n_11,
      \TOPORT_reg[12]_0\ => ram_n_12,
      \TOPORT_reg[13]_0\ => ram_n_13,
      \TOPORT_reg[14]_0\ => ram_n_14,
      \TOPORT_reg[15]_0\ => ram_n_15,
      \TOPORT_reg[1]_0\ => ram_n_1,
      \TOPORT_reg[2]_0\ => ram_n_2,
      \TOPORT_reg[3]_0\ => ram_n_3,
      \TOPORT_reg[4]_0\ => ram_n_4,
      \TOPORT_reg[5]_0\ => ram_n_5,
      \TOPORT_reg[6]_0\ => ram_n_6,
      \TOPORT_reg[7]_0\ => ram_n_7,
      \TOPORT_reg[8]_0\ => ram_n_8,
      \TOPORT_reg[9]_0\ => ram_n_9
    );
end STRUCTURE;
