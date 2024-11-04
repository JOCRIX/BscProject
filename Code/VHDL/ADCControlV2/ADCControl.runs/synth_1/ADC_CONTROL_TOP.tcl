# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.runs/synth_1/ADC_CONTROL_TOP.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 6
set_param xicom.use_bs_reader 1
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.cache/wt} [current_project]
set_property parent.project_path {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.xpr} [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {f:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_vhdl -library xil_defaultlib {
  {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/sources_1/imports/Transfer/adc_control.vhd}
  {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/sources_1/imports/Transfer/pulse_gen_width_modulator_invert.vhd}
  {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/sources_1/imports/Transfer/pulse_train_gen.vhd}
  {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/sources_1/imports/Transfer/ADC_CONTROL_TOP.vhd}
}
read_ip -quiet {{F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci}}
set_property used_in_implementation false [get_files -all {{f:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{f:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc}}]
set_property used_in_implementation false [get_files -all {{f:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc}}]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/constrs_1/imports/Transfer/Cmod-A7-Master.xdc}}
set_property used_in_implementation false [get_files {{F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/constrs_1/imports/Transfer/Cmod-A7-Master.xdc}}]

set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental {F:/Git Projects/EIT/P7---Bsc/Code/VHDL/ADCControl/ADCControl.srcs/utils_1/imports/synth_1/ADC_CONTROL_TOP.dcp}
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top ADC_CONTROL_TOP -part xc7a35tcpg236-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ADC_CONTROL_TOP.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
generate_parallel_reports -reports { "report_utilization -file ADC_CONTROL_TOP_utilization_synth.rpt -pb ADC_CONTROL_TOP_utilization_synth.pb"  } 
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
