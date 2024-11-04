// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Nov  3 00:12:31 2024
// Host        : DESKTOP-DNC9NIR running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {F:/Git
//               Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.sim/sim_1/synth/timing/xsim/ADC_CONTROL_TOP_time_synth.v}
// Design      : ADC_CONTROL_TOP
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module ADC_CONTROL_TOP
   (MASTER_CLK_IN,
    EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN,
    EXT_EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN,
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT,
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT,
    EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT,
    EXT_LEDS_DATA_FROM_ADC_CONTROL,
    EXT_TEST_ACQUIRE_START);
  input MASTER_CLK_IN;
  input EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN;
  input EXT_EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN;
  output EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT;
  output EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT;
  output EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT;
  output [15:0]EXT_LEDS_DATA_FROM_ADC_CONTROL;
  input EXT_TEST_ACQUIRE_START;

  wire ACTIVE;
  wire EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT;
  wire EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF;
  wire EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT;
  wire EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT;
  wire EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF;
  wire EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN;
  wire EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF;
  wire [15:0]EXT_LEDS_DATA_FROM_ADC_CONTROL;
  wire [14:0]EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF;
  wire EXT_TEST_ACQUIRE_START;
  wire EXT_TEST_ACQUIRE_START_IBUF;
  wire EXT_TEST_ACQUIRE_START_IBUF_BUFG;
  wire MASTER_CLK_IN;
  wire MASTER_CLK_IN_IBUF;
  wire MASTER_CLK_IN_IBUF_BUFG;
  wire PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  wire PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT;
  wire i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;

initial begin
 $sdf_annotate("ADC_CONTROL_TOP_time_synth.sdf",,,,"tool_control");
