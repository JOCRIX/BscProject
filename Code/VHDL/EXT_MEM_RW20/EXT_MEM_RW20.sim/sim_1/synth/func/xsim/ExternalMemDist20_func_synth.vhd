-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Nov  9 00:32:48 2024
-- Host        : DESKTOP-S99FO1K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/EXT_MEM_RW20/EXT_MEM_RW20.sim/sim_1/synth/func/xsim/ExternalMemDist20_func_synth.vhd
-- Design      : ExternalMemDist20
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ExternalMemDist20 is
  port (
    i_CLK : in STD_LOGIC;
    i_DATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    i_ADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    o_ADDR : out STD_LOGIC_VECTOR ( 18 downto 0 );
    o_DATA_EMEM : out STD_LOGIC_VECTOR ( 7 downto 0 );
    i_DATA_EMEM : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    i_SET : in STD_LOGIC;
    o_SET : out STD_LOGIC;
    i_HOLD : in STD_LOGIC;
    i_RnW : in STD_LOGIC;
    o_RnW : out STD_LOGIC;
    i_RESET : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ExternalMemDist20 : entity is true;
end ExternalMemDist20;

architecture STRUCTURE of ExternalMemDist20 is
  signal i_ADDR_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal i_CLK_IBUF : STD_LOGIC;
  signal i_CLK_IBUF_BUFG : STD_LOGIC;
  signal i_DATA_EMEM_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_DATA_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal i_HOLD_IBUF : STD_LOGIC;
  signal i_RESET_IBUF : STD_LOGIC;
  signal i_SET_IBUF : STD_LOGIC;
  signal i_SET_IBUF_BUFG : STD_LOGIC;
  signal \o_ADDR[18]_i_1_n_0\ : STD_LOGIC;
  signal o_ADDR_OBUF : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \o_DATA_EMEM[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[1]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[4]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[5]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[6]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[7]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_EMEM[7]_i_2_n_0\ : STD_LOGIC;
  signal o_DATA_EMEM_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_DATA_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_RnW_OBUF : STD_LOGIC;
  signal o_SET_OBUF : STD_LOGIC;
  signal o_SET_i_2_n_0 : STD_LOGIC;
  signal o_SET_i_3_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \s_byte[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_byte[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_byte[2]_i_1_n_0\ : STD_LOGIC;
  signal \s_byte_reg_n_0_[0]\ : STD_LOGIC;
  signal \s_byte_reg_n_0_[1]\ : STD_LOGIC;
  signal \s_byte_reg_n_0_[2]\ : STD_LOGIC;
  signal w_CMPLT_i_1_n_0 : STD_LOGIC;
  signal w_CMPLT_reg_n_0 : STD_LOGIC;
  signal w_RUN : STD_LOGIC;
  signal w_RUN_i_1_n_0 : STD_LOGIC;
  signal w_iHiBYTE : STD_LOGIC;
  signal w_iLoBYTE : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_DATA_EMEM[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_DATA_EMEM[7]_i_2\ : label is "soft_lutpair3";
begin
\i_ADDR_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(0),
      O => i_ADDR_IBUF(0)
    );
\i_ADDR_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(10),
      O => i_ADDR_IBUF(10)
    );
\i_ADDR_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(11),
      O => i_ADDR_IBUF(11)
    );
\i_ADDR_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(12),
      O => i_ADDR_IBUF(12)
    );
\i_ADDR_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(13),
      O => i_ADDR_IBUF(13)
    );
\i_ADDR_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(14),
      O => i_ADDR_IBUF(14)
    );
\i_ADDR_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(15),
      O => i_ADDR_IBUF(15)
    );
\i_ADDR_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(1),
      O => i_ADDR_IBUF(1)
    );
\i_ADDR_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(2),
      O => i_ADDR_IBUF(2)
    );
\i_ADDR_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(3),
      O => i_ADDR_IBUF(3)
    );
\i_ADDR_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(4),
      O => i_ADDR_IBUF(4)
    );
\i_ADDR_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(5),
      O => i_ADDR_IBUF(5)
    );
\i_ADDR_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(6),
      O => i_ADDR_IBUF(6)
    );
