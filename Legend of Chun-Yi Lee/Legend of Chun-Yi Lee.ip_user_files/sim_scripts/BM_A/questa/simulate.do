onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_A_opt

do {wave.do}

view wave
view structure
view signals

do {BM_A.udo}

run -all

quit -force
