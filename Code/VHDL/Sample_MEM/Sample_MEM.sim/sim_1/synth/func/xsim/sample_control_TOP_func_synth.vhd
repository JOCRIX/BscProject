-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Nov  3 02:42:31 2024
-- Host        : DESKTOP-S99FO1K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/Sample_MEM/Sample_MEM.sim/sim_1/synth/func/xsim/sample_control_TOP_func_synth.vhd
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
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    RW_EXT_IBUF_BUFG_inst : out STD_LOGIC;
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end comm_port;

architecture STRUCTURE of comm_port is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
  RW_EXT_IBUF_BUFG_inst <= \^e\(0);
  \^e\(0) <= E(0);
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \^e\(0),
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_0 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__19\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_0 : entity is "comm_port";
end comm_port_0;

architecture STRUCTURE of comm_port_0 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__19\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_1 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__21\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_1 : entity is "comm_port";
end comm_port_1;

architecture STRUCTURE of comm_port_1 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__21\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_10 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__9\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_10 : entity is "comm_port";
end comm_port_10;

architecture STRUCTURE of comm_port_10 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__9\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_11 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__11\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_11 : entity is "comm_port";
end comm_port_11;

architecture STRUCTURE of comm_port_11 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__11\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_12 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__13\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_12 : entity is "comm_port";
end comm_port_12;

architecture STRUCTURE of comm_port_12 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__13\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_13 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__15\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_13 : entity is "comm_port";
end comm_port_13;

architecture STRUCTURE of comm_port_13 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__15\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_14 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__17\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_14 : entity is "comm_port";
end comm_port_14;

architecture STRUCTURE of comm_port_14 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__17\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_2 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__23\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_2 : entity is "comm_port";
end comm_port_2;

architecture STRUCTURE of comm_port_2 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__23\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_3 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__25\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_3 : entity is "comm_port";
end comm_port_3;

architecture STRUCTURE of comm_port_3 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__25\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_4 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__27\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_4 : entity is "comm_port";
end comm_port_4;

architecture STRUCTURE of comm_port_4 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__27\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_5 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RAM_reg_0_15_0_0__29\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_5 : entity is "comm_port";
end comm_port_5;

architecture STRUCTURE of comm_port_5 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \RAM_reg_0_15_0_0__29\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_6 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ADDRESS_reg[1]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_6 : entity is "comm_port";
end comm_port_6;

architecture STRUCTURE of comm_port_6 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \ADDRESS_reg[1]\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_7 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ADDRESS_reg[2]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_7 : entity is "comm_port";
end comm_port_7;

architecture STRUCTURE of comm_port_7 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \ADDRESS_reg[2]\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_8 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ADDRESS_reg[3]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_8 : entity is "comm_port";
end comm_port_8;

architecture STRUCTURE of comm_port_8 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \ADDRESS_reg[3]\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comm_port_9 is
  port (
    TORAM : out STD_LOGIC_VECTOR ( 0 to 0 );
    IO_PINS_EXT_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ADDRESS_reg[4]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of comm_port_9 : entity is "comm_port";
end comm_port_9;

architecture STRUCTURE of comm_port_9 is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of TORAM_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of TORAM_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of TORAM_reg : label is "VCC:GE GND:CLR";
begin
TORAM_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => IO_PINS_EXT_IBUF(0),
      G => \ADDRESS_reg[4]\,
      GE => '1',
      Q => TORAM(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity internal_ram is
  port (
    \TOPORT_reg[0]_0\ : out STD_LOGIC;
    \TOPORT_reg[1]_0\ : out STD_LOGIC;
    \TOPORT_reg[2]_0\ : out STD_LOGIC;
    \TOPORT_reg[3]_0\ : out STD_LOGIC;
    \TOPORT_reg[4]_0\ : out STD_LOGIC;
    \TOPORT_reg[5]_0\ : out STD_LOGIC;
    \TOPORT_reg[6]_0\ : out STD_LOGIC;
    \TOPORT_reg[7]_0\ : out STD_LOGIC;
    \TOPORT_reg[8]_0\ : out STD_LOGIC;
    \TOPORT_reg[9]_0\ : out STD_LOGIC;
    \TOPORT_reg[10]_0\ : out STD_LOGIC;
    \TOPORT_reg[11]_0\ : out STD_LOGIC;
    \TOPORT_reg[12]_0\ : out STD_LOGIC;
    \TOPORT_reg[13]_0\ : out STD_LOGIC;
    \TOPORT_reg[14]_0\ : out STD_LOGIC;
    \TOPORT_reg[15]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    TEST_RESET_OBUF : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC;
    TORAM : in STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end internal_ram;

architecture STRUCTURE of internal_ram is
  signal ADDRESS : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ADDRESS[4]_i_1_n_0\ : STD_LOGIC;
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
  signal TOPORT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TOPORT0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal state_reg_n_0 : STD_LOGIC;
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
\ADDRESS[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => state_reg_n_0,
      O => \ADDRESS[4]_i_1_n_0\
    );
\ADDRESS_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM(0),
      Q => ADDRESS(0),
      R => '0'
    );
\ADDRESS_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM(1),
      Q => ADDRESS(1),
      R => '0'
    );
\ADDRESS_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM(2),
      Q => ADDRESS(2),
      R => '0'
    );