\i_ADDR_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(7),
      O => i_ADDR_IBUF(7)
    );
\i_ADDR_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(8),
      O => i_ADDR_IBUF(8)
    );
\i_ADDR_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_ADDR(9),
      O => i_ADDR_IBUF(9)
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
\i_DATA_EMEM_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(0),
      O => i_DATA_EMEM_IBUF(0)
    );
\i_DATA_EMEM_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(1),
      O => i_DATA_EMEM_IBUF(1)
    );
\i_DATA_EMEM_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(2),
      O => i_DATA_EMEM_IBUF(2)
    );
\i_DATA_EMEM_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(3),
      O => i_DATA_EMEM_IBUF(3)
    );
\i_DATA_EMEM_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(4),
      O => i_DATA_EMEM_IBUF(4)
    );
\i_DATA_EMEM_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(5),
      O => i_DATA_EMEM_IBUF(5)
    );
\i_DATA_EMEM_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(6),
      O => i_DATA_EMEM_IBUF(6)
    );
\i_DATA_EMEM_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_EMEM(7),
      O => i_DATA_EMEM_IBUF(7)
    );
\i_DATA_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(0),
      O => i_DATA_IBUF(0)
    );
\i_DATA_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(10),
      O => i_DATA_IBUF(10)
    );
\i_DATA_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(11),
      O => i_DATA_IBUF(11)
    );
\i_DATA_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(12),
      O => i_DATA_IBUF(12)
    );
\i_DATA_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(13),
      O => i_DATA_IBUF(13)
    );
\i_DATA_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(14),
      O => i_DATA_IBUF(14)
    );
\i_DATA_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(15),
      O => i_DATA_IBUF(15)
    );
\i_DATA_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(1),
      O => i_DATA_IBUF(1)
    );
\i_DATA_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(2),
      O => i_DATA_IBUF(2)
    );
\i_DATA_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(3),
      O => i_DATA_IBUF(3)
    );
\i_DATA_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(4),
      O => i_DATA_IBUF(4)
    );
\i_DATA_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(5),
      O => i_DATA_IBUF(5)
    );
\i_DATA_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(6),
      O => i_DATA_IBUF(6)
    );
\i_DATA_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(7),
      O => i_DATA_IBUF(7)
    );
\i_DATA_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(8),
      O => i_DATA_IBUF(8)
    );
\i_DATA_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(9),
      O => i_DATA_IBUF(9)
    );
i_HOLD_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_HOLD,
      O => i_HOLD_IBUF
    );
i_RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_RESET,
      O => i_RESET_IBUF
    );
i_RnW_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_RnW,
      O => o_RnW_OBUF
    );
i_SET_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_SET_IBUF,
      O => i_SET_IBUF_BUFG
    );
i_SET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_SET,
      O => i_SET_IBUF
    );
\o_ADDR[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000222"
    )
        port map (
      I0 => w_RUN,
      I1 => i_HOLD_IBUF,
      I2 => \s_byte_reg_n_0_[1]\,
      I3 => o_RnW_OBUF,
      I4 => \s_byte_reg_n_0_[2]\,
      I5 => \s_byte_reg_n_0_[0]\,
      O => \o_ADDR[18]_i_1_n_0\
    );
\o_ADDR_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(0),
      O => o_ADDR(0)
    );
\o_ADDR_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(10),
      O => o_ADDR(10)
    );
\o_ADDR_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(11),
      O => o_ADDR(11)
    );
\o_ADDR_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(12),
      O => o_ADDR(12)
    );
\o_ADDR_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(13),
      O => o_ADDR(13)
    );
\o_ADDR_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(14),
      O => o_ADDR(14)
    );
\o_ADDR_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(15),
      O => o_ADDR(15)
    );
\o_ADDR_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_ADDR(16)
    );
\o_ADDR_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_ADDR(17)
    );
\o_ADDR_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(18),
      O => o_ADDR(18)
    );
\o_ADDR_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(1),
      O => o_ADDR(1)
    );
\o_ADDR_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(2),
      O => o_ADDR(2)
    );
\o_ADDR_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(3),
      O => o_ADDR(3)
    );
\o_ADDR_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(4),
      O => o_ADDR(4)
    );
