-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Nov  6 19:40:22 2024
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
    i_CLK : in STD_LOGIC;
    i_RnW : in STD_LOGIC;
    i_FSM_RESET : in STD_LOGIC;
    i_TORAM : in STD_LOGIC_VECTOR ( 15 downto 0 );
    o_TOPORT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    i_DATA_FROM_IVSA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    o_ADDR_TO_IVSA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    o_CLK_TO_IVSA : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of IV_SAMPLE_CTRL : entity is true;
end IV_SAMPLE_CTRL;

architecture STRUCTURE of IV_SAMPLE_CTRL is
  signal \ADDR_u16[15]_i_1_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__0_i_1_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__0_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__10_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__11_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__12_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__13_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__14_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__15_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__16_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__17_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__18_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__19_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__1_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__20_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__21_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__22_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__23_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__24_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__25_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__26_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__27_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__28_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__29_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__2_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__30_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__3_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__4_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__5_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__6_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__7_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__8_n_0\ : STD_LOGIC;
  signal \RAM_reg_0_15_0_0__9_n_0\ : STD_LOGIC;
  signal RAM_reg_0_15_0_0_i_1_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_0_n_0 : STD_LOGIC;
  signal i_CLK_IBUF : STD_LOGIC;
  signal i_CLK_IBUF_BUFG : STD_LOGIC;
  signal i_DATA_FROM_IVSA_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal i_FSM_RESET_IBUF : STD_LOGIC;
  signal i_RnW_IBUF : STD_LOGIC;
  signal i_TORAM_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_ADDR_TO_IVSA_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_CLK_TO_IVSA_OBUF : STD_LOGIC;
  signal o_TOPORT_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \o_TOPORT_OBUF[15]_inst_i_2_n_0\ : STD_LOGIC;
  signal \o_TOPORT_OBUF[15]_inst_i_3_n_0\ : STD_LOGIC;
  signal \o_TOPORT_OBUF[15]_inst_i_4_n_0\ : STD_LOGIC;
  signal state_i_1_n_0 : STD_LOGIC;
  signal state_reg_n_0 : STD_LOGIC;
  signal w_DATA_INT_MEM0 : STD_LOGIC;
  signal w_DATA_INT_MEM1 : STD_LOGIC;
  signal \w_DATA_INT_MEM[0]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[10]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[11]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[12]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[13]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[14]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[15]_i_2_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[15]_i_3_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[15]_i_4_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[15]_i_5_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[1]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[2]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[3]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[4]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[5]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[6]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[7]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[8]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM[9]_i_1_n_0\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[0]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[10]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[11]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[12]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[13]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[14]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[15]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[1]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[2]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[3]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[4]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[5]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[6]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[7]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[8]\ : STD_LOGIC;
  signal \w_DATA_INT_MEM_reg_n_0_[9]\ : STD_LOGIC;
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_15_0_0 : label is 384;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_15_0_0 : label is "RAM_reg";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of RAM_reg_0_15_0_0 : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of RAM_reg_0_15_0_0 : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of RAM_reg_0_15_0_0 : label is "GND:A4";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_15_0_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_15_0_0 : label is 15;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_15_0_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_15_0_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_15_0_0 : label is 0;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__0\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__0\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__0\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__0\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__0\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__0\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__0\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__0\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__0\ : label is 0;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__0\ : label is 0;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__1\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__1\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__1\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__1\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__1\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__1\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__1\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__1\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__1\ : label is 1;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__1\ : label is 1;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__10\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__10\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__10\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__10\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__10\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__10\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__10\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__10\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__10\ : label is 5;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__10\ : label is 5;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__11\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__11\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__11\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__11\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__11\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__11\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__11\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__11\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__11\ : label is 6;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__11\ : label is 6;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__12\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__12\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__12\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__12\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__12\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__12\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__12\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__12\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__12\ : label is 6;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__12\ : label is 6;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__13\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__13\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__13\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__13\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__13\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__13\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__13\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__13\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__13\ : label is 7;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__13\ : label is 7;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__14\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__14\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__14\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__14\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__14\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__14\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__14\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__14\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__14\ : label is 7;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__14\ : label is 7;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__15\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__15\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__15\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__15\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__15\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__15\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__15\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__15\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__15\ : label is 8;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__15\ : label is 8;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__16\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__16\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__16\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__16\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__16\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__16\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__16\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__16\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__16\ : label is 8;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__16\ : label is 8;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__17\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__17\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__17\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__17\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__17\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__17\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__17\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__17\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__17\ : label is 9;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__17\ : label is 9;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__18\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__18\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__18\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__18\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__18\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__18\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__18\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__18\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__18\ : label is 9;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__18\ : label is 9;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__19\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__19\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__19\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__19\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__19\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__19\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__19\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__19\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__19\ : label is 10;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__19\ : label is 10;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__2\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__2\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__2\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__2\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__2\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__2\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__2\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__2\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__2\ : label is 1;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__2\ : label is 1;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__20\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__20\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__20\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__20\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__20\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__20\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__20\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__20\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__20\ : label is 10;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__20\ : label is 10;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__21\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__21\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__21\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__21\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__21\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__21\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__21\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__21\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__21\ : label is 11;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__21\ : label is 11;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__22\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__22\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__22\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__22\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__22\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__22\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__22\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__22\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__22\ : label is 11;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__22\ : label is 11;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__23\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__23\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__23\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__23\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__23\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__23\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__23\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__23\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__23\ : label is 12;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__23\ : label is 12;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__24\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__24\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__24\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__24\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__24\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__24\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__24\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__24\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__24\ : label is 12;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__24\ : label is 12;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__25\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__25\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__25\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__25\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__25\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__25\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__25\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__25\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__25\ : label is 13;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__25\ : label is 13;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__26\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__26\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__26\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__26\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__26\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__26\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__26\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__26\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__26\ : label is 13;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__26\ : label is 13;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__27\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__27\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__27\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__27\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__27\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__27\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__27\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__27\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__27\ : label is 14;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__27\ : label is 14;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__28\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__28\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__28\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__28\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__28\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__28\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__28\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__28\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__28\ : label is 14;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__28\ : label is 14;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__29\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__29\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__29\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__29\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__29\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__29\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__29\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__29\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__29\ : label is 15;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__29\ : label is 15;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__3\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__3\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__3\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__3\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__3\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__3\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__3\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__3\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__3\ : label is 2;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__3\ : label is 2;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__30\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__30\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__30\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__30\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__30\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__30\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__30\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__30\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__30\ : label is 15;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__30\ : label is 15;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__4\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__4\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__4\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__4\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__4\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__4\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__4\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__4\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__4\ : label is 2;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__4\ : label is 2;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__5\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__5\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__5\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__5\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__5\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__5\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__5\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__5\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__5\ : label is 3;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__5\ : label is 3;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__6\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__6\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__6\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__6\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__6\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__6\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__6\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__6\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__6\ : label is 3;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__6\ : label is 3;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__7\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__7\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__7\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__7\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__7\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__7\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__7\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__7\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__7\ : label is 4;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__7\ : label is 4;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__8\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__8\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__8\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__8\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__8\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__8\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__8\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__8\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__8\ : label is 4;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__8\ : label is 4;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__9\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__9\ : label is "RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__9\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__9\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__9\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__9\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__9\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__9\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__9\ : label is 5;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__9\ : label is 5;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[15]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \w_DATA_INT_MEM[9]_i_1\ : label is "soft_lutpair4";
begin
\ADDR_u16[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => w_DATA_INT_MEM0,
      I1 => i_RnW_IBUF,
      O => \ADDR_u16[15]_i_1_n_0\
    );
