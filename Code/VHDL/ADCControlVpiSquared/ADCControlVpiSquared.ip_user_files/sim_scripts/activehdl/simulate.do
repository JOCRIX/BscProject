transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+adc_control  -L xil_defaultlib -L secureip -O5 xil_defaultlib.adc_control

do {adc_control.udo}

run 1000ns

endsim

quit -force
