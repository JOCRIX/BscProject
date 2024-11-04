-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Nov  2 16:21:11 2024
-- Host        : DESKTOP-S99FO1K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/Sample_MEM/Sample_MEM.sim/sim_1/synth/func/xsim/comm_port_func_synth.vhd
-- Design      : internal_ram
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
    CLK : in STD_LOGIC;
    RW : in STD_LOGIC;
    FSM_RESET : in STD_LOGIC;
    TORAM : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TOPORT : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of internal_ram : entity is true;
end internal_ram;

architecture STRUCTURE of internal_ram is
  signal ADDRESS : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ADDRESS[4]_i_10_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_11_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_12_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_13_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_14_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_1_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_4_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_5_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_6_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_7_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_8_n_0\ : STD_LOGIC;
  signal \ADDRESS[4]_i_9_n_0\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_3_n_1\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_3_n_2\ : STD_LOGIC;
  signal \ADDRESS_reg[4]_i_3_n_3\ : STD_LOGIC;
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal FSM_RESET_IBUF : STD_LOGIC;
  signal RW_IBUF : STD_LOGIC;
  signal TOPORT0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TOPORT_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TORAM_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal state_i_1_n_0 : STD_LOGIC;
  signal state_reg_n_0 : STD_LOGIC;
  signal \NLW_ADDRESS_reg[4]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ADDRESS_reg[4]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of \ADDRESS_reg[4]_i_2\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \ADDRESS_reg[4]_i_3\ : label is 11;
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_31_0_0 : label is 512;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_31_0_0 : label is "RAM_reg";
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
  attribute RTL_RAM_NAME of RAM_reg_0_31_10_10 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_10_10 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_10_10 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_10_10 : label is 31;
  attribute ram_offset of RAM_reg_0_31_10_10 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_10_10 : label is 10;
  attribute ram_slice_end of RAM_reg_0_31_10_10 : label is 10;
  attribute RTL_RAM_BITS of RAM_reg_0_31_11_11 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_11_11 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_11_11 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_11_11 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_11_11 : label is 31;
  attribute ram_offset of RAM_reg_0_31_11_11 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_11_11 : label is 11;
  attribute ram_slice_end of RAM_reg_0_31_11_11 : label is 11;
  attribute RTL_RAM_BITS of RAM_reg_0_31_12_12 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_12_12 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_12_12 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_12_12 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_12_12 : label is 31;
  attribute ram_offset of RAM_reg_0_31_12_12 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_12_12 : label is 12;
  attribute ram_slice_end of RAM_reg_0_31_12_12 : label is 12;
  attribute RTL_RAM_BITS of RAM_reg_0_31_13_13 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_13_13 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_13_13 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_13_13 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_13_13 : label is 31;
  attribute ram_offset of RAM_reg_0_31_13_13 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_13_13 : label is 13;
  attribute ram_slice_end of RAM_reg_0_31_13_13 : label is 13;
  attribute RTL_RAM_BITS of RAM_reg_0_31_14_14 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_14_14 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_14_14 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_14_14 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_14_14 : label is 31;
  attribute ram_offset of RAM_reg_0_31_14_14 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_14_14 : label is 14;
  attribute ram_slice_end of RAM_reg_0_31_14_14 : label is 14;
  attribute RTL_RAM_BITS of RAM_reg_0_31_15_15 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_15_15 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_15_15 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_15_15 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_15_15 : label is 31;
  attribute ram_offset of RAM_reg_0_31_15_15 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_15_15 : label is 15;
  attribute ram_slice_end of RAM_reg_0_31_15_15 : label is 15;
  attribute RTL_RAM_BITS of RAM_reg_0_31_1_1 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_1_1 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_1_1 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_1_1 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_1_1 : label is 31;
  attribute ram_offset of RAM_reg_0_31_1_1 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_1_1 : label is 1;
  attribute ram_slice_end of RAM_reg_0_31_1_1 : label is 1;
  attribute RTL_RAM_BITS of RAM_reg_0_31_2_2 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_2_2 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_2_2 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_2_2 : label is 31;
  attribute ram_offset of RAM_reg_0_31_2_2 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_2_2 : label is 2;
  attribute ram_slice_end of RAM_reg_0_31_2_2 : label is 2;
  attribute RTL_RAM_BITS of RAM_reg_0_31_3_3 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_3_3 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_3_3 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_3_3 : label is 31;
  attribute ram_offset of RAM_reg_0_31_3_3 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_3_3 : label is 3;
  attribute ram_slice_end of RAM_reg_0_31_3_3 : label is 3;
  attribute RTL_RAM_BITS of RAM_reg_0_31_4_4 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_4_4 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_4_4 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_4_4 : label is 31;
  attribute ram_offset of RAM_reg_0_31_4_4 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_4_4 : label is 4;
  attribute ram_slice_end of RAM_reg_0_31_4_4 : label is 4;
  attribute RTL_RAM_BITS of RAM_reg_0_31_5_5 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_5_5 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_5_5 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_5_5 : label is 31;
  attribute ram_offset of RAM_reg_0_31_5_5 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_5_5 : label is 5;
  attribute ram_slice_end of RAM_reg_0_31_5_5 : label is 5;
  attribute RTL_RAM_BITS of RAM_reg_0_31_6_6 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_6_6 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_6_6 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_6_6 : label is 31;
  attribute ram_offset of RAM_reg_0_31_6_6 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_6_6 : label is 6;
  attribute ram_slice_end of RAM_reg_0_31_6_6 : label is 6;
  attribute RTL_RAM_BITS of RAM_reg_0_31_7_7 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_7_7 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_7_7 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_7_7 : label is 31;
  attribute ram_offset of RAM_reg_0_31_7_7 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_7_7 : label is 7;
  attribute ram_slice_end of RAM_reg_0_31_7_7 : label is 7;
  attribute RTL_RAM_BITS of RAM_reg_0_31_8_8 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_8_8 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_8_8 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_8_8 : label is 31;
  attribute ram_offset of RAM_reg_0_31_8_8 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_8_8 : label is 8;
  attribute ram_slice_end of RAM_reg_0_31_8_8 : label is 8;
  attribute RTL_RAM_BITS of RAM_reg_0_31_9_9 : label is 512;
  attribute RTL_RAM_NAME of RAM_reg_0_31_9_9 : label is "RAM_reg";
  attribute RTL_RAM_TYPE of RAM_reg_0_31_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of RAM_reg_0_31_9_9 : label is 0;
  attribute ram_addr_end of RAM_reg_0_31_9_9 : label is 31;
  attribute ram_offset of RAM_reg_0_31_9_9 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_31_9_9 : label is 9;
  attribute ram_slice_end of RAM_reg_0_31_9_9 : label is 9;