\ADDR_u16_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(0),
      Q => o_ADDR_TO_IVSA_OBUF(0),
      R => '0'
    );
\ADDR_u16_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(10),
      Q => o_ADDR_TO_IVSA_OBUF(10),
      R => '0'
    );
\ADDR_u16_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(11),
      Q => o_ADDR_TO_IVSA_OBUF(11),
      R => '0'
    );
\ADDR_u16_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(12),
      Q => o_ADDR_TO_IVSA_OBUF(12),
      R => '0'
    );
\ADDR_u16_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(13),
      Q => o_ADDR_TO_IVSA_OBUF(13),
      R => '0'
    );
\ADDR_u16_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(14),
      Q => o_ADDR_TO_IVSA_OBUF(14),
      R => '0'
    );
\ADDR_u16_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(15),
      Q => o_ADDR_TO_IVSA_OBUF(15),
      R => '0'
    );
\ADDR_u16_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(1),
      Q => o_ADDR_TO_IVSA_OBUF(1),
      R => '0'
    );
\ADDR_u16_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(2),
      Q => o_ADDR_TO_IVSA_OBUF(2),
      R => '0'
    );
\ADDR_u16_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(3),
      Q => o_ADDR_TO_IVSA_OBUF(3),
      R => '0'
    );
\ADDR_u16_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(4),
      Q => o_ADDR_TO_IVSA_OBUF(4),
      R => '0'
    );
