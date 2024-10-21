-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Oct 19 16:28:46 2024
-- Host        : DESKTOP-DNC9NIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {F:/Git
--               Projects/EIT/P7---Bsc/Code/VHDL/TestClockGenForRam/TestClockGenForRam.sim/sim_1/impl/func/xsim/pulse_train_gen_func_impl.vhd}
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
    test : out STD_LOGIC;
    Trig_in : in STD_LOGIC;
    Trig_out : out STD_LOGIC;
    CLK_in : in STD_LOGIC;
    RAM_CLK : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pulse_train_gen : entity is true;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ of pulse_train_gen : entity is std.standard.true;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ of pulse_train_gen : entity is std.standard.true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of pulse_train_gen : entity is "dd6db6e6";
end pulse_train_gen;

architecture STRUCTURE of pulse_train_gen is
  signal CLK_in_IBUF : STD_LOGIC;
  signal CLK_in_IBUF_BUFG : STD_LOGIC;
  signal RAM_CLK_OBUF : STD_LOGIC;
  signal Trig_out_OBUF : STD_LOGIC;
  signal active : STD_LOGIC;
  signal active_i_1_n_0 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal test_OBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair1";
begin
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
RAM_CLK_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => RAM_CLK_OBUF,
      O => RAM_CLK
    );
RAM_CLK_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => CLK_in_IBUF,
      I1 => active,
      O => RAM_CLK_OBUF
    );
Trig_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Trig_in,
      O => Trig_out_OBUF
    );
Trig_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Trig_out_OBUF,
      O => Trig_out
    );
active_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF0000FB00"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => Trig_out_OBUF,
      I4 => test_OBUF,
      I5 => active,
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
\count[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA51AA"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => Trig_out_OBUF,
      I4 => test_OBUF,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CC6C"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => Trig_out_OBUF,
      I3 => test_OBUF,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCC68CC"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => Trig_out_OBUF,
      I4 => test_OBUF,
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
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF000400"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => Trig_out_OBUF,
      I4 => test_OBUF,
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
      Q => test_OBUF,
      R => '0'
    );
test_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => test_OBUF,
      O => test
    );
end STRUCTURE;