\ADDRESS_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM(3),
      Q => ADDRESS(3),
      R => '0'
    );
\ADDRESS_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \ADDRESS[4]_i_1_n_0\,
      D => TORAM(4),
      Q => ADDRESS(4),
      R => '0'
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(0),
      O => \TOPORT_reg[0]_0\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(10),
      O => \TOPORT_reg[10]_0\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(11),
      O => \TOPORT_reg[11]_0\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(12),
      O => \TOPORT_reg[12]_0\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(13),
      O => \TOPORT_reg[13]_0\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(14),
      O => \TOPORT_reg[14]_0\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(15),
      O => \TOPORT_reg[15]_0\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(1),
      O => \TOPORT_reg[1]_0\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(2),
      O => \TOPORT_reg[2]_0\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(3),
      O => \TOPORT_reg[3]_0\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(4),
      O => \TOPORT_reg[4]_0\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(5),
      O => \TOPORT_reg[5]_0\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(6),
      O => \TOPORT_reg[6]_0\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(7),
      O => \TOPORT_reg[7]_0\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(8),
      O => \TOPORT_reg[8]_0\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => TOPORT(9),
      O => \TOPORT_reg[9]_0\
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
      WCLK => CLK,
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
      WCLK => CLK,
      WE => \RAM_reg_0_15_0_0__0_i_1_n_0\
    );
\RAM_reg_0_15_0_0__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => state_reg_n_0,
      I2 => ADDRESS(4),
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
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
      WCLK => CLK,
      WE => RAM_reg_0_15_0_0_i_1_n_0
    );
RAM_reg_0_15_0_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => state_reg_n_0,
      I2 => ADDRESS(4),
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
      C => CLK,
      CE => E(0),
      D => TOPORT0(0),
      Q => TOPORT(0),
      R => '0'
    );
\TOPORT_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(10),
      Q => TOPORT(10),
      R => '0'
    );
\TOPORT_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(11),
      Q => TOPORT(11),
      R => '0'
    );
\TOPORT_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(12),
      Q => TOPORT(12),
      R => '0'
    );
\TOPORT_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(13),
      Q => TOPORT(13),
      R => '0'
    );
\TOPORT_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(14),
      Q => TOPORT(14),
      R => '0'
    );
\TOPORT_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(15),
      Q => TOPORT(15),
      R => '0'
    );
\TOPORT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(1),
      Q => TOPORT(1),
      R => '0'
    );
\TOPORT_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(2),
      Q => TOPORT(2),
      R => '0'
    );
\TOPORT_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(3),
      Q => TOPORT(3),
      R => '0'
    );
\TOPORT_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(4),
      Q => TOPORT(4),
      R => '0'
    );
\TOPORT_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(5),
      Q => TOPORT(5),
      R => '0'
    );
\TOPORT_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(6),
      Q => TOPORT(6),
      R => '0'
    );
\TOPORT_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(7),
      Q => TOPORT(7),
      R => '0'
    );
\TOPORT_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(8),
      Q => TOPORT(8),
      R => '0'
    );
\TOPORT_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      D => TOPORT0(9),
      Q => TOPORT(9),
      R => '0'
    );
state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => TEST_RESET_OBUF,
      D => \ADDRESS[4]_i_1_n_0\,
      Q => state_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity logic_reset is
  port (
    TEST_RESET_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RW_EXT_IBUF : in STD_LOGIC
  );
end logic_reset;

