vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../ADCResampler.gen/sources_1/ip/clk_wiz_0" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../ADCResampler.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../ADCResampler.gen/sources_1/ip/dds_compiler_0/dds_compiler_0_sim_netlist.vhdl" \
"../../../ADCResampler.srcs/sources_1/imports/new/pulse_width_gen.vhd" \
"../../../ADCResampler.srcs/sources_1/new/adc_resampler.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

