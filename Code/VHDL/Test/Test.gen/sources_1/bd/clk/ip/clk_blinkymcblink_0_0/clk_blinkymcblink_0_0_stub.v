// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Oct  7 13:59:57 2024
// Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/EIT
//               GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0_stub.v}
// Design      : clk_blinkymcblink_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blinkymcblink,Vivado 2024.1" *)
module clk_blinkymcblink_0_0(CLK, CLK_CRYSTAL, LED1, LED2, CLK_OUT)
/* synthesis syn_black_box black_box_pad_pin="CLK,CLK_CRYSTAL,LED1,LED2,CLK_OUT" */;
  input CLK;
  input CLK_CRYSTAL;
  output LED1;
  output LED2;
  output CLK_OUT;
endmodule