\ADDR_u16_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(5),
      Q => o_ADDR_TO_IVSA_OBUF(5),
      R => '0'
    );
\ADDR_u16_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(6),
      Q => o_ADDR_TO_IVSA_OBUF(6),
      R => '0'
    );
\ADDR_u16_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(7),
      Q => o_ADDR_TO_IVSA_OBUF(7),
      R => '0'
    );
\ADDR_u16_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(8),
      Q => o_ADDR_TO_IVSA_OBUF(8),
      R => '0'
    );
\ADDR_u16_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \ADDR_u16[15]_i_1_n_0\,
      D => i_TORAM_IBUF(9),
      Q => o_ADDR_TO_IVSA_OBUF(9),
      R => '0'
    );
RAM_reg_0_15_0_0: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(0),
      O => RAM_reg_0_15_0_0_n_0,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__0\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(0),
      O => \RAM_reg_0_15_0_0__0_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => w_DATA_INT_MEM0,
      I1 => state_reg_n_0,
      I2 => i_RnW_IBUF,
      I3 => o_ADDR_TO_IVSA_OBUF(4),
      O => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__1\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(1),
      O => \RAM_reg_0_15_0_0__1_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__10\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(5),
      O => \RAM_reg_0_15_0_0__10_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__11\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(6),
      O => \RAM_reg_0_15_0_0__11_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__12\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(6),
      O => \RAM_reg_0_15_0_0__12_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__13\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(7),
      O => \RAM_reg_0_15_0_0__13_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__14\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(7),
      O => \RAM_reg_0_15_0_0__14_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__15\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(8),
      O => \RAM_reg_0_15_0_0__15_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__16\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(8),
      O => \RAM_reg_0_15_0_0__16_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__17\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(9),
      O => \RAM_reg_0_15_0_0__17_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__18\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(9),
      O => \RAM_reg_0_15_0_0__18_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__19\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(10),
      O => \RAM_reg_0_15_0_0__19_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__2\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(1),
      O => \RAM_reg_0_15_0_0__2_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__20\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(10),
      O => \RAM_reg_0_15_0_0__20_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__21\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(11),
      O => \RAM_reg_0_15_0_0__21_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__22\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(11),
      O => \RAM_reg_0_15_0_0__22_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__23\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(12),
      O => \RAM_reg_0_15_0_0__23_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__24\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(12),
      O => \RAM_reg_0_15_0_0__24_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__25\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(13),
      O => \RAM_reg_0_15_0_0__25_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__26\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(13),
      O => \RAM_reg_0_15_0_0__26_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__27\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(14),
      O => \RAM_reg_0_15_0_0__27_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__28\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(14),
      O => \RAM_reg_0_15_0_0__28_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__29\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(15),
      O => \RAM_reg_0_15_0_0__29_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__3\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(2),
      O => \RAM_reg_0_15_0_0__3_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__30\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(15),
      O => \RAM_reg_0_15_0_0__30_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__4\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(2),
      O => \RAM_reg_0_15_0_0__4_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__5\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(3),
      O => \RAM_reg_0_15_0_0__5_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__6\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(3),
      O => \RAM_reg_0_15_0_0__6_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__7\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(4),
      O => \RAM_reg_0_15_0_0__7_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__8\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(4),
      O => \RAM_reg_0_15_0_0__8_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__9\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => o_ADDR_TO_IVSA_OBUF(0),
      A1 => o_ADDR_TO_IVSA_OBUF(1),
      A2 => o_ADDR_TO_IVSA_OBUF(2),
      A3 => o_ADDR_TO_IVSA_OBUF(3),
      A4 => '0',
      D => i_TORAM_IBUF(5),
      O => \RAM_reg_0_15_0_0__9_n_0\,
      WCLK => i_CLK_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