\o_ADDR_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(5),
      O => o_ADDR(5)
    );
\o_ADDR_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(6),
      O => o_ADDR(6)
    );
\o_ADDR_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(7),
      O => o_ADDR(7)
    );
\o_ADDR_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(8),
      O => o_ADDR(8)
    );
\o_ADDR_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_OBUF(9),
      O => o_ADDR(9)
    );
\o_ADDR_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(0),
      Q => o_ADDR_OBUF(0),
      R => '0'
    );
\o_ADDR_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(10),
      Q => o_ADDR_OBUF(10),
      R => '0'
    );
\o_ADDR_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(11),
      Q => o_ADDR_OBUF(11),
      R => '0'
    );
\o_ADDR_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(12),
      Q => o_ADDR_OBUF(12),
      R => '0'
    );
\o_ADDR_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(13),
      Q => o_ADDR_OBUF(13),
      R => '0'
    );
\o_ADDR_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(14),
      Q => o_ADDR_OBUF(14),
      R => '0'
    );
\o_ADDR_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(15),
      Q => o_ADDR_OBUF(15),
      R => '0'
    );
\o_ADDR_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => \s_byte_reg_n_0_[1]\,
      Q => o_ADDR_OBUF(18),
      R => '0'
    );
\o_ADDR_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(1),
      Q => o_ADDR_OBUF(1),
      R => '0'
    );
\o_ADDR_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(2),
      Q => o_ADDR_OBUF(2),
      R => '0'
    );
\o_ADDR_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(3),
      Q => o_ADDR_OBUF(3),
      R => '0'
    );
\o_ADDR_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(4),
      Q => o_ADDR_OBUF(4),
      R => '0'
    );
\o_ADDR_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(5),
      Q => o_ADDR_OBUF(5),
      R => '0'
    );
\o_ADDR_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(6),
      Q => o_ADDR_OBUF(6),
      R => '0'
    );
\o_ADDR_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(7),
      Q => o_ADDR_OBUF(7),
      R => '0'
    );
\o_ADDR_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(8),
      Q => o_ADDR_OBUF(8),
      R => '0'
    );
\o_ADDR_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_ADDR[18]_i_1_n_0\,
      D => i_ADDR_IBUF(9),
      Q => o_ADDR_OBUF(9),
      R => '0'
    );
\o_DATA_EMEM[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(8),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(0),
      O => \o_DATA_EMEM[0]_i_1_n_0\
    );
\o_DATA_EMEM[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(9),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(1),
      O => \o_DATA_EMEM[1]_i_1_n_0\
    );
\o_DATA_EMEM[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(10),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(2),
      O => \o_DATA_EMEM[2]_i_1_n_0\
    );
\o_DATA_EMEM[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(11),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(3),
      O => \o_DATA_EMEM[3]_i_1_n_0\
    );
\o_DATA_EMEM[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(12),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(4),
      O => \o_DATA_EMEM[4]_i_1_n_0\
    );
\o_DATA_EMEM[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(13),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(5),
      O => \o_DATA_EMEM[5]_i_1_n_0\
    );
\o_DATA_EMEM[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(14),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(6),
      O => \o_DATA_EMEM[6]_i_1_n_0\
    );
\o_DATA_EMEM[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => w_RUN,
      I1 => i_HOLD_IBUF,
      I2 => \s_byte_reg_n_0_[2]\,
      I3 => \s_byte_reg_n_0_[0]\,
      I4 => o_RnW_OBUF,
      O => \o_DATA_EMEM[7]_i_1_n_0\
    );
\o_DATA_EMEM[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => i_DATA_IBUF(15),
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => i_DATA_IBUF(7),
      O => \o_DATA_EMEM[7]_i_2_n_0\
    );
\o_DATA_EMEM_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(0),
      O => o_DATA_EMEM(0)
    );
\o_DATA_EMEM_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(1),
      O => o_DATA_EMEM(1)
    );
\o_DATA_EMEM_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(2),
      O => o_DATA_EMEM(2)
    );
\o_DATA_EMEM_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(3),
      O => o_DATA_EMEM(3)
    );
\o_DATA_EMEM_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(4),
      O => o_DATA_EMEM(4)
    );
