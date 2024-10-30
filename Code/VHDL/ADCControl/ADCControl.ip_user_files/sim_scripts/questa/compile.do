vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../ADCControl.gen/sources_1/ip/clk_wiz_0_1" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../ADCControl.srcs/sources_1/imports/New folder/adc_control.vhd" \
"../../../ADCControl.srcs/sources_1/imports/New folder/pulse_gen_invert.vhd" \
"../../../ADCControl.srcs/sources_1/imports/New folder/pulse_train_gen.vhd" \
"../../../ADCControl.srcs/sources_1/imports/New folder/ADC_CONTROL_TOP.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

