-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Fri Nov  8 21:31:42 2024
-- Host        : DESKTOP-S99FO1K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/EXT_MEM_RW20/EXT_MEM_RW20.sim/sim_1/synth/func/xsim/EXT_MEM_RW20_func_synth.vhd
-- Design      : EXT_MEM_RW20
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EXT_MEM_RW20 is
  port (
    i_DATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    o_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    o_DATA_TO_ERAM : out STD_LOGIC_VECTOR ( 7 downto 0 );
    i_DATA_FR_ERAM : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_WnR : in STD_LOGIC;
    i_ADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    i_RESET : in STD_LOGIC;
    o_ADDR_TO_ERAM : out STD_LOGIC_VECTOR ( 18 downto 0 );
    i_EN : in STD_LOGIC;
    i_CLK : in STD_LOGIC;
    o_nCE : out STD_LOGIC;
    o_nOE : out STD_LOGIC;
    o_nWE : out STD_LOGIC;
    o_IO_BUF_CTRL : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of EXT_MEM_RW20 : entity is true;
end EXT_MEM_RW20;

architecture STRUCTURE of EXT_MEM_RW20 is
  signal \ExtMem_Comm.v_Count[0]_i_3_n_0\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \ExtMem_Comm.v_Count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal i_ADDR_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal i_CLK_IBUF : STD_LOGIC;
  signal i_CLK_IBUF_BUFG : STD_LOGIC;
  signal i_DATA_FR_ERAM_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_DATA_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_EN_IBUF : STD_LOGIC;
  signal i_EN_IBUF_BUFG : STD_LOGIC;
  signal i_RESET_IBUF : STD_LOGIC;
  signal i_WnR_IBUF : STD_LOGIC;
  signal o_ADDR_TO_ERAM_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_DATA_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \o_DATA_TO_ERAM[7]_i_1_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM[7]_i_2_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM[7]_i_3_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM[7]_i_4_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM[7]_i_5_n_0\ : STD_LOGIC;
  signal o_DATA_TO_ERAM_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \o_DATA_TO_ERAM_reg[7]_i_6_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_6_n_1\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_6_n_2\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_6_n_3\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_7_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_7_n_1\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_7_n_2\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_7_n_3\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_8_n_0\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_8_n_1\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_8_n_2\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_8_n_3\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_9_n_2\ : STD_LOGIC;
  signal \o_DATA_TO_ERAM_reg[7]_i_9_n_3\ : STD_LOGIC;
  signal o_IO_BUF_CTRL14_out : STD_LOGIC;
  signal o_IO_BUF_CTRL2_out : STD_LOGIC;
  signal o_IO_BUF_CTRL5_out : STD_LOGIC;
  signal o_IO_BUF_CTRL_OBUF : STD_LOGIC;
  signal o_IO_BUF_CTRL_i_4_n_0 : STD_LOGIC;
  signal o_IO_BUF_CTRL_i_5_n_0 : STD_LOGIC;
  signal o_IO_BUF_CTRL_i_6_n_0 : STD_LOGIC;
  signal o_nOE10_out : STD_LOGIC;
  signal o_nOE_OBUF : STD_LOGIC;
  signal o_nOE_i_1_n_0 : STD_LOGIC;
  signal o_nOE_i_3_n_0 : STD_LOGIC;
  signal o_nWE8_out : STD_LOGIC;
  signal o_nWE_OBUF : STD_LOGIC;
  signal o_nWE_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal w_CMPLT_i_1_n_0 : STD_LOGIC;
  signal w_CMPLT_i_2_n_0 : STD_LOGIC;
  signal w_CMPLT_reg_n_0 : STD_LOGIC;
  signal w_RUN : STD_LOGIC;
  signal w_RUN_i_1_n_0 : STD_LOGIC;
  signal w_oADDR : STD_LOGIC;
  signal w_oDATA : STD_LOGIC;
  signal \w_oDATA[7]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_ExtMem_Comm.v_Count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_o_DATA_TO_ERAM_reg[7]_i_9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_o_DATA_TO_ERAM_reg[7]_i_9_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \ExtMem_Comm.v_Count_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \ExtMem_Comm.v_Count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ExtMem_Comm.v_Count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \ExtMem_Comm.v_Count_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \o_DATA_TO_ERAM_reg[7]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \o_DATA_TO_ERAM_reg[7]_i_7\ : label is 35;
  attribute ADDER_THRESHOLD of \o_DATA_TO_ERAM_reg[7]_i_8\ : label is 35;
  attribute ADDER_THRESHOLD of \o_DATA_TO_ERAM_reg[7]_i_9\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of o_IO_BUF_CTRL_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of w_CMPLT_i_2 : label is "soft_lutpair0";
begin
\ExtMem_Comm.v_Count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => w_RUN,
      O => clear
    );
