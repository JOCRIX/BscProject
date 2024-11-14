vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93  \
"../../../ADCResampler.srcs/sources_1/imports/new/pulse_width_gen.vhd" \
"../../../ADCResampler.srcs/sources_1/new/adc_resampler.vhd" \


