transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93  \
"../../../ADCResampler.srcs/sources_1/imports/new/pulse_width_gen.vhd" \
"../../../ADCResampler.srcs/sources_1/new/adc_resampler.vhd" \