\ExtMem_Comm.v_Count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ExtMem_Comm.v_Count_reg\(0),
      O => \ExtMem_Comm.v_Count[0]_i_3_n_0\
    );
\ExtMem_Comm.v_Count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[0]_i_2_n_7\,
      Q => \ExtMem_Comm.v_Count_reg\(0),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_0\,
      CO(2) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_1\,
      CO(1) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_2\,
      CO(0) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_4\,
      O(2) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_5\,
      O(1) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_6\,
      O(0) => \ExtMem_Comm.v_Count_reg[0]_i_2_n_7\,
      S(3 downto 1) => \ExtMem_Comm.v_Count_reg\(3 downto 1),
      S(0) => \ExtMem_Comm.v_Count[0]_i_3_n_0\
    );
\ExtMem_Comm.v_Count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[8]_i_1_n_5\,
      Q => \ExtMem_Comm.v_Count_reg\(10),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[8]_i_1_n_4\,
      Q => \ExtMem_Comm.v_Count_reg\(11),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[12]_i_1_n_7\,
      Q => \ExtMem_Comm.v_Count_reg\(12),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ExtMem_Comm.v_Count_reg[8]_i_1_n_0\,
      CO(3) => \NLW_ExtMem_Comm.v_Count_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_1\,
      CO(1) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_2\,
      CO(0) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_4\,
      O(2) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_5\,
      O(1) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_6\,
      O(0) => \ExtMem_Comm.v_Count_reg[12]_i_1_n_7\,
      S(3 downto 0) => \ExtMem_Comm.v_Count_reg\(15 downto 12)
    );
\ExtMem_Comm.v_Count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[12]_i_1_n_6\,
      Q => \ExtMem_Comm.v_Count_reg\(13),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[12]_i_1_n_5\,
      Q => \ExtMem_Comm.v_Count_reg\(14),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[12]_i_1_n_4\,
      Q => \ExtMem_Comm.v_Count_reg\(15),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[0]_i_2_n_6\,
      Q => \ExtMem_Comm.v_Count_reg\(1),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[0]_i_2_n_5\,
      Q => \ExtMem_Comm.v_Count_reg\(2),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[0]_i_2_n_4\,
      Q => \ExtMem_Comm.v_Count_reg\(3),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[4]_i_1_n_7\,
      Q => \ExtMem_Comm.v_Count_reg\(4),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ExtMem_Comm.v_Count_reg[0]_i_2_n_0\,
      CO(3) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_0\,
      CO(2) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_1\,
      CO(1) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_2\,
      CO(0) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_4\,
      O(2) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_5\,
      O(1) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_6\,
      O(0) => \ExtMem_Comm.v_Count_reg[4]_i_1_n_7\,
      S(3 downto 0) => \ExtMem_Comm.v_Count_reg\(7 downto 4)
    );
\ExtMem_Comm.v_Count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[4]_i_1_n_6\,
      Q => \ExtMem_Comm.v_Count_reg\(5),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[4]_i_1_n_5\,
      Q => \ExtMem_Comm.v_Count_reg\(6),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[4]_i_1_n_4\,
      Q => \ExtMem_Comm.v_Count_reg\(7),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[8]_i_1_n_7\,
      Q => \ExtMem_Comm.v_Count_reg\(8),
      R => clear
    );
