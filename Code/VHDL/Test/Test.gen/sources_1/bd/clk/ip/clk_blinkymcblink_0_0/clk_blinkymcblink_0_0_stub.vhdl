-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Oct  7 13:59:57 2024
-- Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/EIT
--               GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0_stub.vhdl}
-- Design      : clk_blinkymcblink_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_blinkymcblink_0_0 is
  Port ( 
    CLK : in STD_LOGIC;
    CLK_CRYSTAL : in STD_LOGIC;
    LED1 : out STD_LOGIC;
    LED2 : out STD_LOGIC;
    CLK_OUT : out STD_LOGIC
  );

end clk_blinkymcblink_0_0;

architecture stub of clk_blinkymcblink_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CLK_CRYSTAL,LED1,LED2,CLK_OUT";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blinkymcblink,Vivado 2024.1";
begin
end;
