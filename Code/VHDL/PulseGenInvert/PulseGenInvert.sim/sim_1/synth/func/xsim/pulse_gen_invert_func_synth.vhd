-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Fri Nov  1 22:55:12 2024
-- Host        : DESKTOP-DNC9NIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {F:/Git
--               Projects/EIT/P7---Bsc/Code/VHDL/PulseGenInvert/PulseGenInvert.sim/sim_1/synth/func/xsim/pulse_gen_invert_func_synth.vhd}
-- Design      : pulse_gen_invert
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pulse_gen_invert is
  port (
    MASTER_CLK_200MEG_IN : in STD_LOGIC;
    TRIGGER : in STD_LOGIC;
    PULSE_OUT : out STD_LOGIC;
    ACTIVE : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pulse_gen_invert : entity is true;
  attribute HIGH_TIME : integer;
  attribute HIGH_TIME of pulse_gen_invert : entity is 25;
  attribute LOW_TIME : integer;
  attribute LOW_TIME of pulse_gen_invert : entity is 25;
  attribute NR_OF_CLKs : integer;
  attribute NR_OF_CLKs of pulse_gen_invert : entity is 7;
end pulse_gen_invert;

architecture STRUCTURE of pulse_gen_invert is
  signal ACTIVE_OBUF : STD_LOGIC;
  signal MASTER_CLK_200MEG_IN_IBUF : STD_LOGIC;
  signal MASTER_CLK_200MEG_IN_IBUF_BUFG : STD_LOGIC;
  signal PULSE_OUT_OBUF : STD_LOGIC;
  signal TRIGGER_IBUF : STD_LOGIC;
  signal TRIGGER_IBUF_BUFG : STD_LOGIC;
  signal clk_count : STD_LOGIC;
  signal \clk_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \clk_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \clk_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \clk_count[0]_i_7_n_0\ : STD_LOGIC;
  signal clk_count_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \clk_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \clk_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \clk_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clk_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal done : STD_LOGIC;
  signal done0 : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_i_2_n_0 : STD_LOGIC;
  signal done_i_3_n_0 : STD_LOGIC;
  signal gen_1_pulse : STD_LOGIC;
  signal gen_1_pulse_i_1_n_0 : STD_LOGIC;
  signal gen_1_pulse_i_2_n_0 : STD_LOGIC;
  signal output_set : STD_LOGIC;
  signal output_set_i_1_n_0 : STD_LOGIC;
  signal output_set_i_2_n_0 : STD_LOGIC;
  signal output_set_i_3_n_0 : STD_LOGIC;
  signal output_set_i_4_n_0 : STD_LOGIC;
  signal output_set_reg_n_0 : STD_LOGIC;
  signal output_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \pulse_complete__0_i_1_n_0\ : STD_LOGIC;
  signal \pulse_complete__0_i_2_n_0\ : STD_LOGIC;
  signal pulse_complete_i_1_n_0 : STD_LOGIC;
  signal \pulse_complete_reg__1\ : STD_LOGIC;
  signal pulse_complete_reg_n_0 : STD_LOGIC;
  signal pulses_generated0 : STD_LOGIC;
  signal \pulses_generated[0]_i_4_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_5_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_6_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_7_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_8_n_0\ : STD_LOGIC;
  signal \pulses_generated[0]_i_9_n_0\ : STD_LOGIC;
  signal pulses_generated_reg : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \pulses_generated_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \pulses_generated_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pulses_generated_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal s_toggle : STD_LOGIC;
  signal s_toggle4_out : STD_LOGIC;
  signal s_toggle_i_1_n_0 : STD_LOGIC;
  signal \NLW_clk_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_clk_count_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_pulses_generated_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pulses_generated_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \clk_count[0]_i_4\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \clk_count_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \clk_count_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of done_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of gen_1_pulse_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of output_set_i_3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of output_set_i_4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of output_set_i_5 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pulse_complete__0_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of pulse_complete_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pulses_generated[0]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \pulses_generated[0]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \pulses_generated[0]_i_8\ : label is "soft_lutpair5";
  attribute ADDER_THRESHOLD of \pulses_generated_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \pulses_generated_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulses_generated_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulses_generated_reg[8]_i_1\ : label is 11;
begin
ACTIVE_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => ACTIVE_OBUF,
      O => ACTIVE
    );
