
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/utils_1/imports/synth_1/pulse_width_gen.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2u
sF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/utils_1/imports/synth_1/pulse_width_gen.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
n
Command: %s
53*	vivadotcl2=
;synth_design -top pulse_wdith_gen_TOP -part xc7a35tcpg236-1Z4-113h px� 
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
M
#Helper process launched with PID %s4824*oasys2
3964Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1392.680 ; gain = 448.383
h px� 
�
synthesizing module '%s'638*oasys2
pulse_wdith_gen_TOP2q
mF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_wdith_gen_TOP.vhd2
438@Z8-638h px� 
I
%s
*synth21
/	Parameter width bound to: 40 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
pulse_width_gen2k
iF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_width_gen.vhd2
342

pulsegen2
pulse_width_gen2q
mF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_wdith_gen_TOP.vhd2
728@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
pulse_width_gen2m
iF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_width_gen.vhd2
468@Z8-638h px� 
I
%s
*synth21
/	Parameter width bound to: 40 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
pulse_width_gen2
02
12m
iF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_width_gen.vhd2
468@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	clk_wiz_02�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.runs/synth_1/.Xil/Vivado-12992-DESKTOP-DNC9NIR/realtime/clk_wiz_0_stub.vhdl2
62
your_instance_name2
	clk_wiz_02q
mF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_wdith_gen_TOP.vhd2
848@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	clk_wiz_02�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.runs/synth_1/.Xil/Vivado-12992-DESKTOP-DNC9NIR/realtime/clk_wiz_0_stub.vhdl2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
pulse_wdith_gen_TOP2
02
12q
mF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_wdith_gen_TOP.vhd2
438@Z8-256h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1503.516 ; gain = 559.219
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1503.516 ; gain = 559.219
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1503.516 ; gain = 559.219
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

1503.5162
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
�f:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2
your_instance_name	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�f:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.gen/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc2
your_instance_name	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc8Z20-179h px� 
�
No nets matched '%s'.
507*	planAhead2
E_TRIGGER_OUT_OBUF2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1448@Z12-507h px�
�
No ports matched '%s'.
584*	planAhead2	
o_pulse2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1468@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
	o_trigger2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1478@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
i_master_clk2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1488@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
	i_trigger2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1498@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2	
o_pulse2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1508@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
	o_trigger2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2
1518@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2'
%.Xil/pulse_wdith_gen_TOP_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
�F:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.srcs/constrs_1/imports/CMOD A7 AT35 Constraint File/Cmod-A7-Master.xdc2'
%.Xil/pulse_wdith_gen_TOP_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1578.7232
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
00:00:00.0012

1578.7232
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
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
,	   2 Input    4 Bit       Adders := 1     
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
.	                4 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 3     
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
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
}Finished Timing Optimization : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
|Finished Technology Mapping : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
vFinished IO Insertion : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
 |2     |BUFG           |     1|
h px� 
:
%s*synth2"
 |3     |LUT1           |     1|
h px� 
:
%s*synth2"
 |4     |LUT2           |     2|
h px� 
:
%s*synth2"
 |5     |LUT3           |     1|
h px� 
:
%s*synth2"
 |6     |LUT4           |     2|
h px� 
:
%s*synth2"
 |7     |FDCE           |     1|
h px� 
:
%s*synth2"
 |8     |FDRE           |     6|
h px� 
:
%s*synth2"
 |9     |IBUF           |     1|
h px� 
:
%s*synth2"
 |10    |OBUF           |     2|
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:10 ; elapsed = 00:00:15 . Memory (MB): peak = 1578.723 ; gain = 559.219
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1578.723 ; gain = 634.426
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

1578.7232
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

1578.7232
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

a476bc50Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272
92
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

00:00:182

00:00:192

1578.7232

1035.711Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002

00:00:002

1578.7232
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2i
gF:/Git Projects/EIT/P7---Bsc/Code/VHDL/PulseWidthGen/PulseWidthGen.runs/synth_1/pulse_wdith_gen_TOP.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2q
oreport_utilization -file pulse_wdith_gen_TOP_utilization_synth.rpt -pb pulse_wdith_gen_TOP_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Nov 10 01:54:04 2024Z17-206h px� 


End Record