transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+pulse_gen_invert  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.pulse_gen_invert xil_defaultlib.glbl

do {pulse_gen_invert.udo}

run 1000ns

endsim

quit -force