ACTIVE_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => output_state(1),
      CE => '1',
      CLR => done,
      D => '1',
      Q => ACTIVE_OBUF
    );
MASTER_CLK_200MEG_IN_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => MASTER_CLK_200MEG_IN_IBUF,
      O => MASTER_CLK_200MEG_IN_IBUF_BUFG
    );
MASTER_CLK_200MEG_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => MASTER_CLK_200MEG_IN,
      O => MASTER_CLK_200MEG_IN_IBUF
    );
PULSE_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => PULSE_OUT_OBUF,
      O => PULSE_OUT
    );
PULSE_OUT_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => output_state(1),
      I1 => output_state(0),
      I2 => output_set_reg_n_0,
      O => PULSE_OUT_OBUF
    );
TRIGGER_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => TRIGGER_IBUF,
      O => TRIGGER_IBUF_BUFG
    );
TRIGGER_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => TRIGGER,
      O => TRIGGER_IBUF
    );
\clk_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020040000"
    )
        port map (
      I0 => clk_count_reg(0),
      I1 => clk_count_reg(1),
      I2 => clk_count_reg(2),
      I3 => s_toggle,
      I4 => clk_count,
      I5 => \clk_count[0]_i_4_n_0\,
      O => s_toggle4_out
    );
\clk_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gen_1_pulse,
      I1 => pulse_complete_reg_n_0,
      O => clk_count
    );
\clk_count[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => clk_count_reg(13),
      I1 => clk_count_reg(12),
      I2 => clk_count_reg(3),
      I3 => \clk_count[0]_i_6_n_0\,
      I4 => \clk_count[0]_i_7_n_0\,
      O => \clk_count[0]_i_4_n_0\
    );
\clk_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_count_reg(0),
      O => \clk_count[0]_i_5_n_0\
    );
\clk_count[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_count_reg(9),
      I1 => clk_count_reg(8),
      I2 => clk_count_reg(11),
      I3 => clk_count_reg(10),
      O => \clk_count[0]_i_6_n_0\
    );
\clk_count[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_count_reg(5),
      I1 => clk_count_reg(4),
      I2 => clk_count_reg(7),
      I3 => clk_count_reg(6),
      O => \clk_count[0]_i_7_n_0\
    );
\clk_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_7\,
      Q => clk_count_reg(0),
      R => s_toggle4_out
    );
\clk_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_count_reg[0]_i_3_n_0\,
      CO(2) => \clk_count_reg[0]_i_3_n_1\,
      CO(1) => \clk_count_reg[0]_i_3_n_2\,
      CO(0) => \clk_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \clk_count_reg[0]_i_3_n_4\,
      O(2) => \clk_count_reg[0]_i_3_n_5\,
      O(1) => \clk_count_reg[0]_i_3_n_6\,
      O(0) => \clk_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => clk_count_reg(3 downto 1),
      S(0) => \clk_count[0]_i_5_n_0\
    );
\clk_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_5\,
      Q => clk_count_reg(10),
      R => s_toggle4_out
    );
\clk_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_4\,
      Q => clk_count_reg(11),
      R => s_toggle4_out
    );
\clk_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[12]_i_1_n_7\,
      Q => clk_count_reg(12),
      R => s_toggle4_out
    );
\clk_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_clk_count_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \clk_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_clk_count_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \clk_count_reg[12]_i_1_n_6\,
      O(0) => \clk_count_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => clk_count_reg(13 downto 12)
    );
\clk_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[12]_i_1_n_6\,
      Q => clk_count_reg(13),
      R => s_toggle4_out
    );
\clk_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_6\,
      Q => clk_count_reg(1),
      R => s_toggle4_out
    );
\clk_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_5\,
      Q => clk_count_reg(2),
      R => s_toggle4_out
    );
\clk_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[0]_i_3_n_4\,
      Q => clk_count_reg(3),
      R => s_toggle4_out
    );
\clk_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_7\,
      Q => clk_count_reg(4),
      R => s_toggle4_out
    );
