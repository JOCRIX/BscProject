#!/bin/bash -f
#**********************************************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Script generated by Vivado on Fri Dec 13 18:39:47 +0100 2024
# SW Build 5076996 on Wed May 22 18:37:14 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved. 
#
# Filename     : dds_compiler_0.sh
# Simulator    : Synopsys Verilog Compiler Simulator
# Description  : Simulation script generated by export_simulation Tcl command
# Purpose      : Run 'compile', 'elaborate', 'simulate' steps for compiling, elaborating and simulating the
#                design. The script will copy the library mapping file from the compiled library directory,
#                create design library directories and library mappings in the mapping file.
#
# Usage        : dds_compiler_0.sh
#                dds_compiler_0.sh [-lib_map_path] [-step] [-keep_index] [-noclean_files]*
#                dds_compiler_0.sh [-reset_run]
#                dds_compiler_0.sh [-reset_log]
#                dds_compiler_0.sh [-help]
#
#               * The -noclean_files switch is deprecated and will not peform any function (by default, the
#                 simulator generated files will not be removed unless -reset_run switch is used)
#
# Prerequisite : Before running export_simulation, you must first compile the AMD simulation library
#                using the 'compile_simlib' Tcl command (for more information, run 'compile_simlib -help'
#                command in the Vivado Tcl shell). After compiling the library, specify the -lib_map_path
#                switch with the directory path where the library is created while generating the script
#                with export_simulation.
#
#                Alternatively, you can set the library path by setting the following project property:-
#
#                 set_property compxlib.<simulator>_compiled_library_dir <path> [current_project]
#
#                You can also point to the simulation library by either setting the 'lib_map_path' global
#                variable in this script or specify it with the '-lib_map_path' switch while executing this
#                script (type 'dds_compiler_0.sh -help' for more information).
#
#                Note: For pure RTL based designs, the -lib_map_path switch can be specified later with the
#                generated script, but if design is targetted for system simulation containing SystemC/C++/C
#                sources, then the library path MUST be specified upfront when calling export_simulation.
#
#                For more information, refer 'Vivado Design Suite User Guide:Logic simulation (UG900)'
#
#**********************************************************************************************************

# catch pipeline exit status
set -Eeuo pipefail

# set vhdlan compile options
vhdlan_opts="-full64 -l .tmp_log"

# set vlogan compile options
vlogan_opts="-full64 -l .tmp_log"

# set vcs elaboration options
vcs_elab_opts="-full64 -t ps -licqueue -l elaborate.log"

# set vcs simulation options
vcs_sim_opts="-ucli -licqueue -l simulate.log "

# set design libraries
design_libs=(xpm xbip_utils_v3_0_13 axi_utils_v2_0_9 xbip_pipe_v3_0_9 xbip_bram18k_v3_0_9 mult_gen_v12_0_21 xbip_dsp48_wrapper_v3_0_6 xbip_dsp48_addsub_v3_0_9 xbip_dsp48_multadd_v3_0_9 dds_compiler_v6_0_25 xil_defaultlib)

# simulation root library directory
sim_lib_dir="vcs_lib"

# script info
echo -e "dds_compiler_0.sh - Script generated by export_simulation (Vivado v2024.1 (64-bit)-id)\n"

# main steps
run()
{
  check_args $*
  setup
  if [[ ($b_step == 1) ]]; then
    case $step in
      "compile" )
       init_lib
       compile
      ;;
      "elaborate" )
       elaborate
      ;;
      "simulate" )
       simulate
      ;;
      * )
        echo -e "ERROR: Invalid or missing step '$step' (type \"./dds_compiler_0.sh -help\" for more information)\n"
        exit 1
      esac
  else
    init_lib
    compile
    elaborate
    simulate
  fi
}