architecture STRUCTURE of logic_reset is
  signal \^test_reset_obuf\ : STD_LOGIC;
  signal reset_trig : STD_LOGIC;
  signal \reset_trig__0_i_1_n_0\ : STD_LOGIC;
  signal reset_trig_reg_n_0 : STD_LOGIC;
  signal s_reset : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_reset__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_reset_reg[0]\ : label is "r_clk2:01,r_clk3:10,r_clk1:00,reset_trigd:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_reset_reg[1]\ : label is "r_clk2:01,r_clk3:10,r_clk1:00,reset_trigd:11";
begin
  TEST_RESET_OBUF <= \^test_reset_obuf\;
\FSM_sequential_s_reset[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RW_EXT_IBUF,
      I1 => s_reset(0),
      O => \s_reset__0\(0)
    );
\FSM_sequential_s_reset[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => s_reset(0),
      I1 => s_reset(1),
      I2 => RW_EXT_IBUF,
      O => \s_reset__0\(1)
    );
\FSM_sequential_s_reset_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
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
      C => CLK,
      CE => '1',
      D => \s_reset__0\(1),
      Q => s_reset(1),
      R => '0'
    );
\reset_trig__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => reset_trig_reg_n_0,
      I1 => \^test_reset_obuf\,
      O => \reset_trig__0_i_1_n_0\
    );
\reset_trig_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => \^test_reset_obuf\,
      I1 => s_reset(1),
      I2 => s_reset(0),
      I3 => RW_EXT_IBUF,
      O => reset_trig
    );
reset_trig_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => reset_trig,
      Q => reset_trig_reg_n_0,
      R => '0'
    );
\reset_trig_reg__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \reset_trig__0_i_1_n_0\,
      Q => \^test_reset_obuf\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sample_control_TOP is
  port (
    CLK_EXT : in STD_LOGIC;
    RW_EXT : in STD_LOGIC;
    TEST_RESET : out STD_LOGIC;
    IO_PINS_EXT : inout STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sample_control_TOP : entity is true;
end sample_control_TOP;

architecture STRUCTURE of sample_control_TOP is
  signal CLK_EXT_IBUF : STD_LOGIC;
  signal CLK_EXT_IBUF_BUFG : STD_LOGIC;
  signal IO_PINS_EXT_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \IO_PINS_EXT_IOBUF[0]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[10]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[11]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[12]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[13]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[14]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[15]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[2]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[3]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[4]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[5]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[7]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[8]_inst_i_2_n_0\ : STD_LOGIC;
  signal \IO_PINS_EXT_IOBUF[9]_inst_i_2_n_0\ : STD_LOGIC;
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
  signal RW_EXT_IBUF_BUFG : STD_LOGIC;
  signal TEST_RESET_OBUF : STD_LOGIC;
  signal TORAM : STD_LOGIC;
  signal TORAM_internal : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \gen_comm_port[0].commport_n_1\ : STD_LOGIC;
  signal ram_n_0 : STD_LOGIC;
  signal ram_n_1 : STD_LOGIC;
  signal ram_n_10 : STD_LOGIC;
  signal ram_n_11 : STD_LOGIC;
  signal ram_n_12 : STD_LOGIC;
  signal ram_n_13 : STD_LOGIC;
  signal ram_n_14 : STD_LOGIC;
  signal ram_n_15 : STD_LOGIC;
  signal ram_n_2 : STD_LOGIC;
  signal ram_n_3 : STD_LOGIC;
  signal ram_n_4 : STD_LOGIC;
  signal ram_n_5 : STD_LOGIC;
  signal ram_n_6 : STD_LOGIC;
  signal ram_n_7 : STD_LOGIC;
  signal ram_n_8 : STD_LOGIC;
  signal ram_n_9 : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[0]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[0]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[10]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[10]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[11]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[11]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[12]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[12]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[13]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[13]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[14]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[14]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[15]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[15]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[1]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[1]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[2]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[2]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[3]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[3]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[4]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[4]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[5]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[5]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[6]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[6]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[7]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[7]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[8]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[8]_inst_i_2\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IO_PINS_EXT_IOBUF[9]_inst_i_2\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IO_PINS_EXT_IOBUF[9]_inst_i_2\ : label is "VCC:GE GND:CLR";
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
\IO_PINS_EXT_IOBUF[0]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(0),
      O => IO_PINS_EXT_IBUF(0),
      T => \IO_PINS_EXT_TRI[0]\
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[0]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[0]\
    );
\IO_PINS_EXT_IOBUF[0]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_0,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[0]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[10]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(10),
      O => IO_PINS_EXT_IBUF(10),
      T => \IO_PINS_EXT_TRI[10]\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[10]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[10]\
    );
