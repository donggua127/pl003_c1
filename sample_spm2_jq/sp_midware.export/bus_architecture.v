// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Oct 15 14:59:22 2019
// Host        : TXLX582 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -cell bus_architecture/bus_architecture_i bus_architecture.v
// Design      : bus_architecture
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module bus_architecture(axi_lite_aclk_out, axi_lite_aresetn_out, 
  b_code_in, board_led_out, clk_in, db_1_in, debug_led_out, dsp6455_0_emif_bus_addr_in, 
  dsp6455_0_emif_bus_be_in, dsp6455_0_emif_bus_ce_in, dsp6455_0_emif_bus_data_in, 
  dsp6455_0_emif_bus_data_out, dsp6455_0_emif_bus_oe_in, dsp6455_0_emif_bus_rdy_out, 
  dsp6455_0_emif_bus_we_in, dsp6455_0_intr, dsp6455_1_emif_bus_addr_in, 
  dsp6455_1_emif_bus_be_in, dsp6455_1_emif_bus_ce_in, dsp6455_1_emif_bus_data_in, 
  dsp6455_1_emif_bus_data_out, dsp6455_1_emif_bus_oe_in, dsp6455_1_emif_bus_rdy_out, 
  dsp6455_1_emif_bus_we_in, dsp6455_1_intr, flash_high_addr_out, flash_intf_addr, 
  flash_intf_adv_ldn, flash_intf_ben, flash_intf_ce, flash_intf_ce_n, flash_intf_clken, 
  flash_intf_cre, flash_intf_dq_i, flash_intf_dq_o, flash_intf_dq_t, flash_intf_lbon, 
  flash_intf_oen, flash_intf_qwen, flash_intf_rnw, flash_intf_rpn, flash_intf_wait, 
  flash_intf_wen, gt_refclk_clk_n, gt_refclk_clk_p, gt_serial_rx0_rxn, gt_serial_rx0_rxp, 
  gt_serial_rx1_rxn, gt_serial_rx1_rxp, gt_serial_rx2_rxn, gt_serial_rx2_rxp, 
  gt_serial_rx3_rxn, gt_serial_rx3_rxp, gt_serial_tx0_txn, gt_serial_tx0_txp, 
  gt_serial_tx1_txn, gt_serial_tx1_txp, gt_serial_tx2_txn, gt_serial_tx2_txp, 
  gt_serial_tx3_txn, gt_serial_tx3_txp, heartbeat_out, links_config_out, resetn_in, 
  rx_high_429_in, rx_low_429_in, s_axis_next_rx_tdata, s_axis_next_rx_tkeep, 
  s_axis_next_rx_tlast, s_axis_next_rx_tvalid, s_axis_next_tx_tdata, 
  s_axis_next_tx_tkeep, s_axis_next_tx_tlast, s_axis_next_tx_tready, 
  s_axis_next_tx_tvalid, s_axis_pre_rx_tdata, s_axis_pre_rx_tkeep, s_axis_pre_rx_tlast, 
  s_axis_pre_rx_tvalid, s_axis_pre_tx_tdata, s_axis_pre_tx_tkeep, s_axis_pre_tx_tlast, 
  s_axis_pre_tx_tready, s_axis_pre_tx_tvalid, scm_mode_out, spix_0_rx_sclk_in, 
  spix_0_rx_sdi_in, spix_0_rx_sen_in, spix_0_tx_sclk_out, spix_0_tx_sdo_out, 
  spix_0_tx_sen_out, spix_1_rx_sclk_in, spix_1_rx_sdi_in, spix_1_rx_sen_in, 
  spix_1_tx_sclk_out, spix_1_tx_sdo_out, spix_1_tx_sen_out, spix_2_rx_sclk_in, 
  spix_2_rx_sdi_in, spix_2_rx_sen_in, spix_2_tx_sclk_out, spix_2_tx_sdo_out, 
  spix_2_tx_sen_out, spm_markaddr_out, uart_0_rxd_in, uart_0_txd_out, uart_1_rxd_in, 
  uart_1_txd_out, uart_2_rxd_in, uart_2_txd_out, uart_3_rxd_in, uart_3_txd_out, 
  uart_4_rxd_in, uart_4_txd_out, wf_0_reset_out, wf_1_reset_out, wf_data_axis_0_rx_tdata, 
  wf_data_axis_0_rx_tkeep, wf_data_axis_0_rx_tlast, wf_data_axis_0_rx_tready, 
  wf_data_axis_0_rx_tvalid, wf_data_axis_0_tx_tdata, wf_data_axis_0_tx_tkeep, 
  wf_data_axis_0_tx_tlast, wf_data_axis_0_tx_tready, wf_data_axis_0_tx_tvalid, 
  wf_data_axis_1_rx_tdata, wf_data_axis_1_rx_tkeep, wf_data_axis_1_rx_tlast, 
  wf_data_axis_1_rx_tready, wf_data_axis_1_rx_tvalid, wf_data_axis_1_tx_tdata, 
  wf_data_axis_1_tx_tkeep, wf_data_axis_1_tx_tlast, wf_data_axis_1_tx_tready, 
  wf_data_axis_1_tx_tvalid, wf_data_user_clk, wf_intr_in, wf_m_axi_lite_0_araddr, 
  wf_m_axi_lite_0_arprot, wf_m_axi_lite_0_arready, wf_m_axi_lite_0_arvalid, 
  wf_m_axi_lite_0_awaddr, wf_m_axi_lite_0_awprot, wf_m_axi_lite_0_awready, 
  wf_m_axi_lite_0_awvalid, wf_m_axi_lite_0_bready, wf_m_axi_lite_0_bresp, 
  wf_m_axi_lite_0_bvalid, wf_m_axi_lite_0_rdata, wf_m_axi_lite_0_rready, 
  wf_m_axi_lite_0_rresp, wf_m_axi_lite_0_rvalid, wf_m_axi_lite_0_wdata, 
  wf_m_axi_lite_0_wready, wf_m_axi_lite_0_wstrb, wf_m_axi_lite_0_wvalid, 
  wf_m_axi_lite_1_araddr, wf_m_axi_lite_1_arprot, wf_m_axi_lite_1_arready, 
  wf_m_axi_lite_1_arvalid, wf_m_axi_lite_1_awaddr, wf_m_axi_lite_1_awprot, 
  wf_m_axi_lite_1_awready, wf_m_axi_lite_1_awvalid, wf_m_axi_lite_1_bready, 
  wf_m_axi_lite_1_bresp, wf_m_axi_lite_1_bvalid, wf_m_axi_lite_1_rdata, 
  wf_m_axi_lite_1_rready, wf_m_axi_lite_1_rresp, wf_m_axi_lite_1_rvalid, 
  wf_m_axi_lite_1_wdata, wf_m_axi_lite_1_wready, wf_m_axi_lite_1_wstrb, 
  wf_m_axi_lite_1_wvalid)