\o_DATA_EMEM_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(5),
      O => o_DATA_EMEM(5)
    );
\o_DATA_EMEM_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(6),
      O => o_DATA_EMEM(6)
    );
\o_DATA_EMEM_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_EMEM_OBUF(7),
      O => o_DATA_EMEM(7)
    );
\o_DATA_EMEM_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[0]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(0),
      R => '0'
    );
\o_DATA_EMEM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[1]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(1),
      R => '0'
    );
\o_DATA_EMEM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[2]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(2),
      R => '0'
    );
\o_DATA_EMEM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[3]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(3),
      R => '0'
    );
\o_DATA_EMEM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[4]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(4),
      R => '0'
    );
\o_DATA_EMEM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[5]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(5),
      R => '0'
    );
\o_DATA_EMEM_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[6]_i_1_n_0\,
      Q => o_DATA_EMEM_OBUF(6),
      R => '0'
    );
\o_DATA_EMEM_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_EMEM[7]_i_1_n_0\,
      D => \o_DATA_EMEM[7]_i_2_n_0\,
      Q => o_DATA_EMEM_OBUF(7),
      R => '0'
    );
\o_DATA_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(0),
      O => o_DATA(0)
    );
\o_DATA_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(10),
      O => o_DATA(10)
    );
\o_DATA_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(11),
      O => o_DATA(11)
    );
\o_DATA_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(12),
      O => o_DATA(12)
    );
\o_DATA_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(13),
      O => o_DATA(13)
    );
\o_DATA_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(14),
      O => o_DATA(14)
    );
\o_DATA_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(15),
      O => o_DATA(15)
    );
\o_DATA_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(1),
      O => o_DATA(1)
    );
\o_DATA_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(2),
      O => o_DATA(2)
    );
\o_DATA_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(3),
      O => o_DATA(3)
    );
\o_DATA_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(4),
      O => o_DATA(4)
    );
\o_DATA_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(5),
      O => o_DATA(5)
    );
\o_DATA_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(6),
      O => o_DATA(6)
    );
\o_DATA_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(7),
      O => o_DATA(7)
    );
\o_DATA_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(8),
      O => o_DATA(8)
    );
\o_DATA_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(9),
      O => o_DATA(9)
    );
o_RnW_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_RnW_OBUF,
      O => o_RnW
    );
o_SET_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_SET_OBUF,
      O => o_SET
    );
o_SET_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => w_RUN,
      O => p_0_in
    );
o_SET_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001E54"
    )
        port map (
      I0 => \s_byte_reg_n_0_[2]\,
      I1 => \s_byte_reg_n_0_[0]\,
      I2 => \s_byte_reg_n_0_[1]\,
      I3 => o_RnW_OBUF,
      I4 => i_HOLD_IBUF,
      O => o_SET_i_2_n_0
    );
o_SET_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F30"
    )
        port map (
      I0 => \s_byte_reg_n_0_[2]\,
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => o_RnW_OBUF,
      I3 => \s_byte_reg_n_0_[0]\,
      O => o_SET_i_3_n_0
    );
o_SET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => o_SET_i_2_n_0,
      D => o_SET_i_3_n_0,
      Q => o_SET_OBUF,
      R => p_0_in
    );
\s_byte[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA995900000000"
    )
        port map (
      I0 => \s_byte_reg_n_0_[0]\,
      I1 => \s_byte_reg_n_0_[2]\,
      I2 => o_RnW_OBUF,
      I3 => \s_byte_reg_n_0_[1]\,
      I4 => i_HOLD_IBUF,
      I5 => w_RUN,
      O => \s_byte[0]_i_1_n_0\
    );
\s_byte[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DC9DCCCC00000000"
    )
        port map (
      I0 => i_HOLD_IBUF,
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => o_RnW_OBUF,
      I3 => \s_byte_reg_n_0_[2]\,
      I4 => \s_byte_reg_n_0_[0]\,
      I5 => w_RUN,
      O => \s_byte[1]_i_1_n_0\
    );
\s_byte[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4F00000"
    )
        port map (
      I0 => i_HOLD_IBUF,
      I1 => \s_byte_reg_n_0_[1]\,
      I2 => \s_byte_reg_n_0_[2]\,
      I3 => \s_byte_reg_n_0_[0]\,
      I4 => w_RUN,
      O => \s_byte[2]_i_1_n_0\
    );
