
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:132

00:00:132	
515.2072	
203.629Z17-268h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
C:/Xilinx/Vivado/2024.1/data/ipZ19-2313h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/utils_1/imports/synth_1/blinkymcblink.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2X
VC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/utils_1/imports/synth_1/blinkymcblink.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
f
Command: %s
53*	vivadotcl25
3synth_design -top clk_wrapper -part xc7a35tcpg236-1Z4-113h px� 
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
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
7656Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:11 ; elapsed = 00:00:13 . Memory (MB): peak = 1376.898 ; gain = 446.598
h px� 
�
synthesizing module '%s'638*oasys2
clk_wrapper2T
Pc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/hdl/clk_wrapper.vhd2
258@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
clk2L
Jc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/synth/clk.vhd2
152
clk_i2
clk2T
Pc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/hdl/clk_wrapper.vhd2
368@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
clk2N
Jc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/synth/clk.vhd2
298@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
clk_blinkymcblink_0_02�
C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/.Xil/Vivado-13036-LAPTOP-EVQDCN9M/realtime/clk_blinkymcblink_0_0_stub.vhdl2
62
blinkymcblink_02
clk_blinkymcblink_0_02N
Jc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/synth/clk.vhd2
668@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
clk_blinkymcblink_0_02�
C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/.Xil/Vivado-13036-LAPTOP-EVQDCN9M/realtime/clk_blinkymcblink_0_0_stub.vhdl2
178@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
clk_clk_wiz_0_02{
yC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/.Xil/Vivado-13036-LAPTOP-EVQDCN9M/realtime/clk_clk_wiz_0_0_stub.vhdl2
62
	clk_wiz_02
clk_clk_wiz_0_02N
Jc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/synth/clk.vhd2
748@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
clk_clk_wiz_0_02}
yC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/.Xil/Vivado-13036-LAPTOP-EVQDCN9M/realtime/clk_clk_wiz_0_0_stub.vhdl2
168@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
clk2
02
12N
Jc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/synth/clk.vhd2
298@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
clk_wrapper2
02
12T
Pc:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/hdl/clk_wrapper.vhd2
258@Z8-256h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:14 ; elapsed = 00:00:16 . Memory (MB): peak = 1487.660 ; gain = 557.359
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:14 ; elapsed = 00:00:16 . Memory (MB): peak = 1487.660 ; gain = 557.359
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:16 . Memory (MB): peak = 1487.660 ; gain = 557.359
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

00:00:002

00:00:002

1487.6602
0.000Z17-268h px� 
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
~c:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_clk_wiz_0_0/clk_clk_wiz_0_0/clk_clk_wiz_0_0_in_context.xdc2
clk_i/clk_wiz_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
~c:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_clk_wiz_0_0/clk_clk_wiz_0_0/clk_clk_wiz_0_0_in_context.xdc2
clk_i/clk_wiz_0	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0_in_context.xdc2
clk_i/blinkymcblink_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.gen/sources_1/bd/clk/ip/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0/clk_blinkymcblink_0_0_in_context.xdc2
clk_i/blinkymcblink_0	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2r
nC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2r
nC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc8Z20-178h px� 
�
Parsing XDC File [%s]
179*designutils2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
CLK2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
18@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
CLK2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
28@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LED12c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
38@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LED22c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
48@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LED12c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
58@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LED22c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
68@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
CLK_CRYSTAL2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
88@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2	
CLK_OUT2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
98@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
CLK_CRYSTAL2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
108@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2	
CLK_OUT2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
118@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2c
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2a
_C:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/constrs_1/new/cmod_17_master_constraint_blinky.xdc2
.Xil/clk_wrapper_propImpl.xdcZ1-498h px� 
�
Parsing XDC File [%s]
179*designutils2G
CC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2G
CC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1502.6682
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0042

1502.6682
0.000Z17-268h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:28 ; elapsed = 00:00:31 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:28 ; elapsed = 00:00:31 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:28 ; elapsed = 00:00:31 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
7
%s
*synth2
Start Preparing Guide Design
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
�
�The reference checkpoint %s is not suitable for use with incremental synthesis for this design. Please regenerate the checkpoint for this design with -incremental_synth switch in the same Vivado session that synth_design has been run. Synthesis will continue with the default flow4740*oasys2X
VC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.srcs/utils_1/imports/synth_1/blinkymcblink.dcpZ8-6895h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Doing Graph Differ : Time (s): cpu = 00:00:28 ; elapsed = 00:00:31 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Preparing Guide Design : Time (s): cpu = 00:00:28 ; elapsed = 00:00:31 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:28 ; elapsed = 00:00:31 . Memory (MB): peak = 1502.668 ; gain = 572.367
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
C
%s
*synth2+
)

Incremental Synthesis Report Summary:

h p
x
� 
<
%s
*synth2$
"1. Incremental synthesis run: no

h p
x
� 
O
%s
*synth27
5   Reason for not running incremental synthesis : 


h p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
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
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:32 ; elapsed = 00:00:36 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:44 ; elapsed = 00:00:48 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
}Finished Timing Optimization : Time (s): cpu = 00:00:44 ; elapsed = 00:00:48 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
|Finished Technology Mapping : Time (s): cpu = 00:00:44 ; elapsed = 00:00:48 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
vFinished IO Insertion : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
E
%s
*synth2-
++------+----------------------+----------+
h p
x
� 
E
%s
*synth2-
+|      |BlackBox name         |Instances |
h p
x
� 
E
%s
*synth2-
++------+----------------------+----------+
h p
x
� 
E
%s
*synth2-
+|1     |clk_blinkymcblink_0_0 |         1|
h p
x
� 
E
%s
*synth2-
+|2     |clk_clk_wiz_0_0       |         1|
h p
x
� 
E
%s
*synth2-
++------+----------------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
F
%s*synth2.
,+------+---------------------------+------+
h px� 
F
%s*synth2.
,|      |Cell                       |Count |
h px� 
F
%s*synth2.
,+------+---------------------------+------+
h px� 
F
%s*synth2.
,|1     |clk_blinkymcblink_0_0_bbox |     1|
h px� 
F
%s*synth2.
,|2     |clk_clk_wiz_0_0_bbox       |     1|
h px� 
F
%s*synth2.
,|3     |IBUF                       |     1|
h px� 
F
%s*synth2.
,|4     |OBUF                       |     3|
h px� 
F
%s*synth2.
,+------+---------------------------+------+
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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
FSynthesis finished with 0 errors, 1 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:35 ; elapsed = 00:00:54 . Memory (MB): peak = 1502.668 ; gain = 557.359
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:52 ; elapsed = 00:00:57 . Memory (MB): peak = 1502.668 ; gain = 572.367
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

00:00:002

00:00:002

1502.6682
0.000Z17-268h px� 
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

00:00:002

00:00:002

1502.6682
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

5a5d32a4Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
282
122
12
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:01:022

00:01:092

1502.6682	
974.523Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0012

1502.6682
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2F
DC:/EIT GIT/P7---Bsc/Code/VHDL/Test/Test.runs/synth_1/clk_wrapper.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2a
_report_utilization -file clk_wrapper_utilization_synth.rpt -pb clk_wrapper_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon Oct  7 14:01:40 2024Z17-206h px� 


End Record