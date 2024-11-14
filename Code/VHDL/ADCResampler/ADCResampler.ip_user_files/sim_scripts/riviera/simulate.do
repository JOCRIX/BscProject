transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+adc_resampler  -L xil_defaultlib -L secureip -O5 xil_defaultlib.adc_resampler

do {adc_resampler.udo}

run 1000ns

endsim

quit -force