\IO_PINS_EXT_IOBUF[10]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_10,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[10]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[11]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(11),
      O => IO_PINS_EXT_IBUF(11),
      T => \IO_PINS_EXT_TRI[11]\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[11]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[11]\
    );
\IO_PINS_EXT_IOBUF[11]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_11,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[11]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[12]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(12),
      O => IO_PINS_EXT_IBUF(12),
      T => \IO_PINS_EXT_TRI[12]\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[12]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[12]\
    );
\IO_PINS_EXT_IOBUF[12]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_12,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[12]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[13]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(13),
      O => IO_PINS_EXT_IBUF(13),
      T => \IO_PINS_EXT_TRI[13]\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[13]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[13]\
    );
\IO_PINS_EXT_IOBUF[13]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_13,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[13]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[14]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(14),
      O => IO_PINS_EXT_IBUF(14),
      T => \IO_PINS_EXT_TRI[14]\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[14]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[14]\
    );
\IO_PINS_EXT_IOBUF[14]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_14,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[14]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[15]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(15),
      O => IO_PINS_EXT_IBUF(15),
      T => \IO_PINS_EXT_TRI[15]\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[15]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[15]\
    );
\IO_PINS_EXT_IOBUF[15]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_15,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[15]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[1]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(1),
      O => IO_PINS_EXT_IBUF(1),
      T => \IO_PINS_EXT_TRI[1]\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[1]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[1]\
    );
\IO_PINS_EXT_IOBUF[1]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_1,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[1]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[2]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(2),
      O => IO_PINS_EXT_IBUF(2),
      T => \IO_PINS_EXT_TRI[2]\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[2]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[2]\
    );
\IO_PINS_EXT_IOBUF[2]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_2,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[2]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[3]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(3),
      O => IO_PINS_EXT_IBUF(3),
      T => \IO_PINS_EXT_TRI[3]\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[3]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[3]\
    );
\IO_PINS_EXT_IOBUF[3]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_3,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[3]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[4]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(4),
      O => IO_PINS_EXT_IBUF(4),
      T => \IO_PINS_EXT_TRI[4]\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[4]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[4]\
    );
\IO_PINS_EXT_IOBUF[4]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_4,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[4]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[5]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(5),
      O => IO_PINS_EXT_IBUF(5),
      T => \IO_PINS_EXT_TRI[5]\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[5]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[5]\
    );
\IO_PINS_EXT_IOBUF[5]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_5,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[5]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[6]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(6),
      O => IO_PINS_EXT_IBUF(6),
      T => \IO_PINS_EXT_TRI[6]\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[6]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[6]\
    );
\IO_PINS_EXT_IOBUF[6]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_6,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[6]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[7]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(7),
      O => IO_PINS_EXT_IBUF(7),
      T => \IO_PINS_EXT_TRI[7]\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[7]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[7]\
    );
\IO_PINS_EXT_IOBUF[7]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_7,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[7]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[8]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(8),
      O => IO_PINS_EXT_IBUF(8),
      T => \IO_PINS_EXT_TRI[8]\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[8]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[8]\
    );
\IO_PINS_EXT_IOBUF[8]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_8,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[8]_inst_i_2_n_0\
    );
\IO_PINS_EXT_IOBUF[9]_inst\: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => IO_PINS_EXT(9),
      O => IO_PINS_EXT_IBUF(9),
      T => \IO_PINS_EXT_TRI[9]\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \IO_PINS_EXT_IOBUF[9]_inst_i_2_n_0\,
      O => \IO_PINS_EXT_TRI[9]\
    );
\IO_PINS_EXT_IOBUF[9]_inst_i_2\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ram_n_9,
      G => RW_EXT_IBUF_BUFG,
      GE => '1',
      Q => \IO_PINS_EXT_IOBUF[9]_inst_i_2_n_0\
    );
RW_EXT_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => RW_EXT_IBUF,
      O => RW_EXT_IBUF_BUFG
    );
RW_EXT_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RW_EXT,
      O => RW_EXT_IBUF
    );
TEST_RESET_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => TEST_RESET_OBUF,
      O => TEST_RESET
    );
\gen_comm_port[0].commport\: entity work.comm_port
     port map (
      E(0) => RW_EXT_IBUF_BUFG,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(0),
      RW_EXT_IBUF_BUFG_inst => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM
    );