begin
\ADDRESS[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state_reg_n_0,
      I1 => \ADDRESS_reg[4]_i_2_n_0\,
      I2 => RW_IBUF,
      O => \ADDRESS[4]_i_1_n_0\
    );
\ADDRESS[4]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => TORAM_IBUF(0),
      I1 => TORAM_IBUF(1),
      O => \ADDRESS[4]_i_10_n_0\
    );
\ADDRESS[4]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TORAM_IBUF(6),
      I1 => TORAM_IBUF(7),
      O => \ADDRESS[4]_i_11_n_0\
    );
\ADDRESS[4]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => TORAM_IBUF(4),
      I1 => TORAM_IBUF(5),
      O => \ADDRESS[4]_i_12_n_0\
    );
\ADDRESS[4]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => TORAM_IBUF(2),
      I1 => TORAM_IBUF(3),
      O => \ADDRESS[4]_i_13_n_0\
    );
\ADDRESS[4]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => TORAM_IBUF(0),
      I1 => TORAM_IBUF(1),
      O => \ADDRESS[4]_i_14_n_0\
    );
\ADDRESS[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TORAM_IBUF(14),
      I1 => TORAM_IBUF(15),
      O => \ADDRESS[4]_i_4_n_0\
    );
\ADDRESS[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TORAM_IBUF(12),
      I1 => TORAM_IBUF(13),
      O => \ADDRESS[4]_i_5_n_0\
    );
