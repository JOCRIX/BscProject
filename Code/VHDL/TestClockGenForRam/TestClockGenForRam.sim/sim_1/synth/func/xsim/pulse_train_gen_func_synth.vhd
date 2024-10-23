-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Oct 23 23:40:52 2024
-- Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/EIT
--               GIT/P7---Bsc/Code/VHDL/TestClockGenForRam/TestClockGenForRam.sim/sim_1/synth/func/xsim/pulse_train_gen_func_synth.vhd}
-- Design      : pulse_train_gen
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_train_gen is
  port (
    Trig_in : in STD_LOGIC;
    CLK_in : in STD_LOGIC;
    BUSY : out STD_LOGIC;
    Pulse_out : out STD_LOGIC;
    Pulse_complete : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pulse_train_gen : entity is true;
  attribute NR_OF_CLKs : integer;
  attribute NR_OF_CLKs of pulse_train_gen : entity is 4;
end pulse_train_gen;

architecture STRUCTURE of pulse_train_gen is
  signal BUSY_OBUF : STD_LOGIC;
  signal CLK_in_IBUF : STD_LOGIC;
  signal CLK_in_IBUF_BUFG : STD_LOGIC;
  signal Pulse_complete_OBUF : STD_LOGIC;
  signal Pulse_out_OBUF : STD_LOGIC;
  signal Trig_in_IBUF : STD_LOGIC;
  signal Trig_in_IBUF_BUFG : STD_LOGIC;
  signal active : STD_LOGIC;
  signal active_i_1_n_0 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal run : STD_LOGIC;
  signal stop : STD_LOGIC;
  signal stop_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of BUSY_OBUF_inst_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of Pulse_out_OBUF_inst_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of active_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair1";
begin
BUSY_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => BUSY_OBUF,
      O => BUSY
    );
BUSY_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => active,
      I1 => Pulse_complete_OBUF,
      O => BUSY_OBUF
    );
CLK_in_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_in_IBUF,
      O => CLK_in_IBUF_BUFG
    );
CLK_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK_in,
      O => CLK_in_IBUF
    );
Pulse_complete_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Pulse_complete_OBUF,
      O => Pulse_complete
    );
Pulse_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Pulse_out_OBUF,
      O => Pulse_out
    );
Pulse_out_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => CLK_in_IBUF,
      I1 => stop,
      I2 => active,
      O => Pulse_out_OBUF
    );
Trig_in_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Trig_in_IBUF,
      O => Trig_in_IBUF_BUFG
    );
Trig_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Trig_in,
      O => Trig_in_IBUF
    );
active_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFB00"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => p_0_in,
      I2 => \count_reg_n_0_[1]\,
      I3 => run,
      I4 => active,
      O => active_i_1_n_0
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_in_IBUF_BUFG,
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
      I0 => \count_reg_n_0_[0]\,
      I1 => p_0_in,
      I2 => \count_reg_n_0_[1]\,
      I3 => run,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => run,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6C00"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => p_0_in,
      I2 => \count_reg_n_0_[0]\,
      I3 => run,
      O => \count[2]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_in_IBUF_BUFG,
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
      C => CLK_in_IBUF_BUFG,
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
      C => CLK_in_IBUF_BUFG,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => p_0_in,
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => p_0_in,
      I2 => \count_reg_n_0_[1]\,
      I3 => run,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_in_IBUF_BUFG,
      CE => '1',
      D => done_i_1_n_0,
      Q => Pulse_complete_OBUF,
      R => '0'
    );
run_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => Trig_in_IBUF_BUFG,
      CE => '1',
      CLR => Pulse_complete_OBUF,
      D => '1',
      Q => run
    );
stop_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active,
      O => stop_i_1_n_0
    );
stop_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK_in_IBUF_BUFG,
      CE => '1',
      CLR => stop_i_1_n_0,
      D => p_0_in,
      Q => stop
    );
end STRUCTURE;