\ExtMem_Comm.v_Count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ExtMem_Comm.v_Count_reg[4]_i_1_n_0\,
      CO(3) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_0\,
      CO(2) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_1\,
      CO(1) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_2\,
      CO(0) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_4\,
      O(2) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_5\,
      O(1) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_6\,
      O(0) => \ExtMem_Comm.v_Count_reg[8]_i_1_n_7\,
      S(3 downto 0) => \ExtMem_Comm.v_Count_reg\(11 downto 8)
    );
\ExtMem_Comm.v_Count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => '1',
      D => \ExtMem_Comm.v_Count_reg[8]_i_1_n_6\,
      Q => \ExtMem_Comm.v_Count_reg\(9),
      R => clear
    );
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
\i_DATA_FR_ERAM_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(0),
      O => i_DATA_FR_ERAM_IBUF(0)
    );
\i_DATA_FR_ERAM_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(1),
      O => i_DATA_FR_ERAM_IBUF(1)
    );
\i_DATA_FR_ERAM_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(2),
      O => i_DATA_FR_ERAM_IBUF(2)
    );
\i_DATA_FR_ERAM_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(3),
      O => i_DATA_FR_ERAM_IBUF(3)
    );
\i_DATA_FR_ERAM_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(4),
      O => i_DATA_FR_ERAM_IBUF(4)
    );
\i_DATA_FR_ERAM_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(5),
      O => i_DATA_FR_ERAM_IBUF(5)
    );
\i_DATA_FR_ERAM_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(6),
      O => i_DATA_FR_ERAM_IBUF(6)
    );
\i_DATA_FR_ERAM_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA_FR_ERAM(7),
      O => i_DATA_FR_ERAM_IBUF(7)
    );
\i_DATA_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_DATA(0),
      O => i_DATA_IBUF(0)
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
i_EN_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_EN_IBUF,
      O => i_EN_IBUF_BUFG
    );
i_EN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_EN,
      O => i_EN_IBUF
    );
i_RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_RESET,
      O => i_RESET_IBUF
    );
i_WnR_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_WnR,
      O => i_WnR_IBUF
    );
\o_ADDR_TO_ERAM_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(0),
      O => o_ADDR_TO_ERAM(0)
    );
\o_ADDR_TO_ERAM_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(10),
      O => o_ADDR_TO_ERAM(10)
    );
\o_ADDR_TO_ERAM_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(11),
      O => o_ADDR_TO_ERAM(11)
    );
\o_ADDR_TO_ERAM_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(12),
      O => o_ADDR_TO_ERAM(12)
    );
\o_ADDR_TO_ERAM_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(13),
      O => o_ADDR_TO_ERAM(13)
    );
\o_ADDR_TO_ERAM_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(14),
      O => o_ADDR_TO_ERAM(14)
    );
\o_ADDR_TO_ERAM_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(15),
      O => o_ADDR_TO_ERAM(15)
    );
\o_ADDR_TO_ERAM_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_ADDR_TO_ERAM(16)
    );
\o_ADDR_TO_ERAM_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_ADDR_TO_ERAM(17)
    );
\o_ADDR_TO_ERAM_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_ADDR_TO_ERAM(18)
    );
\o_ADDR_TO_ERAM_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(1),
      O => o_ADDR_TO_ERAM(1)
    );
\o_ADDR_TO_ERAM_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(2),
      O => o_ADDR_TO_ERAM(2)
    );
\o_ADDR_TO_ERAM_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(3),
      O => o_ADDR_TO_ERAM(3)
    );
\o_ADDR_TO_ERAM_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(4),
      O => o_ADDR_TO_ERAM(4)
    );
\o_ADDR_TO_ERAM_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(5),
      O => o_ADDR_TO_ERAM(5)
    );
\o_ADDR_TO_ERAM_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(6),
      O => o_ADDR_TO_ERAM(6)
    );
\o_ADDR_TO_ERAM_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(7),
      O => o_ADDR_TO_ERAM(7)
    );