RAM_reg_0_15_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => w_DATA_INT_MEM0,
      I1 => state_reg_n_0,
      I2 => i_RnW_IBUF,
      I3 => o_ADDR_TO_IVSA_OBUF(4),
      O => RAM_reg_0_15_0_0_i_1_n_0
    );
i_CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_CLK_IBUF,
      O => i_CLK_IBUF_BUFG
    );
i_CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_CLK,
      O => i_CLK_IBUF
    );
\i_DATA_FROM_IVSA_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(0),
      O => i_DATA_FROM_IVSA_IBUF(0)
    );
\i_DATA_FROM_IVSA_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(10),
      O => i_DATA_FROM_IVSA_IBUF(10)
    );
\i_DATA_FROM_IVSA_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(11),
      O => i_DATA_FROM_IVSA_IBUF(11)
    );
\i_DATA_FROM_IVSA_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(12),
      O => i_DATA_FROM_IVSA_IBUF(12)
    );
\i_DATA_FROM_IVSA_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(13),
      O => i_DATA_FROM_IVSA_IBUF(13)
    );
\i_DATA_FROM_IVSA_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(14),
      O => i_DATA_FROM_IVSA_IBUF(14)
    );
\i_DATA_FROM_IVSA_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(15),
      O => i_DATA_FROM_IVSA_IBUF(15)
    );
\i_DATA_FROM_IVSA_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(1),
      O => i_DATA_FROM_IVSA_IBUF(1)
    );
\i_DATA_FROM_IVSA_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(2),
      O => i_DATA_FROM_IVSA_IBUF(2)
    );
\i_DATA_FROM_IVSA_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(3),
      O => i_DATA_FROM_IVSA_IBUF(3)
    );
\i_DATA_FROM_IVSA_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(4),
      O => i_DATA_FROM_IVSA_IBUF(4)
    );
\i_DATA_FROM_IVSA_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(5),
      O => i_DATA_FROM_IVSA_IBUF(5)
    );
\i_DATA_FROM_IVSA_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(6),
      O => i_DATA_FROM_IVSA_IBUF(6)
    );
\i_DATA_FROM_IVSA_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(7),
      O => i_DATA_FROM_IVSA_IBUF(7)
    );
\i_DATA_FROM_IVSA_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(8),
      O => i_DATA_FROM_IVSA_IBUF(8)
    );
\i_DATA_FROM_IVSA_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FROM_IVSA(9),
      O => i_DATA_FROM_IVSA_IBUF(9)
    );
i_FSM_RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_FSM_RESET,
      O => i_FSM_RESET_IBUF
    );
i_RnW_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_RnW,
      O => i_RnW_IBUF
    );
\i_TORAM_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(0),
      O => i_TORAM_IBUF(0)
    );
\i_TORAM_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(10),
      O => i_TORAM_IBUF(10)
    );
\i_TORAM_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(11),
      O => i_TORAM_IBUF(11)
    );
\i_TORAM_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(12),
      O => i_TORAM_IBUF(12)
    );
\i_TORAM_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(13),
      O => i_TORAM_IBUF(13)
    );
\i_TORAM_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(14),
      O => i_TORAM_IBUF(14)
    );
\i_TORAM_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(15),
      O => i_TORAM_IBUF(15)
    );
\i_TORAM_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(1),
      O => i_TORAM_IBUF(1)
    );
\i_TORAM_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(2),
      O => i_TORAM_IBUF(2)
    );
\i_TORAM_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(3),
      O => i_TORAM_IBUF(3)
    );
\i_TORAM_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(4),
      O => i_TORAM_IBUF(4)
    );
\i_TORAM_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(5),
      O => i_TORAM_IBUF(5)
    );
\i_TORAM_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(6),
      O => i_TORAM_IBUF(6)
    );
\i_TORAM_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(7),
      O => i_TORAM_IBUF(7)
    );