# RUN_STEP: <compile>
compile()
{
  vlogan -work xpm $vlogan_opts -sverilog \
  "C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  2>&1 | tee compile.log; cat .tmp_log > vlogan.log 2>/dev/null

  vhdlan -work xpm $vhdlan_opts \
  "C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log > vhdlan.log 2>/dev/null

  vhdlan -work xbip_utils_v3_0_13 $vhdlan_opts \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work axi_utils_v2_0_9 $vhdlan_opts \
  "../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work xbip_pipe_v3_0_9 $vhdlan_opts \
  "../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work xbip_bram18k_v3_0_9 $vhdlan_opts \
  "../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work mult_gen_v12_0_21 $vhdlan_opts \
  "../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work xbip_dsp48_wrapper_v3_0_6 $vhdlan_opts \
  "../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work xbip_dsp48_addsub_v3_0_9 $vhdlan_opts \
  "../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work xbip_dsp48_multadd_v3_0_9 $vhdlan_opts \
  "../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work dds_compiler_v6_0_25 $vhdlan_opts -vhdl08 \
  "../../../ipstatic/hdl/float_pkg.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work dds_compiler_v6_0_25 $vhdlan_opts \
  "../../../ipstatic/hdl/dds_compiler_v6_0_viv_comp.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_comp.vhd" \
  "../../../ipstatic/hdl/pkg_dds_compiler_v6_0.vhd" \
  "../../../ipstatic/hdl/pkg_beta.vhd" \
  "../../../ipstatic/hdl/pkg_alpha.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_hdl_comps.vhd" \
  "../../../ipstatic/hdl/dither_wrap.vhd" \
  "../../../ipstatic/hdl/pipe_add.vhd" \
  "../../../ipstatic/hdl/lut_ram.vhd" \
  "../../../ipstatic/hdl/lut5_ram.vhd" \
  "../../../ipstatic/hdl/sin_cos.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work dds_compiler_v6_0_25 $vhdlan_opts -vhdl08 \
  "../../../ipstatic/hdl/sin_cos_fp.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work dds_compiler_v6_0_25 $vhdlan_opts \
  "../../../ipstatic/hdl/sin_cos_quad_rast.vhd" \
  "../../../ipstatic/hdl/dsp48_wrap.vhd" \
  "../../../ipstatic/hdl/accum.vhd" \
  "../../../ipstatic/hdl/raster_accum.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_eff_lut.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_eff.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_rdy.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_core.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0_viv.vhd" \
  "../../../ipstatic/hdl/dds_compiler_v6_0.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vhdlan -work xil_defaultlib $vhdlan_opts \
  "../../../../FINAL_TEST_PCB.gen/sources_1/ip/dds_compiler_0/sim/dds_compiler_0.vhd" \
  2>&1 | tee -a compile.log; cat .tmp_log >> vhdlan.log 2>/dev/null

  vlogan -work xil_defaultlib $vlogan_opts +v2k \
  glbl.v \
  2>&1 | tee -a compile.log; cat .tmp_log >> vlogan.log 2>/dev/null
}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.dds_compiler_0 xil_defaultlib.glbl -o dds_compiler_0_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./dds_compiler_0_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  # delete previous files for a clean rerun
  if [[ ($b_reset_run == 1) ]]; then
    reset_run
    echo -e "INFO: Simulation run files deleted.\n"
    exit 0
  fi

 # delete previous log files
  if [[ ($b_reset_log == 1) ]]; then
    reset_log
    echo -e "INFO: Simulation run log files deleted.\n"
    exit 0
  fi

  # add any setup/initialization commands here:-

  # <user specific commands>

}

# simulator index file/library directory processing
init_lib()
{
  if [[ ($b_keep_index == 1) ]]; then
    # keep previous design library mappings
    true
  else
    # define design library mappings
    create_lib_mappings
  fi

  if [[ ($b_keep_index == 1) ]]; then
    # do not recreate design library directories
    true
  else
    # create design library directories
    create_lib_dir
  fi
}

# define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($lib_map_path == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file


  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# create design library directory
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi
  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key dds_compiler_0_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .tmp_log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log lib_sc.so 64 AN.DB csrc dds_compiler_0_simv.daidir vcs_lib c.obj)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done
}