\o_ADDR_TO_ERAM_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(8),
      O => o_ADDR_TO_ERAM(8)
    );
\o_ADDR_TO_ERAM_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_ADDR_TO_ERAM_OBUF(9),
      O => o_ADDR_TO_ERAM(9)
    );
\o_DATA_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_OBUF(0),
      O => o_DATA(0)
    );
\o_DATA_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_DATA(10)
    );
\o_DATA_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_DATA(11)
    );
\o_DATA_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_DATA(12)
    );
\o_DATA_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_DATA(13)
    );
\o_DATA_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_DATA(14)
    );
\o_DATA_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
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
      I => '0',
      O => o_DATA(8)
    );
\o_DATA_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_DATA(9)
    );
\o_DATA_TO_ERAM[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => w_RUN,
      I1 => i_WnR_IBUF,
      I2 => \o_DATA_TO_ERAM[7]_i_2_n_0\,
      I3 => \o_DATA_TO_ERAM[7]_i_3_n_0\,
      I4 => \o_DATA_TO_ERAM[7]_i_4_n_0\,
      I5 => \o_DATA_TO_ERAM[7]_i_5_n_0\,
      O => \o_DATA_TO_ERAM[7]_i_1_n_0\
    );
\o_DATA_TO_ERAM[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in(7),
      I1 => p_0_in(6),
      I2 => p_0_in(9),
      I3 => p_0_in(8),
      O => \o_DATA_TO_ERAM[7]_i_2_n_0\
    );
\o_DATA_TO_ERAM[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(2),
      I2 => p_0_in(5),
      I3 => p_0_in(4),
      O => \o_DATA_TO_ERAM[7]_i_3_n_0\
    );
\o_DATA_TO_ERAM[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_0_in(15),
      I1 => p_0_in(14),
      I2 => p_0_in(1),
      O => \o_DATA_TO_ERAM[7]_i_4_n_0\
    );
\o_DATA_TO_ERAM[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in(11),
      I1 => p_0_in(10),
      I2 => p_0_in(13),
      I3 => p_0_in(12),
      O => \o_DATA_TO_ERAM[7]_i_5_n_0\
    );
\o_DATA_TO_ERAM_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(0),
      O => o_DATA_TO_ERAM(0)
    );
\o_DATA_TO_ERAM_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(1),
      O => o_DATA_TO_ERAM(1)
    );
\o_DATA_TO_ERAM_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(2),
      O => o_DATA_TO_ERAM(2)
    );
\o_DATA_TO_ERAM_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(3),
      O => o_DATA_TO_ERAM(3)
    );
\o_DATA_TO_ERAM_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(4),
      O => o_DATA_TO_ERAM(4)
    );
\o_DATA_TO_ERAM_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(5),
      O => o_DATA_TO_ERAM(5)
    );
\o_DATA_TO_ERAM_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(6),
      O => o_DATA_TO_ERAM(6)
    );
\o_DATA_TO_ERAM_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_DATA_TO_ERAM_OBUF(7),
      O => o_DATA_TO_ERAM(7)
    );
\o_DATA_TO_ERAM_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(0),
      Q => o_DATA_TO_ERAM_OBUF(0),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(1),
      Q => o_DATA_TO_ERAM_OBUF(1),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(2),
      Q => o_DATA_TO_ERAM_OBUF(2),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(3),
      Q => o_DATA_TO_ERAM_OBUF(3),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(4),
      Q => o_DATA_TO_ERAM_OBUF(4),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(5),
      Q => o_DATA_TO_ERAM_OBUF(5),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(6),
      Q => o_DATA_TO_ERAM_OBUF(6),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      D => i_DATA_IBUF(7),
      Q => o_DATA_TO_ERAM_OBUF(7),
      R => '0'
    );
\o_DATA_TO_ERAM_reg[7]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_DATA_TO_ERAM_reg[7]_i_8_n_0\,
      CO(3) => \o_DATA_TO_ERAM_reg[7]_i_6_n_0\,
      CO(2) => \o_DATA_TO_ERAM_reg[7]_i_6_n_1\,
      CO(1) => \o_DATA_TO_ERAM_reg[7]_i_6_n_2\,
      CO(0) => \o_DATA_TO_ERAM_reg[7]_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(8 downto 5),
      S(3 downto 0) => \ExtMem_Comm.v_Count_reg\(8 downto 5)
    );