\i_TORAM_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(8),
      O => i_TORAM_IBUF(8)
    );
\i_TORAM_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_TORAM(9),
      O => i_TORAM_IBUF(9)
    );
\o_ADDR_TO_IVSA_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(0),
      O => o_ADDR_TO_IVSA(0)
    );
\o_ADDR_TO_IVSA_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(10),
      O => o_ADDR_TO_IVSA(10)
    );
\o_ADDR_TO_IVSA_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(11),
      O => o_ADDR_TO_IVSA(11)
    );
\o_ADDR_TO_IVSA_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(12),
      O => o_ADDR_TO_IVSA(12)
    );
\o_ADDR_TO_IVSA_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(13),
      O => o_ADDR_TO_IVSA(13)
    );
\o_ADDR_TO_IVSA_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(14),
      O => o_ADDR_TO_IVSA(14)
    );
\o_ADDR_TO_IVSA_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(15),
      O => o_ADDR_TO_IVSA(15)
    );
\o_ADDR_TO_IVSA_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(1),
      O => o_ADDR_TO_IVSA(1)
    );
\o_ADDR_TO_IVSA_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(2),
      O => o_ADDR_TO_IVSA(2)
    );
\o_ADDR_TO_IVSA_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(3),
      O => o_ADDR_TO_IVSA(3)
    );
\o_ADDR_TO_IVSA_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(4),
      O => o_ADDR_TO_IVSA(4)
    );
\o_ADDR_TO_IVSA_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(5),
      O => o_ADDR_TO_IVSA(5)
    );
\o_ADDR_TO_IVSA_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(6),
      O => o_ADDR_TO_IVSA(6)
    );
\o_ADDR_TO_IVSA_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(7),
      O => o_ADDR_TO_IVSA(7)
    );
\o_ADDR_TO_IVSA_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(8),
      O => o_ADDR_TO_IVSA(8)
    );
\o_ADDR_TO_IVSA_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_IVSA_OBUF(9),
      O => o_ADDR_TO_IVSA(9)
    );
o_CLK_TO_IVSA_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_CLK_TO_IVSA_OBUF,
      O => o_CLK_TO_IVSA
    );
o_CLK_TO_IVSA_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I1 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => i_RnW_IBUF,
      I4 => i_CLK_IBUF,
      O => o_CLK_TO_IVSA_OBUF
    );
\o_TOPORT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(0),
      O => o_TOPORT(0)
    );
\o_TOPORT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(0),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[0]\,
      O => o_TOPORT_OBUF(0)
    );
\o_TOPORT_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(10),
      O => o_TOPORT(10)
    );
\o_TOPORT_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(10),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[10]\,
      O => o_TOPORT_OBUF(10)
    );
\o_TOPORT_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(11),
      O => o_TOPORT(11)
    );
\o_TOPORT_OBUF[11]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(11),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[11]\,
      O => o_TOPORT_OBUF(11)
    );
\o_TOPORT_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(12),
      O => o_TOPORT(12)
    );
\o_TOPORT_OBUF[12]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(12),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[12]\,
      O => o_TOPORT_OBUF(12)
    );
\o_TOPORT_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(13),
      O => o_TOPORT(13)
    );
\o_TOPORT_OBUF[13]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(13),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[13]\,
      O => o_TOPORT_OBUF(13)
    );
\o_TOPORT_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(14),
      O => o_TOPORT(14)
    );
\o_TOPORT_OBUF[14]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(14),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[14]\,
      O => o_TOPORT_OBUF(14)
    );
\o_TOPORT_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(15),
      O => o_TOPORT(15)
    );
\o_TOPORT_OBUF[15]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(15),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[15]\,
      O => o_TOPORT_OBUF(15)
    );
\o_TOPORT_OBUF[15]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => o_ADDR_TO_IVSA_OBUF(10),
      I1 => o_ADDR_TO_IVSA_OBUF(9),
      I2 => o_ADDR_TO_IVSA_OBUF(12),
      I3 => o_ADDR_TO_IVSA_OBUF(11),
      O => \o_TOPORT_OBUF[15]_inst_i_2_n_0\
    );