\clk_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_reg[0]_i_3_n_0\,
      CO(3) => \clk_count_reg[4]_i_1_n_0\,
      CO(2) => \clk_count_reg[4]_i_1_n_1\,
      CO(1) => \clk_count_reg[4]_i_1_n_2\,
      CO(0) => \clk_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_reg[4]_i_1_n_4\,
      O(2) => \clk_count_reg[4]_i_1_n_5\,
      O(1) => \clk_count_reg[4]_i_1_n_6\,
      O(0) => \clk_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => clk_count_reg(7 downto 4)
    );
\clk_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_6\,
      Q => clk_count_reg(5),
      R => s_toggle4_out
    );
\clk_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_5\,
      Q => clk_count_reg(6),
      R => s_toggle4_out
    );
\clk_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[4]_i_1_n_4\,
      Q => clk_count_reg(7),
      R => s_toggle4_out
    );
\clk_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_7\,
      Q => clk_count_reg(8),
      R => s_toggle4_out
    );
\clk_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_count_reg[4]_i_1_n_0\,
      CO(3) => \clk_count_reg[8]_i_1_n_0\,
      CO(2) => \clk_count_reg[8]_i_1_n_1\,
      CO(1) => \clk_count_reg[8]_i_1_n_2\,
      CO(0) => \clk_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \clk_count_reg[8]_i_1_n_4\,
      O(2) => \clk_count_reg[8]_i_1_n_5\,
      O(1) => \clk_count_reg[8]_i_1_n_6\,
      O(0) => \clk_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => clk_count_reg(11 downto 8)
    );
\clk_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => clk_count,
      D => \clk_count_reg[8]_i_1_n_6\,
      Q => clk_count_reg(9),
      R => s_toggle4_out
    );
done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => output_state(1),
      I1 => gen_1_pulse,
      I2 => done0,
      I3 => done,
      O => done_i_1_n_0
    );
done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => done_i_3_n_0,
      I1 => done,
      I2 => pulses_generated_reg(0),
      I3 => pulses_generated_reg(2),
      I4 => pulses_generated_reg(1),
      I5 => pulse_complete_reg_n_0,
      O => done_i_2_n_0
    );
done_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => pulses_generated_reg(13),
      I1 => pulses_generated_reg(12),
      I2 => pulses_generated_reg(3),
      I3 => \pulses_generated[0]_i_6_n_0\,
      I4 => \pulses_generated[0]_i_7_n_0\,
      O => done_i_3_n_0
    );
done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => '1',
      CLR => done_i_2_n_0,
      D => done_i_1_n_0,
      Q => done
    );
gen_1_pulse_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0FFA0FFE0FFE0"
    )
        port map (
      I0 => done_i_3_n_0,
      I1 => gen_1_pulse_i_2_n_0,
      I2 => output_state(1),
      I3 => gen_1_pulse,
      I4 => \pulses_generated[0]_i_8_n_0\,
      I5 => pulses_generated_reg(1),
      O => gen_1_pulse_i_1_n_0
    );
gen_1_pulse_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => pulses_generated_reg(2),
      I1 => pulses_generated_reg(0),
      I2 => done,
      O => gen_1_pulse_i_2_n_0
    );
gen_1_pulse_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => '1',
      CLR => pulse_complete_reg_n_0,
      D => gen_1_pulse_i_1_n_0,
      Q => gen_1_pulse
    );
output_set_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEF0F0FFFFF0F0"
    )
        port map (
      I0 => clk_count_reg(0),
      I1 => clk_count_reg(2),
      I2 => output_set_i_2_n_0,
      I3 => \clk_count[0]_i_4_n_0\,
      I4 => output_set_i_3_n_0,
      I5 => clk_count_reg(1),
      O => output_set_i_1_n_0
    );
output_set_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002FFFF00020000"
    )
        port map (
      I0 => \pulse_complete__0_i_2_n_0\,
      I1 => \clk_count[0]_i_7_n_0\,
      I2 => \clk_count[0]_i_6_n_0\,
      I3 => output_set_i_4_n_0,
      I4 => output_set,
      I5 => output_set_reg_n_0,
      O => output_set_i_2_n_0
    );
