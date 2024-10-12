-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Fri Oct 11 01:10:54 2024
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
entity comm_port is
  port (
    TORAM : out STD_LOGIC;
    \IO_PINS_EXT_IOBUF[0]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[0]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end comm_port;

architecture STRUCTURE of comm_port is
  signal \^toram\ : STD_LOGIC;
  signal TORAM_i_1_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM <= \^toram\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[0]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[0]_inst_i_1\
    );
TORAM_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram\,
      I3 => IO_PINS_EXT_IBUF(0),
      O => TORAM_i_1_n_0
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => TORAM_i_1_n_0,
      Q => \^toram\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_0 is
  port (
    \TORAM__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[10]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[10]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_0 : entity is "comm_port";
end comm_port_0;

architecture STRUCTURE of comm_port_0 is
  signal \^toram__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__9_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  \TORAM__0\(0) <= \^toram__0\(0);
\FSM_sequential_state[0]_i_1__9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[10]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[10]_inst_i_1\
    );
\TORAM_i_1__9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram__0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__9_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__9_n_0\,
      Q => \^toram__0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_1 is
  port (
    \TORAM__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[11]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[11]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_1 : entity is "comm_port";
end comm_port_1;

architecture STRUCTURE of comm_port_1 is
  signal \^toram__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__10_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  \TORAM__0\(0) <= \^toram__0\(0);
\FSM_sequential_state[0]_i_1__10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[11]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[11]_inst_i_1\
    );
\TORAM_i_1__10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram__0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__10_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__10_n_0\,
      Q => \^toram__0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_10 is
  port (
    \TORAM__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[5]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[5]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_10 : entity is "comm_port";
end comm_port_10;

architecture STRUCTURE of comm_port_10 is
  signal \^toram__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__4_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  \TORAM__0\(0) <= \^toram__0\(0);
\FSM_sequential_state[0]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[5]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[5]_inst_i_1\
    );
