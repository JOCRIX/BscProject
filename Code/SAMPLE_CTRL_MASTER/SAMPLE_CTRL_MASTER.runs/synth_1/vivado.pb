
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:092

00:00:122	
506.5042	
201.508Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/utils_1/imports/synth_1/MASTER_FILE.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2y
wC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/utils_1/imports/synth_1/MASTER_FILE.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
f
Command: %s
53*	vivadotcl25
3synth_design -top MASTER_FILE -part xc7a35tcpg236-1Z4-113h px� 
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
14364Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1369.051 ; gain = 447.789
h px� 
�
synthesizing module '%s'638*oasys2
MASTER_FILE2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
558@Z8-638h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
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
IOBUF2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1808@Z8-113h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ExtMemReadWrite2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/ExtMemoryControl/ExtMemoryControl.srcs/sources_1/imports/new/ext_mem_read_write.vhd2
342
EXT_MEM_RW12
ExtMemReadWrite2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
1948@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ExtMemReadWrite2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/ExtMemoryControl/ExtMemoryControl.srcs/sources_1/imports/new/ext_mem_read_write.vhd2
588@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ExtMemReadWrite2
02
12�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/ExtMemoryControl/ExtMemoryControl.srcs/sources_1/imports/new/ext_mem_read_write.vhd2
588@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ExternalMemoryDistribution2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/ExtMemoryControl/ExtMemoryControl.srcs/sources_1/new/ExternalMemoryControl.vhd2
342
	MEM_DIST12
ExternalMemoryDistribution2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
2128@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ExternalMemoryDistribution2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/ExtMemoryControl/ExtMemoryControl.srcs/sources_1/new/ExternalMemoryControl.vhd2
548@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ExternalMemoryDistribution2
02
12�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/ExtMemoryControl/ExtMemoryControl.srcs/sources_1/new/ExternalMemoryControl.vhd2
548@Z8-256h px� 
M
%s
*synth25
3	Parameter NR_OF_CLKs bound to: 4 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
pulse_train_gen2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/TestClockGenForRam/TestClockGenForRam.srcs/sources_1/new/pulse_train_gen.vhd2
352
	PulseGen12
pulse_train_gen2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
2368@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
pulse_train_gen2�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/TestClockGenForRam/TestClockGenForRam.srcs/sources_1/new/pulse_train_gen.vhd2
508@Z8-638h px� 
M
%s
*synth25
3	Parameter NR_OF_CLKs bound to: 4 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
pulse_train_gen2
02
12�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/VHDL/TestClockGenForRam/TestClockGenForRam.srcs/sources_1/new/pulse_train_gen.vhd2
508@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
IV_SAMPLE_CTRL2z
xC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/new/IV_SAMPLE_CTRL.vhd2
352
	IV_SAVER12
IV_SAMPLE_CTRL2q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
2488@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
IV_SAMPLE_CTRL2|
xC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/new/IV_SAMPLE_CTRL.vhd2
558@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
IV_SAMPLE_CTRL2
02
12|
xC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/imports/new/IV_SAMPLE_CTRL.vhd2
558@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	clk_wiz_02�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.runs/synth_1/.Xil/Vivado-13868-DESKTOP-26ONRPF/realtime/clk_wiz_0_stub.vhdl2
62
PLL_12
	clk_wiz_02q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
2668@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	clk_wiz_02�
�C:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.runs/synth_1/.Xil/Vivado-13868-DESKTOP-26ONRPF/realtime/clk_wiz_0_stub.vhdl2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MASTER_FILE2
02
12q
mC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/sources_1/new/MASTER_FILE.vhd2
558@Z8-256h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
PulseCompleteExtReadWrite2
ExternalMemoryDistributionZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1483.207 ; gain = 561.945
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1483.207 ; gain = 561.945
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1483.207 ; gain = 561.945
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
00:00:00.0072

1488.1642
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
8Z29-17h px� 
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
�c:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2	
PLL_1	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2	
PLL_1	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2}
yC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/constrs_1/imports/CMOD/Cmod-A7-Master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2}
yC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.srcs/constrs_1/imports/CMOD/Cmod-A7-Master.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1592.8322
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
W  A total of 8 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 8 instances
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

1592.8322
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
Finished Constraint Validation : Time (s): cpu = 00:00:20 ; elapsed = 00:00:23 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:20 ; elapsed = 00:00:23 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:23 . Memory (MB): peak = 1592.832 ; gain = 671.570
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
u
3inferred FSM for state register '%s' in module '%s'802*oasys2
s_write_reg2
ExtMemReadWriteZ8-802h px� 
t
3inferred FSM for state register '%s' in module '%s'802*oasys2

