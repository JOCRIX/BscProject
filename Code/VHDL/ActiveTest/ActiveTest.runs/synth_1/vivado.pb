
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:102

00:00:132	
507.3632	
199.789Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/utils_1/imports/synth_1/sample_control_TOP.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2u
sC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/utils_1/imports/synth_1/sample_control_TOP.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
m
Command: %s
53*	vivadotcl2<
:synth_design -top sample_control_TOP -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7a35tcpg236-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
15040Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1371.801 ; gain = 449.773
h px� 
�
synthesizing module '%s'638*oasys2
sample_control_TOP2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
798@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	clk_wiz_02�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/.Xil/Vivado-15708-DESKTOP-26ONRPF/realtime/clk_wiz_0_stub.vhdl2
62
PLL_12
	clk_wiz_02a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
4538@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	clk_wiz_02�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/.Xil/Vivado-15708-DESKTOP-26ONRPF/realtime/clk_wiz_0_stub.vhdl2
148@Z8-638h px� 
N
%s
*synth26
4	Parameter NR_OF_CLKs bound to: 16 - type: integer 
h p
x
� 
M
%s
*synth25
3	Parameter HIGH_TIME bound to: 20 - type: integer 
h p
x
� 
L
%s
*synth24
2	Parameter LOW_TIME bound to: 25 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
"pulse_gen_width_modulator_inverted2y
wC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_gen_width_modulator_invert.vhd2
352
pulse_gen_1_SPICLK2$
"pulse_gen_width_modulator_inverted2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
4618@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2$
"pulse_gen_width_modulator_inverted2{
wC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_gen_width_modulator_invert.vhd2
498@Z8-638h px� 
N
%s
*synth26
4	Parameter NR_OF_CLKs bound to: 16 - type: integer 
h p
x
� 
M
%s
*synth25
3	Parameter HIGH_TIME bound to: 20 - type: integer 
h p
x
� 
L
%s
*synth24
2	Parameter LOW_TIME bound to: 25 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2$
"pulse_gen_width_modulator_inverted2
02
12{
wC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_gen_width_modulator_invert.vhd2
498@Z8-256h px� 
I
%s
*synth21
/	Parameter width bound to: 35 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
pulse_width_gen2h
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
342
pulse_gen_2_CNV2
pulse_width_gen2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
4748@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
pulse_width_gen2j
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
458@Z8-638h px� 
I
%s
*synth21
/	Parameter width bound to: 35 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
pulse_width_gen2
02
12j
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
458@Z8-256h px� 
I
%s
*synth21
/	Parameter width bound to: 30 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
pulse_width_gen2h
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
342
pulse_gen_3_DCN2
pulse_width_gen2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
4848@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2!
pulse_width_gen__parameterized12j
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
458@Z8-638h px� 
I
%s
*synth21
/	Parameter width bound to: 30 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
pulse_width_gen__parameterized12
02
12j
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
458@Z8-256h px� 
I
%s
*synth21
/	Parameter width bound to: 30 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
pulse_width_gen2h
fC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/pulse_width_gen.vhd2
342
pulse_gen_4_DSC2
pulse_width_gen2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
4948@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
PARALLEL_SERIES_CONVERTER2r
pC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/PARALLEL_SERIES_CONVERTER.vhd2
342
PSC_12
PARALLEL_SERIES_CONVERTER2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5058@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
PARALLEL_SERIES_CONVERTER2t
pC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/PARALLEL_SERIES_CONVERTER.vhd2
478@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
PARALLEL_SERIES_CONVERTER2
02
12t
pC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/PARALLEL_SERIES_CONVERTER.vhd2
478@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
adc_control2d
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_control.vhd2
342
	adc_ctrl12
adc_control2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5178@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
adc_control2f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_control.vhd2
688@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2	
w_reset2f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_control.vhd2
1588@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
adc_control2
02
12f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_control.vhd2
688@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dds_compiler_02�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/.Xil/Vivado-15708-DESKTOP-26ONRPF/realtime/dds_compiler_0_stub.vhdl2
62	
DDS_DAC2
dds_compiler_02a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5498@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
dds_compiler_02�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/.Xil/Vivado-15708-DESKTOP-26ONRPF/realtime/dds_compiler_0_stub.vhdl2
178@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DAC_DATA_Conversion2l
jC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/DAC_DATA_Conversion.vhd2
342
DAC_DATA_CONVERTER2
DAC_DATA_Conversion2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5588@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DAC_DATA_Conversion2n
jC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/DAC_DATA_Conversion.vhd2
468@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
DAC_DATA_Conversion2
02
12n
jC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/DAC_DATA_Conversion.vhd2
468@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DAC_PRESCALER2f
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/DAC_PRESCALER.vhd2
342
DAC_PRESCALER12
DAC_PRESCALER2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5728@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DAC_PRESCALER2h
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/DAC_PRESCALER.vhd2
458@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
DAC_PRESCALER2
02
12h
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/DAC_PRESCALER.vhd2
458@Z8-256h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5828@Z8-113h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
EXT_MEM_RW202e
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/EXT_MEM_RW20.vhd2
342
	ext_memRW2
EXT_MEM_RW202a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
5998@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
EXT_MEM_RW202g
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/EXT_MEM_RW20.vhd2
568@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
EXT_MEM_RW202
02
12g
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/EXT_MEM_RW20.vhd2
568@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ExternalMemDist202j
hC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/ExternalMemDist20.vhd2
342
	MEM_DIST12
ExternalMemDist202a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
6228@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ExternalMemDist202l
hC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/ExternalMemDist20.vhd2
538@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ExternalMemDist202
02
12l
hC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/ExternalMemDist20.vhd2
538@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
adc_resampler2f
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_resampler.vhd2
372
ADC_RESAMPLER12
adc_resampler2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
6468@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
adc_resampler2h
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_resampler.vhd2
538@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dds_compiler_12�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/.Xil/Vivado-15708-DESKTOP-26ONRPF/realtime/dds_compiler_1_stub.vhdl2
62

sample_clk2
dds_compiler_12h
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_resampler.vhd2
1108@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
dds_compiler_12�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/.Xil/Vivado-15708-DESKTOP-26ONRPF/realtime/dds_compiler_1_stub.vhdl2
178@Z8-638h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
BUFGCE_inst2
BUFGCE2h
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_resampler.vhd2
2358@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
adc_resampler2
02
12h
dC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_resampler.vhd2
538@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
IV_SAMPLE_CTRL2g
eC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/IV_SAMPLE_CTRL.vhd2
362

IV_SAVER2
IV_SAMPLE_CTRL2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
6628@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
IV_SAMPLE_CTRL2i
eC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/IV_SAMPLE_CTRL.vhd2
578@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
IV_SAMPLE_CTRL2
02
12i
eC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/IV_SAMPLE_CTRL.vhd2
578@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
internal_ram2e
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/internal_ram.vhd2
402
IMEM2
internal_ram2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
6818@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
internal_ram2g
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/internal_ram.vhd2
598@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
internal_ram2
02
12g
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/internal_ram.vhd2
598@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
IX_MUX2e
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/EXT_MEM_COMM.vhd2
392	
IX_MUX12
IX_MUX2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7018@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
IX_MUX2g
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/EXT_MEM_COMM.vhd2
558@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
IX_MUX2
02
12g
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/EXT_MEM_COMM.vhd2
558@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
logic_reset2d
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/logic_reset.vhd2
342
logic_resetter2
logic_reset2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7168@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
logic_reset2f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/logic_reset.vhd2
438@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
logic_reset2
02
12f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/logic_reset.vhd2
438@Z8-256h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
I
%s
*synth21
/	Parameter DRIVE bound to: 12 - type: integer 
h p
x
� 
R
%s
*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
h p
x
� 
I
%s
*synth21
/	Parameter SLEW bound to: SLOW - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

IOBUF_inst2
IOBUF2a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
7278@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
sample_control_TOP2
02
12a
]C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/MASTER.vhd2
798@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
adc_2_data_latched_reg2f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_control.vhd2
1868@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
serial_data_adc_2_reg2f
bC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/sources_1/new/adc_control.vhd2
1868@Z8-6014h px� 
q
+design %s has port %s driven by constant %s3447*oasys2
sample_control_TOP2
o_DnB2
1Z8-3917h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[14]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[13]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[12]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[11]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[10]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[9]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[8]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[7]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[6]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[5]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[4]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[3]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[2]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[1]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[0]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sample_size_int_mem_reg[15]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2%
#EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN2
adc_controlZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1498.848 ; gain = 576.820
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1498.848 ; gain = 576.820
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1498.848 ; gain = 576.820
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0352

