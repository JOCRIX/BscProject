--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Mon Oct  7 13:57:43 2024
--Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
--Command     : generate_target clk_wrapper.bd
--Design      : clk_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wrapper is
  port (
    CLK_0 : in STD_LOGIC;
    CLK_OUT_0 : out STD_LOGIC;
    LED1_0 : out STD_LOGIC;
    LED2_0 : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC
  );
end clk_wrapper;

architecture STRUCTURE of clk_wrapper is
  component clk is
  port (
    CLK_OUT_0 : out STD_LOGIC;
    LED2_0 : out STD_LOGIC;
    LED1_0 : out STD_LOGIC;
    CLK_0 : in STD_LOGIC;
    clk_in1_0 : in STD_LOGIC
  );
  end component clk;
begin
clk_i: component clk
     port map (
      CLK_0 => CLK_0,
      CLK_OUT_0 => CLK_OUT_0,
      LED1_0 => LED1_0,
      LED2_0 => LED2_0,
      clk_in1_0 => clk_in1_0
    );
end STRUCTURE;