\TORAM_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram__0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__4_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__4_n_0\,
      Q => \^toram__0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_11 is
  port (
    \TORAM__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    TORAM_reg_0 : out STD_LOGIC;
    \IO_PINS_EXT_IOBUF[6]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    \FSM_sequential_state_reset_logic_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TORAM : in STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[6]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_11 : entity is "comm_port";
end comm_port_11;

architecture STRUCTURE of comm_port_11 is
  signal \^toram__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__5_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  \TORAM__0\(0) <= \^toram__0\(0);
\FSM_sequential_state[0]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\FSM_sequential_state_reset_logic[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^toram__0\(0),
      I1 => \FSM_sequential_state_reset_logic_reg[0]\(1),
      I2 => TORAM(0),
      I3 => \FSM_sequential_state_reset_logic_reg[0]\(0),
      I4 => \FSM_sequential_state_reset_logic_reg[0]\(3),
      I5 => \FSM_sequential_state_reset_logic_reg[0]\(2),
      O => TORAM_reg_0
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[6]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[6]_inst_i_1\
    );
\TORAM_i_1__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram__0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__5_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__5_n_0\,
      Q => \^toram__0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_12 is
  port (
    TORAM_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[7]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[7]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_12 : entity is "comm_port";
end comm_port_12;

architecture STRUCTURE of comm_port_12 is
  signal \TORAM_i_1__6_n_0\ : STD_LOGIC;
  signal \^toram_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_reg_0(0) <= \^toram_reg_0\(0);
\FSM_sequential_state[0]_i_1__6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[7]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[7]_inst_i_1\
    );
\TORAM_i_1__6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_reg_0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__6_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__6_n_0\,
      Q => \^toram_reg_0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_13 is
  port (
    TORAM_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[8]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[8]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_13 : entity is "comm_port";
end comm_port_13;

architecture STRUCTURE of comm_port_13 is
  signal \TORAM_i_1__7_n_0\ : STD_LOGIC;
  signal \^toram_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_reg_0(0) <= \^toram_reg_0\(0);
\FSM_sequential_state[0]_i_1__7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[8]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[8]_inst_i_1\
    );
\TORAM_i_1__7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_reg_0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__7_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__7_n_0\,
      Q => \^toram_reg_0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_14 is
  port (
    TORAM_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[9]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[9]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_14 : entity is "comm_port";
end comm_port_14;

architecture STRUCTURE of comm_port_14 is
  signal \TORAM_i_1__8_n_0\ : STD_LOGIC;
  signal \^toram_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_reg_0(0) <= \^toram_reg_0\(0);
\FSM_sequential_state[0]_i_1__8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[9]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[9]_inst_i_1\
    );
\TORAM_i_1__8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_reg_0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__8_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__8_n_0\,
      Q => \^toram_reg_0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_2 is
  port (
    \TORAM__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    TORAM_reg_0 : out STD_LOGIC;
    \IO_PINS_EXT_IOBUF[12]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    \FSM_sequential_state_reset_logic_reg[0]\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[12]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_2 : entity is "comm_port";
end comm_port_2;

architecture STRUCTURE of comm_port_2 is
  signal \^toram__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__11_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  \TORAM__0\(0) <= \^toram__0\(0);
\FSM_sequential_state[0]_i_1__11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\FSM_sequential_state_reset_logic[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^toram__0\(0),
      I1 => \FSM_sequential_state_reset_logic_reg[0]\(2),
      I2 => \FSM_sequential_state_reset_logic_reg[0]\(0),
      I3 => \FSM_sequential_state_reset_logic_reg[0]\(1),
      I4 => \FSM_sequential_state_reset_logic_reg[0]\(4),
      I5 => \FSM_sequential_state_reset_logic_reg[0]\(3),
      O => TORAM_reg_0
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[12]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[12]_inst_i_1\
    );
\TORAM_i_1__11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram__0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__11_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__11_n_0\,
      Q => \^toram__0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_3 is
  port (
    TORAM_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[13]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[13]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_3 : entity is "comm_port";
end comm_port_3;

architecture STRUCTURE of comm_port_3 is
  signal \TORAM_i_1__12_n_0\ : STD_LOGIC;
  signal \^toram_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_reg_0(0) <= \^toram_reg_0\(0);
\FSM_sequential_state[0]_i_1__12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[13]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[13]_inst_i_1\
    );
\TORAM_i_1__12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_reg_0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__12_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__12_n_0\,
      Q => \^toram_reg_0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_4 is
  port (
    TORAM_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[14]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[14]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_4 : entity is "comm_port";
end comm_port_4;

architecture STRUCTURE of comm_port_4 is
  signal \TORAM_i_1__13_n_0\ : STD_LOGIC;
  signal \^toram_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_reg_0(0) <= \^toram_reg_0\(0);
\FSM_sequential_state[0]_i_1__13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[14]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[14]_inst_i_1\
    );
\TORAM_i_1__13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_reg_0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__13_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__13_n_0\,
      Q => \^toram_reg_0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_5 is
  port (
    TORAM_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[15]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[15]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_5 : entity is "comm_port";
end comm_port_5;

architecture STRUCTURE of comm_port_5 is
  signal \TORAM_i_1__14_n_0\ : STD_LOGIC;
  signal \^toram_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_reg_0(0) <= \^toram_reg_0\(0);
\FSM_sequential_state[0]_i_1__14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[15]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[15]_inst_i_1\
    );
\TORAM_i_1__14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_reg_0\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__14_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__14_n_0\,
      Q => \^toram_reg_0\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_6 is
  port (
    TORAM_internal : out STD_LOGIC_VECTOR ( 0 to 0 );
    TORAM_reg_0 : out STD_LOGIC;
    \IO_PINS_EXT_IOBUF[1]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    TORAM : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[1]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_6 : entity is "comm_port";
end comm_port_6;

architecture STRUCTURE of comm_port_6 is
  signal \TORAM_i_1__0_n_0\ : STD_LOGIC;
  signal \^toram_internal\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_internal(0) <= \^toram_internal\(0);
\FSM_sequential_state[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\FSM_sequential_state_reset_logic[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^toram_internal\(0),
      I1 => TORAM(0),
      I2 => TORAM(2),
      I3 => TORAM(1),
      O => TORAM_reg_0
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[1]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[1]_inst_i_1\
    );
\TORAM_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_internal\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__0_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__0_n_0\,
      Q => \^toram_internal\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_7 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[2]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[2]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_7 : entity is "comm_port";
end comm_port_7;

architecture STRUCTURE of comm_port_7 is
  signal \^toram\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__1_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM(0) <= \^toram\(0);
\FSM_sequential_state[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[2]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[2]_inst_i_1\
    );
\TORAM_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__1_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__1_n_0\,
      Q => \^toram\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_8 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[3]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[3]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_8 : entity is "comm_port";
end comm_port_8;

architecture STRUCTURE of comm_port_8 is
  signal \^toram\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \TORAM_i_1__2_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM(0) <= \^toram\(0);
\FSM_sequential_state[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[3]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[3]_inst_i_1\
    );
\TORAM_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__2_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__2_n_0\,
      Q => \^toram\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_9 is
  port (
    TORAM_internal : out STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_IOBUF[4]_inst_i_1\ : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \IO_PINS_EXT_TRI[4]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_9 : entity is "comm_port";
end comm_port_9;

architecture STRUCTURE of comm_port_9 is
  signal \TORAM_i_1__3_n_0\ : STD_LOGIC;
  signal \^toram_internal\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,wait_state1:001,wait_state_w_1:011,read_ram:101,wait_state_r_1:100,write_ram:010";
begin
  TORAM_internal(0) <= \^toram_internal\(0);
\FSM_sequential_state[0]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[1]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0046"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1120"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => RW_EXT_IBUF,
      I3 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(0),
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(1),
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \state__0\(2),
      Q => state(2),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACAAAAAF"
    )
        port map (
      I0 => \IO_PINS_EXT_TRI[4]\,
      I1 => Q(0),
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      O => \IO_PINS_EXT_IOBUF[4]_inst_i_1\
    );
\TORAM_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F1E0"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \^toram_internal\(0),
      I3 => IO_PINS_EXT_IBUF(0),
      O => \TORAM_i_1__3_n_0\
    );
TORAM_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \TORAM_i_1__3_n_0\,
      Q => \^toram_internal\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity internal_ram is
  port (
    TOPORT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RW_EXT_IBUF : in STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    TORAM : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end internal_ram;

architecture STRUCTURE of internal_ram is
  signal ADDRESS : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ADDRESS__0\ : STD_LOGIC;
  signal \FSM_onehot_ram_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_ram_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_ram_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_ram_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_ram_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_ram_state_reg_n_0_[3]\ : STD_LOGIC;
  signal RAM : STD_LOGIC;
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
  signal TOPORT0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_ram_state_reg[0]\ : label is "wait_state:00001,set_address:00010,wait_state2:00100,write_ram:10000,read_ram:01000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_ram_state_reg[1]\ : label is "wait_state:00001,set_address:00010,wait_state2:00100,write_ram:10000,read_ram:01000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_ram_state_reg[2]\ : label is "wait_state:00001,set_address:00010,wait_state2:00100,write_ram:10000,read_ram:01000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_ram_state_reg[3]\ : label is "wait_state:00001,set_address:00010,wait_state2:00100,write_ram:10000,read_ram:01000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_ram_state_reg[4]\ : label is "wait_state:00001,set_address:00010,wait_state2:00100,write_ram:10000,read_ram:01000";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_15_0_0 : label is 384;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_15_0_0 : label is "ram/RAM_reg";
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
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__0\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__0\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__0\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__0\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__0\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__0\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__0\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__0\ : label is 0;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__0\ : label is 0;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__1\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__1\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__1\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__1\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__1\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__1\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__1\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__1\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__1\ : label is 1;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__1\ : label is 1;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__10\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__10\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__10\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__10\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__10\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__10\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__10\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__10\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__10\ : label is 5;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__10\ : label is 5;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__11\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__11\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__11\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__11\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__11\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__11\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__11\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__11\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__11\ : label is 6;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__11\ : label is 6;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__12\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__12\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__12\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__12\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__12\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__12\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__12\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__12\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__12\ : label is 6;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__12\ : label is 6;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__13\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__13\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__13\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__13\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__13\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__13\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__13\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__13\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__13\ : label is 7;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__13\ : label is 7;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__14\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__14\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__14\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__14\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__14\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__14\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__14\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__14\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__14\ : label is 7;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__14\ : label is 7;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__15\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__15\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__15\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__15\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__15\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__15\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__15\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__15\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__15\ : label is 8;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__15\ : label is 8;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__16\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__16\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__16\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__16\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__16\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__16\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__16\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__16\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__16\ : label is 8;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__16\ : label is 8;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__17\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__17\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__17\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__17\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__17\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__17\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__17\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__17\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__17\ : label is 9;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__17\ : label is 9;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__18\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__18\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__18\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__18\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__18\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__18\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__18\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__18\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__18\ : label is 9;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__18\ : label is 9;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__19\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__19\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__19\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__19\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__19\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__19\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__19\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__19\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__19\ : label is 10;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__19\ : label is 10;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__2\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__2\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__2\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__2\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__2\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__2\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__2\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__2\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__2\ : label is 1;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__2\ : label is 1;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__20\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__20\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__20\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__20\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__20\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__20\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__20\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__20\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__20\ : label is 10;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__20\ : label is 10;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__21\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__21\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__21\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__21\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__21\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__21\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__21\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__21\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__21\ : label is 11;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__21\ : label is 11;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__22\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__22\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__22\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__22\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__22\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__22\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__22\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__22\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__22\ : label is 11;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__22\ : label is 11;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__23\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__23\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__23\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__23\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__23\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__23\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__23\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__23\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__23\ : label is 12;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__23\ : label is 12;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__24\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__24\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__24\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__24\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__24\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__24\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__24\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__24\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__24\ : label is 12;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__24\ : label is 12;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__25\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__25\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__25\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__25\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__25\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__25\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__25\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__25\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__25\ : label is 13;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__25\ : label is 13;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__26\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__26\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__26\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__26\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__26\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__26\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__26\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__26\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__26\ : label is 13;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__26\ : label is 13;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__27\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__27\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__27\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__27\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__27\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__27\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__27\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__27\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__27\ : label is 14;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__27\ : label is 14;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__28\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__28\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__28\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__28\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__28\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__28\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__28\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__28\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__28\ : label is 14;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__28\ : label is 14;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__29\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__29\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__29\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__29\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__29\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__29\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__29\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__29\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__29\ : label is 15;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__29\ : label is 15;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__3\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__3\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__3\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__3\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__3\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__3\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__3\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__3\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__3\ : label is 2;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__3\ : label is 2;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__30\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__30\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__30\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__30\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__30\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__30\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__30\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__30\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__30\ : label is 15;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__30\ : label is 15;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__4\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__4\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__4\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__4\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__4\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__4\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__4\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__4\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__4\ : label is 2;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__4\ : label is 2;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__5\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__5\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__5\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__5\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__5\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__5\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__5\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__5\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__5\ : label is 3;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__5\ : label is 3;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__6\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__6\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__6\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__6\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__6\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__6\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__6\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__6\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__6\ : label is 3;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__6\ : label is 3;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__7\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__7\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__7\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__7\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__7\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__7\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__7\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__7\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__7\ : label is 4;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__7\ : label is 4;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__8\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__8\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__8\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__8\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__8\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__8\ : label is 16;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__8\ : label is 23;
  attribute ram_offset of \RAM_reg_0_15_0_0__8\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__8\ : label is 4;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__8\ : label is 4;
  attribute RTL_RAM_BITS of \RAM_reg_0_15_0_0__9\ : label is 384;
  attribute RTL_RAM_NAME of \RAM_reg_0_15_0_0__9\ : label is "ram/RAM_reg";
  attribute RTL_RAM_TYPE of \RAM_reg_0_15_0_0__9\ : label is "RAM_SP";
  attribute XILINX_LEGACY_PRIM of \RAM_reg_0_15_0_0__9\ : label is "RAM16X1S";
  attribute XILINX_TRANSFORM_PINMAP of \RAM_reg_0_15_0_0__9\ : label is "GND:A4";
  attribute ram_addr_begin of \RAM_reg_0_15_0_0__9\ : label is 0;
  attribute ram_addr_end of \RAM_reg_0_15_0_0__9\ : label is 15;
  attribute ram_offset of \RAM_reg_0_15_0_0__9\ : label is 0;
  attribute ram_slice_begin of \RAM_reg_0_15_0_0__9\ : label is 5;
  attribute ram_slice_end of \RAM_reg_0_15_0_0__9\ : label is 5;
begin
\ADDRESS_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \ADDRESS__0\,
      D => TORAM(0),
      Q => ADDRESS(0),
      R => '0'
    );
\ADDRESS_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \ADDRESS__0\,
      D => TORAM(1),
      Q => ADDRESS(1),
      R => '0'
    );
\ADDRESS_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \ADDRESS__0\,
      D => TORAM(2),
      Q => ADDRESS(2),
      R => '0'
    );
\ADDRESS_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \ADDRESS__0\,
      D => TORAM(3),
      Q => ADDRESS(3),
      R => '0'
    );
