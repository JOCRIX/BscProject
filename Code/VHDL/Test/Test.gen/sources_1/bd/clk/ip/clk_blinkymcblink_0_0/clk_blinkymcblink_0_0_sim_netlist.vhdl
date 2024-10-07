-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Oct  7 13:59:57 2024
-- Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/EIT
--               GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0_sim_netlist.vhdl}
-- Design      : clk_blinkymcblink_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_blinkymcblink_0_0 is
  port (
    CLK : in STD_LOGIC;
    CLK_CRYSTAL : in STD_LOGIC;
    LED1 : out STD_LOGIC;
    LED2 : out STD_LOGIC;
    CLK_OUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_blinkymcblink_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of clk_blinkymcblink_0_0 : entity is "clk_blinkymcblink_0_0,blinkymcblink,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of clk_blinkymcblink_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of clk_blinkymcblink_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of clk_blinkymcblink_0_0 : entity is "blinkymcblink,Vivado 2024.1";
end clk_blinkymcblink_0_0;

architecture STRUCTURE of clk_blinkymcblink_0_0 is
  signal \^clk\ : STD_LOGIC;
  signal \^clk_crystal\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of CLK : signal is "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN clk_CLK_0, INSERT_VIP 0";
begin
  CLK_OUT <= \^clk_crystal\;
  LED1 <= \^clk\;
  \^clk\ <= CLK;
  \^clk_crystal\ <= CLK_CRYSTAL;
LED2_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^clk\,
      O => LED2
    );
end STRUCTURE;
