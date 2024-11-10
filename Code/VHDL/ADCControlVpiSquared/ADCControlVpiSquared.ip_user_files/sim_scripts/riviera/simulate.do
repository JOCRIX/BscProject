transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+ADC_CONTROL_TOP  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ADC_CONTROL_TOP xil_defaultlib.glbl

do {ADC_CONTROL_TOP.udo}

run 1000ns

endsim

quit -force