\ADDRESS_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \ADDRESS__0\,
      D => TORAM(4),
      Q => ADDRESS(4),
      R => '0'
    );
\FSM_onehot_ram_state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_ram_state_reg_n_0_[3]\,
      I1 => RAM,
      O => \FSM_onehot_ram_state[0]_i_1_n_0\
    );
\FSM_onehot_ram_state[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_ram_state_reg_n_0_[2]\,
      I1 => RW_EXT_IBUF,
      O => \FSM_onehot_ram_state[3]_i_1_n_0\
    );
\FSM_onehot_ram_state[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_ram_state_reg_n_0_[2]\,
      I1 => RW_EXT_IBUF,
      O => \FSM_onehot_ram_state[4]_i_1_n_0\
    );
\FSM_onehot_ram_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \FSM_onehot_ram_state[0]_i_1_n_0\,
      Q => \FSM_onehot_ram_state_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_ram_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \FSM_onehot_ram_state_reg_n_0_[0]\,
      Q => \ADDRESS__0\,
      R => '0'
    );
\FSM_onehot_ram_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \ADDRESS__0\,
      Q => \FSM_onehot_ram_state_reg_n_0_[2]\,
      R => '0'
    );
\FSM_onehot_ram_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \FSM_onehot_ram_state[3]_i_1_n_0\,
      Q => \FSM_onehot_ram_state_reg_n_0_[3]\,
      R => '0'
    );
