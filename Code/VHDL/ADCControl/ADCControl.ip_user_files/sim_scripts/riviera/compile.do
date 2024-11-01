transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../ADCControl.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"G:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"G:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../ADCControl.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../ADCControl.srcs/sources_1/imports/Transfer/adc_control.vhd" \
"../../../ADCControl.srcs/sources_1/imports/Transfer/pulse_gen_invert.vhd" \
"../../../ADCControl.srcs/sources_1/imports/Transfer/pulse_train_gen.vhd" \
"../../../ADCControl.srcs/sources_1/imports/Transfer/ADC_CONTROL_TOP.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

