transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../ADCResampler.srcs/sources_1/imports/new/pulse_width_gen.vhd" \
"../../../ADCResampler.srcs/sources_1/new/adc_resampler.vhd" \