\o_DATA_TO_ERAM_reg[7]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_DATA_TO_ERAM_reg[7]_i_6_n_0\,
      CO(3) => \o_DATA_TO_ERAM_reg[7]_i_7_n_0\,
      CO(2) => \o_DATA_TO_ERAM_reg[7]_i_7_n_1\,
      CO(1) => \o_DATA_TO_ERAM_reg[7]_i_7_n_2\,
      CO(0) => \o_DATA_TO_ERAM_reg[7]_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(12 downto 9),
      S(3 downto 0) => \ExtMem_Comm.v_Count_reg\(12 downto 9)
    );
\o_DATA_TO_ERAM_reg[7]_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \o_DATA_TO_ERAM_reg[7]_i_8_n_0\,
      CO(2) => \o_DATA_TO_ERAM_reg[7]_i_8_n_1\,
      CO(1) => \o_DATA_TO_ERAM_reg[7]_i_8_n_2\,
      CO(0) => \o_DATA_TO_ERAM_reg[7]_i_8_n_3\,
      CYINIT => \ExtMem_Comm.v_Count_reg\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(4 downto 1),
      S(3 downto 0) => \ExtMem_Comm.v_Count_reg\(4 downto 1)
    );
\o_DATA_TO_ERAM_reg[7]_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_DATA_TO_ERAM_reg[7]_i_7_n_0\,
      CO(3 downto 2) => \NLW_o_DATA_TO_ERAM_reg[7]_i_9_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \o_DATA_TO_ERAM_reg[7]_i_9_n_2\,
      CO(0) => \o_DATA_TO_ERAM_reg[7]_i_9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_o_DATA_TO_ERAM_reg[7]_i_9_O_UNCONNECTED\(3),
      O(2 downto 0) => p_0_in(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => \ExtMem_Comm.v_Count_reg\(15 downto 13)
    );
o_IO_BUF_CTRL_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_IO_BUF_CTRL_OBUF,
      O => o_IO_BUF_CTRL
    );
o_IO_BUF_CTRL_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \w_oDATA[7]_i_2_n_0\,
      I1 => \ExtMem_Comm.v_Count_reg\(0),
      I2 => \ExtMem_Comm.v_Count_reg\(1),
      I3 => \ExtMem_Comm.v_Count_reg\(2),
      I4 => i_WnR_IBUF,
      O => o_IO_BUF_CTRL5_out
    );
o_IO_BUF_CTRL_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080800000000000"
    )
        port map (
      I0 => o_nOE_i_3_n_0,
      I1 => i_WnR_IBUF,
      I2 => \ExtMem_Comm.v_Count_reg\(1),
      I3 => \ExtMem_Comm.v_Count_reg\(2),
      I4 => \ExtMem_Comm.v_Count_reg\(0),
      I5 => \w_oDATA[7]_i_2_n_0\,
      O => o_IO_BUF_CTRL2_out
    );
o_IO_BUF_CTRL_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \ExtMem_Comm.v_Count_reg\(2),
      I1 => \ExtMem_Comm.v_Count_reg\(0),
      I2 => o_IO_BUF_CTRL_i_4_n_0,
      O => o_IO_BUF_CTRL14_out
    );
o_IO_BUF_CTRL_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => o_IO_BUF_CTRL_i_5_n_0,
      I1 => o_IO_BUF_CTRL_i_6_n_0,
      I2 => \ExtMem_Comm.v_Count_reg\(6),
      I3 => \ExtMem_Comm.v_Count_reg\(5),
      I4 => \ExtMem_Comm.v_Count_reg\(4),
      I5 => \ExtMem_Comm.v_Count_reg\(3),
      O => o_IO_BUF_CTRL_i_4_n_0
    );