/* synthesis syn_black_box black_box_pad_pin="axi_lite_aclk_out[0:0],axi_lite_aresetn_out[0:0],b_code_in,board_led_out[3:0],clk_in,db_1_in[7:0],debug_led_out[3:0],dsp6455_0_emif_bus_addr_in[31:0],dsp6455_0_emif_bus_be_in[3:0],dsp6455_0_emif_bus_ce_in,dsp6455_0_emif_bus_data_in[31:0],dsp6455_0_emif_bus_data_out[31:0],dsp6455_0_emif_bus_oe_in,dsp6455_0_emif_bus_rdy_out,dsp6455_0_emif_bus_we_in,dsp6455_0_intr,dsp6455_1_emif_bus_addr_in[31:0],dsp6455_1_emif_bus_be_in[3:0],dsp6455_1_emif_bus_ce_in,dsp6455_1_emif_bus_data_in[31:0],dsp6455_1_emif_bus_data_out[31:0],dsp6455_1_emif_bus_oe_in,dsp6455_1_emif_bus_rdy_out,dsp6455_1_emif_bus_we_in,dsp6455_1_intr,flash_high_addr_out[2:0],flash_intf_addr[31:0],flash_intf_adv_ldn,flash_intf_ben[1:0],flash_intf_ce[0:0],flash_intf_ce_n[0:0],flash_intf_clken,flash_intf_cre,flash_intf_dq_i[15:0],flash_intf_dq_o[15:0],flash_intf_dq_t[15:0],flash_intf_lbon,flash_intf_oen[0:0],flash_intf_qwen[1:0],flash_intf_rnw,flash_intf_rpn,flash_intf_wait[0:0],flash_intf_wen,gt_refclk_clk_n,gt_refclk_clk_p,gt_serial_rx0_rxn[0:0],gt_serial_rx0_rxp[0:0],gt_serial_rx1_rxn[0:0],gt_serial_rx1_rxp[0:0],gt_serial_rx2_rxn[0:0],gt_serial_rx2_rxp[0:0],gt_serial_rx3_rxn[0:0],gt_serial_rx3_rxp[0:0],gt_serial_tx0_txn[0:0],gt_serial_tx0_txp[0:0],gt_serial_tx1_txn[0:0],gt_serial_tx1_txp[0:0],gt_serial_tx2_txn[0:0],gt_serial_tx2_txp[0:0],gt_serial_tx3_txn[0:0],gt_serial_tx3_txp[0:0],heartbeat_out,links_config_out,resetn_in,rx_high_429_in,rx_low_429_in,s_axis_next_rx_tdata[0:31],s_axis_next_rx_tkeep[0:3],s_axis_next_rx_tlast,s_axis_next_rx_tvalid,s_axis_next_tx_tdata[0:31],s_axis_next_tx_tkeep[0:3],s_axis_next_tx_tlast,s_axis_next_tx_tready,s_axis_next_tx_tvalid,s_axis_pre_rx_tdata[0:31],s_axis_pre_rx_tkeep[0:3],s_axis_pre_rx_tlast,s_axis_pre_rx_tvalid,s_axis_pre_tx_tdata[0:31],s_axis_pre_tx_tkeep[0:3],s_axis_pre_tx_tlast,s_axis_pre_tx_tready,s_axis_pre_tx_tvalid,scm_mode_out,spix_0_rx_sclk_in,spix_0_rx_sdi_in,spix_0_rx_sen_in,spix_0_tx_sclk_out,spix_0_tx_sdo_out,spix_0_tx_sen_out,spix_1_rx_sclk_in,spix_1_rx_sdi_in,spix_1_rx_sen_in,spix_1_tx_sclk_out,spix_1_tx_sdo_out,spix_1_tx_sen_out,spix_2_rx_sclk_in,spix_2_rx_sdi_in,spix_2_rx_sen_in,spix_2_tx_sclk_out,spix_2_tx_sdo_out,spix_2_tx_sen_out,spm_markaddr_out[7:0],uart_0_rxd_in,uart_0_txd_out,uart_1_rxd_in,uart_1_txd_out,uart_2_rxd_in,uart_2_txd_out,uart_3_rxd_in,uart_3_txd_out,uart_4_rxd_in,uart_4_txd_out,wf_0_reset_out,wf_1_reset_out,wf_data_axis_0_rx_tdata[31:0],wf_data_axis_0_rx_tkeep[3:0],wf_data_axis_0_rx_tlast[0:0],wf_data_axis_0_rx_tready[0:0],wf_data_axis_0_rx_tvalid[0:0],wf_data_axis_0_tx_tdata[31:0],wf_data_axis_0_tx_tkeep[3:0],wf_data_axis_0_tx_tlast[0:0],wf_data_axis_0_tx_tready[0:0],wf_data_axis_0_tx_tvalid[0:0],wf_data_axis_1_rx_tdata[31:0],wf_data_axis_1_rx_tkeep[3:0],wf_data_axis_1_rx_tlast[0:0],wf_data_axis_1_rx_tready[0:0],wf_data_axis_1_rx_tvalid[0:0],wf_data_axis_1_tx_tdata[31:0],wf_data_axis_1_tx_tkeep[3:0],wf_data_axis_1_tx_tlast[0:0],wf_data_axis_1_tx_tready[0:0],wf_data_axis_1_tx_tvalid[0:0],wf_data_user_clk,wf_intr_in[7:0],wf_m_axi_lite_0_araddr[31:0],wf_m_axi_lite_0_arprot[2:0],wf_m_axi_lite_0_arready,wf_m_axi_lite_0_arvalid,wf_m_axi_lite_0_awaddr[31:0],wf_m_axi_lite_0_awprot[2:0],wf_m_axi_lite_0_awready,wf_m_axi_lite_0_awvalid,wf_m_axi_lite_0_bready,wf_m_axi_lite_0_bresp[1:0],wf_m_axi_lite_0_bvalid,wf_m_axi_lite_0_rdata[31:0],wf_m_axi_lite_0_rready,wf_m_axi_lite_0_rresp[1:0],wf_m_axi_lite_0_rvalid,wf_m_axi_lite_0_wdata[31:0],wf_m_axi_lite_0_wready,wf_m_axi_lite_0_wstrb[3:0],wf_m_axi_lite_0_wvalid,wf_m_axi_lite_1_araddr[31:0],wf_m_axi_lite_1_arprot[2:0],wf_m_axi_lite_1_arready,wf_m_axi_lite_1_arvalid,wf_m_axi_lite_1_awaddr[31:0],wf_m_axi_lite_1_awprot[2:0],wf_m_axi_lite_1_awready,wf_m_axi_lite_1_awvalid,wf_m_axi_lite_1_bready,wf_m_axi_lite_1_bresp[1:0],wf_m_axi_lite_1_bvalid,wf_m_axi_lite_1_rdata[31:0],wf_m_axi_lite_1_rready,wf_m_axi_lite_1_rresp[1:0],wf_m_axi_lite_1_rvalid,wf_m_axi_lite_1_wdata[31:0],wf_m_axi_lite_1_wready,wf_m_axi_lite_1_wstrb[3:0],wf_m_axi_lite_1_wvalid" */;
  output [0:0]axi_lite_aclk_out;
  output [0:0]axi_lite_aresetn_out;
  input b_code_in;
  output [3:0]board_led_out;
  input clk_in;
  input [7:0]db_1_in;
  output [3:0]debug_led_out;
  input [31:0]dsp6455_0_emif_bus_addr_in;
  input [3:0]dsp6455_0_emif_bus_be_in;
  input dsp6455_0_emif_bus_ce_in;
  input [31:0]dsp6455_0_emif_bus_data_in;
  output [31:0]dsp6455_0_emif_bus_data_out;
  input dsp6455_0_emif_bus_oe_in;
  output dsp6455_0_emif_bus_rdy_out;
  input dsp6455_0_emif_bus_we_in;
  output dsp6455_0_intr;
  input [31:0]dsp6455_1_emif_bus_addr_in;
  input [3:0]dsp6455_1_emif_bus_be_in;
  input dsp6455_1_emif_bus_ce_in;
  input [31:0]dsp6455_1_emif_bus_data_in;
  output [31:0]dsp6455_1_emif_bus_data_out;
  input dsp6455_1_emif_bus_oe_in;
  output dsp6455_1_emif_bus_rdy_out;
  input dsp6455_1_emif_bus_we_in;
  output dsp6455_1_intr;
  output [2:0]flash_high_addr_out;
  output [31:0]flash_intf_addr;
  output flash_intf_adv_ldn;
  output [1:0]flash_intf_ben;
  output [0:0]flash_intf_ce;
  output [0:0]flash_intf_ce_n;
  output flash_intf_clken;
  output flash_intf_cre;
  input [15:0]flash_intf_dq_i;
  output [15:0]flash_intf_dq_o;
  output [15:0]flash_intf_dq_t;
  output flash_intf_lbon;
  output [0:0]flash_intf_oen;
  output [1:0]flash_intf_qwen;
  output flash_intf_rnw;
  output flash_intf_rpn;
  input [0:0]flash_intf_wait;
  output flash_intf_wen;
  input gt_refclk_clk_n;
  input gt_refclk_clk_p;
  input [0:0]gt_serial_rx0_rxn;
  input [0:0]gt_serial_rx0_rxp;
  input [0:0]gt_serial_rx1_rxn;
  input [0:0]gt_serial_rx1_rxp;
  input [0:0]gt_serial_rx2_rxn;
  input [0:0]gt_serial_rx2_rxp;
  input [0:0]gt_serial_rx3_rxn;
  input [0:0]gt_serial_rx3_rxp;
  output [0:0]gt_serial_tx0_txn;
  output [0:0]gt_serial_tx0_txp;
  output [0:0]gt_serial_tx1_txn;
  output [0:0]gt_serial_tx1_txp;
  output [0:0]gt_serial_tx2_txn;
  output [0:0]gt_serial_tx2_txp;
  output [0:0]gt_serial_tx3_txn;
  output [0:0]gt_serial_tx3_txp;
  output heartbeat_out;
  output links_config_out;
  input resetn_in;
  input rx_high_429_in;
  input rx_low_429_in;
  output [0:31]s_axis_next_rx_tdata;
  output [0:3]s_axis_next_rx_tkeep;
  output s_axis_next_rx_tlast;
  output s_axis_next_rx_tvalid;
  input [0:31]s_axis_next_tx_tdata;
  input [0:3]s_axis_next_tx_tkeep;
  input s_axis_next_tx_tlast;
  output s_axis_next_tx_tready;
  input s_axis_next_tx_tvalid;
  output [0:31]s_axis_pre_rx_tdata;
  output [0:3]s_axis_pre_rx_tkeep;
  output s_axis_pre_rx_tlast;
  output s_axis_pre_rx_tvalid;
  input [0:31]s_axis_pre_tx_tdata;
  input [0:3]s_axis_pre_tx_tkeep;
  input s_axis_pre_tx_tlast;
  output s_axis_pre_tx_tready;
  input s_axis_pre_tx_tvalid;
  output scm_mode_out;
  input spix_0_rx_sclk_in;
  input spix_0_rx_sdi_in;
  input spix_0_rx_sen_in;
  output spix_0_tx_sclk_out;
  output spix_0_tx_sdo_out;
  output spix_0_tx_sen_out;
  input spix_1_rx_sclk_in;
  input spix_1_rx_sdi_in;
  input spix_1_rx_sen_in;
  output spix_1_tx_sclk_out;
  output spix_1_tx_sdo_out;
  output spix_1_tx_sen_out;
  input spix_2_rx_sclk_in;
  input spix_2_rx_sdi_in;
  input spix_2_rx_sen_in;
  output spix_2_tx_sclk_out;
  output spix_2_tx_sdo_out;
  output spix_2_tx_sen_out;
  output [7:0]spm_markaddr_out;
  input uart_0_rxd_in;
  output uart_0_txd_out;
  input uart_1_rxd_in;
  output uart_1_txd_out;
  input uart_2_rxd_in;
  output uart_2_txd_out;
  input uart_3_rxd_in;
  output uart_3_txd_out;
  input uart_4_rxd_in;
  output uart_4_txd_out;
  output wf_0_reset_out;
  output wf_1_reset_out;
  output [31:0]wf_data_axis_0_rx_tdata;
  output [3:0]wf_data_axis_0_rx_tkeep;
  output [0:0]wf_data_axis_0_rx_tlast;
  input [0:0]wf_data_axis_0_rx_tready;
  output [0:0]wf_data_axis_0_rx_tvalid;
  input [31:0]wf_data_axis_0_tx_tdata;
  input [3:0]wf_data_axis_0_tx_tkeep;
  input [0:0]wf_data_axis_0_tx_tlast;
  output [0:0]wf_data_axis_0_tx_tready;
  input [0:0]wf_data_axis_0_tx_tvalid;
  output [31:0]wf_data_axis_1_rx_tdata;
  output [3:0]wf_data_axis_1_rx_tkeep;
  output [0:0]wf_data_axis_1_rx_tlast;
  input [0:0]wf_data_axis_1_rx_tready;
  output [0:0]wf_data_axis_1_rx_tvalid;
  input [31:0]wf_data_axis_1_tx_tdata;
  input [3:0]wf_data_axis_1_tx_tkeep;
  input [0:0]wf_data_axis_1_tx_tlast;
  output [0:0]wf_data_axis_1_tx_tready;
  input [0:0]wf_data_axis_1_tx_tvalid;
  output wf_data_user_clk;
  input [7:0]wf_intr_in;
  output [31:0]wf_m_axi_lite_0_araddr;
  output [2:0]wf_m_axi_lite_0_arprot;
  input wf_m_axi_lite_0_arready;
  output wf_m_axi_lite_0_arvalid;
  output [31:0]wf_m_axi_lite_0_awaddr;
  output [2:0]wf_m_axi_lite_0_awprot;
  input wf_m_axi_lite_0_awready;
  output wf_m_axi_lite_0_awvalid;
  output wf_m_axi_lite_0_bready;
  input [1:0]wf_m_axi_lite_0_bresp;
  input wf_m_axi_lite_0_bvalid;
  input [31:0]wf_m_axi_lite_0_rdata;
  output wf_m_axi_lite_0_rready;
  input [1:0]wf_m_axi_lite_0_rresp;
  input wf_m_axi_lite_0_rvalid;
  output [31:0]wf_m_axi_lite_0_wdata;
  input wf_m_axi_lite_0_wready;
  output [3:0]wf_m_axi_lite_0_wstrb;
  output wf_m_axi_lite_0_wvalid;
  output [31:0]wf_m_axi_lite_1_araddr;
  output [2:0]wf_m_axi_lite_1_arprot;
  input wf_m_axi_lite_1_arready;
  output wf_m_axi_lite_1_arvalid;
  output [31:0]wf_m_axi_lite_1_awaddr;
  output [2:0]wf_m_axi_lite_1_awprot;
  input wf_m_axi_lite_1_awready;
  output wf_m_axi_lite_1_awvalid;
  output wf_m_axi_lite_1_bready;
  input [1:0]wf_m_axi_lite_1_bresp;
  input wf_m_axi_lite_1_bvalid;
  input [31:0]wf_m_axi_lite_1_rdata;
  output wf_m_axi_lite_1_rready;
  input [1:0]wf_m_axi_lite_1_rresp;
  input wf_m_axi_lite_1_rvalid;
  output [31:0]wf_m_axi_lite_1_wdata;
  input wf_m_axi_lite_1_wready;
  output [3:0]wf_m_axi_lite_1_wstrb;
  output wf_m_axi_lite_1_wvalid;
endmodule