\o_TOPORT_OBUF[15]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
        port map (
      I0 => o_ADDR_TO_IVSA_OBUF(14),
      I1 => o_ADDR_TO_IVSA_OBUF(13),
      I2 => o_ADDR_TO_IVSA_OBUF(4),
      I3 => o_ADDR_TO_IVSA_OBUF(3),
      I4 => o_ADDR_TO_IVSA_OBUF(15),
      O => \o_TOPORT_OBUF[15]_inst_i_3_n_0\
    );
\o_TOPORT_OBUF[15]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => o_ADDR_TO_IVSA_OBUF(6),
      I1 => o_ADDR_TO_IVSA_OBUF(5),
      I2 => o_ADDR_TO_IVSA_OBUF(8),
      I3 => o_ADDR_TO_IVSA_OBUF(7),
      O => \o_TOPORT_OBUF[15]_inst_i_4_n_0\
    );
\o_TOPORT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(1),
      O => o_TOPORT(1)
    );
\o_TOPORT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(1),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[1]\,
      O => o_TOPORT_OBUF(1)
    );
\o_TOPORT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(2),
      O => o_TOPORT(2)
    );
\o_TOPORT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(2),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[2]\,
      O => o_TOPORT_OBUF(2)
    );
\o_TOPORT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(3),
      O => o_TOPORT(3)
    );
\o_TOPORT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(3),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[3]\,
      O => o_TOPORT_OBUF(3)
    );
\o_TOPORT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(4),
      O => o_TOPORT(4)
    );
\o_TOPORT_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(4),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[4]\,
      O => o_TOPORT_OBUF(4)
    );
\o_TOPORT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(5),
      O => o_TOPORT(5)
    );
\o_TOPORT_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(5),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[5]\,
      O => o_TOPORT_OBUF(5)
    );
\o_TOPORT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(6),
      O => o_TOPORT(6)
    );
\o_TOPORT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(6),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[6]\,
      O => o_TOPORT_OBUF(6)
    );
\o_TOPORT_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(7),
      O => o_TOPORT(7)
    );
\o_TOPORT_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(7),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[7]\,
      O => o_TOPORT_OBUF(7)
    );
\o_TOPORT_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(8),
      O => o_TOPORT(8)
    );
\o_TOPORT_OBUF[8]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(8),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[8]\,
      O => o_TOPORT_OBUF(8)
    );
\o_TOPORT_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_TOPORT_OBUF(9),
      O => o_TOPORT(9)
    );
\o_TOPORT_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88888880"
    )
        port map (
      I0 => i_DATA_FROM_IVSA_IBUF(9),
      I1 => i_RnW_IBUF,
      I2 => \o_TOPORT_OBUF[15]_inst_i_2_n_0\,
      I3 => \o_TOPORT_OBUF[15]_inst_i_3_n_0\,
      I4 => \o_TOPORT_OBUF[15]_inst_i_4_n_0\,
      I5 => \w_DATA_INT_MEM_reg_n_0_[9]\,
      O => o_TOPORT_OBUF(9)
    );
state_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"24"
    )
        port map (
      I0 => state_reg_n_0,
      I1 => w_DATA_INT_MEM1,
      I2 => i_RnW_IBUF,
      O => state_i_1_n_0
    );
state_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000007"
    )
        port map (
      I0 => i_TORAM_IBUF(3),
      I1 => i_TORAM_IBUF(4),
      I2 => \w_DATA_INT_MEM[15]_i_5_n_0\,
      I3 => \w_DATA_INT_MEM[15]_i_4_n_0\,
      I4 => \w_DATA_INT_MEM[15]_i_3_n_0\,
      O => w_DATA_INT_MEM1
    );
state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      CLR => i_FSM_RESET_IBUF,
      D => state_i_1_n_0,
      Q => state_reg_n_0
    );
\w_DATA_INT_MEM[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__0_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => RAM_reg_0_15_0_0_n_0,
      O => \w_DATA_INT_MEM[0]_i_1_n_0\
    );
\w_DATA_INT_MEM[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__20_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__19_n_0\,
      O => \w_DATA_INT_MEM[10]_i_1_n_0\
    );