output_set_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => pulse_complete_reg_n_0,
      I1 => gen_1_pulse,
      I2 => s_toggle,
      O => output_set_i_3_n_0
    );
output_set_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => clk_count_reg(13),
      I1 => clk_count_reg(12),
      I2 => clk_count_reg(3),
      O => output_set_i_4_n_0
    );
output_set_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => pulse_complete_reg_n_0,
      I1 => gen_1_pulse,
      I2 => s_toggle,
      O => output_set
    );
output_set_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => '1',
      D => output_set_i_1_n_0,
      Q => output_set_reg_n_0,
      R => '0'
    );
\output_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => done,
      CE => '1',
      CLR => TRIGGER_IBUF_BUFG,
      D => '1',
      Q => output_state(0)
    );
\output_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => TRIGGER_IBUF_BUFG,
      CE => '1',
      CLR => done,
      D => '1',
      Q => output_state(1)
    );
\pulse_complete__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \clk_count[0]_i_4_n_0\,
      I1 => \pulse_complete__0_i_2_n_0\,
      I2 => gen_1_pulse,
      I3 => s_toggle,
      I4 => pulse_complete_reg_n_0,
      O => \pulse_complete__0_i_1_n_0\
    );
\pulse_complete__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => clk_count_reg(1),
      I1 => clk_count_reg(2),
      I2 => clk_count_reg(0),
      O => \pulse_complete__0_i_2_n_0\
    );
pulse_complete_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \pulse_complete_reg__1\,
      I1 => pulse_complete_reg_n_0,
      O => pulse_complete_i_1_n_0
    );
pulse_complete_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => '1',
      D => pulse_complete_i_1_n_0,
      Q => pulse_complete_reg_n_0,
      R => '0'
    );
\pulse_complete_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => '1',
      D => \pulse_complete__0_i_1_n_0\,
      Q => \pulse_complete_reg__1\,
      R => '0'
    );
\pulses_generated[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \pulses_generated[0]_i_4_n_0\,
      I1 => \pulses_generated[0]_i_5_n_0\,
      I2 => \pulses_generated[0]_i_6_n_0\,
      I3 => \pulses_generated[0]_i_7_n_0\,
      I4 => \pulses_generated[0]_i_8_n_0\,
      I5 => pulses_generated_reg(1),
      O => done0
    );
\pulses_generated[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => done_i_3_n_0,
      I1 => done,
      I2 => pulses_generated_reg(0),
      I3 => pulses_generated_reg(2),
      I4 => pulses_generated_reg(1),
      I5 => \pulses_generated[0]_i_4_n_0\,
      O => pulses_generated0
    );
\pulses_generated[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => gen_1_pulse,
      I1 => output_state(1),
      I2 => pulse_complete_reg_n_0,
      O => \pulses_generated[0]_i_4_n_0\
    );
\pulses_generated[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => pulses_generated_reg(13),
      I1 => pulses_generated_reg(12),
      I2 => pulses_generated_reg(3),
      O => \pulses_generated[0]_i_5_n_0\
    );
\pulses_generated[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pulses_generated_reg(9),
      I1 => pulses_generated_reg(8),
      I2 => pulses_generated_reg(11),
      I3 => pulses_generated_reg(10),
      O => \pulses_generated[0]_i_6_n_0\
    );
\pulses_generated[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pulses_generated_reg(5),
      I1 => pulses_generated_reg(4),
      I2 => pulses_generated_reg(7),
      I3 => pulses_generated_reg(6),
      O => \pulses_generated[0]_i_7_n_0\
    );
\pulses_generated[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => pulses_generated_reg(0),
      I1 => pulses_generated_reg(2),
      O => \pulses_generated[0]_i_8_n_0\
    );
\pulses_generated[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pulses_generated_reg(0),
      O => \pulses_generated[0]_i_9_n_0\
    );
\pulses_generated_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_7\,
      Q => pulses_generated_reg(0),
      R => done0
    );