end
  OBUF EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF_inst
       (.I(EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF),
        .O(EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT));
  OBUF EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT_OBUF_inst
       (.I(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .O(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT));
  OBUF EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF_inst
       (.I(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .O(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT));
  IBUF EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF_inst
       (.I(EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN),
        .O(EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[0]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[0]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[0]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[10]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[10]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[10]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[11]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[11]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[11]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[12]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[12]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[12]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[13]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[13]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[13]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[14]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[14]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[14]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[15]_inst 
       (.I(1'b0),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[15]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[1]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[1]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[1]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[2]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[2]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[2]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[3]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[3]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[3]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[4]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[4]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[4]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[5]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[5]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[5]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[6]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[6]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[6]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[7]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[7]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[7]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[8]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[8]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[8]));
  OBUF \EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[9]_inst 
       (.I(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF[9]),
        .O(EXT_LEDS_DATA_FROM_ADC_CONTROL[9]));
  BUFG EXT_TEST_ACQUIRE_START_IBUF_BUFG_inst
       (.I(EXT_TEST_ACQUIRE_START_IBUF),
        .O(EXT_TEST_ACQUIRE_START_IBUF_BUFG));
  IBUF EXT_TEST_ACQUIRE_START_IBUF_inst
       (.I(EXT_TEST_ACQUIRE_START),
        .O(EXT_TEST_ACQUIRE_START_IBUF));
  BUFG MASTER_CLK_IN_IBUF_BUFG_inst
       (.I(MASTER_CLK_IN_IBUF),
        .O(MASTER_CLK_IN_IBUF_BUFG));
  IBUF MASTER_CLK_IN_IBUF_inst
       (.I(MASTER_CLK_IN),
        .O(MASTER_CLK_IN_IBUF));
  adc_control adc_ctrl1
       (.ACTIVE(ACTIVE),
        .D(EXT_EXT_SDA_POS_ADC_A_TO_ADC_CONTROL_IN_IBUF),
        .EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .EXT_TEST_ACQUIRE_START_IBUF_BUFG(EXT_TEST_ACQUIRE_START_IBUF_BUFG),
        .MASTER_CLK_IN_IBUF_BUFG(MASTER_CLK_IN_IBUF_BUFG),
        .PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT(PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT),
        .PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT),
        .Q(EXT_LEDS_DATA_FROM_ADC_CONTROL_OBUF),
        .i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN(i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN));
  pulse_gen_width_modulator_inverted pulse_gen_1_SDACLK
       (.ACTIVE(ACTIVE),
        .EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .MASTER_CLK_IN_IBUF_BUFG(MASTER_CLK_IN_IBUF_BUFG),
        .PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT));
  pulse_train_gen pulse_gen_2_35ns
       (.EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF(EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF),
        .MASTER_CLK_IN_IBUF_BUFG(MASTER_CLK_IN_IBUF_BUFG),
        .PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT(PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT));
  pulse_train_gen__parameterized1 pulse_gen_3_45ns
       (.MASTER_CLK_IN_IBUF_BUFG(MASTER_CLK_IN_IBUF_BUFG),
        .PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT(PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT),
        .i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN(i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN));
endmodule

module adc_control
   (PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT,
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
    Q,
    i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
    EXT_TEST_ACQUIRE_START_IBUF_BUFG,
    MASTER_CLK_IN_IBUF_BUFG,
    ACTIVE,
    D,
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF);
  output PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT;
  output PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  output [14:0]Q;
  input i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
  input EXT_TEST_ACQUIRE_START_IBUF_BUFG;
  input MASTER_CLK_IN_IBUF_BUFG;
  input ACTIVE;
  input [0:0]D;
  input EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF;

  wire ACTIVE;
  wire [0:0]D;
  wire EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF;
  wire EXT_TEST_ACQUIRE_START_IBUF_BUFG;
  wire MASTER_CLK_IN_IBUF_BUFG;
  wire PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  wire PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT;
  wire PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg_i_1_n_0;
  wire [14:0]Q;
  wire clear;
  wire clks_start;
  wire clks_start_i_1_n_0;
  wire i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
  wire [2:1]p_0_in;
  wire serial_clk_count0;
  wire \serial_clk_count[0]_i_1_n_0 ;
  wire \serial_clk_count[3]_i_1_n_0 ;
  wire [3:0]serial_clk_count_reg;
  wire \serial_data_adc_1[0]_i_1_n_0 ;
  wire \serial_data_adc_1[10]_i_1_n_0 ;
  wire \serial_data_adc_1[11]_i_1_n_0 ;
  wire \serial_data_adc_1[12]_i_1_n_0 ;
  wire \serial_data_adc_1[13]_i_1_n_0 ;
  wire \serial_data_adc_1[14]_i_1_n_0 ;
  wire \serial_data_adc_1[1]_i_1_n_0 ;
  wire \serial_data_adc_1[2]_i_1_n_0 ;
  wire \serial_data_adc_1[3]_i_1_n_0 ;
  wire \serial_data_adc_1[4]_i_1_n_0 ;
  wire \serial_data_adc_1[5]_i_1_n_0 ;
  wire \serial_data_adc_1[6]_i_1_n_0 ;
  wire \serial_data_adc_1[7]_i_1_n_0 ;
  wire \serial_data_adc_1[8]_i_1_n_0 ;
  wire \serial_data_adc_1[9]_i_1_n_0 ;
  wire start_acquisition;
  wire start_adc_control;

  FDRE #(
    .INIT(1'b0)) 
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(start_acquisition),
        .Q(PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg
       (.CLR(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg_i_1_n_0),
        .D(clks_start),
        .G(clks_start),
        .GE(1'b1),
        .Q(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT));
  LUT4 #(
    .INIT(16'h8000)) 
    PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg_i_1
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(serial_clk_count_reg[0]),
        .I3(serial_clk_count_reg[1]),
        .O(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg_i_1_n_0));
  LUT4 #(
    .INIT(16'h7F40)) 
    clks_start_i_1
       (.I0(ACTIVE),
        .I1(start_adc_control),
        .I2(start_acquisition),
        .I3(clks_start),
        .O(clks_start_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clks_start_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(clks_start_i_1_n_0),
        .Q(clks_start),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \serial_clk_count[0]_i_1 
       (.I0(serial_clk_count_reg[0]),
        .O(\serial_clk_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \serial_clk_count[1]_i_1 
       (.I0(serial_clk_count_reg[1]),
        .I1(serial_clk_count_reg[0]),
        .O(p_0_in[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \serial_clk_count[2]_i_1 
       (.I0(start_adc_control),
        .O(clear));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \serial_clk_count[2]_i_2 
       (.I0(serial_clk_count_reg[1]),
        .I1(serial_clk_count_reg[0]),
        .I2(serial_clk_count_reg[2]),
        .I3(serial_clk_count_reg[3]),
        .O(serial_clk_count0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \serial_clk_count[2]_i_3 
       (.I0(serial_clk_count_reg[1]),
        .I1(serial_clk_count_reg[0]),
        .I2(serial_clk_count_reg[2]),
        .O(p_0_in[2]));
  LUT4 #(
    .INIT(16'hFF80)) 
    \serial_clk_count[3]_i_1 
       (.I0(serial_clk_count_reg[1]),
        .I1(serial_clk_count_reg[0]),
        .I2(serial_clk_count_reg[2]),
        .I3(serial_clk_count_reg[3]),
        .O(\serial_clk_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \serial_clk_count_reg[0] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(serial_clk_count0),
        .D(\serial_clk_count[0]_i_1_n_0 ),
        .Q(serial_clk_count_reg[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \serial_clk_count_reg[1] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(serial_clk_count0),
        .D(p_0_in[1]),
        .Q(serial_clk_count_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \serial_clk_count_reg[2] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(serial_clk_count0),
        .D(p_0_in[2]),
        .Q(serial_clk_count_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \serial_clk_count_reg[3] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(1'b1),
        .D(\serial_clk_count[3]_i_1_n_0 ),
        .Q(serial_clk_count_reg[3]),
        .R(clear));
  LUT5 #(
    .INIT(32'h00000004)) 
    \serial_data_adc_1[0]_i_1 
       (.I0(serial_clk_count_reg[1]),
        .I1(start_adc_control),
        .I2(serial_clk_count_reg[0]),
        .I3(serial_clk_count_reg[3]),
        .I4(serial_clk_count_reg[2]),
        .O(\serial_data_adc_1[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00080000)) 
    \serial_data_adc_1[10]_i_1 
       (.I0(serial_clk_count_reg[1]),
        .I1(start_adc_control),
        .I2(serial_clk_count_reg[0]),
        .I3(serial_clk_count_reg[2]),
        .I4(serial_clk_count_reg[3]),
        .O(\serial_data_adc_1[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \serial_data_adc_1[11]_i_1 
       (.I0(serial_clk_count_reg[0]),
        .I1(serial_clk_count_reg[1]),
        .I2(start_adc_control),
        .I3(serial_clk_count_reg[2]),
        .I4(serial_clk_count_reg[3]),
        .O(\serial_data_adc_1[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \serial_data_adc_1[12]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(serial_clk_count_reg[1]),
        .I3(start_adc_control),
        .I4(serial_clk_count_reg[0]),
        .O(\serial_data_adc_1[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \serial_data_adc_1[13]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(start_adc_control),
        .I3(serial_clk_count_reg[0]),
        .I4(serial_clk_count_reg[1]),
        .O(\serial_data_adc_1[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \serial_data_adc_1[14]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(serial_clk_count_reg[1]),
        .I3(start_adc_control),
        .I4(serial_clk_count_reg[0]),
        .O(\serial_data_adc_1[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \serial_data_adc_1[1]_i_1 
       (.I0(start_adc_control),
        .I1(serial_clk_count_reg[0]),
        .I2(serial_clk_count_reg[1]),
        .I3(serial_clk_count_reg[3]),
        .I4(serial_clk_count_reg[2]),
        .O(\serial_data_adc_1[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \serial_data_adc_1[2]_i_1 
       (.I0(serial_clk_count_reg[1]),
        .I1(start_adc_control),
        .I2(serial_clk_count_reg[0]),
        .I3(serial_clk_count_reg[3]),
        .I4(serial_clk_count_reg[2]),
        .O(\serial_data_adc_1[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \serial_data_adc_1[3]_i_1 
       (.I0(serial_clk_count_reg[0]),
        .I1(serial_clk_count_reg[1]),
        .I2(start_adc_control),
        .I3(serial_clk_count_reg[3]),
        .I4(serial_clk_count_reg[2]),
        .O(\serial_data_adc_1[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000400)) 
    \serial_data_adc_1[4]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(serial_clk_count_reg[1]),
        .I3(start_adc_control),
        .I4(serial_clk_count_reg[0]),
        .O(\serial_data_adc_1[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00004000)) 
    \serial_data_adc_1[5]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(start_adc_control),
        .I3(serial_clk_count_reg[0]),
        .I4(serial_clk_count_reg[1]),
        .O(\serial_data_adc_1[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00004000)) 
    \serial_data_adc_1[6]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(serial_clk_count_reg[2]),
        .I2(serial_clk_count_reg[1]),
        .I3(start_adc_control),
        .I4(serial_clk_count_reg[0]),
        .O(\serial_data_adc_1[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \serial_data_adc_1[7]_i_1 
       (.I0(serial_clk_count_reg[3]),
        .I1(start_adc_control),
        .I2(serial_clk_count_reg[2]),
        .I3(serial_clk_count_reg[0]),
        .I4(serial_clk_count_reg[1]),
        .O(\serial_data_adc_1[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \serial_data_adc_1[8]_i_1 
       (.I0(serial_clk_count_reg[1]),
        .I1(start_adc_control),
        .I2(serial_clk_count_reg[0]),
        .I3(serial_clk_count_reg[2]),
        .I4(serial_clk_count_reg[3]),
        .O(\serial_data_adc_1[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00080000)) 
    \serial_data_adc_1[9]_i_1 
       (.I0(start_adc_control),
        .I1(serial_clk_count_reg[0]),
        .I2(serial_clk_count_reg[1]),
        .I3(serial_clk_count_reg[2]),
        .I4(serial_clk_count_reg[3]),
        .O(\serial_data_adc_1[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[0] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[0]_i_1_n_0 ),
        .D(D),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[10] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[10]_i_1_n_0 ),
        .D(D),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[11] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[11]_i_1_n_0 ),
        .D(D),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[12] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[12]_i_1_n_0 ),
        .D(D),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[13] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[13]_i_1_n_0 ),
        .D(D),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[14] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[14]_i_1_n_0 ),
        .D(D),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[1] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[1]_i_1_n_0 ),
        .D(D),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[2] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[2]_i_1_n_0 ),
        .D(D),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[3] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[3]_i_1_n_0 ),
        .D(D),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[4] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[4]_i_1_n_0 ),
        .D(D),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[5] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[5]_i_1_n_0 ),
        .D(D),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[6] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[6]_i_1_n_0 ),
        .D(D),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[7] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[7]_i_1_n_0 ),
        .D(D),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[8] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[8]_i_1_n_0 ),
        .D(D),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \serial_data_adc_1_reg[9] 
       (.C(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF),
        .CE(\serial_data_adc_1[9]_i_1_n_0 ),
        .D(D),
        .Q(Q[9]),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    start_acquisition_reg
       (.C(EXT_TEST_ACQUIRE_START_IBUF_BUFG),
        .CE(1'b1),
        .CLR(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg_i_1_n_0),
        .D(1'b1),
        .Q(start_acquisition));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    start_adc_control_reg
       (.C(i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN),
        .CE(1'b1),
        .CLR(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT_reg_i_1_n_0),
        .D(1'b1),
        .Q(start_adc_control));
endmodule

module pulse_gen_width_modulator_inverted
   (ACTIVE,
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF,
    MASTER_CLK_IN_IBUF_BUFG,
    PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT);
  output ACTIVE;
  output EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF;
  input MASTER_CLK_IN_IBUF_BUFG;
  input PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT;

  wire ACTIVE;
  wire EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF;
  wire MASTER_CLK_IN_IBUF_BUFG;
  wire PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT;
  wire clk_count;
  wire \clk_count[0]_i_4_n_0 ;
  wire \clk_count[0]_i_5_n_0 ;
  wire \clk_count[0]_i_6_n_0 ;
  wire \clk_count[0]_i_7_n_0 ;
  wire [13:0]clk_count_reg;
  wire \clk_count_reg[0]_i_3_n_0 ;
  wire \clk_count_reg[0]_i_3_n_1 ;
  wire \clk_count_reg[0]_i_3_n_2 ;
  wire \clk_count_reg[0]_i_3_n_3 ;
  wire \clk_count_reg[0]_i_3_n_4 ;
  wire \clk_count_reg[0]_i_3_n_5 ;
  wire \clk_count_reg[0]_i_3_n_6 ;
  wire \clk_count_reg[0]_i_3_n_7 ;
  wire \clk_count_reg[12]_i_1_n_3 ;
  wire \clk_count_reg[12]_i_1_n_6 ;
  wire \clk_count_reg[12]_i_1_n_7 ;
  wire \clk_count_reg[4]_i_1_n_0 ;
  wire \clk_count_reg[4]_i_1_n_1 ;
  wire \clk_count_reg[4]_i_1_n_2 ;
  wire \clk_count_reg[4]_i_1_n_3 ;
  wire \clk_count_reg[4]_i_1_n_4 ;
  wire \clk_count_reg[4]_i_1_n_5 ;
  wire \clk_count_reg[4]_i_1_n_6 ;
  wire \clk_count_reg[4]_i_1_n_7 ;
  wire \clk_count_reg[8]_i_1_n_0 ;
  wire \clk_count_reg[8]_i_1_n_1 ;
  wire \clk_count_reg[8]_i_1_n_2 ;
  wire \clk_count_reg[8]_i_1_n_3 ;
  wire \clk_count_reg[8]_i_1_n_4 ;
  wire \clk_count_reg[8]_i_1_n_5 ;
  wire \clk_count_reg[8]_i_1_n_6 ;
  wire \clk_count_reg[8]_i_1_n_7 ;
  wire done;
  wire done0;
  wire done_i_1_n_0;
  wire done_i_2_n_0;
  wire done_i_3_n_0;
  wire gen_1_pulse;
  wire gen_1_pulse1;
  wire gen_1_pulse_i_1_n_0;
  wire output_set_i_1_n_0;
  wire output_set_reg_n_0;
  wire [0:0]output_state;
  wire pulse_complete__0_i_1_n_0;
  wire pulse_complete_i_1_n_0;
  wire pulse_complete_reg__1;
  wire pulse_complete_reg_n_0;
  wire pulses_generated0;
  wire \pulses_generated[0]_i_5_n_0 ;
  wire \pulses_generated[0]_i_6_n_0 ;
  wire \pulses_generated[0]_i_7_n_0 ;
  wire \pulses_generated[0]_i_8_n_0 ;
  wire [13:0]pulses_generated_reg;
  wire \pulses_generated_reg[0]_i_3_n_0 ;
  wire \pulses_generated_reg[0]_i_3_n_1 ;
  wire \pulses_generated_reg[0]_i_3_n_2 ;
  wire \pulses_generated_reg[0]_i_3_n_3 ;
  wire \pulses_generated_reg[0]_i_3_n_4 ;
  wire \pulses_generated_reg[0]_i_3_n_5 ;
  wire \pulses_generated_reg[0]_i_3_n_6 ;
  wire \pulses_generated_reg[0]_i_3_n_7 ;
  wire \pulses_generated_reg[12]_i_1_n_3 ;
  wire \pulses_generated_reg[12]_i_1_n_6 ;
  wire \pulses_generated_reg[12]_i_1_n_7 ;
  wire \pulses_generated_reg[4]_i_1_n_0 ;
  wire \pulses_generated_reg[4]_i_1_n_1 ;
  wire \pulses_generated_reg[4]_i_1_n_2 ;
  wire \pulses_generated_reg[4]_i_1_n_3 ;
  wire \pulses_generated_reg[4]_i_1_n_4 ;
  wire \pulses_generated_reg[4]_i_1_n_5 ;
  wire \pulses_generated_reg[4]_i_1_n_6 ;
  wire \pulses_generated_reg[4]_i_1_n_7 ;
  wire \pulses_generated_reg[8]_i_1_n_0 ;
  wire \pulses_generated_reg[8]_i_1_n_1 ;
  wire \pulses_generated_reg[8]_i_1_n_2 ;
  wire \pulses_generated_reg[8]_i_1_n_3 ;
  wire \pulses_generated_reg[8]_i_1_n_4 ;
  wire \pulses_generated_reg[8]_i_1_n_5 ;
  wire \pulses_generated_reg[8]_i_1_n_6 ;
  wire \pulses_generated_reg[8]_i_1_n_7 ;
  wire s_toggle;
  wire s_toggle4_out;
  wire s_toggle_i_1_n_0;
  wire start;
  wire [3:1]\NLW_clk_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_clk_count_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_pulses_generated_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_pulses_generated_reg[12]_i_1_O_UNCONNECTED ;

  FDCE #(
    .INIT(1'b0)) 
    ACTIVE_reg
       (.C(start),
        .CE(1'b1),
        .CLR(done),
        .D(1'b1),
        .Q(ACTIVE));
  LUT3 #(
    .INIT(8'hFD)) 
    EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_A_OUT_OBUF_inst_i_1
       (.I0(start),
        .I1(output_state),
        .I2(output_set_reg_n_0),
        .O(EXT_EXT_SCK_POS_ADC_CONTROL_TO_ADC_B_OUT_OBUF));
  LUT5 #(
    .INIT(32'h00002002)) 
    \clk_count[0]_i_1 
       (.I0(gen_1_pulse),
        .I1(pulse_complete_reg_n_0),
        .I2(clk_count_reg[2]),
        .I3(s_toggle),
        .I4(\clk_count[0]_i_4_n_0 ),
        .O(s_toggle4_out));
  LUT2 #(
    .INIT(4'h2)) 
    \clk_count[0]_i_2 
       (.I0(gen_1_pulse),
        .I1(pulse_complete_reg_n_0),
        .O(clk_count));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \clk_count[0]_i_4 
       (.I0(\clk_count[0]_i_6_n_0 ),
        .I1(clk_count_reg[5]),
        .I2(clk_count_reg[4]),
        .I3(clk_count_reg[7]),
        .I4(clk_count_reg[6]),
        .I5(\clk_count[0]_i_7_n_0 ),
        .O(\clk_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_count[0]_i_5 
       (.I0(clk_count_reg[0]),
        .O(\clk_count[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_count[0]_i_6 
       (.I0(clk_count_reg[9]),
        .I1(clk_count_reg[8]),
        .I2(clk_count_reg[11]),
        .I3(clk_count_reg[10]),
        .O(\clk_count[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \clk_count[0]_i_7 
       (.I0(clk_count_reg[0]),
        .I1(clk_count_reg[12]),
        .I2(clk_count_reg[13]),
        .I3(clk_count_reg[3]),
        .I4(clk_count_reg[1]),
        .O(\clk_count[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[0]_i_3_n_7 ),
        .Q(clk_count_reg[0]),
        .R(s_toggle4_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\clk_count_reg[0]_i_3_n_0 ,\clk_count_reg[0]_i_3_n_1 ,\clk_count_reg[0]_i_3_n_2 ,\clk_count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clk_count_reg[0]_i_3_n_4 ,\clk_count_reg[0]_i_3_n_5 ,\clk_count_reg[0]_i_3_n_6 ,\clk_count_reg[0]_i_3_n_7 }),
        .S({clk_count_reg[3:1],\clk_count[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[8]_i_1_n_5 ),
        .Q(clk_count_reg[10]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[8]_i_1_n_4 ),
        .Q(clk_count_reg[11]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[12]_i_1_n_7 ),
        .Q(clk_count_reg[12]),
        .R(s_toggle4_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[12]_i_1 
       (.CI(\clk_count_reg[8]_i_1_n_0 ),
        .CO({\NLW_clk_count_reg[12]_i_1_CO_UNCONNECTED [3:1],\clk_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_clk_count_reg[12]_i_1_O_UNCONNECTED [3:2],\clk_count_reg[12]_i_1_n_6 ,\clk_count_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,clk_count_reg[13:12]}));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[12]_i_1_n_6 ),
        .Q(clk_count_reg[13]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[0]_i_3_n_6 ),
        .Q(clk_count_reg[1]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[0]_i_3_n_5 ),
        .Q(clk_count_reg[2]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[0]_i_3_n_4 ),
        .Q(clk_count_reg[3]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[4]_i_1_n_7 ),
        .Q(clk_count_reg[4]),
        .R(s_toggle4_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[4]_i_1 
       (.CI(\clk_count_reg[0]_i_3_n_0 ),
        .CO({\clk_count_reg[4]_i_1_n_0 ,\clk_count_reg[4]_i_1_n_1 ,\clk_count_reg[4]_i_1_n_2 ,\clk_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_reg[4]_i_1_n_4 ,\clk_count_reg[4]_i_1_n_5 ,\clk_count_reg[4]_i_1_n_6 ,\clk_count_reg[4]_i_1_n_7 }),
        .S(clk_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[4]_i_1_n_6 ),
        .Q(clk_count_reg[5]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[4]_i_1_n_5 ),
        .Q(clk_count_reg[6]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[4]_i_1_n_4 ),
        .Q(clk_count_reg[7]),
        .R(s_toggle4_out));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[8]_i_1_n_7 ),
        .Q(clk_count_reg[8]),
        .R(s_toggle4_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_count_reg[8]_i_1 
       (.CI(\clk_count_reg[4]_i_1_n_0 ),
        .CO({\clk_count_reg[8]_i_1_n_0 ,\clk_count_reg[8]_i_1_n_1 ,\clk_count_reg[8]_i_1_n_2 ,\clk_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_count_reg[8]_i_1_n_4 ,\clk_count_reg[8]_i_1_n_5 ,\clk_count_reg[8]_i_1_n_6 ,\clk_count_reg[8]_i_1_n_7 }),
        .S(clk_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(clk_count),
        .D(\clk_count_reg[8]_i_1_n_6 ),
        .Q(clk_count_reg[9]),
        .R(s_toggle4_out));
  LUT4 #(
    .INIT(16'h2F20)) 
    done_i_1
       (.I0(start),
        .I1(gen_1_pulse),
        .I2(done0),
        .I3(done),
        .O(done_i_1_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    done_i_2
       (.I0(done_i_3_n_0),
        .I1(pulses_generated_reg[4]),
        .I2(done),
        .I3(pulse_complete_reg_n_0),
        .O(done_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    done_i_3
       (.I0(\pulses_generated[0]_i_5_n_0 ),
        .I1(pulses_generated_reg[5]),
        .I2(pulses_generated_reg[3]),
        .I3(pulses_generated_reg[7]),
        .I4(pulses_generated_reg[6]),
        .I5(\pulses_generated[0]_i_7_n_0 ),
        .O(done_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .CLR(done_i_2_n_0),
        .D(done_i_1_n_0),
        .Q(done));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hF8F8F8FC)) 
    gen_1_pulse_i_1
       (.I0(done_i_3_n_0),
        .I1(start),
        .I2(gen_1_pulse),
        .I3(done),
        .I4(pulses_generated_reg[4]),
        .O(gen_1_pulse_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    gen_1_pulse_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .CLR(pulse_complete_reg_n_0),
        .D(gen_1_pulse_i_1_n_0),
        .Q(gen_1_pulse));
  LUT6 #(
    .INIT(64'hC0CCCFCCCACCCECC)) 
    output_set_i_1
       (.I0(clk_count_reg[2]),
        .I1(output_set_reg_n_0),
        .I2(pulse_complete_reg_n_0),
        .I3(gen_1_pulse),
        .I4(s_toggle),
        .I5(\clk_count[0]_i_4_n_0 ),
        .O(output_set_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    output_set_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(output_set_i_1_n_0),
        .Q(output_set_reg_n_0),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    \output_state_reg[0] 
       (.C(done),
        .CE(1'b1),
        .CLR(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT),
        .D(1'b1),
        .Q(output_state));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFF4000)) 
    pulse_complete__0_i_1
       (.I0(\clk_count[0]_i_4_n_0 ),
        .I1(gen_1_pulse),
        .I2(s_toggle),
        .I3(clk_count_reg[2]),
        .I4(pulse_complete_reg_n_0),
        .O(pulse_complete__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    pulse_complete_i_1
       (.I0(pulse_complete_reg__1),
        .I1(pulse_complete_reg_n_0),
        .O(pulse_complete_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    pulse_complete_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(pulse_complete_i_1_n_0),
        .Q(pulse_complete_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    pulse_complete_reg__0
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(pulse_complete__0_i_1_n_0),
        .Q(pulse_complete_reg__1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \pulses_generated[0]_i_1 
       (.I0(pulse_complete_reg_n_0),
        .I1(gen_1_pulse1),
        .I2(pulses_generated_reg[4]),
        .I3(\pulses_generated[0]_i_5_n_0 ),
        .I4(\pulses_generated[0]_i_6_n_0 ),
        .I5(\pulses_generated[0]_i_7_n_0 ),
        .O(done0));
  LUT6 #(
    .INIT(64'h0000000000EF0000)) 
    \pulses_generated[0]_i_2 
       (.I0(done_i_3_n_0),
        .I1(pulses_generated_reg[4]),
        .I2(done),
        .I3(pulse_complete_reg_n_0),
        .I4(start),
        .I5(gen_1_pulse),
        .O(pulses_generated0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \pulses_generated[0]_i_4 
       (.I0(start),
        .I1(gen_1_pulse),
        .O(gen_1_pulse1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pulses_generated[0]_i_5 
       (.I0(pulses_generated_reg[9]),
        .I1(pulses_generated_reg[8]),
        .I2(pulses_generated_reg[11]),
        .I3(pulses_generated_reg[10]),
        .O(\pulses_generated[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pulses_generated[0]_i_6 
       (.I0(pulses_generated_reg[5]),
        .I1(pulses_generated_reg[3]),
        .I2(pulses_generated_reg[7]),
        .I3(pulses_generated_reg[6]),
        .O(\pulses_generated[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \pulses_generated[0]_i_7 
       (.I0(pulses_generated_reg[0]),
        .I1(pulses_generated_reg[12]),
        .I2(pulses_generated_reg[13]),
        .I3(pulses_generated_reg[2]),
        .I4(pulses_generated_reg[1]),
        .O(\pulses_generated[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \pulses_generated[0]_i_8 
       (.I0(pulses_generated_reg[0]),
        .O(\pulses_generated[0]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[0] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[0]_i_3_n_7 ),
        .Q(pulses_generated_reg[0]),
        .R(done0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulses_generated_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\pulses_generated_reg[0]_i_3_n_0 ,\pulses_generated_reg[0]_i_3_n_1 ,\pulses_generated_reg[0]_i_3_n_2 ,\pulses_generated_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pulses_generated_reg[0]_i_3_n_4 ,\pulses_generated_reg[0]_i_3_n_5 ,\pulses_generated_reg[0]_i_3_n_6 ,\pulses_generated_reg[0]_i_3_n_7 }),
        .S({pulses_generated_reg[3:1],\pulses_generated[0]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[10] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[8]_i_1_n_5 ),
        .Q(pulses_generated_reg[10]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[11] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[8]_i_1_n_4 ),
        .Q(pulses_generated_reg[11]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[12] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[12]_i_1_n_7 ),
        .Q(pulses_generated_reg[12]),
        .R(done0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulses_generated_reg[12]_i_1 
       (.CI(\pulses_generated_reg[8]_i_1_n_0 ),
        .CO({\NLW_pulses_generated_reg[12]_i_1_CO_UNCONNECTED [3:1],\pulses_generated_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_pulses_generated_reg[12]_i_1_O_UNCONNECTED [3:2],\pulses_generated_reg[12]_i_1_n_6 ,\pulses_generated_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,pulses_generated_reg[13:12]}));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[13] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[12]_i_1_n_6 ),
        .Q(pulses_generated_reg[13]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[1] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[0]_i_3_n_6 ),
        .Q(pulses_generated_reg[1]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[2] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[0]_i_3_n_5 ),
        .Q(pulses_generated_reg[2]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[3] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[0]_i_3_n_4 ),
        .Q(pulses_generated_reg[3]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[4] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[4]_i_1_n_7 ),
        .Q(pulses_generated_reg[4]),
        .R(done0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulses_generated_reg[4]_i_1 
       (.CI(\pulses_generated_reg[0]_i_3_n_0 ),
        .CO({\pulses_generated_reg[4]_i_1_n_0 ,\pulses_generated_reg[4]_i_1_n_1 ,\pulses_generated_reg[4]_i_1_n_2 ,\pulses_generated_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulses_generated_reg[4]_i_1_n_4 ,\pulses_generated_reg[4]_i_1_n_5 ,\pulses_generated_reg[4]_i_1_n_6 ,\pulses_generated_reg[4]_i_1_n_7 }),
        .S(pulses_generated_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[5] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[4]_i_1_n_6 ),
        .Q(pulses_generated_reg[5]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[6] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[4]_i_1_n_5 ),
        .Q(pulses_generated_reg[6]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[7] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[4]_i_1_n_4 ),
        .Q(pulses_generated_reg[7]),
        .R(done0));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[8] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[8]_i_1_n_7 ),
        .Q(pulses_generated_reg[8]),
        .R(done0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulses_generated_reg[8]_i_1 
       (.CI(\pulses_generated_reg[4]_i_1_n_0 ),
        .CO({\pulses_generated_reg[8]_i_1_n_0 ,\pulses_generated_reg[8]_i_1_n_1 ,\pulses_generated_reg[8]_i_1_n_2 ,\pulses_generated_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulses_generated_reg[8]_i_1_n_4 ,\pulses_generated_reg[8]_i_1_n_5 ,\pulses_generated_reg[8]_i_1_n_6 ,\pulses_generated_reg[8]_i_1_n_7 }),
        .S(pulses_generated_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \pulses_generated_reg[9] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(pulses_generated0),
        .D(\pulses_generated_reg[8]_i_1_n_6 ),
        .Q(pulses_generated_reg[9]),
        .R(done0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFBFF0100)) 
    s_toggle_i_1
       (.I0(\clk_count[0]_i_4_n_0 ),
        .I1(clk_count_reg[2]),
        .I2(pulse_complete_reg_n_0),
        .I3(gen_1_pulse),
        .I4(s_toggle),
        .O(s_toggle_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_toggle_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(s_toggle_i_1_n_0),
        .Q(s_toggle),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    start_reg
       (.C(PULSE_TRIGGER_SPI_CLK_ADC_CONTROL_TO_PULSEGEN_1_OUT),
        .CE(1'b1),
        .CLR(done),
        .D(1'b1),
        .Q(start));
endmodule

module pulse_train_gen
   (EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF,
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
    MASTER_CLK_IN_IBUF_BUFG);
  output EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF;
  input PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  input MASTER_CLK_IN_IBUF_BUFG;

  wire EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF;
  wire MASTER_CLK_IN_IBUF_BUFG;
  wire PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  wire active;
  wire active_i_1_n_0;
  wire [2:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire done_i_1_n_0;
  wire done_reg_n_0;
  wire run;

  LUT2 #(
    .INIT(4'hE)) 
    EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF_inst_i_1
       (.I0(active),
        .I1(done_reg_n_0),
        .O(EXT_EXT_CNV_ACQUIRE_EXT_ADC_CONTROL_TO_ADC_A_AND_B_OUT_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hBFFFBF00)) 
    active_i_1
       (.I0(count[0]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(run),
        .I4(active),
        .O(active_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    active_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(active_i_1_n_0),
        .Q(active),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h1500)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(run),
        .O(\count[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \count[1]_i_1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(run),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6C00)) 
    \count[2]_i_1 
       (.I0(count[1]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(run),
        .O(\count[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(count[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    done_i_1
       (.I0(count[0]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(run),
        .O(done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(done_reg_n_0),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    run_reg
       (.C(PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT),
        .CE(1'b1),
        .CLR(done_reg_n_0),
        .D(1'b1),
        .Q(run));
endmodule

(* ORIG_REF_NAME = "pulse_train_gen" *) 
module pulse_train_gen__parameterized1
   (i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN,
    PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT,
    MASTER_CLK_IN_IBUF_BUFG);
  output i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
  input PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  input MASTER_CLK_IN_IBUF_BUFG;

  wire MASTER_CLK_IN_IBUF_BUFG;
  wire PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT;
  wire active;
  wire active_i_1__0_n_0;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire done_i_1__0_n_0;
  wire done_reg_n_0;
  wire i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN;
  wire run;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFBFFFB00)) 
    active_i_1__0
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(run),
        .I4(active),
        .O(active_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    active_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(active_i_1__0_n_0),
        .Q(active),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h5100)) 
    \count[0]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(run),
        .O(\count[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \count[1]_i_1 
       (.I0(\count_reg_n_0_[1] ),
        .I1(\count_reg_n_0_[0] ),
        .I2(run),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6C00)) 
    \count[2]_i_1 
       (.I0(\count_reg_n_0_[1] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(run),
        .O(\count[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    done_i_1__0
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(run),
        .O(done_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(MASTER_CLK_IN_IBUF_BUFG),
        .CE(1'b1),
        .D(done_i_1__0_n_0),
        .Q(done_reg_n_0),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    run_reg
       (.C(PULSE_TRIGGER_CNV_PULSE_ADC_CONTROL_TO_PULSEGEN_2_OUT),
        .CE(1'b1),
        .CLR(done_reg_n_0),
        .D(1'b1),
        .Q(run));
  LUT2 #(
    .INIT(4'hE)) 
    start_adc_control_i_1
       (.I0(active),
        .I1(done_reg_n_0),
        .O(i_PULSE_DCNVSCKL_PULSE_PULSEGEN_3_ACTIVE_PULSE_WIDTH_OUT_TO_ADC_CONTROL_IN));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