\ADDRESS[4]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TORAM_IBUF(10),
      I1 => TORAM_IBUF(11),
      O => \ADDRESS[4]_i_6_n_0\
    );
\ADDRESS[4]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TORAM_IBUF(8),
      I1 => TORAM_IBUF(9),
      O => \ADDRESS[4]_i_7_n_0\
    );
\ADDRESS[4]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TORAM_IBUF(4),
      I1 => TORAM_IBUF(5),
      O => \ADDRESS[4]_i_8_n_0\
    );
\ADDRESS[4]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => TORAM_IBUF(2),
      I1 => TORAM_IBUF(3),
      O => \ADDRESS[4]_i_9_n_0\
    );
\ADDRESS_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM_IBUF(0),
      Q => ADDRESS(0),
      R => '0'
    );
\ADDRESS_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM_IBUF(1),
      Q => ADDRESS(1),
      R => '0'
    );
\ADDRESS_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM_IBUF(2),
      Q => ADDRESS(2),
      R => '0'
    );
\ADDRESS_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM_IBUF(3),
      Q => ADDRESS(3),
      R => '0'
    );
\ADDRESS_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM_IBUF(4),
      Q => ADDRESS(4),
      R => '0'
    );
\ADDRESS_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ADDRESS_reg[4]_i_3_n_0\,
      CO(3) => \ADDRESS_reg[4]_i_2_n_0\,
      CO(2) => \ADDRESS_reg[4]_i_2_n_1\,
      CO(1) => \ADDRESS_reg[4]_i_2_n_2\,
      CO(0) => \ADDRESS_reg[4]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ADDRESS_reg[4]_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => \ADDRESS[4]_i_4_n_0\,
      S(2) => \ADDRESS[4]_i_5_n_0\,
      S(1) => \ADDRESS[4]_i_6_n_0\,
      S(0) => \ADDRESS[4]_i_7_n_0\
    );
\ADDRESS_reg[4]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ADDRESS_reg[4]_i_3_n_0\,
      CO(2) => \ADDRESS_reg[4]_i_3_n_1\,
      CO(1) => \ADDRESS_reg[4]_i_3_n_2\,
      CO(0) => \ADDRESS_reg[4]_i_3_n_3\,
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => \ADDRESS[4]_i_8_n_0\,
      DI(1) => \ADDRESS[4]_i_9_n_0\,
      DI(0) => \ADDRESS[4]_i_10_n_0\,
      O(3 downto 0) => \NLW_ADDRESS_reg[4]_i_3_O_UNCONNECTED\(3 downto 0),
      S(3) => \ADDRESS[4]_i_11_n_0\,
      S(2) => \ADDRESS[4]_i_12_n_0\,
      S(1) => \ADDRESS[4]_i_13_n_0\,
      S(0) => \ADDRESS[4]_i_14_n_0\
    );
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
FSM_RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => FSM_RESET,
      O => FSM_RESET_IBUF
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
      D => TORAM_IBUF(0),
      O => TOPORT0(0),
      WCLK => CLK_IBUF_BUFG,
      WE => p_0_in
    );
RAM_reg_0_31_0_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state_reg_n_0,
      I1 => RW_IBUF,
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
      D => TORAM_IBUF(10),
      O => TOPORT0(10),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(11),
      O => TOPORT0(11),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(12),
      O => TOPORT0(12),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(13),
      O => TOPORT0(13),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(14),
      O => TOPORT0(14),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(15),
      O => TOPORT0(15),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(1),
      O => TOPORT0(1),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(2),
      O => TOPORT0(2),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(3),
      O => TOPORT0(3),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(4),
      O => TOPORT0(4),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(5),
      O => TOPORT0(5),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(6),
      O => TOPORT0(6),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(7),
      O => TOPORT0(7),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(8),
      O => TOPORT0(8),
      WCLK => CLK_IBUF_BUFG,
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
      D => TORAM_IBUF(9),
      O => TOPORT0(9),
      WCLK => CLK_IBUF_BUFG,
      WE => p_0_in
    );
