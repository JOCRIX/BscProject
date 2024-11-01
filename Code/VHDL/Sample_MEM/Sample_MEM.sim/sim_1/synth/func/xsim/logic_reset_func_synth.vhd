-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Fri Nov  1 18:45:34 2024
-- Host        : DESKTOP-S99FO1K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/Sample_MEM/Sample_MEM.sim/sim_1/synth/func/xsim/logic_reset_func_synth.vhd
-- Design      : logic_reset
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity logic_reset is
  port (
    CLK : in STD_LOGIC;
    RW : in STD_LOGIC;
    RESET : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of logic_reset : entity is true;
end logic_reset;

architecture STRUCTURE of logic_reset is
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal RESET_OBUF : STD_LOGIC;
  signal RW_IBUF : STD_LOGIC;
  signal reset_trig : STD_LOGIC;
  signal reset_trig0 : STD_LOGIC;
  signal s_reset : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_reset__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_reset_reg[0]\ : label is "r_clk2:01,r_clk3:10,r_clk1:00,reset_trigd:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_reset_reg[1]\ : label is "r_clk2:01,r_clk3:10,r_clk1:00,reset_trigd:11";
begin
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
\FSM_sequential_s_reset[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_IBUF,
      I1 => s_reset(0),
      O => \s_reset__0\(0)
    );
\FSM_sequential_s_reset[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => s_reset(0),
      I1 => RW_IBUF,
      I2 => s_reset(1),
      O => \s_reset__0\(1)
    );
\FSM_sequential_s_reset_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \s_reset__0\(0),
      Q => s_reset(0),
      R => '0'
    );
\FSM_sequential_s_reset_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \s_reset__0\(1),
      Q => s_reset(1),
      R => '0'
    );
RESET_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => RESET_OBUF,
      O => RESET
    );
RW_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RW,
      O => RW_IBUF
    );
reset_trig_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_reset(0),
      I1 => s_reset(1),
      O => reset_trig0
    );
reset_trig_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_reset(0),
      I1 => RW_IBUF,
      I2 => s_reset(1),
      O => reset_trig
    );
reset_trig_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => reset_trig,
      D => RW_IBUF,
      Q => RESET_OBUF,
      R => reset_trig0
    );
end STRUCTURE;
