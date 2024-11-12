// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Nov 12 13:28:02 2024
// Host        : LAPTOP-EVQDCN9M running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_25,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_25,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    s_axis_config_tvalid,
    s_axis_config_tdata,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_CONFIG, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_config_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_CONFIG TDATA" *) input [31:0]s_axis_config_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [7:0]m_axis_data_tdata;

  wire aclk;
  wire [7:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [31:0]s_axis_config_tdata;
  wire s_axis_config_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [31:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [31:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [31:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "32" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "1" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "8" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_TYPE = "0" *) 
  (* C_OUTPUT_WIDTH = "3" *) 
  (* C_PHASE_ANGLE_WIDTH = "3" *) 
  (* C_PHASE_INCREMENT = "1" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "32" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_25 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[31:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[31:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[31:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(s_axis_config_tdata),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QwzFJmGcmuiKddE+BYFoDvgdr5RCDU8RbXMXhOK+y3PeocMYwGQprU06gy6+uULddPdY1d7Zpkl4
8PLD9UUy/XTRIMRkKFF8iGwcy4GukjF+wF//IfzFlL7UzfIynEfTE9BZnkKrGSgEtvrrieEPogs6
4cHoUeICIlYn2vaCq1U=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A5TDtolvoT8jrAmuJHkafqS9OHu6Gq/PMmm1EtAJgSJSLKbu8jW7A8ZF3/HKxkKmRmFUILHUKYlR
QfHZS4GmEVtWCEWtKpqBFqWJFaCOU0d7Z52FYUUNsrHsjemkExK3X+d+4zmcvoWkt0PpF6he3x3Z
H2Hfm0DzIC6BxqRq+fbN4r1Y3CxkJWUGWSFGDAUyqrC4lFM3y2zFtsedwywPj9k7ZPBckA4rSeQ+
4xZ9PrIwtQXxLQ95tJQ/FblrFLD/khI7gm+pfS8MzQZX3cTOi3IEaATad8E6H21q4AlXRIjcZ5aZ
fsIQVJKxmoAW+tkpAvvqpKaZSSHZDG7/Zfpxvg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
q4nXc6vDv7SCwovcUQ8mg0ddt/6HzaQq5knTykAAhGFX5GDr/On+XnH0gJb/s5YAZ+efacireUfc
0/7oLdu6vx0IlQEdvxciUTh5LeYn/dCh/dofsZIYIkbcmvUS+lYKQbVsMZD08GDHLFFhxLzvKnQY
yO4XzYtKXm/gRIyc1B8=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bi4/JvsyXYWliqe8C97RzFYYL+5kiQY48Rw9+WmFLdezOov8H+z/OR8MhkrrzYvN87xpcvNumpgC
XbM/cnArMPPf/kW0xBOJScjqvhW8Ch6eXrqmpDq0wgHJ7ahHoEKvI2I3h9/8W6URIi9LnpW+EG04
V+nqTAlVPRJu9twstL3wERy1kw7PdVYH26vnZfSDji5/Ck6Dj12abH5szgZRd1vF5511xHPwUxOx
zJUa1megV9zt0UR/jy2bq5rBQBoP3t5I1YhjCZZBtJB0pRaoJr3u674oG32/sIJiuIGfr5YQ1OYW
NqS9gt+0Mar/sFqAnXnlQzog3HA7Y30pcndu7Q==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ItL89heSfN5sCFq5IhssGXFB+J/tRcmaKBFe7SV8TL+P9IJPXrY3zAmA6bnheHyj8UMWnpVL+8WZ
MtjLIYzaKoFjtqxeor5r62jajXcS7MZ5rQBuE//VX4MT/FmGvm70+pUPvoGjqy/7l9v0I0hZa+W8
WR/atwdtQRRqQDm8BkCsQbdz5dsyzGemnbBgY2/50td0bx56mHVO3ibR6YVaff5XSo7X6GaOjYZc
uav2Y7SZwIaMGqT4HTDKngEcU/EbMAPa8omcjSNT78MK28l4k1c2Nj/bRIlHNQgEb/6IXnP/2X0P
9KqaEIO1exETmm7qd0yUKPDoVjcPmYdcIqh4dQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
s/MMLYeEJjrvFPxblPwSTTZm363UgI35H03Nc3Qjmxxt0s/ujUUeYyBel64pJMZGDJKPX/i5sx6Z
cdtOD3cpHdZdZXPuMdZ4qfSzthwl7nBseISCQ4FaK2qxVVq45u6tDhEsHfZPEPKiSfn9oxmy59MC
cQJClufehfd+YKhkuoF0Qnt9WSa0vWMQmExrZpsudJGrcgiNurIdfd99Wj7Ve62/qN4IpkTT6Bej
wZuDbi74E26J+N9T9ZVC1tZzcKBwceUyWHOreS2l87fLYFlR76sDfyFXB7MRk3TXwkfvXE3r//4L
BKMHceBKA+T0BNXyI3pF/No6ajgPnjZl6C/Beg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iU0iiUsqMoLiXYDQyD0xNh0he8Hb+dVzANumn57cZoUJPt5x/SmPwNhA5lLdPYlmMIa5onU3Nvlv
ebtnoxdB/DjX3WUhrLOKHW3w6167rUBrgZtuXuX4JhmP7dbPHm+/afSj4cesQJubVLODCCcxyNca
ZXvNA7647G/g0je3B+SVjUzdnN7/NDjGDEzyVGAfVXCMgODpbdE/jna1bEjJbqi9NQhw5YZH2CAg
iXP5NDDnPA6WHWKe5HnKO1a9QwLtxN936GztodWGx3qx0or93h5iNAUsFq+AVMN08/E8pfjNRlDL
xKWAnxQ7T9pjmQDosH/9IS/VZTgj9fmtfUM7UA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
qCNpLEjYQEnVMYYeIvStLp9KxlBlueRkY+gEPLcRBFfm3zsV+053PXrI3CGA9oPjLBsNe2/zCmF/
8J7HSMsGXnAr5aAQnBlPdzSWsbcND8KgCVRmjvllKxdjn3PaGTUGNz77mH1SXOMraIGmtNgckee7
gVFmIy1gBeMoUxi4HRDJT/1qytnEXUbH1WzYvxanE1vkcB290bNEe5zWHDk93gHTChfyq59fN1FP
JO4/yjrKSHk26XrFto+F4E1Go7sCFGB4QBUfzscbFHJNnPpE8LY9Y0eNhvk2Decvvlva/XnZe17E
wqTcnUlizXHk7ZzXIb1NZKzbWZstaoX0EJHaVhwC/4u5L9GuLNxs5S4cUzoFujyt/4oBeNcipLDk
+2hAHojfBkHJplYRMVKBSQkD+YJjmxrS8bscHwS2A9JVlViG2zfMvUhIjIrZRbTcgV8dWq5eO9Yu
iq0CqeEL7Gsq+IZIV85kkk8JB+mJNtImH0tfY4rMEx8dYNpALCThtXvx

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bVfzIBiijAjUMZrGuUCb22zYY2OJET1A1hOtMbpVq8ZnKczRf7Zvybh2sVrWqJZsuG4kK1pu1Ek2
FJfBLqF2VR/0OfAJzJjvI/CsR+YxNAIbBspFhBWHf//cqji7L1NCEoQALr80vXYInRgVAmbaSw4E
4Chcwfy5wouUE0bhR3hd69c7cJjZaADg48C6nFC07pL7O8hxMMMAnu2DfVHgJivO7vbZns6cVmIP
ThJOO5aYXSZLW0f8us5JcrY8ilO0VUpo/rmh6KFGOQDGz0HMXoFVqlzytcb93LVy/viq31gnT9Dk
iHCwM0VStm3BY8iOT0Th5e7IV+OFr/9HWsta2w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14288)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QwzFJmGcmuiKddE+BYFoDvgdr5RCDU8RbXMXhOK+y3PeocMYwGQprU06gy6+uULddPdY1d7Zpkl4
8PLD9UUy/XTRIMRkKFF8iGwcy4GukjF+wF//IfzFlL7UzfIynEfTE9BZnkKrGSgEtvrrieEPogs6
4cHoUeICIlYn2vaCq1U=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A5TDtolvoT8jrAmuJHkafqS9OHu6Gq/PMmm1EtAJgSJSLKbu8jW7A8ZF3/HKxkKmRmFUILHUKYlR
QfHZS4GmEVtWCEWtKpqBFqWJFaCOU0d7Z52FYUUNsrHsjemkExK3X+d+4zmcvoWkt0PpF6he3x3Z
H2Hfm0DzIC6BxqRq+fbN4r1Y3CxkJWUGWSFGDAUyqrC4lFM3y2zFtsedwywPj9k7ZPBckA4rSeQ+
4xZ9PrIwtQXxLQ95tJQ/FblrFLD/khI7gm+pfS8MzQZX3cTOi3IEaATad8E6H21q4AlXRIjcZ5aZ
fsIQVJKxmoAW+tkpAvvqpKaZSSHZDG7/Zfpxvg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
q4nXc6vDv7SCwovcUQ8mg0ddt/6HzaQq5knTykAAhGFX5GDr/On+XnH0gJb/s5YAZ+efacireUfc
0/7oLdu6vx0IlQEdvxciUTh5LeYn/dCh/dofsZIYIkbcmvUS+lYKQbVsMZD08GDHLFFhxLzvKnQY
yO4XzYtKXm/gRIyc1B8=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Bi4/JvsyXYWliqe8C97RzFYYL+5kiQY48Rw9+WmFLdezOov8H+z/OR8MhkrrzYvN87xpcvNumpgC
XbM/cnArMPPf/kW0xBOJScjqvhW8Ch6eXrqmpDq0wgHJ7ahHoEKvI2I3h9/8W6URIi9LnpW+EG04
V+nqTAlVPRJu9twstL3wERy1kw7PdVYH26vnZfSDji5/Ck6Dj12abH5szgZRd1vF5511xHPwUxOx
zJUa1megV9zt0UR/jy2bq5rBQBoP3t5I1YhjCZZBtJB0pRaoJr3u674oG32/sIJiuIGfr5YQ1OYW
NqS9gt+0Mar/sFqAnXnlQzog3HA7Y30pcndu7Q==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ItL89heSfN5sCFq5IhssGXFB+J/tRcmaKBFe7SV8TL+P9IJPXrY3zAmA6bnheHyj8UMWnpVL+8WZ
MtjLIYzaKoFjtqxeor5r62jajXcS7MZ5rQBuE//VX4MT/FmGvm70+pUPvoGjqy/7l9v0I0hZa+W8
WR/atwdtQRRqQDm8BkCsQbdz5dsyzGemnbBgY2/50td0bx56mHVO3ibR6YVaff5XSo7X6GaOjYZc
uav2Y7SZwIaMGqT4HTDKngEcU/EbMAPa8omcjSNT78MK28l4k1c2Nj/bRIlHNQgEb/6IXnP/2X0P
9KqaEIO1exETmm7qd0yUKPDoVjcPmYdcIqh4dQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
s/MMLYeEJjrvFPxblPwSTTZm363UgI35H03Nc3Qjmxxt0s/ujUUeYyBel64pJMZGDJKPX/i5sx6Z
cdtOD3cpHdZdZXPuMdZ4qfSzthwl7nBseISCQ4FaK2qxVVq45u6tDhEsHfZPEPKiSfn9oxmy59MC
cQJClufehfd+YKhkuoF0Qnt9WSa0vWMQmExrZpsudJGrcgiNurIdfd99Wj7Ve62/qN4IpkTT6Bej
wZuDbi74E26J+N9T9ZVC1tZzcKBwceUyWHOreS2l87fLYFlR76sDfyFXB7MRk3TXwkfvXE3r//4L
BKMHceBKA+T0BNXyI3pF/No6ajgPnjZl6C/Beg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iU0iiUsqMoLiXYDQyD0xNh0he8Hb+dVzANumn57cZoUJPt5x/SmPwNhA5lLdPYlmMIa5onU3Nvlv
ebtnoxdB/DjX3WUhrLOKHW3w6167rUBrgZtuXuX4JhmP7dbPHm+/afSj4cesQJubVLODCCcxyNca
ZXvNA7647G/g0je3B+SVjUzdnN7/NDjGDEzyVGAfVXCMgODpbdE/jna1bEjJbqi9NQhw5YZH2CAg
iXP5NDDnPA6WHWKe5HnKO1a9QwLtxN936GztodWGx3qx0or93h5iNAUsFq+AVMN08/E8pfjNRlDL
xKWAnxQ7T9pjmQDosH/9IS/VZTgj9fmtfUM7UA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
qCNpLEjYQEnVMYYeIvStLp9KxlBlueRkY+gEPLcRBFfm3zsV+053PXrI3CGA9oPjLBsNe2/zCmF/
8J7HSMsGXnAr5aAQnBlPdzSWsbcND8KgCVRmjvllKxdjn3PaGTUGNz77mH1SXOMraIGmtNgckee7
gVFmIy1gBeMoUxi4HRDJT/1qytnEXUbH1WzYvxanE1vkcB290bNEe5zWHDk93gHTChfyq59fN1FP
JO4/yjrKSHk26XrFto+F4E1Go7sCFGB4QBUfzscbFHJNnPpE8LY9Y0eNhvk2Decvvlva/XnZe17E
wqTcnUlizXHk7ZzXIb1NZKzbWZstaoX0EJHaVhwC/4u5L9GuLNxs5S4cUzoFujyt/4oBeNcipLDk
+2hAHojfBkHJplYRMVKBSQkD+YJjmxrS8bscHwS2A9JVlViG2zfMvUhIjIrZRbTcgV8dWq5eO9Yu
iq0CqeEL7Gsq+IZIV85kkk8JB+mJNtImH0tfY4rMEx8dYNpALCThtXvx

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bVfzIBiijAjUMZrGuUCb22zYY2OJET1A1hOtMbpVq8ZnKczRf7Zvybh2sVrWqJZsuG4kK1pu1Ek2
FJfBLqF2VR/0OfAJzJjvI/CsR+YxNAIbBspFhBWHf//cqji7L1NCEoQALr80vXYInRgVAmbaSw4E
4Chcwfy5wouUE0bhR3hd69c7cJjZaADg48C6nFC07pL7O8hxMMMAnu2DfVHgJivO7vbZns6cVmIP
ThJOO5aYXSZLW0f8us5JcrY8ilO0VUpo/rmh6KFGOQDGz0HMXoFVqlzytcb93LVy/viq31gnT9Dk
iHCwM0VStm3BY8iOT0Th5e7IV+OFr/9HWsta2w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dn8ROJNjOOzCpdnpz1fkQc6yZXDACAmGmdNn8ucaoR+7MqVTSKzie2Vpstpa1hVFClgixsJvGl1v
NEzllJfkvlfhmokD+FBSBSeXKXl1Vihg4W+pfeBR5va9zTeq7LonPh6ZzqOgDtflcMQeTGDsCGDu
v1KruJKKE3a9Hr3xKkt/PIoL0pT3ktgK+rMPqf5RZOZx2HaiVlbSlL708RGnApp+0hFWwMMpkvtf
RvcQdxxkmEFlQgseKnoZAN0Ex0pCuAhk7IAJxXT7NbhZf5q+no2PKtfXXXJ3U7kLJfxoarOaNkBr
Z/pPUBpdRtZ3wONugH3UxWyIKoQoqYuPZZAeDQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k2IutfNaxYLmU8XCkgEVnDSoRlkVm91cNL4AR1l0sdUgvqCCiITZmKTHRMeN15MSN1PpK5JzIfTz
n83HBzRFwBohV5YS0W7GV1+q60TEeN9+dvvfcokKif1GYoeA//HhJd9UATVcdwbSjGb2JolYP1TK
KGOycvwRwkBr1NoieHxzkHaMSvgS5yFPrmkl6+e7EtCfqzzViXY33+BzWXWYTDxTFacNSliq4CuI
53pGxiGm1au9k6Yf0SCpD+VmnG4x1fH4iRPYQ2+VQEHDN0LOC8aT3PFGFdPbmjxalYFT6dzgrpL6
C5NTrr0H0VpitXX/O5Bih9z2HaIScX3vIKSLCw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 35600)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Gfm/KjEq16tQdmjotZ7aw426nnZ66lwQxFBnAwt+dzKzFgwfdDqMuwv69cZkoaHlzSl61K/9wRwn
J6H3usfQJqHCjRTybLqXHHxDa/hhE+V/RjAZrc79uFIfIqvyzNgb2L2jiHVanP96shUM5ZM4eOs2
6w9vCYLuoHfm9jE0JxY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BleSOtcgWI/qc8mCcGa/deCKMWirxZpjLBmYuAr/d69/vgwaGjURdA+7+tsXozuAFxgJa+f4YYyY
/UtnGwZ8P4/ebpYfAveqYDwKMj72318XhLArJjAit9PNtUGHMuhqEvTmhcewGWrmrLI4zTxuX6Lx
1JKo59wQIHLFtEw6L4kAOsYr8xTaZ3f3biD7Cl15LyBIB2lHV9Jsm14UKWl4zZtlzqFQ2S5c2BbI
dbhHFPj8xLLqfr/md77PHThTzkJVc0Jgm+y1Y8pA134lXNqg4BfMQ/GTF+oDatGNDKmJdKwmlCqa
3mcUBGYnw2HG75Y0W8wkA8mSRv61vuR1AIi9Wg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uaofQ5nOjBjFYXjDUHmFexjwV6W6zFjrv5rNagktBr9x97iwQmfRd5PMkhivRXqN7BV/XEw74ZSQ
Fax1LntgbVSDp3CpWcF+SY7f2uxU/dpw/urZ1DD+KPGz4iu0BLyGFZfHf2h38B4IpCyS7qP4424+
3yO3+WEqIGo1phlZMFA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ejHvSzPk7mzsbyjbq5z3+5yP5UbWGLofh4qBZXOeF0i55gRQs+ZPwdq02HxwpVM9eBBM3f5RH32V
MfB+zSbYNkuBelpQeHIiFvrwtRaqySyc4O3d1IxR93kwIAJ8tshwvOJ2VvMo1I1ZxwwhPNBLG0V/
rT1SC7ERdtU4VRrSSSwuuq/Bp0G4AKUKN0c+2EEkSiQWOkrrTeg89cLXUPIGn+/rPj+5ssIS4udZ
KCTs8xLzYFbCn1Iiej6/+6YB+S4erJXAqPD0uVRr6e7g+UqRGEy2RuY/1Nwtn1ku0ynepG9nIMn5
6puJLTHze5eDv39Ppy/PouytXSBv5EbtNyss2w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2M6cn2OosqhC9MUEjbwh9uq0y8bvd9ncNRL8tE4a8f4CGhNsQ9gsbw2vRBj7L/zJIroqfaWGUsKw
/9PgdYFu7eZ3kaDTQI+dYXR9GC5l8uMzQRGx+RIZE2BBNCehjVvyzbtI5V5wPt/0kkG70gsw8ilk
R4Ydms/ucKkzXwegdjE7lomrMtPa06WrXkbbgcTC+7qksmhfGm2BsJyxUvFN/+ZYl1cpM3I4PhTn
B1+flmk5REQNLq0oYApf3XCORF9AxnZ9A6y/sAbEmh0VBRnzMw0UAUCuI3RBKw1woq1LcnIqEqtR
MejfeXDSwyKrkgIFp12dHpDmN8+G6IhxzAsu1A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rENHntPAj3dJ9INhFLwmMvePhlm/P/OiFTTrc4gOjO3hZESW+fWsCNrcwsqPsiX2l+BgwpUXZmV2
cUE6nwM0ws/iNg1Uhtodv4wYU0MNcfCA5Nvjkb9Vf/JmOywNjIB1FrcO467Ev/gNlBcRdxcIJxrf
JJjaPuhXMnoprhLlzTFTicLkdlSAo8OSd6HyzHfvCa0jRpPKaCVmvdfUFNMNxPCbdcUaxSjcz/sP
frV84Y3Qj8acoN7YrqzDQhk29yREb8Z3lE53cWYWfxbXm33FJmvqEZitfgzOPC0xhaYJ2aC6Dey6
cngRkpmTmsMtppSycwCCNrOnDgDHkgU87x/PWA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GveRuYmxZZQ4YEjKGK7VRQjuH3AZJE6gbffXUkQpq+Czx0C+EhvLN931xsB26ohkqgarkbh4uOp0
FjcqbzpGAgOPotn3eUJG9mJiJeTgDKxGaHuKbHH5ZuiPrIJopg36u7ZkilZWmeySrofjFh4o6/gM
VIUjw8/VlSMbHDivmUeQYece4qeRoyJY4sVhYSeZTVteuScBHuIkBEOY7GkHebGcy5XKMQmwoKq6
9i5+iiXgUxpryr+NG2n0KAM+/5p249I68VFx+/QShxpiOaouGosxsJeo/8/5zUF6H3iKKRXOJJdg
EtGUF7brQOrwWRIfmxqGuUnMhGHuAj2ehXYtig==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gYtzOAjQEqEqnACVnAajuFqwicsdRLjpKUP+2X1QdJwyW34YM07pBcK4215MGdE/oq2AtXunFV/1
YYC9UIYcD6PFdbbxOfh7VJlUpoEjybiiTJPjADogpv+F5zYTiuuMO0tOkB9XetQAhMhxabXnHtSh
mFK0I2CQt79WCts4cvQykwPrD/7uU5GNoq6GDv/m1Acf8t7No/LK0I/Ruic09tzVNcE9zIOCmWkj
yQsvjWqRy8fnQkwD/jFE34VojhE3r0xDdSxONTCSpaGU5BHq5znnS7kdGDLpA0GRrM90kavZ+P8c
ASwSmXK9nEm9fCfgxVP9YPQ7nlqyBU6KXRMrnYCyi9wqGrZX95nH5XN3xsD/psMIMyK1kVgddDmE
Qyc3ArMuJuRubr1mgIxBd4QHKHFZNIsrxMUdmdhJLmUYhU/QGID6EbkbZYMNiVD21vvHSF3DrUSb
BfJOn17Xc3WTTaRXrvjDX6IUPUwNR0U6cye5JSjt1tLRhp2zEHydEcgw

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
J8xkZrOO5aSXrk8Xsh5d5jur/i5dBq4XuTdFXiv0SjDqu0CNFS3Uvew1nCxAM5j9L/sCMEODR2TS
sv3m3i8tM2tk4tRpLVwOOqKOzA9yPliw5VtHKKpbPzIkrOym4hA8IUnSVWn6d1HEWLguuAIy5I6+
gYClZCJWP0LhcKaRrVhwOqMQOY45gXYM60dvI/SWZyf0kxY1pX+AtsX7YK6hIKCoUOlM+AL2lSzU
lPowXd/vuCEFlZrCbEDk7sjgnL9UtH50YoJsx1ePkJJNFmsyai7bOmlN0QxXvcQfVaG9zVlECN5y
sWGhBFs6I16YMl40+dnLkX1ToATo2F8gb6zXEQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nO2wiAwNEEs4q0+4Wy/q4VorVHEt3SUkHgw6SX64C52GW1LJ/2fW9juLh+6sr/xycfRFkta4QYn4
wTA3UzdKTMiNr2X40Cx5t+E08nyfzP2KuCWjV8RCmT/YuFZ/jbwl2SFREvColjYGt0jpS/EOBXNO
UobdPUNSPPjTPeHvisGG59zCf7OZlfBkqk7Lx8Qd+WDQzYIQS0puu4Vz+IFQuyNNRUsLtwjZbmj3
rDh/Zqoj1wrsnZIHTaFhC7bd+ngKXYZ0veihATjotvJ+I8qXT8HzBu/De3B/MIoBDnbSgkIYIvIE
ktiNys5cmhWPXcazKl2Il4DO26kxX8rqvSYfnQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SWEBeaPnyY/edczCyGK05X8vv0orkUZV3834MgS++glyPQgSdpbx2lDsD6wAcjvumvLXCqC6BeWH
WXYcHR7KPdNga5j/w8/781WWmPDMF1aGQZC96DlsIAL0wfTR29IAREKCPnyxMkh9BHs21Ji0gqYK
WGObMkq/xrR7fTsDuBX6hiFc3WpXouWO7Di0G/1T/bMWyui0y32jmfxDEJ73K4za5bG4mVGcxpwK
ql0vbdvoYuB3mRe5nNoN/0nXjM7BDV5Jd871zFi8BEuZAnPlF0+Td9yz7HiF5gbE7P5ILtb5hz5F
oEONYAK2znaw+KlT+6khhaLCWlOXPdrQhRLJ9w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15648)
`pragma protect data_block
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
`pragma protect end_protected
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
