onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib pulse_gen_invert_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {pulse_gen_invert.udo}

run 1000ns

quit -force
