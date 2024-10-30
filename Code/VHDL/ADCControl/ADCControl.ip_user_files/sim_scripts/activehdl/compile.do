transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ADCControl.gen/sources_1/ip/clk_wiz_0_1" -l xpm -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  \
"../../../ADCControl.srcs/sources_1/imports/New folder/adc_control.vhd" \
"../../../ADCControl.srcs/sources_1/imports/New folder/pulse_gen_invert.vhd" \
"../../../ADCControl.srcs/sources_1/imports/New folder/pulse_train_gen.vhd" \
"../../../ADCControl.srcs/sources_1/imports/New folder/ADC_CONTROL_TOP.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

