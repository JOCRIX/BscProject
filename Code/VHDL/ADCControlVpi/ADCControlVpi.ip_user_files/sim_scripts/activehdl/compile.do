transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ADCControlVpi.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"G:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"G:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  \
"../../../ADCControlVpi.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../ADCControlVpi.srcs/sources_1/imports/Transfer/adc_control.vhd" \
"../../../ADCControlVpi.srcs/sources_1/imports/Transfer/pulse_gen_width_modulator_invert.vhd" \
"../../../ADCControlVpi.srcs/sources_1/imports/Transfer/pulse_train_gen.vhd" \
"../../../ADCControlVpi.srcs/sources_1/imports/Transfer/ADC_CONTROL_TOP.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