1498.8482
0.000Z17-268h px� 
�
�The value of SIM_DEVICE on instance '%s' of type '%s' is '%s'; it is being changed to match the current FPGA architecture, '%s'. For functional simulation to match hardware behavior, the value of SIM_DEVICE should be changed in the source netlist. %s369*netlist2
ADC_RESAMPLER1/BUFGCE_inst2
BUFGCE2

ULTRASCALE2	
7SERIES2

Z29-345h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
25Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.gen/sources_1/ip/dds_compiler_0/dds_compiler_0/dds_compiler_0_in_context.xdc2
DDS_DAC	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.gen/sources_1/ip/dds_compiler_0/dds_compiler_0/dds_compiler_0_in_context.xdc2
DDS_DAC	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
}c:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2	
PLL_1	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
}c:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2	
PLL_1	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.gen/sources_1/ip/dds_compiler_1/dds_compiler_1/dds_compiler_1_in_context.xdc2
ADC_RESAMPLER1/sample_clk	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.gen/sources_1/ip/dds_compiler_1/dds_compiler_1/dds_compiler_1_in_context.xdc2
ADC_RESAMPLER1/sample_clk	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc8Z20-179h px� 
�
No nets matched '%s'.
507*	planAhead2
i_ADC_DnB_IBUF2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1338@Z12-507h px�
�
No ports matched '%s'.
584*	planAhead2
	i_ADC_DnB2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1728@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
	i_ADC_DnB2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1758@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2