\FSM_onehot_ram_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \FSM_onehot_ram_state[4]_i_1_n_0\,
      Q => RAM,
      R => '0'
    );
RAM_reg_0_15_0_0: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(0),
      O => RAM_reg_0_15_0_0_n_0,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__0\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(0),
      O => \RAM_reg_0_15_0_0__0_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAM,
      I1 => ADDRESS(4),
      O => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__1\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(1),
      O => \RAM_reg_0_15_0_0__1_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__10\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(5),
      O => \RAM_reg_0_15_0_0__10_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__11\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(6),
      O => \RAM_reg_0_15_0_0__11_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__12\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(6),
      O => \RAM_reg_0_15_0_0__12_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__13\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(7),
      O => \RAM_reg_0_15_0_0__13_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__14\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(7),
      O => \RAM_reg_0_15_0_0__14_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__15\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(8),
      O => \RAM_reg_0_15_0_0__15_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__16\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(8),
      O => \RAM_reg_0_15_0_0__16_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__17\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(9),
      O => \RAM_reg_0_15_0_0__17_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__18\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(9),
      O => \RAM_reg_0_15_0_0__18_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__19\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(10),
      O => \RAM_reg_0_15_0_0__19_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__2\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(1),
      O => \RAM_reg_0_15_0_0__2_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__20\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(10),
      O => \RAM_reg_0_15_0_0__20_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__21\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(11),
      O => \RAM_reg_0_15_0_0__21_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__22\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(11),
      O => \RAM_reg_0_15_0_0__22_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__23\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(12),
      O => \RAM_reg_0_15_0_0__23_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__24\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(12),
      O => \RAM_reg_0_15_0_0__24_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__25\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(13),
      O => \RAM_reg_0_15_0_0__25_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__26\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(13),
      O => \RAM_reg_0_15_0_0__26_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__27\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(14),
      O => \RAM_reg_0_15_0_0__27_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__28\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(14),
      O => \RAM_reg_0_15_0_0__28_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__29\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(15),
      O => \RAM_reg_0_15_0_0__29_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__3\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(2),
      O => \RAM_reg_0_15_0_0__3_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__30\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(15),
      O => \RAM_reg_0_15_0_0__30_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__4\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(2),
      O => \RAM_reg_0_15_0_0__4_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__5\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(3),
      O => \RAM_reg_0_15_0_0__5_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__6\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(3),
      O => \RAM_reg_0_15_0_0__6_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__7\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(4),
      O => \RAM_reg_0_15_0_0__7_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
