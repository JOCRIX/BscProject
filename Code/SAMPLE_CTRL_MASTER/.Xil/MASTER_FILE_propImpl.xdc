set_property SRC_FILE_INFO {cfile:c:/Users/jakob/Desktop/P7---Bsc/Code/SAMPLE_CTRL_MASTER/SAMPLE_CTRL_MASTER.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../SAMPLE_CTRL_MASTER.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:PLL_1/inst} [current_design]
current_instance PLL_1/inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.060
