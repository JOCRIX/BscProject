vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93  \
"../../../ADCResampler.srcs/sources_1/imports/new/pulse_width_gen.vhd" \
"../../../ADCResampler.srcs/sources_1/new/adc_resampler.vhd" \