\RAM_reg_0_15_0_0__8\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(4),
      O => \RAM_reg_0_15_0_0__8_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__9\: unisim.vcomponents.RAM32X1S
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => ADDRESS(0),
      A1 => ADDRESS(1),
      A2 => ADDRESS(2),
      A3 => ADDRESS(3),
      A4 => '0',
      D => TORAM(5),
      O => \RAM_reg_0_15_0_0__9_n_0\,
      WCLK => CLK_EXT_IBUF_BUFG,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
RAM_reg_0_15_0_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RAM,
      I1 => ADDRESS(4),
      O => RAM_reg_0_15_0_0_i_1_n_0
    );
\TOPORT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__0_n_0\,
      I1 => ADDRESS(4),
      I2 => RAM_reg_0_15_0_0_n_0,
      O => TOPORT0(0)
    );
\TOPORT[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__20_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__19_n_0\,
      O => TOPORT0(10)
    );
\TOPORT[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__22_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__21_n_0\,
      O => TOPORT0(11)
    );
\TOPORT[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__24_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__23_n_0\,
      O => TOPORT0(12)
    );
\TOPORT[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__26_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__25_n_0\,
      O => TOPORT0(13)
    );
\TOPORT[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__28_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__27_n_0\,
      O => TOPORT0(14)
    );
\TOPORT[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__30_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__29_n_0\,
      O => TOPORT0(15)
    );
\TOPORT[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__2_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__1_n_0\,
      O => TOPORT0(1)
    );
\TOPORT[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__4_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__3_n_0\,
      O => TOPORT0(2)
    );
\TOPORT[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__6_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__5_n_0\,
      O => TOPORT0(3)
    );
\TOPORT[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__8_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__7_n_0\,
      O => TOPORT0(4)
    );
\TOPORT[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__10_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__9_n_0\,
      O => TOPORT0(5)
    );
\TOPORT[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__12_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__11_n_0\,
      O => TOPORT0(6)
    );
\TOPORT[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__14_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__13_n_0\,
      O => TOPORT0(7)
    );
\TOPORT[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__16_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__15_n_0\,
      O => TOPORT0(8)
    );
\TOPORT[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \RAM_reg_0_15_0_0__18_n_0\,
      I1 => ADDRESS(4),
      I2 => \RAM_reg_0_15_0_0__17_n_0\,
      O => TOPORT0(9)
    );
\TOPORT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(0),
      Q => TOPORT(0),
      R => '0'
    );
\TOPORT_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(10),
      Q => TOPORT(10),
      R => '0'
    );
\TOPORT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(11),
      Q => TOPORT(11),
      R => '0'
    );
\TOPORT_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(12),
      Q => TOPORT(12),
      R => '0'
    );
\TOPORT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(13),
      Q => TOPORT(13),
      R => '0'
    );
\TOPORT_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(14),
      Q => TOPORT(14),
      R => '0'
    );
\TOPORT_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(15),
      Q => TOPORT(15),
      R => '0'
    );
\TOPORT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(1),
      Q => TOPORT(1),
      R => '0'
    );
\TOPORT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(2),
      Q => TOPORT(2),
      R => '0'
    );
\TOPORT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(3),
      Q => TOPORT(3),
      R => '0'
    );
\TOPORT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(4),
      Q => TOPORT(4),
      R => '0'
    );
\TOPORT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(5),
      Q => TOPORT(5),
      R => '0'
    );
\TOPORT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(6),
      Q => TOPORT(6),
      R => '0'
    );
\TOPORT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(7),
      Q => TOPORT(7),
      R => '0'
    );
\TOPORT_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(8),
      Q => TOPORT(8),
      R => '0'
    );
