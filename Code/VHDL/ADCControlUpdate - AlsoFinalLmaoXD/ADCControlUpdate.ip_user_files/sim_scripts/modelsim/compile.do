vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../ADCControlUpdate.gen/sources_1/ip/clk_wiz_0" \
"G:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"G:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../ADCControlUpdate.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/adc_control.vhd" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/pulse_gen_width_modulator_invert.vhd" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/pulse_train_gen.vhd" \
"../../../ADCControlUpdate.srcs/sources_1/imports/VHDL/ADCControlVpiSquared/ADCControlVpiSquared.srcs/sources_1/imports/Transfer/ADC_CONTROL_TOP.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