RW_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RW,
      O => RW_IBUF
    );
\TOPORT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(0),
      O => TOPORT(0)
    );
\TOPORT_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(10),
      O => TOPORT(10)
    );
\TOPORT_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(11),
      O => TOPORT(11)
    );
\TOPORT_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(12),
      O => TOPORT(12)
    );
\TOPORT_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(13),
      O => TOPORT(13)
    );
\TOPORT_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(14),
      O => TOPORT(14)
    );
\TOPORT_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(15),
      O => TOPORT(15)
    );
\TOPORT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(1),
      O => TOPORT(1)
    );
\TOPORT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(2),
      O => TOPORT(2)
    );
\TOPORT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(3),
      O => TOPORT(3)
    );
\TOPORT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(4),
      O => TOPORT(4)
    );
\TOPORT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(5),
      O => TOPORT(5)
    );
\TOPORT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(6),
      O => TOPORT(6)
    );
\TOPORT_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(7),
      O => TOPORT(7)
    );
\TOPORT_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(8),
      O => TOPORT(8)
    );
\TOPORT_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => TOPORT_OBUF(9),
      O => TOPORT(9)
    );
\TOPORT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(0),
      Q => TOPORT_OBUF(0),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(10),
      Q => TOPORT_OBUF(10),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(11),
      Q => TOPORT_OBUF(11),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(12),
      Q => TOPORT_OBUF(12),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(13),
      Q => TOPORT_OBUF(13),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(14),
      Q => TOPORT_OBUF(14),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(15),
      Q => TOPORT_OBUF(15),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(1),
      Q => TOPORT_OBUF(1),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(2),
      Q => TOPORT_OBUF(2),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(3),
      Q => TOPORT_OBUF(3),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(4),
      Q => TOPORT_OBUF(4),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(5),
      Q => TOPORT_OBUF(5),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(6),
      Q => TOPORT_OBUF(6),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(7),
      Q => TOPORT_OBUF(7),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(8),
      Q => TOPORT_OBUF(8),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TOPORT_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => RW_IBUF,
      D => TOPORT0(9),
      Q => TOPORT_OBUF(9),
      R => \ADDRESS[4]_i_1_n_0\
    );
\TORAM_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(0),
      O => TORAM_IBUF(0)
    );
\TORAM_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(10),
      O => TORAM_IBUF(10)
    );
\TORAM_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(11),
      O => TORAM_IBUF(11)
    );
\TORAM_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(12),
      O => TORAM_IBUF(12)
    );
\TORAM_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(13),
      O => TORAM_IBUF(13)
    );
\TORAM_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(14),
      O => TORAM_IBUF(14)
    );
\TORAM_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(15),
      O => TORAM_IBUF(15)
    );
\TORAM_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(1),
      O => TORAM_IBUF(1)
    );
\TORAM_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(2),
      O => TORAM_IBUF(2)
    );
\TORAM_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(3),
      O => TORAM_IBUF(3)
    );
\TORAM_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(4),
      O => TORAM_IBUF(4)
    );
\TORAM_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(5),
      O => TORAM_IBUF(5)
    );
\TORAM_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(6),
      O => TORAM_IBUF(6)
    );
\TORAM_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(7),
      O => TORAM_IBUF(7)
    );
\TORAM_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(8),
      O => TORAM_IBUF(8)
    );
\TORAM_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => TORAM(9),
      O => TORAM_IBUF(9)
    );
state_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => RW_IBUF,
      I1 => \ADDRESS_reg[4]_i_2_n_0\,
      I2 => state_reg_n_0,
      O => state_i_1_n_0
    );
state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => FSM_RESET_IBUF,
      D => state_i_1_n_0,
      Q => state_reg_n_0
    );
end STRUCTURE;