\TOPORT_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => \FSM_onehot_ram_state[3]_i_1_n_0\,
      D => TOPORT0(9),
      Q => TOPORT(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity reset_IO_RAM_logic is
  port (
    DUMMYOUT_OBUF : out STD_LOGIC;
    CLK_EXT_IBUF_BUFG : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    \FSM_sequential_state_reset_logic_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_state_reset_logic_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_state_reset_logic_reg[0]_2\ : in STD_LOGIC
  );
end reset_IO_RAM_logic;

architecture STRUCTURE of reset_IO_RAM_logic is
  signal \^dummyout_obuf\ : STD_LOGIC;
  signal \FSM_sequential_state_reset_logic[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_reset_logic[1]_i_1_n_0\ : STD_LOGIC;
  signal reset_signal : STD_LOGIC;
  signal \reset_signal__0_i_1_n_0\ : STD_LOGIC;
  signal reset_signal_reg_n_0 : STD_LOGIC;
  signal \state_reset_logic__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reset_logic_reg[0]\ : label is "check_io_pins_clk0:00,rw_high_clk1:01,rw_low_clk2:10,rw_high_clk3:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reset_logic_reg[1]\ : label is "check_io_pins_clk0:00,rw_high_clk1:01,rw_low_clk2:10,rw_high_clk3:11";
begin
  DUMMYOUT_OBUF <= \^dummyout_obuf\;
\FSM_sequential_state_reset_logic[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F000F0F880F00"
    )
        port map (
      I0 => \FSM_sequential_state_reset_logic_reg[0]_0\,
      I1 => \FSM_sequential_state_reset_logic_reg[0]_1\,
      I2 => RW_EXT_IBUF,
      I3 => \state_reset_logic__0\(1),
      I4 => \FSM_sequential_state_reset_logic_reg[0]_2\,
      I5 => \state_reset_logic__0\(0),
      O => \FSM_sequential_state_reset_logic[0]_i_1_n_0\
    );
\FSM_sequential_state_reset_logic[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4A"
    )
        port map (
      I0 => \state_reset_logic__0\(1),
      I1 => RW_EXT_IBUF,
      I2 => \state_reset_logic__0\(0),
      O => \FSM_sequential_state_reset_logic[1]_i_1_n_0\
    );
\FSM_sequential_state_reset_logic_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_state_reset_logic[0]_i_1_n_0\,
      Q => \state_reset_logic__0\(0),
      R => '0'
    );
\FSM_sequential_state_reset_logic_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_state_reset_logic[1]_i_1_n_0\,
      Q => \state_reset_logic__0\(1),
      R => '0'
    );
\reset_signal__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => reset_signal_reg_n_0,
      I1 => \^dummyout_obuf\,
      O => \reset_signal__0_i_1_n_0\
    );
reset_signal_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => \^dummyout_obuf\,
      I1 => \state_reset_logic__0\(0),
      I2 => \state_reset_logic__0\(1),
      I3 => RW_EXT_IBUF,
      O => reset_signal
    );
reset_signal_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => reset_signal,
      Q => reset_signal_reg_n_0,
      R => '0'
    );
\reset_signal_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \reset_signal__0_i_1_n_0\,
      Q => \^dummyout_obuf\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sample_control_TOP is
  port (
    DUMMYOUT : out STD_LOGIC;
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
  signal DUMMYOUT_OBUF : STD_LOGIC;
  signal IO_PINS_EXT_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
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
  signal TOPORT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TORAM : STD_LOGIC;
  signal \TORAM__0\ : STD_LOGIC_VECTOR ( 15 downto 5 );
  signal TORAM_internal : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \gen_comm_port[0].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[10].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[11].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[12].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[12].commport_n_2\ : STD_LOGIC;
  signal \gen_comm_port[13].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[14].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[15].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[1].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[1].commport_n_2\ : STD_LOGIC;
  signal \gen_comm_port[2].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[3].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[4].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[5].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[6].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[6].commport_n_2\ : STD_LOGIC;
  signal \gen_comm_port[7].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[8].commport_n_1\ : STD_LOGIC;
  signal \gen_comm_port[9].commport_n_1\ : STD_LOGIC;
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
DUMMYOUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => DUMMYOUT_OBUF,
      O => DUMMYOUT
    );
\IO_PINS_EXT_IOBUF[0]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(0),
      O => IO_PINS_EXT_IBUF(0),
      T => \IO_PINS_EXT_TRI[0]\
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[0].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[0]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[10]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(10),
      O => IO_PINS_EXT_IBUF(10),
      T => \IO_PINS_EXT_TRI[10]\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[10].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[10]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[11]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(11),
      O => IO_PINS_EXT_IBUF(11),
      T => \IO_PINS_EXT_TRI[11]\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[11].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[11]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[12]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(12),
      O => IO_PINS_EXT_IBUF(12),
      T => \IO_PINS_EXT_TRI[12]\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[12].commport_n_2\,
      Q => \IO_PINS_EXT_TRI[12]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[13]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(13),
      O => IO_PINS_EXT_IBUF(13),
      T => \IO_PINS_EXT_TRI[13]\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[13].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[13]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[14]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(14),
      O => IO_PINS_EXT_IBUF(14),
      T => \IO_PINS_EXT_TRI[14]\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[14].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[14]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[15]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(15),
      O => IO_PINS_EXT_IBUF(15),
      T => \IO_PINS_EXT_TRI[15]\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[15].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[15]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[1]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(1),
      O => IO_PINS_EXT_IBUF(1),
      T => \IO_PINS_EXT_TRI[1]\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[1].commport_n_2\,
      Q => \IO_PINS_EXT_TRI[1]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[2]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(2),
      O => IO_PINS_EXT_IBUF(2),
      T => \IO_PINS_EXT_TRI[2]\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[2].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[2]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[3]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(3),
      O => IO_PINS_EXT_IBUF(3),
      T => \IO_PINS_EXT_TRI[3]\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[3].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[3]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[4]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(4),
      O => IO_PINS_EXT_IBUF(4),
      T => \IO_PINS_EXT_TRI[4]\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[4].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[4]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[5]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(5),
      O => IO_PINS_EXT_IBUF(5),
      T => \IO_PINS_EXT_TRI[5]\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[5].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[5]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[6]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(6),
      O => IO_PINS_EXT_IBUF(6),
      T => \IO_PINS_EXT_TRI[6]\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[6].commport_n_2\,
      Q => \IO_PINS_EXT_TRI[6]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[7]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(7),
      O => IO_PINS_EXT_IBUF(7),
      T => \IO_PINS_EXT_TRI[7]\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[7].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[7]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[8]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(8),
      O => IO_PINS_EXT_IBUF(8),
      T => \IO_PINS_EXT_TRI[8]\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[8].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[8]\,
      R => '0'
    );
