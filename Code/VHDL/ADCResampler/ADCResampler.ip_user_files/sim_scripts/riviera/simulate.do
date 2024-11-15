transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+adc_resampler  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.adc_resampler xil_defaultlib.glbl

do {adc_resampler.udo}

run 1000ns

endsim

quit -force
