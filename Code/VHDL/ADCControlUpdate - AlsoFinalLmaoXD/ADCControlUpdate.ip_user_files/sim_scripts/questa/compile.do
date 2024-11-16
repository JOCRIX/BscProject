vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../ipstatic" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../ADCControlUpdate.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/adc_control.vhd" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/pulse_gen_width_modulator_invert.vhd" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/PulseWidthGen/PulseWidthGen.srcs/sources_1/new/pulse_width_gen.vhd" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/ADC_CONTROL_TOP.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