s_read_reg2
ExtMemReadWriteZ8-802h px� 

3inferred FSM for state register '%s' in module '%s'802*oasys2

s_byte_reg2
ExternalMemoryDistributionZ8-802h px� 
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
_               readstep1 |                             0001 |                               00
h p
x
� 
y
%s
*synth2a
_               readstep2 |                             0010 |                               01
h p
x
� 
y
%s
*synth2a
_               readstep3 |                             0100 |                               10
h p
x
� 
y
%s
*synth2a
_               readstep4 |                             1000 |                               11
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

s_read_reg2	
one-hot2
ExtMemReadWriteZ8-3354h px� 
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
_              writestep1 |                             0001 |                               00
h p
x
� 
y
%s
*synth2a
_              writestep2 |                             0010 |                               01
h p
x
� 
y
%s
*synth2a
_              writestep3 |                             0100 |                               10
h p
x
� 
y
%s
*synth2a
_              writestep4 |                             1000 |                               11
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
s_write_reg2	
one-hot2
ExtMemReadWriteZ8-3354h px� 
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
_             byte1_step1 |                            00001 |                              000
h p
x
� 
y
%s
*synth2a
_             byte1_step2 |                            00010 |                              001
h p
x
� 
y
%s
*synth2a
_                   reset |                            00100 |                              010
h p
x
� 
y
%s
*synth2a
_                   byte2 |                            01000 |                              011
h p
x
� 
y
%s
*synth2a
_                finished |                            10000 |                              100
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

s_byte_reg2	
one-hot2
ExternalMemoryDistributionZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:21 ; elapsed = 00:00:23 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
,	   2 Input    3 Bit       Adders := 1     
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
.	   2 Input      1 Bit         XORs := 1     
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
.	               19 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 8     
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
,	   5 Input   19 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   5 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 3     
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
t
+design %s has port %s driven by constant %s3447*oasys2
MASTER_FILE2
Ext_Mem_nCE_ext2
0Z8-3917h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:26 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:31 ; elapsed = 00:00:34 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
}Finished Timing Optimization : Time (s): cpu = 00:00:31 ; elapsed = 00:00:34 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
|Finished Technology Mapping : Time (s): cpu = 00:00:31 ; elapsed = 00:00:34 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
vFinished IO Insertion : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |clk_wiz_0     |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
:
%s*synth2"
 +------+---------------+------+
h px� 
:
%s*synth2"
 |      |Cell           |Count |
h px� 
:
%s*synth2"
 +------+---------------+------+
h px� 
:
%s*synth2"
 |1     |clk_wiz_0_bbox |     1|
h px� 
:
%s*synth2"
 |2     |BUFG           |     2|
h px� 
:
%s*synth2"
 |3     |CARRY4         |     4|
h px� 
:
%s*synth2"
 |4     |LUT1           |     2|
h px� 
:
%s*synth2"
 |5     |LUT2           |    33|
h px� 
:
%s*synth2"
 |6     |LUT3           |    10|
h px� 
:
%s*synth2"
 |7     |LUT4           |     5|
h px� 
:
%s*synth2"
 |8     |LUT5           |    11|
h px� 
:
%s*synth2"
 |9     |LUT6           |     4|
h px� 
:
%s*synth2"
 |10    |FDCE           |    16|
h px� 
:
%s*synth2"
 |11    |FDPE           |     2|
h px� 
:
%s*synth2"
 |12    |FDRE           |    87|
h px� 
:
%s*synth2"
 |13    |FDSE           |     9|
h px� 
:
%s*synth2"
 |14    |IBUF           |    24|
h px� 
:
%s*synth2"
 |15    |IOBUF          |     8|
h px� 
:
%s*synth2"
 |16    |OBUF           |    38|
h px� 
:
%s*synth2"
 +------+---------------+------+
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:26 ; elapsed = 00:00:38 . Memory (MB): peak = 1592.832 ; gain = 561.945
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 1592.832 ; gain = 671.570
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
00:00:00.0042

1592.8322
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
12Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
U
1Inserted %s IBUFs to IO ports without IO buffers.100*opt2
1Z31-140h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1592.8322
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
W  A total of 8 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 8 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

715b4b06Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
542
32
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

00:00:462

00:00:592

1592.8322

1073.699Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1592.8322
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2i
gC:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.runs/synth_1/MASTER_FILE.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2a
_report_utilization -file MASTER_FILE_utilization_synth.rpt -pb MASTER_FILE_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Wed Oct 23 11:33:45 2024Z17-206h px� 


End Record