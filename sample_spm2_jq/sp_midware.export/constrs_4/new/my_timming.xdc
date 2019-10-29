set_false_path -through [get_pins bus_architecture/bus_architecture_i/proc_sys_reset_0/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/Q] -to [get_pins -hierarchical -filter {NAME =~ */PRE || NAME =~ */CLR}]


set_max_delay -datapath_only -from [get_clocks user_clk_out] -to [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] 16.000
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks user_clk_out] 10.000
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins Waveform/u_wave_pro/u_conv_top/u_clk_25d6m/inst/mmcm_adv_inst/CLKOUT0]] 10.000
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks gtx_clk_125m_p_in_pad] 10.000
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins Waveform/u_wave_pro/u_conv_top/u_clk_25d6m/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] 39.000
set_max_delay -datapath_only -from [get_clocks gtx_clk_125m_p_in_pad] -to [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] 8.000

