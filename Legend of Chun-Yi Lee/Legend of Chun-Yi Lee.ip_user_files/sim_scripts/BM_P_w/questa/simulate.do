onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_P_w_opt

do {wave.do}

view wave
view structure
view signals

do {BM_P_w.udo}

run -all

quit -force