\w_DATA_INT_MEM[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__22_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__21_n_0\,
      O => \w_DATA_INT_MEM[11]_i_1_n_0\
    );
\w_DATA_INT_MEM[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__24_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__23_n_0\,
      O => \w_DATA_INT_MEM[12]_i_1_n_0\
    );
\w_DATA_INT_MEM[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__26_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__25_n_0\,
      O => \w_DATA_INT_MEM[13]_i_1_n_0\
    );
\w_DATA_INT_MEM[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__28_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__27_n_0\,
      O => \w_DATA_INT_MEM[14]_i_1_n_0\
    );
\w_DATA_INT_MEM[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200020002"
    )
        port map (
      I0 => i_RnW_IBUF,
      I1 => \w_DATA_INT_MEM[15]_i_3_n_0\,
      I2 => \w_DATA_INT_MEM[15]_i_4_n_0\,
      I3 => \w_DATA_INT_MEM[15]_i_5_n_0\,
      I4 => i_TORAM_IBUF(4),
      I5 => i_TORAM_IBUF(3),
      O => w_DATA_INT_MEM0
    );
\w_DATA_INT_MEM[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__30_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__29_n_0\,
      O => \w_DATA_INT_MEM[15]_i_2_n_0\
    );
\w_DATA_INT_MEM[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => i_TORAM_IBUF(5),
      I1 => i_TORAM_IBUF(7),
      I2 => i_TORAM_IBUF(6),
      O => \w_DATA_INT_MEM[15]_i_3_n_0\
    );
\w_DATA_INT_MEM[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => i_TORAM_IBUF(13),
      I1 => i_TORAM_IBUF(12),
      I2 => i_TORAM_IBUF(15),
      I3 => i_TORAM_IBUF(14),
      O => \w_DATA_INT_MEM[15]_i_4_n_0\
    );
\w_DATA_INT_MEM[15]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => i_TORAM_IBUF(9),
      I1 => i_TORAM_IBUF(8),
      I2 => i_TORAM_IBUF(11),
      I3 => i_TORAM_IBUF(10),
      O => \w_DATA_INT_MEM[15]_i_5_n_0\
    );
\w_DATA_INT_MEM[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__2_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__1_n_0\,
      O => \w_DATA_INT_MEM[1]_i_1_n_0\
    );
\w_DATA_INT_MEM[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__4_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__3_n_0\,
      O => \w_DATA_INT_MEM[2]_i_1_n_0\
    );
\w_DATA_INT_MEM[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__6_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__5_n_0\,
      O => \w_DATA_INT_MEM[3]_i_1_n_0\
    );
\w_DATA_INT_MEM[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__8_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__7_n_0\,
      O => \w_DATA_INT_MEM[4]_i_1_n_0\
    );
\w_DATA_INT_MEM[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__10_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__9_n_0\,
      O => \w_DATA_INT_MEM[5]_i_1_n_0\
    );
\w_DATA_INT_MEM[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__12_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__11_n_0\,
      O => \w_DATA_INT_MEM[6]_i_1_n_0\
    );
\w_DATA_INT_MEM[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__14_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__13_n_0\,
      O => \w_DATA_INT_MEM[7]_i_1_n_0\
    );
\w_DATA_INT_MEM[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__16_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__15_n_0\,
      O => \w_DATA_INT_MEM[8]_i_1_n_0\
    );
\w_DATA_INT_MEM[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__18_n_0\,
      I1 => o_ADDR_TO_IVSA_OBUF(4),
      I2 => \RAM_reg_0_15_0_0__17_n_0\,
      O => \w_DATA_INT_MEM[9]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[0]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[0]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[10]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[10]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[11]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[11]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[12]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[12]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[13]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[13]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[14]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[14]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[15]_i_2_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[15]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[1]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[1]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[2]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[2]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[3]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[3]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[4]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[4]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[5]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[5]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[6]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[6]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[7]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[7]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[8]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[8]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
\w_DATA_INT_MEM_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_DATA_INT_MEM0,
      D => \w_DATA_INT_MEM[9]_i_1_n_0\,
      Q => \w_DATA_INT_MEM_reg_n_0_[9]\,
      R => \ADDR_u16[15]_i_1_n_0\
    );
end STRUCTURE;