\gen_comm_port[10].commport\: entity work.comm_port_0
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(10),
      \RAM_reg_0_15_0_0__19\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(10)
    );
\gen_comm_port[11].commport\: entity work.comm_port_1
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(11),
      \RAM_reg_0_15_0_0__21\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(11)
    );
\gen_comm_port[12].commport\: entity work.comm_port_2
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(12),
      \RAM_reg_0_15_0_0__23\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(12)
    );
\gen_comm_port[13].commport\: entity work.comm_port_3
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(13),
      \RAM_reg_0_15_0_0__25\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(13)
    );
\gen_comm_port[14].commport\: entity work.comm_port_4
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(14),
      \RAM_reg_0_15_0_0__27\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(14)
    );
\gen_comm_port[15].commport\: entity work.comm_port_5
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(15),
      \RAM_reg_0_15_0_0__29\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(15)
    );
\gen_comm_port[1].commport\: entity work.comm_port_6
     port map (
      \ADDRESS_reg[1]\ => \gen_comm_port[0].commport_n_1\,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(1),
      TORAM(0) => TORAM_internal(1)
    );
\gen_comm_port[2].commport\: entity work.comm_port_7
     port map (
      \ADDRESS_reg[2]\ => \gen_comm_port[0].commport_n_1\,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(2),
      TORAM(0) => TORAM_internal(2)
    );
\gen_comm_port[3].commport\: entity work.comm_port_8
     port map (
      \ADDRESS_reg[3]\ => \gen_comm_port[0].commport_n_1\,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(3),
      TORAM(0) => TORAM_internal(3)
    );
\gen_comm_port[4].commport\: entity work.comm_port_9
     port map (
      \ADDRESS_reg[4]\ => \gen_comm_port[0].commport_n_1\,
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(4),
      TORAM(0) => TORAM_internal(4)
    );
\gen_comm_port[5].commport\: entity work.comm_port_10
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(5),
      \RAM_reg_0_15_0_0__9\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(5)
    );
\gen_comm_port[6].commport\: entity work.comm_port_11
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(6),
      \RAM_reg_0_15_0_0__11\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(6)
    );
\gen_comm_port[7].commport\: entity work.comm_port_12
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(7),
      \RAM_reg_0_15_0_0__13\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(7)
    );
\gen_comm_port[8].commport\: entity work.comm_port_13
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(8),
      \RAM_reg_0_15_0_0__15\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(8)
    );
\gen_comm_port[9].commport\: entity work.comm_port_14
     port map (
      IO_PINS_EXT_IBUF(0) => IO_PINS_EXT_IBUF(9),
      \RAM_reg_0_15_0_0__17\ => \gen_comm_port[0].commport_n_1\,
      TORAM(0) => TORAM_internal(9)
    );
logic_resetter: entity work.logic_reset
     port map (
      CLK => CLK_EXT_IBUF_BUFG,
      RW_EXT_IBUF => RW_EXT_IBUF,
      TEST_RESET_OBUF => TEST_RESET_OBUF
    );
ram: entity work.internal_ram
     port map (
      CLK => CLK_EXT_IBUF_BUFG,
      E(0) => RW_EXT_IBUF_BUFG,
      RW_EXT_IBUF => RW_EXT_IBUF,
      TEST_RESET_OBUF => TEST_RESET_OBUF,
      \TOPORT_reg[0]_0\ => ram_n_0,
      \TOPORT_reg[10]_0\ => ram_n_10,
      \TOPORT_reg[11]_0\ => ram_n_11,
      \TOPORT_reg[12]_0\ => ram_n_12,
      \TOPORT_reg[13]_0\ => ram_n_13,
      \TOPORT_reg[14]_0\ => ram_n_14,
      \TOPORT_reg[15]_0\ => ram_n_15,
      \TOPORT_reg[1]_0\ => ram_n_1,
      \TOPORT_reg[2]_0\ => ram_n_2,
      \TOPORT_reg[3]_0\ => ram_n_3,
      \TOPORT_reg[4]_0\ => ram_n_4,
      \TOPORT_reg[5]_0\ => ram_n_5,
      \TOPORT_reg[6]_0\ => ram_n_6,
      \TOPORT_reg[7]_0\ => ram_n_7,
      \TOPORT_reg[8]_0\ => ram_n_8,
      \TOPORT_reg[9]_0\ => ram_n_9,
      TORAM(15 downto 1) => TORAM_internal(15 downto 1),
      TORAM(0) => TORAM
    );
end STRUCTURE;