# delete generated log files from the previous run
reset_log()
{
  files_to_remove=(vlogan.log vhdlan.log compile.log elaborate.log simulate.log .tmp_log)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done
}

# check switch argument value
check_arg_value()
{
  if [[ ($1 == "-step") && (($2 != "compile") && ($2 != "elaborate") && ($2 != "simulate")) ]];then
    echo -e "ERROR: Invalid or missing step '$2' (type \"./top.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($1 == "-lib_map_path") && ($2 == "") ]];then
    echo -e "ERROR: Simulation library directory path not specified (type \"./dds_compiler_0.sh -help\" for more information)\n"
    exit 1
  fi
}

# check command line arguments
check_args()
{
  arg_count=$#
  if [[ ("$#" == 1) && (("$1" == "-help") || ("$1" == "-h")) ]]; then
    usage
  fi
  while [[ "$#" -gt 0 ]]; do
    case $1 in
      -step)          check_arg_value $1 $2;step=$2;         b_step=1;         shift;;
      -lib_map_path)  check_arg_value $1 $2;lib_map_path=$2; b_lib_map_path=1; shift;;
      -gen_bypass)    b_gen_bypass=1    ;;
      -reset_run)     b_reset_run=1     ;;
      -reset_log)     b_reset_log=1     ;;
      -keep_index)    b_keep_index=1    ;;
      -noclean_files) b_noclean_files=1 ;;
      -help|-h)       ;;
      *) echo -e "ERROR: Invalid option specified '$1' (type "./top.sh -help" for more information)\n"; exit 1 ;;
    esac
     shift
  done

  # -reset_run is not applicable with other switches
  if [[ ("$arg_count" -gt 1) && ($b_reset_run == 1) ]]; then
    echo -e "ERROR: -reset_run switch is not applicable with other switches (type \"./top.sh -help\" for more information)\n"
    exit 1
  fi

  # -reset_log is not applicable with other switches
  if [[ ("$arg_count" -gt 1) && ($b_reset_log == 1) ]]; then
    echo -e "ERROR: -reset_log switch is not applicable with other switches (type \"./top.sh -help\" for more information)\n"
    exit 1
  fi

  # -keep_index is not applicable with other switches
  if [[ ("$arg_count" -gt 1) && ($b_keep_index == 1) ]]; then
    echo -e "ERROR: -keep_index switch is not applicable with other switches (type \"./top.sh -help\" for more information)\n"
    exit 1
  fi

  # -noclean_files is not applicable with other switches
  if [[ ("$arg_count" -gt 1) && ($b_noclean_files == 1) ]]; then
    echo -e "ERROR: -noclean_files switch is not applicable with other switches (type \"./top.sh -help\" for more information)\n"
    exit 1
  fi
}

# script usage
usage()
{
  msg="Usage: dds_compiler_0.sh [-help]\n\
Usage: dds_compiler_0.sh [-step]\n\
Usage: dds_compiler_0.sh [-lib_map_path]\n\
Usage: dds_compiler_0.sh [-reset_run]\n\
Usage: dds_compiler_0.sh [-reset_log]\n\
Usage: dds_compiler_0.sh [-keep_index]\n\
Usage: dds_compiler_0.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-step <name>] -- Execute specified step (compile, elaborate, simulate)\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Delete simulator generated data files from the previous run and recreate simulator setup\n\
file/library mappings for a clean run. This switch will not execute steps defined in the script.\n\n\
NOTE: To keep simulator index file settings from the previous run, use the -keep_index switch\n\
NOTE: To regenerate simulator index file but keep the simulator generated files, use the -noclean_files switch\n\n\
[-reset_log] -- Delete simulator generated log files from the previous run\n\n\
[-keep_index] -- Keep simulator index file settings from the previous run\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run\n"
  echo -e $msg
  exit 0
}

# initialize globals
step=""
lib_map_path=""
b_step=0
b_lib_map_path=0
b_gen_bypass=0
b_reset_run=0
b_reset_log=0
b_keep_index=0
b_noclean_files=0

# launch script
run $*