o_IO_BUF_CTRL_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \ExtMem_Comm.v_Count_reg\(11),
      I1 => \ExtMem_Comm.v_Count_reg\(12),
      I2 => \ExtMem_Comm.v_Count_reg\(13),
      I3 => \ExtMem_Comm.v_Count_reg\(14),
      I4 => \ExtMem_Comm.v_Count_reg\(15),
      O => o_IO_BUF_CTRL_i_5_n_0
    );
o_IO_BUF_CTRL_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \ExtMem_Comm.v_Count_reg\(10),
      I1 => \ExtMem_Comm.v_Count_reg\(9),
      I2 => \ExtMem_Comm.v_Count_reg\(8),
      I3 => \ExtMem_Comm.v_Count_reg\(7),
      O => o_IO_BUF_CTRL_i_6_n_0
    );
o_IO_BUF_CTRL_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => o_IO_BUF_CTRL2_out,
      D => o_IO_BUF_CTRL14_out,
      Q => o_IO_BUF_CTRL_OBUF,
      S => o_IO_BUF_CTRL5_out
    );
o_nCE_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_nCE
    );
o_nOE_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_nOE_OBUF,
      O => o_nOE
    );
o_nOE_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => w_RUN,
      I1 => i_WnR_IBUF,
      O => o_nOE_i_1_n_0
    );
o_nOE_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => w_RUN,
      I1 => o_nOE_i_3_n_0,
      O => o_nOE10_out
    );
o_nOE_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \o_DATA_TO_ERAM[7]_i_2_n_0\,
      I1 => \o_DATA_TO_ERAM[7]_i_3_n_0\,
      I2 => p_0_in(15),
      I3 => p_0_in(14),
      I4 => p_0_in(1),
      I5 => \o_DATA_TO_ERAM[7]_i_5_n_0\,
      O => o_nOE_i_3_n_0
    );
o_nOE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => o_nOE10_out,
      D => '1',
      Q => o_nOE_OBUF,
      R => o_nOE_i_1_n_0
    );
o_nWE_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_nWE_OBUF,
      O => o_nWE
    );
o_nWE_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000800000"
    )
        port map (
      I0 => \w_oDATA[7]_i_2_n_0\,
      I1 => \ExtMem_Comm.v_Count_reg\(0),
      I2 => o_nOE_i_3_n_0,
      I3 => \ExtMem_Comm.v_Count_reg\(2),
      I4 => i_WnR_IBUF,
      I5 => \ExtMem_Comm.v_Count_reg\(1),
      O => o_nWE_i_1_n_0
    );
o_nWE_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \w_oDATA[7]_i_2_n_0\,
      I1 => \ExtMem_Comm.v_Count_reg\(0),
      I2 => o_nOE_i_3_n_0,
      I3 => i_WnR_IBUF,
      I4 => \ExtMem_Comm.v_Count_reg\(2),
      I5 => \ExtMem_Comm.v_Count_reg\(1),
      O => o_nWE8_out
    );
o_nWE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => o_nWE8_out,
      D => o_nWE8_out,
      Q => o_nWE_OBUF,
      R => o_nWE_i_1_n_0
    );
w_CMPLT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000B0000000"
    )
        port map (
      I0 => o_nOE_i_3_n_0,
      I1 => i_WnR_IBUF,
      I2 => o_IO_BUF_CTRL_i_4_n_0,
      I3 => w_CMPLT_i_2_n_0,
      I4 => w_RUN,
      I5 => w_CMPLT_reg_n_0,
      O => w_CMPLT_i_1_n_0
    );
w_CMPLT_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \ExtMem_Comm.v_Count_reg\(0),
      I1 => \ExtMem_Comm.v_Count_reg\(1),
      I2 => \ExtMem_Comm.v_Count_reg\(2),
      O => w_CMPLT_i_2_n_0
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
      C => i_EN_IBUF_BUFG,
      CE => '1',
      CLR => w_RUN_i_1_n_0,
      D => '1',
      Q => w_RUN
    );
