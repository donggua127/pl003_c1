

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list Waveform/u_wave_pro/u_conv_top/u_clk_25d6m/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[0]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[1]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[2]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[3]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[4]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[5]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[6]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[7]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[8]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[9]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[10]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[11]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[12]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[13]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[14]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_idata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[13]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[14]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_idata_cut[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[13]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[14]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_idata_cut[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 14 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ram_waddr[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[0]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[1]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[2]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[3]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[4]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[5]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[6]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[7]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[8]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[9]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[10]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[11]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[12]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[13]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[14]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/baseband_qdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 16 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[13]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[14]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_idata_cut[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 16 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[13]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[14]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/midband_qdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[13]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[14]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/ddc_fir_qdata_cut[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 16 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[0]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[1]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[2]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[3]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[4]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[5]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[6]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[7]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[8]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[9]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[10]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[11]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[12]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[13]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[14]} {Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_qdata_cut[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[0]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[1]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[2]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[3]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[4]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[5]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[6]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[7]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[8]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[9]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[10]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[11]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[12]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[13]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[14]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_idata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 16 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[0]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[1]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[2]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[3]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[4]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[5]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[6]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[7]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[8]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[9]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[10]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[11]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[12]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[13]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[14]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/duc_add_qdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_ddc_conv/cic_ivalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_ddc_conv/fir_dec_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_duc_conv/send_flag]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list bus_architecture/bus_architecture_i/clk_wiz_0/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 20 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[0]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[1]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[2]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[3]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[4]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[5]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[6]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[7]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[8]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[9]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[10]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[11]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[12]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[13]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[14]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[15]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[16]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[17]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[18]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_trig[19]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 20 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[0]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[1]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[2]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[3]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[4]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[5]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[6]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[7]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[8]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[9]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[10]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[11]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[12]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[13]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[14]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[15]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[16]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[17]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[18]} {Waveform/u_wave_pro/u_conv_top/u_duc_conv/cnt_send[19]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 32 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {Waveform/u_wave_pro/cpu_wdata[0]} {Waveform/u_wave_pro/cpu_wdata[1]} {Waveform/u_wave_pro/cpu_wdata[2]} {Waveform/u_wave_pro/cpu_wdata[3]} {Waveform/u_wave_pro/cpu_wdata[4]} {Waveform/u_wave_pro/cpu_wdata[5]} {Waveform/u_wave_pro/cpu_wdata[6]} {Waveform/u_wave_pro/cpu_wdata[7]} {Waveform/u_wave_pro/cpu_wdata[8]} {Waveform/u_wave_pro/cpu_wdata[9]} {Waveform/u_wave_pro/cpu_wdata[10]} {Waveform/u_wave_pro/cpu_wdata[11]} {Waveform/u_wave_pro/cpu_wdata[12]} {Waveform/u_wave_pro/cpu_wdata[13]} {Waveform/u_wave_pro/cpu_wdata[14]} {Waveform/u_wave_pro/cpu_wdata[15]} {Waveform/u_wave_pro/cpu_wdata[16]} {Waveform/u_wave_pro/cpu_wdata[17]} {Waveform/u_wave_pro/cpu_wdata[18]} {Waveform/u_wave_pro/cpu_wdata[19]} {Waveform/u_wave_pro/cpu_wdata[20]} {Waveform/u_wave_pro/cpu_wdata[21]} {Waveform/u_wave_pro/cpu_wdata[22]} {Waveform/u_wave_pro/cpu_wdata[23]} {Waveform/u_wave_pro/cpu_wdata[24]} {Waveform/u_wave_pro/cpu_wdata[25]} {Waveform/u_wave_pro/cpu_wdata[26]} {Waveform/u_wave_pro/cpu_wdata[27]} {Waveform/u_wave_pro/cpu_wdata[28]} {Waveform/u_wave_pro/cpu_wdata[29]} {Waveform/u_wave_pro/cpu_wdata[30]} {Waveform/u_wave_pro/cpu_wdata[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 14 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {Waveform/u_wave_pro/lbs_addr[0]} {Waveform/u_wave_pro/lbs_addr[1]} {Waveform/u_wave_pro/lbs_addr[2]} {Waveform/u_wave_pro/lbs_addr[3]} {Waveform/u_wave_pro/lbs_addr[4]} {Waveform/u_wave_pro/lbs_addr[5]} {Waveform/u_wave_pro/lbs_addr[6]} {Waveform/u_wave_pro/lbs_addr[7]} {Waveform/u_wave_pro/lbs_addr[8]} {Waveform/u_wave_pro/lbs_addr[9]} {Waveform/u_wave_pro/lbs_addr[10]} {Waveform/u_wave_pro/lbs_addr[11]} {Waveform/u_wave_pro/lbs_addr[12]} {Waveform/u_wave_pro/lbs_addr[13]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 32 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {Waveform/u_wave_pro/cpu_rdata[0]} {Waveform/u_wave_pro/cpu_rdata[1]} {Waveform/u_wave_pro/cpu_rdata[2]} {Waveform/u_wave_pro/cpu_rdata[3]} {Waveform/u_wave_pro/cpu_rdata[4]} {Waveform/u_wave_pro/cpu_rdata[5]} {Waveform/u_wave_pro/cpu_rdata[6]} {Waveform/u_wave_pro/cpu_rdata[7]} {Waveform/u_wave_pro/cpu_rdata[8]} {Waveform/u_wave_pro/cpu_rdata[9]} {Waveform/u_wave_pro/cpu_rdata[10]} {Waveform/u_wave_pro/cpu_rdata[11]} {Waveform/u_wave_pro/cpu_rdata[12]} {Waveform/u_wave_pro/cpu_rdata[13]} {Waveform/u_wave_pro/cpu_rdata[14]} {Waveform/u_wave_pro/cpu_rdata[15]} {Waveform/u_wave_pro/cpu_rdata[16]} {Waveform/u_wave_pro/cpu_rdata[17]} {Waveform/u_wave_pro/cpu_rdata[18]} {Waveform/u_wave_pro/cpu_rdata[19]} {Waveform/u_wave_pro/cpu_rdata[20]} {Waveform/u_wave_pro/cpu_rdata[21]} {Waveform/u_wave_pro/cpu_rdata[22]} {Waveform/u_wave_pro/cpu_rdata[23]} {Waveform/u_wave_pro/cpu_rdata[24]} {Waveform/u_wave_pro/cpu_rdata[25]} {Waveform/u_wave_pro/cpu_rdata[26]} {Waveform/u_wave_pro/cpu_rdata[27]} {Waveform/u_wave_pro/cpu_rdata[28]} {Waveform/u_wave_pro/cpu_rdata[29]} {Waveform/u_wave_pro/cpu_rdata[30]} {Waveform/u_wave_pro/cpu_rdata[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list Waveform/u_wave_pro/cpu_cs]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list Waveform/u_wave_pro/cpu_rd]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list Waveform/u_wave_pro/cpu_we]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_duc_conv/down_complete]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_duc_conv/down_end]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_duc_conv/down_start]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list Waveform/u_wave_pro/u_conv_top/u_duc_conv/start_send]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets wf_axi_lite_aclk]