\pulses_generated_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pulses_generated_reg[0]_i_3_n_0\,
      CO(2) => \pulses_generated_reg[0]_i_3_n_1\,
      CO(1) => \pulses_generated_reg[0]_i_3_n_2\,
      CO(0) => \pulses_generated_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pulses_generated_reg[0]_i_3_n_4\,
      O(2) => \pulses_generated_reg[0]_i_3_n_5\,
      O(1) => \pulses_generated_reg[0]_i_3_n_6\,
      O(0) => \pulses_generated_reg[0]_i_3_n_7\,
      S(3 downto 1) => pulses_generated_reg(3 downto 1),
      S(0) => \pulses_generated[0]_i_9_n_0\
    );
\pulses_generated_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_5\,
      Q => pulses_generated_reg(10),
      R => done0
    );
\pulses_generated_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_4\,
      Q => pulses_generated_reg(11),
      R => done0
    );
\pulses_generated_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[12]_i_1_n_7\,
      Q => pulses_generated_reg(12),
      R => done0
    );
\pulses_generated_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulses_generated_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_pulses_generated_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \pulses_generated_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_pulses_generated_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \pulses_generated_reg[12]_i_1_n_6\,
      O(0) => \pulses_generated_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => pulses_generated_reg(13 downto 12)
    );
\pulses_generated_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[12]_i_1_n_6\,
      Q => pulses_generated_reg(13),
      R => done0
    );
\pulses_generated_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_6\,
      Q => pulses_generated_reg(1),
      R => done0
    );
\pulses_generated_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_5\,
      Q => pulses_generated_reg(2),
      R => done0
    );
\pulses_generated_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[0]_i_3_n_4\,
      Q => pulses_generated_reg(3),
      R => done0
    );
\pulses_generated_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_7\,
      Q => pulses_generated_reg(4),
      R => done0
    );
\pulses_generated_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulses_generated_reg[0]_i_3_n_0\,
      CO(3) => \pulses_generated_reg[4]_i_1_n_0\,
      CO(2) => \pulses_generated_reg[4]_i_1_n_1\,
      CO(1) => \pulses_generated_reg[4]_i_1_n_2\,
      CO(0) => \pulses_generated_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulses_generated_reg[4]_i_1_n_4\,
      O(2) => \pulses_generated_reg[4]_i_1_n_5\,
      O(1) => \pulses_generated_reg[4]_i_1_n_6\,
      O(0) => \pulses_generated_reg[4]_i_1_n_7\,
      S(3 downto 0) => pulses_generated_reg(7 downto 4)
    );
\pulses_generated_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_6\,
      Q => pulses_generated_reg(5),
      R => done0
    );
\pulses_generated_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_5\,
      Q => pulses_generated_reg(6),
      R => done0
    );
\pulses_generated_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[4]_i_1_n_4\,
      Q => pulses_generated_reg(7),
      R => done0
    );
\pulses_generated_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_7\,
      Q => pulses_generated_reg(8),
      R => done0
    );
\pulses_generated_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulses_generated_reg[4]_i_1_n_0\,
      CO(3) => \pulses_generated_reg[8]_i_1_n_0\,
      CO(2) => \pulses_generated_reg[8]_i_1_n_1\,
      CO(1) => \pulses_generated_reg[8]_i_1_n_2\,
      CO(0) => \pulses_generated_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulses_generated_reg[8]_i_1_n_4\,
      O(2) => \pulses_generated_reg[8]_i_1_n_5\,
      O(1) => \pulses_generated_reg[8]_i_1_n_6\,
      O(0) => \pulses_generated_reg[8]_i_1_n_7\,
      S(3 downto 0) => pulses_generated_reg(11 downto 8)
    );
\pulses_generated_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => pulses_generated0,
      D => \pulses_generated_reg[8]_i_1_n_6\,
      Q => pulses_generated_reg(9),
      R => done0
    );
s_toggle_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00000400"
    )
        port map (
      I0 => \clk_count[0]_i_4_n_0\,
      I1 => clk_count,
      I2 => clk_count_reg(2),
      I3 => clk_count_reg(1),
      I4 => clk_count_reg(0),
      I5 => s_toggle,
      O => s_toggle_i_1_n_0
    );
s_toggle_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => MASTER_CLK_200MEG_IN_IBUF_BUFG,
      CE => '1',
      D => s_toggle_i_1_n_0,
      Q => s_toggle,
      R => '0'
    );
end STRUCTURE;