o_ADC_TRIG2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
3368@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2

o_ADC_TRIG2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
3378@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2

o_ADC_TRIG2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
3388@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2&
$.Xil/sample_control_TOP_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2&
$.Xil/sample_control_TOP_propImpl.xdcZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2_
[C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2_
[C:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1601.4612
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2}
{  A total of 25 instances were transformed.
  BUFGCE => BUFGCTRL: 1 instance 
  IOBUF => IOBUF (IBUF, OBUFT): 24 instances
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0162

1601.4612
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
}
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
PARALLEL_SERIES_CONVERTERZ8-802h px� 
o
3inferred FSM for state register '%s' in module '%s'802*oasys2
	s_adc_reg2
adc_controlZ8-802h px� 
t
3inferred FSM for state register '%s' in module '%s'802*oasys2
s_resamp_reg2
adc_resamplerZ8-802h px� 
q
3inferred FSM for state register '%s' in module '%s'802*oasys2
s_reset_reg2
logic_resetZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                      s1 |                             0000 |                             0000
h p
x
� 
y
%s
*synth2a
_                      s2 |                             0001 |                             0001
h p
x
� 
y
%s
*synth2a
_                      s3 |                             0010 |                             0010
h p
x
� 
y
%s
*synth2a
_                      s4 |                             0011 |                             0011
h p
x
� 
y
%s
*synth2a
_                      s5 |                             0100 |                             0100
h p
x
� 
y
%s
*synth2a
_                      s6 |                             0101 |                             0101
h p
x
� 
y
%s
*synth2a
_                      s7 |                             0110 |                             0110
h p
x
� 
y
%s
*synth2a
_                      s8 |                             0111 |                             0111
h p
x
� 
y
%s
*synth2a
_                  iSTATE |                             1000 |                             1000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2
PARALLEL_SERIES_CONVERTERZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               01 |                               00
h p
x
� 
y
%s
*synth2a
_                 acquire |                               11 |                               01
h p
x
� 
y
%s
*synth2a
_                get_data |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                   latch |                               00 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	s_adc_reg2

sequential2
adc_controlZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                     arm |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                     run |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                    stop |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
s_resamp_reg2

sequential2
adc_resamplerZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                  r_clk1 |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                  r_clk2 |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                  r_clk3 |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_             reset_trigd |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
s_reset_reg2

sequential2
logic_resetZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 4     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     16 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               48 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               19 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               17 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 46    
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 52    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   19 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   4 Input   19 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input   19 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   17 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   9 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   3 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   9 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   8 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 44    
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 33    
h p
x
� 
F
%s
*synth2.
,	   9 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 18    
h p
x
� 
F
%s
*synth2.
,	   7 Input    1 Bit        Muxes := 8     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
q
+design %s has port %s driven by constant %s3447*oasys2
sample_control_TOP2
o_DnB2
1Z8-3917h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[14]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[13]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[12]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[11]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2!
i_acquire_start_int_mem_reg[10]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[9]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[8]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[7]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[6]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[5]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[4]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[3]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[2]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[1]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
i_acquire_start_int_mem_reg[0]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sample_size_int_mem_reg[15]2
adc_resamplerZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2%
#EXT_SDA_POS_ADC_B_TO_ADC_CONTROL_IN2
adc_controlZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:31 ; elapsed = 00:00:33 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:39 ; elapsed = 00:00:41 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:42 ; elapsed = 00:00:45 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
>
%s
*synth2&
$+------+---------------+----------+
h p
x
� 
>
%s
*synth2&
$|      |BlackBox name  |Instances |
h p
x
� 
>
%s
*synth2&
$+------+---------------+----------+
h p
x
� 
>
%s
*synth2&
$|1     |clk_wiz_0      |         1|
h p
x
� 
>
%s
*synth2&
$|2     |dds_compiler_0 |         1|
h p
x
� 
>
%s
*synth2&
$|3     |dds_compiler_1 |         1|
h p
x
� 
>
%s
*synth2&
$+------+---------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
?
%s*synth2'
%+------+--------------------+------+
h px� 
?
%s*synth2'
%|      |Cell                |Count |
h px� 
?
%s*synth2'
%+------+--------------------+------+
h px� 
?
%s*synth2'
%|1     |clk_wiz_0_bbox      |     1|
h px� 
?
%s*synth2'
%|2     |dds_compiler_0_bbox |     1|
h px� 
?
%s*synth2'
%|3     |dds_compiler_1_bbox |     1|
h px� 
?
%s*synth2'
%|4     |BUFG                |     3|
h px� 
?
%s*synth2'
%|5     |BUFGCE              |     1|
h px� 
?
%s*synth2'
%|6     |CARRY4              |    30|
h px� 
?
%s*synth2'
%|7     |LUT1                |    34|
h px� 
?
%s*synth2'
%|8     |LUT2                |    49|
h px� 
?
%s*synth2'
%|9     |LUT3                |    82|
h px� 
?
%s*synth2'
%|10    |LUT4                |    89|
h px� 
?
%s*synth2'
%|11    |LUT5                |    48|
h px� 
?
%s*synth2'
%|12    |LUT6                |   207|
h px� 
?
%s*synth2'
%|13    |MUXF7               |    64|
h px� 
?
%s*synth2'
%|14    |FDCE                |    90|
h px� 
?
%s*synth2'
%|15    |FDPE                |     2|
h px� 
?
%s*synth2'
%|16    |FDRE                |   954|
h px� 
?
%s*synth2'
%|17    |FDSE                |     1|
h px� 
?
%s*synth2'
%|18    |IBUF                |     4|
h px� 
?
%s*synth2'
%|19    |IOBUF               |    24|
h px� 
?
%s*synth2'
%|20    |OBUF                |    44|
h px� 
?
%s*synth2'
%+------+--------------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:50 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 19 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:37 ; elapsed = 00:00:49 . Memory (MB): peak = 1601.461 ; gain = 576.820
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1601.461 ; gain = 679.434
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0282

1601.4612
0.000Z17-268h px� 
�
�The value of SIM_DEVICE on instance '%s' of type '%s' is '%s'; it is being changed to match the current FPGA architecture, '%s'. For functional simulation to match hardware behavior, the value of SIM_DEVICE should be changed in the source netlist. %s369*netlist2
ADC_RESAMPLER1/BUFGCE_inst2
BUFGCE2

ULTRASCALE2	
7SERIES2

Z29-345h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
119Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1601.4612
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2}
{  A total of 25 instances were transformed.
  BUFGCE => BUFGCTRL: 1 instance 
  IOBUF => IOBUF (IBUF, OBUFT): 24 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

76af8e95Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1082
492
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:572

00:01:122

1601.4612

1082.891Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0072

1601.4612
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2e
cC:/Users/jakob/Desktop/P7---Bsc/Code/VHDL/ActiveTest/ActiveTest.runs/synth_1/sample_control_TOP.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2o
mreport_utilization -file sample_control_TOP_utilization_synth.rpt -pb sample_control_TOP_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Fri Nov 22 18:14:01 2024Z17-206h px� 


End Record