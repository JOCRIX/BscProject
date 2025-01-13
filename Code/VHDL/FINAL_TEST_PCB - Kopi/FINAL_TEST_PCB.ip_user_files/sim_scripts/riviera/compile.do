transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_13
vlib riviera/axi_utils_v2_0_9
vlib riviera/xbip_pipe_v3_0_9
vlib riviera/xbip_bram18k_v3_0_9
vlib riviera/mult_gen_v12_0_21
vlib riviera/xbip_dsp48_wrapper_v3_0_6
vlib riviera/xbip_dsp48_addsub_v3_0_9
vlib riviera/xbip_dsp48_multadd_v3_0_9
vlib riviera/dds_compiler_v6_0_25
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xbip_utils_v3_0_13 riviera/xbip_utils_v3_0_13
vmap axi_utils_v2_0_9 riviera/axi_utils_v2_0_9
vmap xbip_pipe_v3_0_9 riviera/xbip_pipe_v3_0_9
vmap xbip_bram18k_v3_0_9 riviera/xbip_bram18k_v3_0_9
vmap mult_gen_v12_0_21 riviera/mult_gen_v12_0_21
vmap xbip_dsp48_wrapper_v3_0_6 riviera/xbip_dsp48_wrapper_v3_0_6
vmap xbip_dsp48_addsub_v3_0_9 riviera/xbip_dsp48_addsub_v3_0_9
vmap xbip_dsp48_multadd_v3_0_9 riviera/xbip_dsp48_multadd_v3_0_9
vmap dds_compiler_v6_0_25 riviera/dds_compiler_v6_0_25
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../FINAL_TEST_PCB.gen/sources_1/ip/clk_wiz_0" -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_13 -93  -incr \
"../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_9 -93  -incr \
"../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9 -93  -incr \
"../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_9 -93  -incr \
"../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_21 -93  -incr \
"../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  -incr \
"../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9 -93  -incr \
"../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_9 -93  -incr \
"../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work dds_compiler_v6_0_25 -2008  -incr \
"../../ipstatic/hdl/float_pkg.vhd" \

vcom -work dds_compiler_v6_0_25 -93  -incr \
"../../ipstatic/hdl/dds_compiler_v6_0_viv_comp.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_comp.vhd" \
"../../ipstatic/hdl/pkg_dds_compiler_v6_0.vhd" \
"../../ipstatic/hdl/pkg_beta.vhd" \
"../../ipstatic/hdl/pkg_alpha.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_hdl_comps.vhd" \
"../../ipstatic/hdl/dither_wrap.vhd" \
"../../ipstatic/hdl/pipe_add.vhd" \
"../../ipstatic/hdl/lut_ram.vhd" \
"../../ipstatic/hdl/lut5_ram.vhd" \
"../../ipstatic/hdl/sin_cos.vhd" \

vcom -work dds_compiler_v6_0_25 -2008  -incr \
"../../ipstatic/hdl/sin_cos_fp.vhd" \

vcom -work dds_compiler_v6_0_25 -93  -incr \
"../../ipstatic/hdl/sin_cos_quad_rast.vhd" \
"../../ipstatic/hdl/dsp48_wrap.vhd" \
"../../ipstatic/hdl/accum.vhd" \
"../../ipstatic/hdl/raster_accum.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_eff_lut.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_eff.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_rdy.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_core.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0_viv.vhd" \
"../../ipstatic/hdl/dds_compiler_v6_0.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../FINAL_TEST_PCB.gen/sources_1/ip/dds_compiler_1/sim/dds_compiler_1.vhd" \
"../../../FINAL_TEST_PCB.gen/sources_1/ip/dds_compiler_0/sim/dds_compiler_0.vhd" \
"../../../FINAL_TEST_PCB.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/DAC_DATA_Conversion.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/DAC_PRESCALER.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/EXT_MEM_COMM.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/EXT_MEM_RW20.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/ExternalMemDist20.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/IV_SAMPLE_CTRL.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/PARALLEL_SERIES_CONVERTER.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/adc_control.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/adc_resampler.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/internal_ram.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/logic_reset.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/pule_gen_width_modulator.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/pulse_width_gen.vhd" \
"../../../FINAL_TEST_PCB.srcs/sources_1/new/MASTER.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

