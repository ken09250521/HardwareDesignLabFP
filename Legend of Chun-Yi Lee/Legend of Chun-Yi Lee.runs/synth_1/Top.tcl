# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 5
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.cache/wt} [current_project]
set_property parent.project_path {C:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.xpr} [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths {{c:/verilog project/Legend of Chun-Yi Lee/ip}} [current_project]
update_ip_catalog
set_property ip_output_repo {c:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{c:/verilog project/Legend of Chun-Yi Lee/Assets/CY_front_stand.coe}}
add_files {{c:/verilog project/Legend of Chun-Yi Lee/Assets/CS_student.coe}}
read_verilog -library xil_defaultlib {
  {C:/verilog project/Legend of Chun-Yi Lee/KeyboardDecoder.v}
  {C:/verilog project/Legend of Chun-Yi Lee/RGB_GEN.v}
  {C:/verilog project/Legend of Chun-Yi Lee/clk_div.v}
  {C:/verilog project/Legend of Chun-Yi Lee/debounce.v}
  {C:/verilog project/Legend of Chun-Yi Lee/mem_addr_gen.v}
  {C:/verilog project/Legend of Chun-Yi Lee/onepluse.v}
  {C:/verilog project/Legend of Chun-Yi Lee/select_pixel.v}
  {C:/verilog project/Legend of Chun-Yi Lee/state_control.v}
  {C:/verilog project/Legend of Chun-Yi Lee/vga_controller.v}
  {C:/verilog project/Legend of Chun-Yi Lee/top.v}
}
read_ip -quiet {{c:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.srcs/sources_1/ip/KeyboardCtrl_0/KeyboardCtrl_0.xci}}

read_ip -quiet {{c:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.srcs/sources_1/ip/BM_CY_front_stand/BM_CY_front_stand.xci}}
set_property used_in_implementation false [get_files -all {{c:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.srcs/sources_1/ip/BM_CY_front_stand/BM_CY_front_stand_ooc.xdc}}]

read_ip -quiet {{c:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.srcs/sources_1/ip/BM_CS_student/BM_CS_student.xci}}
set_property used_in_implementation false [get_files -all {{c:/verilog project/Legend of Chun-Yi Lee/Legend of Chun-Yi Lee.srcs/sources_1/ip/BM_CS_student/BM_CS_student_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/verilog project/Legend of Chun-Yi Lee/cons.xdc}}
set_property used_in_implementation false [get_files {{C:/verilog project/Legend of Chun-Yi Lee/cons.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
