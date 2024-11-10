-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Nov 10 01:08:53 2024
-- Host        : DESKTOP-DNC9NIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {F:/Git
--               Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.sim/sim_1/synth/func/xsim/pulse_width_gen_func_synth.vhd}
-- Design      : pulse_width_gen
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_width_gen is
  port (
    i_master_clk : in STD_LOGIC;
    i_trigger : in STD_LOGIC;
    o_trigger : out STD_LOGIC;
    o_pulse : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pulse_width_gen : entity is true;
  attribute width : integer;
  attribute width of pulse_width_gen : entity is 75;
end pulse_width_gen;

architecture STRUCTURE of pulse_width_gen is
  signal \gen_pulse.run_reg_n_0\ : STD_LOGIC;
  signal i_master_clk_IBUF : STD_LOGIC;
  signal i_master_clk_IBUF_BUFG : STD_LOGIC;
  signal o_pulse_OBUF : STD_LOGIC;
  signal o_pulse_i_1_n_0 : STD_LOGIC;
  signal o_pulse_i_2_n_0 : STD_LOGIC;
  signal o_trigger_OBUF : STD_LOGIC;
  signal o_trigger_OBUF_BUFG : STD_LOGIC;
  signal \r_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal r_counter_reg : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \r_counter_reg_n_0_[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r_counter[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_counter[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_counter[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_counter[3]_i_1\ : label is "soft_lutpair0";
begin
\gen_pulse.run_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => o_trigger_OBUF_BUFG,
      CE => '1',
      D => '1',
      Q => \gen_pulse.run_reg_n_0\,
      R => '0'
    );
i_master_clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_master_clk_IBUF,
      O => i_master_clk_IBUF_BUFG
    );
i_master_clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_master_clk,
      O => i_master_clk_IBUF
    );
i_trigger_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_trigger,
      O => o_trigger_OBUF
    );
o_pulse_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_pulse_OBUF,
      O => o_pulse
    );
o_pulse_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => \gen_pulse.run_reg_n_0\,
      I1 => r_counter_reg(2),
      I2 => r_counter_reg(3),
      I3 => r_counter_reg(1),
      O => o_pulse_i_1_n_0
    );
o_pulse_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gen_pulse.run_reg_n_0\,
      O => o_pulse_i_2_n_0
    );
o_pulse_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_master_clk_IBUF_BUFG,
      CE => o_pulse_i_2_n_0,
      D => '0',
      Q => o_pulse_OBUF,
      S => o_pulse_i_1_n_0
    );
o_trigger_OBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => o_trigger_OBUF,
      O => o_trigger_OBUF_BUFG
    );
o_trigger_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_trigger_OBUF_BUFG,
      O => o_trigger
    );
\r_counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"007F"
    )
        port map (
      I0 => r_counter_reg(2),
      I1 => r_counter_reg(3),
      I2 => r_counter_reg(1),
      I3 => \r_counter_reg_n_0_[0]\,
      O => \r_counter[0]_i_1_n_0\
    );
\r_counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F70"
    )
        port map (
      I0 => r_counter_reg(2),
      I1 => r_counter_reg(3),
      I2 => r_counter_reg(1),
      I3 => \r_counter_reg_n_0_[0]\,
      O => \r_counter[1]_i_1_n_0\
    );
\r_counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5A2A"
    )
        port map (
      I0 => r_counter_reg(2),
      I1 => r_counter_reg(3),
      I2 => r_counter_reg(1),
      I3 => \r_counter_reg_n_0_[0]\,
      O => \r_counter[2]_i_1_n_0\
    );
\r_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6C4C"
    )
        port map (
      I0 => r_counter_reg(2),
      I1 => r_counter_reg(3),
      I2 => r_counter_reg(1),
      I3 => \r_counter_reg_n_0_[0]\,
      O => \r_counter[3]_i_1_n_0\
    );
\r_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_master_clk_IBUF_BUFG,
      CE => \gen_pulse.run_reg_n_0\,
      D => \r_counter[0]_i_1_n_0\,
      Q => \r_counter_reg_n_0_[0]\,
      R => '0'
    );
\r_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_master_clk_IBUF_BUFG,
      CE => \gen_pulse.run_reg_n_0\,
      D => \r_counter[1]_i_1_n_0\,
      Q => r_counter_reg(1),
      R => '0'
    );
\r_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_master_clk_IBUF_BUFG,
      CE => \gen_pulse.run_reg_n_0\,
      D => \r_counter[2]_i_1_n_0\,
      Q => r_counter_reg(2),
      R => '0'
    );
\r_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_master_clk_IBUF_BUFG,
      CE => \gen_pulse.run_reg_n_0\,
      D => \r_counter[3]_i_1_n_0\,
      Q => r_counter_reg(3),
      R => '0'
    );
end STRUCTURE;