\IO_PINS_EXT_IOBUF[9]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(9),
      O => IO_PINS_EXT_IBUF(9),
      T => \IO_PINS_EXT_TRI[9]\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_EXT_IBUF_BUFG,
      CE => '1',
      D => \gen_comm_port[9].commport_n_1\,
      Q => \IO_PINS_EXT_TRI[9]\,
      R => '0'
    );
RW_EXT_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RW_EXT,
      O => RW_EXT_IBUF
    );
\gen_comm_port[0].commport\: entity work.comm_port
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(0),
      \IO_PINS_EXT_IOBUF[0]_inst_i_1\ => \gen_comm_port[0].commport_n_1\,
      \IO_PINS_EXT_TRI[0]\ => \IO_PINS_EXT_TRI[0]\,
      Q(0) => TOPORT(0),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM => TORAM
    );
\gen_comm_port[10].commport\: entity work.comm_port_0
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(10),
      \IO_PINS_EXT_IOBUF[10]_inst_i_1\ => \gen_comm_port[10].commport_n_1\,
      \IO_PINS_EXT_TRI[10]\ => \IO_PINS_EXT_TRI[10]\,
      Q(0) => TOPORT(10),
      RW_EXT_IBUF => RW_EXT_IBUF,
      \TORAM__0\(0) => \TORAM__0\(10)
    );
\gen_comm_port[11].commport\: entity work.comm_port_1
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(11),
      \IO_PINS_EXT_IOBUF[11]_inst_i_1\ => \gen_comm_port[11].commport_n_1\,
      \IO_PINS_EXT_TRI[11]\ => \IO_PINS_EXT_TRI[11]\,
      Q(0) => TOPORT(11),
      RW_EXT_IBUF => RW_EXT_IBUF,
      \TORAM__0\(0) => \TORAM__0\(11)
    );
\gen_comm_port[12].commport\: entity work.comm_port_2
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      \FSM_sequential_state_reset_logic_reg[0]\(4 downto 2) => \TORAM__0\(15 downto 13),
      \FSM_sequential_state_reset_logic_reg[0]\(1 downto 0) => \TORAM__0\(11 downto 10),
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(12),
      \IO_PINS_EXT_IOBUF[12]_inst_i_1\ => \gen_comm_port[12].commport_n_2\,
      \IO_PINS_EXT_TRI[12]\ => \IO_PINS_EXT_TRI[12]\,
      Q(0) => TOPORT(12),
      RW_EXT_IBUF => RW_EXT_IBUF,
      \TORAM__0\(0) => \TORAM__0\(12),
      TORAM_reg_0 => \gen_comm_port[12].commport_n_1\
    );
\gen_comm_port[13].commport\: entity work.comm_port_3
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(13),
      \IO_PINS_EXT_IOBUF[13]_inst_i_1\ => \gen_comm_port[13].commport_n_1\,
      \IO_PINS_EXT_TRI[13]\ => \IO_PINS_EXT_TRI[13]\,
      Q(0) => TOPORT(13),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_reg_0(0) => \TORAM__0\(13)
    );
\gen_comm_port[14].commport\: entity work.comm_port_4
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(14),
      \IO_PINS_EXT_IOBUF[14]_inst_i_1\ => \gen_comm_port[14].commport_n_1\,
      \IO_PINS_EXT_TRI[14]\ => \IO_PINS_EXT_TRI[14]\,
      Q(0) => TOPORT(14),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_reg_0(0) => \TORAM__0\(14)
    );
\gen_comm_port[15].commport\: entity work.comm_port_5
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(15),
      \IO_PINS_EXT_IOBUF[15]_inst_i_1\ => \gen_comm_port[15].commport_n_1\,
      \IO_PINS_EXT_TRI[15]\ => \IO_PINS_EXT_TRI[15]\,
      Q(0) => TOPORT(15),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_reg_0(0) => \TORAM__0\(15)
    );
\gen_comm_port[1].commport\: entity work.comm_port_6
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(1),
      \IO_PINS_EXT_IOBUF[1]_inst_i_1\ => \gen_comm_port[1].commport_n_2\,
      \IO_PINS_EXT_TRI[1]\ => \IO_PINS_EXT_TRI[1]\,
      Q(0) => TOPORT(1),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM(2 downto 1) => TORAM_internal(3 downto 2),
      TORAM(0) => TORAM,
      TORAM_internal(0) => TORAM_internal(1),
      TORAM_reg_0 => \gen_comm_port[1].commport_n_1\
    );