\w_oADDR[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F8F0F0F0F0"
    )
        port map (
      I0 => \w_oDATA[7]_i_2_n_0\,
      I1 => \ExtMem_Comm.v_Count_reg\(0),
      I2 => \o_DATA_TO_ERAM[7]_i_1_n_0\,
      I3 => i_WnR_IBUF,
      I4 => \ExtMem_Comm.v_Count_reg\(2),
      I5 => \ExtMem_Comm.v_Count_reg\(1),
      O => w_oADDR
    );
\w_oADDR_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(0),
      Q => o_ADDR_TO_ERAM_OBUF(0),
      R => '0'
    );
\w_oADDR_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(10),
      Q => o_ADDR_TO_ERAM_OBUF(10),
      R => '0'
    );
\w_oADDR_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(11),
      Q => o_ADDR_TO_ERAM_OBUF(11),
      R => '0'
    );
\w_oADDR_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(12),
      Q => o_ADDR_TO_ERAM_OBUF(12),
      R => '0'
    );
\w_oADDR_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(13),
      Q => o_ADDR_TO_ERAM_OBUF(13),
      R => '0'
    );
\w_oADDR_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(14),
      Q => o_ADDR_TO_ERAM_OBUF(14),
      R => '0'
    );
\w_oADDR_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(15),
      Q => o_ADDR_TO_ERAM_OBUF(15),
      R => '0'
    );
\w_oADDR_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(1),
      Q => o_ADDR_TO_ERAM_OBUF(1),
      R => '0'
    );
\w_oADDR_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(2),
      Q => o_ADDR_TO_ERAM_OBUF(2),
      R => '0'
    );
\w_oADDR_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(3),
      Q => o_ADDR_TO_ERAM_OBUF(3),
      R => '0'
    );
\w_oADDR_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(4),
      Q => o_ADDR_TO_ERAM_OBUF(4),
      R => '0'
    );
\w_oADDR_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(5),
      Q => o_ADDR_TO_ERAM_OBUF(5),
      R => '0'
    );
\w_oADDR_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(6),
      Q => o_ADDR_TO_ERAM_OBUF(6),
      R => '0'
    );
\w_oADDR_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(7),
      Q => o_ADDR_TO_ERAM_OBUF(7),
      R => '0'
    );
\w_oADDR_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(8),
      Q => o_ADDR_TO_ERAM_OBUF(8),
      R => '0'
    );
\w_oADDR_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oADDR,
      D => i_ADDR_IBUF(9),
      Q => o_ADDR_TO_ERAM_OBUF(9),
      R => '0'
    );
\w_oDATA[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => i_WnR_IBUF,
      I1 => \ExtMem_Comm.v_Count_reg\(0),
      I2 => \ExtMem_Comm.v_Count_reg\(1),
      I3 => \ExtMem_Comm.v_Count_reg\(2),
      I4 => \w_oDATA[7]_i_2_n_0\,
      O => w_oDATA
    );
\w_oDATA[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => o_IO_BUF_CTRL_i_4_n_0,
      I1 => w_RUN,
      O => \w_oDATA[7]_i_2_n_0\
    );
\w_oDATA_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(0),
      Q => o_DATA_OBUF(0),
      R => '0'
    );
\w_oDATA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(1),
      Q => o_DATA_OBUF(1),
      R => '0'
    );
\w_oDATA_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(2),
      Q => o_DATA_OBUF(2),
      R => '0'
    );
\w_oDATA_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(3),
      Q => o_DATA_OBUF(3),
      R => '0'
    );
\w_oDATA_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(4),
      Q => o_DATA_OBUF(4),
      R => '0'
    );
\w_oDATA_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(5),
      Q => o_DATA_OBUF(5),
      R => '0'
    );
\w_oDATA_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(6),
      Q => o_DATA_OBUF(6),
      R => '0'
    );
\w_oDATA_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK_IBUF_BUFG,
      CE => w_oDATA,
      D => i_DATA_FR_ERAM_IBUF(7),
      Q => o_DATA_OBUF(7),
      R => '0'
    );
end STRUCTURE;
