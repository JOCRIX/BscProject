onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib sample_control_TOP_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {sample_control_TOP.udo}

run 1000ns

quit -force
