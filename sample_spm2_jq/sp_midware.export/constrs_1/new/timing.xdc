create_clock -period 20.000 -name bus_architecture/bus_architecture_i/low_speed_dev/axi_hwicap_0/U0/ICAP_NOT_SHARED.HWICAP_CTRL_I/IPIC_IF_I/cfgmclk -waveform {0.000 10.000} [get_pins bus_architecture/bus_architecture_i/low_speed_dev/axi_hwicap_0/U0/ICAP_NOT_SHARED.HWICAP_CTRL_I/IPIC_IF_I/STARTUP_INCLUDE.GEN_7Series_SharedSTARTUP.STARTUPE2_inst/CFGMCLK]
create_clock -period 8.000 -name gtx_clk_125m_p_in_pad -waveform {0.000 4.000} [get_ports gtx_clk_125m_p_in_pad]
create_clock -period 16.000 -name user_clk_out -waveform {0.000 8.000} [get_pins bus_architecture/bus_architecture_i/Aurora/aurora_8b10b_0/user_clk_out]
create_clock -period 10.000 -name clk_100m_in_pad -waveform {0.000 5.000} [get_ports clk_100m_in_pad]
create_clock -period 30.758 -name clk_32m512_in_pad -waveform {0.000 15.379} [get_ports clk_32m512_in_pad]

set_clock_groups -asynchronous -group [get_clocks clk_32m512_in_pad] -group [get_clocks clk_out1_bus_architecture_clk_wiz_0_0]

set_false_path -from [get_pins {bus_architecture/bus_architecture_i/low_speed_dev/sys_ctrl_0/inst/sys_ctrl_biu/reg_gctrl_reg[11]/C}] -to [get_pins {bus_architecture/bus_architecture_i/ExternalInterface/axi_spix_2/inst/spix_receiver/spix_s2p/sdi_edge_reg[0]/D}]
set_false_path -from [get_pins {bus_architecture/bus_architecture_i/low_speed_dev/sys_ctrl_0/inst/sys_ctrl_biu/reg_gctrl_reg[11]/C}] -to [get_pins {bus_architecture/bus_architecture_i/ExternalInterface/axi_spix_2/inst/spix_receiver/spix_s2p/sck_edge_reg[0]/D}]
set_false_path -from [get_clocks bus_architecture/bus_architecture_i/Aurora/aurora_8b10b_0/inst/bus_architecture_aurora_8b10b_0_0_core_i/gt_wrapper_i/bus_architecture_aurora_8b10b_0_0_multi_gt_i/gt0_bus_architecture_aurora_8b10b_0_0_i/gtxe2_i/TXOUTCLK] -to [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks bus_architecture/bus_architecture_i/Aurora/aurora_8b10b_0/inst/bus_architecture_aurora_8b10b_0_0_core_i/gt_wrapper_i/bus_architecture_aurora_8b10b_0_0_multi_gt_i/gt0_bus_architecture_aurora_8b10b_0_0_i/gtxe2_i/TXOUTCLK]

set_false_path -from [get_pins {bus_architecture/bus_architecture_i/low_speed_dev/sys_ctrl_0/inst/sys_ctrl_biu/reg_gctrl_reg[11]/C}] -to [get_pins {bus_architecture/bus_architecture_i/ExternalInterface/axi_spix_2/inst/spix_receiver/sen_edge_reg[0]/D}]
set_false_path -from [get_clocks bus_architecture/bus_architecture_i/low_speed_dev/axi_hwicap_0/U0/ICAP_NOT_SHARED.HWICAP_CTRL_I/IPIC_IF_I/cfgmclk] -to [get_clocks -of_objects [get_pins bus_architecture/bus_architecture_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks bus_architecture/bus_architecture_i/low_speed_dev/axi_hwicap_0/U0/ICAP_NOT_SHARED.HWICAP_CTRL_I/IPIC_IF_I/cfgmclk] -to [get_clocks bus_architecture/bus_architecture_i/Aurora/aurora_8b10b_0/inst/bus_architecture_aurora_8b10b_0_0_core_i/gt_wrapper_i/bus_architecture_aurora_8b10b_0_0_multi_gt_i/gt0_bus_architecture_aurora_8b10b_0_0_i/gtxe2_i/TXOUTCLK]
