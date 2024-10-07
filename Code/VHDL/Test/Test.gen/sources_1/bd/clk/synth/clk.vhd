--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Mon Oct  7 13:57:43 2024
--Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
--Command     : generate_target clk.bd
--Design      : clk
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk is
  port (
    CLK_0 : in STD_LOGIC;
    CLK_OUT_0 : out STD_LOGIC;
    LED1_0 : out STD_LOGIC;
    LED2_0 : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of clk : entity is "clk,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clk : entity is "clk.hwdef";
end clk;

architecture STRUCTURE of clk is
  component clk_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component clk_clk_wiz_0_0;
  component clk_blinkymcblink_0_0 is
  port (
    CLK : in STD_LOGIC;
    CLK_CRYSTAL : in STD_LOGIC;
    LED1 : out STD_LOGIC;
    LED2 : out STD_LOGIC;
    CLK_OUT : out STD_LOGIC
  );
  end component clk_blinkymcblink_0_0;
  signal CLK_0_1 : STD_LOGIC;
  signal blinkymcblink_0_CLK_OUT : STD_LOGIC;
  signal blinkymcblink_0_LED1 : STD_LOGIC;
  signal blinkymcblink_0_LED2 : STD_LOGIC;
  signal clk_in1_0_1 : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN clk_CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of clk_in1_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK";
  attribute X_INTERFACE_PARAMETER of clk_in1_0 : signal is "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN clk_clk_in1_0, FREQ_HZ 12000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  CLK_0_1 <= CLK_0;
  CLK_OUT_0 <= blinkymcblink_0_CLK_OUT;
  LED1_0 <= blinkymcblink_0_LED1;
  LED2_0 <= blinkymcblink_0_LED2;
  clk_in1_0_1 <= clk_in1_0;
blinkymcblink_0: component clk_blinkymcblink_0_0
     port map (
      CLK => CLK_0_1,
      CLK_CRYSTAL => clk_wiz_0_clk_out1,
      CLK_OUT => blinkymcblink_0_CLK_OUT,
      LED1 => blinkymcblink_0_LED1,
      LED2 => blinkymcblink_0_LED2
    );
clk_wiz_0: component clk_clk_wiz_0_0
     port map (
      clk_in1 => clk_in1_0_1,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      reset => '0'
    );
end STRUCTURE;