\s_byte_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \s_byte[0]_i_1_n_0\,
      Q => \s_byte_reg_n_0_[0]\,
      R => '0'
    );
\s_byte_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \s_byte[1]_i_1_n_0\,
      Q => \s_byte_reg_n_0_[1]\,
      R => '0'
    );
\s_byte_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \s_byte[2]_i_1_n_0\,
      Q => \s_byte_reg_n_0_[2]\,
      R => '0'
    );
w_CMPLT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBAAAA00000000"
    )
        port map (
      I0 => w_CMPLT_reg_n_0,
      I1 => i_HOLD_IBUF,
      I2 => \s_byte_reg_n_0_[1]\,
      I3 => o_RnW_OBUF,
      I4 => \s_byte_reg_n_0_[2]\,
      I5 => w_RUN,
      O => w_CMPLT_i_1_n_0
    );
w_CMPLT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => w_CMPLT_i_1_n_0,
      Q => w_CMPLT_reg_n_0,
      R => '0'
    );
w_RUN_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => w_CMPLT_reg_n_0,
      I1 => i_RESET_IBUF,
      O => w_RUN_i_1_n_0
    );
w_RUN_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_SET_IBUF_BUFG,
      CE => '1',
      CLR => w_RUN_i_1_n_0,
      D => '1',
      Q => w_RUN
    );
\w_iHiBYTE[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => w_RUN,
      I1 => i_HOLD_IBUF,
      I2 => \s_byte_reg_n_0_[2]\,
      I3 => \s_byte_reg_n_0_[0]\,
      I4 => \s_byte_reg_n_0_[1]\,
      I5 => o_RnW_OBUF,
      O => w_iHiBYTE
    );
\w_iHiBYTE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(0),
      Q => o_DATA_OBUF(8),
      R => '0'
    );
\w_iHiBYTE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(1),
      Q => o_DATA_OBUF(9),
      R => '0'
    );
\w_iHiBYTE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(2),
      Q => o_DATA_OBUF(10),
      R => '0'
    );
\w_iHiBYTE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(3),
      Q => o_DATA_OBUF(11),
      R => '0'
    );
\w_iHiBYTE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(4),
      Q => o_DATA_OBUF(12),
      R => '0'
    );
\w_iHiBYTE_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(5),
      Q => o_DATA_OBUF(13),
      R => '0'
    );
\w_iHiBYTE_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(6),
      Q => o_DATA_OBUF(14),
      R => '0'
    );
\w_iHiBYTE_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iHiBYTE,
      D => i_DATA_EMEM_IBUF(7),
      Q => o_DATA_OBUF(15),
      R => '0'
    );
\w_iLoBYTE[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020000000000"
    )
        port map (
      I0 => w_RUN,
      I1 => i_HOLD_IBUF,
      I2 => \s_byte_reg_n_0_[0]\,
      I3 => \s_byte_reg_n_0_[1]\,
      I4 => \s_byte_reg_n_0_[2]\,
      I5 => o_RnW_OBUF,
      O => w_iLoBYTE
    );
\w_iLoBYTE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(0),
      Q => o_DATA_OBUF(0),
      R => '0'
    );
\w_iLoBYTE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(1),
      Q => o_DATA_OBUF(1),
      R => '0'
    );
\w_iLoBYTE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(2),
      Q => o_DATA_OBUF(2),
      R => '0'
    );
\w_iLoBYTE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(3),
      Q => o_DATA_OBUF(3),
      R => '0'
    );
\w_iLoBYTE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(4),
      Q => o_DATA_OBUF(4),
      R => '0'
    );
\w_iLoBYTE_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(5),
      Q => o_DATA_OBUF(5),
      R => '0'
    );
\w_iLoBYTE_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(6),
      Q => o_DATA_OBUF(6),
      R => '0'
    );
\w_iLoBYTE_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_iLoBYTE,
      D => i_DATA_EMEM_IBUF(7),
      Q => o_DATA_OBUF(7),
      R => '0'
    );
end STRUCTURE;
