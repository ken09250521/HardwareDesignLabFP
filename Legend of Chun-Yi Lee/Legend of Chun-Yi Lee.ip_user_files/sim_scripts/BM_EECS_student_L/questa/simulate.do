onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_EECS_student_L_opt

do {wave.do}

view wave
view structure
view signals

do {BM_EECS_student_L.udo}

run -all

quit -force