\gen_comm_port[2].commport\: entity work.comm_port_7
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(2),
      \IO_PINS_EXT_IOBUF[2]_inst_i_1\ => \gen_comm_port[2].commport_n_1\,
      \IO_PINS_EXT_TRI[2]\ => \IO_PINS_EXT_TRI[2]\,
      Q(0) => TOPORT(2),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM(0) => TORAM_internal(2)
    );
\gen_comm_port[3].commport\: entity work.comm_port_8
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(3),
      \IO_PINS_EXT_IOBUF[3]_inst_i_1\ => \gen_comm_port[3].commport_n_1\,
      \IO_PINS_EXT_TRI[3]\ => \IO_PINS_EXT_TRI[3]\,
      Q(0) => TOPORT(3),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM(0) => TORAM_internal(3)
    );
\gen_comm_port[4].commport\: entity work.comm_port_9
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(4),
      \IO_PINS_EXT_IOBUF[4]_inst_i_1\ => \gen_comm_port[4].commport_n_1\,
      \IO_PINS_EXT_TRI[4]\ => \IO_PINS_EXT_TRI[4]\,
      Q(0) => TOPORT(4),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_internal(0) => TORAM_internal(4)
    );
\gen_comm_port[5].commport\: entity work.comm_port_10
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(5),
      \IO_PINS_EXT_IOBUF[5]_inst_i_1\ => \gen_comm_port[5].commport_n_1\,
      \IO_PINS_EXT_TRI[5]\ => \IO_PINS_EXT_TRI[5]\,
      Q(0) => TOPORT(5),
      RW_EXT_IBUF => RW_EXT_IBUF,
      \TORAM__0\(0) => \TORAM__0\(5)
    );
\gen_comm_port[6].commport\: entity work.comm_port_11
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      \FSM_sequential_state_reset_logic_reg[0]\(3 downto 1) => \TORAM__0\(9 downto 7),
      \FSM_sequential_state_reset_logic_reg[0]\(0) => \TORAM__0\(5),
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(6),
      \IO_PINS_EXT_IOBUF[6]_inst_i_1\ => \gen_comm_port[6].commport_n_2\,
      \IO_PINS_EXT_TRI[6]\ => \IO_PINS_EXT_TRI[6]\,
      Q(0) => TOPORT(6),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM(0) => TORAM_internal(4),
      \TORAM__0\(0) => \TORAM__0\(6),
      TORAM_reg_0 => \gen_comm_port[6].commport_n_1\
    );
\gen_comm_port[7].commport\: entity work.comm_port_12
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(7),
      \IO_PINS_EXT_IOBUF[7]_inst_i_1\ => \gen_comm_port[7].commport_n_1\,
      \IO_PINS_EXT_TRI[7]\ => \IO_PINS_EXT_TRI[7]\,
      Q(0) => TOPORT(7),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_reg_0(0) => \TORAM__0\(7)
    );
\gen_comm_port[8].commport\: entity work.comm_port_13
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(8),
      \IO_PINS_EXT_IOBUF[8]_inst_i_1\ => \gen_comm_port[8].commport_n_1\,
      \IO_PINS_EXT_TRI[8]\ => \IO_PINS_EXT_TRI[8]\,
      Q(0) => TOPORT(8),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_reg_0(0) => \TORAM__0\(8)
    );
\gen_comm_port[9].commport\: entity work.comm_port_14
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(9),
      \IO_PINS_EXT_IOBUF[9]_inst_i_1\ => \gen_comm_port[9].commport_n_1\,
      \IO_PINS_EXT_TRI[9]\ => \IO_PINS_EXT_TRI[9]\,
      Q(0) => TOPORT(9),
      RW_EXT_IBUF => RW_EXT_IBUF,
      TORAM_reg_0(0) => \TORAM__0\(9)
    );
logic_resetter: entity work.reset_IO_RAM_logic
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      DUMMYOUT_OBUF => DUMMYOUT_OBUF,
      \FSM_sequential_state_reset_logic_reg[0]_0\ => \gen_comm_port[6].commport_n_1\,
      \FSM_sequential_state_reset_logic_reg[0]_1\ => \gen_comm_port[1].commport_n_1\,
      \FSM_sequential_state_reset_logic_reg[0]_2\ => \gen_comm_port[12].commport_n_1\,
      RW_EXT_IBUF => RW_EXT_IBUF
    );
ram: entity work.internal_ram
     port map (
      CLK_EXT_IBUF_BUFG => CLK_EXT_IBUF_BUFG,
      RW_EXT_IBUF => RW_EXT_IBUF,
      TOPORT(15 downto 0) => TOPORT(15 downto 0),
      TORAM(15 downto 5) => \TORAM__0\(15 downto 5),
      TORAM(4 downto 1) => TORAM_internal(4 downto 1),
      TORAM(0) => TORAM
    );
end STRUCTURE;
