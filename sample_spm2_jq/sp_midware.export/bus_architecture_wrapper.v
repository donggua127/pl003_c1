//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Oct 14 15:49:38 2019
//Host        : TXLX582 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target bus_architecture_wrapper.bd
//Design      : bus_architecture_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bus_architecture_wrapper
   (axi_lite_aclk_out,
    axi_lite_aresetn_out,
    b_code_in,
    board_led_out,
    clk_in,
    db_1_in,
    debug_led_out,
    dsp6455_0_emif_bus_addr_in,
    dsp6455_0_emif_bus_be_in,
    dsp6455_0_emif_bus_ce_in,
    dsp6455_0_emif_bus_data_in,
    dsp6455_0_emif_bus_data_out,
    dsp6455_0_emif_bus_oe_in,
    dsp6455_0_emif_bus_rdy_out,
    dsp6455_0_emif_bus_we_in,
    dsp6455_0_intr,
    dsp6455_1_emif_bus_addr_in,
    dsp6455_1_emif_bus_be_in,
    dsp6455_1_emif_bus_ce_in,
    dsp6455_1_emif_bus_data_in,
    dsp6455_1_emif_bus_data_out,
    dsp6455_1_emif_bus_oe_in,
    dsp6455_1_emif_bus_rdy_out,
    dsp6455_1_emif_bus_we_in,
    dsp6455_1_intr,
    flash_high_addr_out,
    flash_intf_addr,
    flash_intf_adv_ldn,
    flash_intf_ben,
    flash_intf_ce,
    flash_intf_ce_n,
    flash_intf_clken,
    flash_intf_cre,
    flash_intf_dq_io,
    flash_intf_lbon,
    flash_intf_oen,
    flash_intf_qwen,
    flash_intf_rnw,
    flash_intf_rpn,
    flash_intf_wait,
    flash_intf_wen,
    gt_refclk_clk_n,
    gt_refclk_clk_p,
    gt_serial_rx0_rxn,
    gt_serial_rx0_rxp,
    gt_serial_rx1_rxn,
    gt_serial_rx1_rxp,
    gt_serial_rx2_rxn,
    gt_serial_rx2_rxp,
    gt_serial_rx3_rxn,
    gt_serial_rx3_rxp,
    gt_serial_tx0_txn,
    gt_serial_tx0_txp,
    gt_serial_tx1_txn,
    gt_serial_tx1_txp,
    gt_serial_tx2_txn,
    gt_serial_tx2_txp,
    gt_serial_tx3_txn,
    gt_serial_tx3_txp,
    heartbeat_out,
    links_config_out,
    resetn_in,
    rx_high_429_in,
    rx_low_429_in,
    s_axis_next_rx_tdata,
    s_axis_next_rx_tkeep,
    s_axis_next_rx_tlast,
    s_axis_next_rx_tvalid,
    s_axis_next_tx_tdata,
    s_axis_next_tx_tkeep,
    s_axis_next_tx_tlast,
    s_axis_next_tx_tready,
    s_axis_next_tx_tvalid,
    s_axis_pre_rx_tdata,
    s_axis_pre_rx_tkeep,
    s_axis_pre_rx_tlast,
    s_axis_pre_rx_tvalid,
    s_axis_pre_tx_tdata,
    s_axis_pre_tx_tkeep,
    s_axis_pre_tx_tlast,
    s_axis_pre_tx_tready,
    s_axis_pre_tx_tvalid,
    scm_mode_out,
    spix_0_rx_sclk_in,
    spix_0_rx_sdi_in,
    spix_0_rx_sen_in,
    spix_0_tx_sclk_out,
    spix_0_tx_sdo_out,
    spix_0_tx_sen_out,
    spix_1_rx_sclk_in,
    spix_1_rx_sdi_in,
    spix_1_rx_sen_in,
    spix_1_tx_sclk_out,
    spix_1_tx_sdo_out,
    spix_1_tx_sen_out,
    spix_2_rx_sclk_in,
    spix_2_rx_sdi_in,
    spix_2_rx_sen_in,
    spix_2_tx_sclk_out,
    spix_2_tx_sdo_out,
    spix_2_tx_sen_out,
    spm_markaddr_out,
    uart_0_rxd_in,
    uart_0_txd_out,
    uart_1_rxd_in,
    uart_1_txd_out,
    uart_2_rxd_in,
    uart_2_txd_out,
    uart_3_rxd_in,
    uart_3_txd_out,
    uart_4_rxd_in,
    uart_4_txd_out,
    wf_0_reset_out,
    wf_1_reset_out,
    wf_data_axis_0_rx_tdata,
    wf_data_axis_0_rx_tkeep,
    wf_data_axis_0_rx_tlast,
    wf_data_axis_0_rx_tready,
    wf_data_axis_0_rx_tvalid,
    wf_data_axis_0_tx_tdata,
    wf_data_axis_0_tx_tkeep,
    wf_data_axis_0_tx_tlast,
    wf_data_axis_0_tx_tready,
    wf_data_axis_0_tx_tvalid,
    wf_data_axis_1_rx_tdata,
    wf_data_axis_1_rx_tkeep,
    wf_data_axis_1_rx_tlast,
    wf_data_axis_1_rx_tready,
    wf_data_axis_1_rx_tvalid,
    wf_data_axis_1_tx_tdata,
    wf_data_axis_1_tx_tkeep,
    wf_data_axis_1_tx_tlast,
    wf_data_axis_1_tx_tready,
    wf_data_axis_1_tx_tvalid,
    wf_data_user_clk,
    wf_intr_in,
    wf_m_axi_lite_0_araddr,
    wf_m_axi_lite_0_arprot,
    wf_m_axi_lite_0_arready,
    wf_m_axi_lite_0_arvalid,
    wf_m_axi_lite_0_awaddr,
    wf_m_axi_lite_0_awprot,
    wf_m_axi_lite_0_awready,
    wf_m_axi_lite_0_awvalid,
    wf_m_axi_lite_0_bready,
    wf_m_axi_lite_0_bresp,
    wf_m_axi_lite_0_bvalid,
    wf_m_axi_lite_0_rdata,
    wf_m_axi_lite_0_rready,
    wf_m_axi_lite_0_rresp,
    wf_m_axi_lite_0_rvalid,
    wf_m_axi_lite_0_wdata,
    wf_m_axi_lite_0_wready,
    wf_m_axi_lite_0_wstrb,
    wf_m_axi_lite_0_wvalid,
    wf_m_axi_lite_1_araddr,
    wf_m_axi_lite_1_arprot,
    wf_m_axi_lite_1_arready,
    wf_m_axi_lite_1_arvalid,
    wf_m_axi_lite_1_awaddr,
    wf_m_axi_lite_1_awprot,
    wf_m_axi_lite_1_awready,
    wf_m_axi_lite_1_awvalid,
    wf_m_axi_lite_1_bready,
    wf_m_axi_lite_1_bresp,
    wf_m_axi_lite_1_bvalid,
    wf_m_axi_lite_1_rdata,
    wf_m_axi_lite_1_rready,
    wf_m_axi_lite_1_rresp,
    wf_m_axi_lite_1_rvalid,
    wf_m_axi_lite_1_wdata,
    wf_m_axi_lite_1_wready,
    wf_m_axi_lite_1_wstrb,
    wf_m_axi_lite_1_wvalid);
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
  inout [15:0]flash_intf_dq_io;
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

  wire [0:0]axi_lite_aclk_out;
  wire [0:0]axi_lite_aresetn_out;
  wire b_code_in;
  wire [3:0]board_led_out;
  wire clk_in;
  wire [7:0]db_1_in;
  wire [3:0]debug_led_out;
  wire [31:0]dsp6455_0_emif_bus_addr_in;
  wire [3:0]dsp6455_0_emif_bus_be_in;
  wire dsp6455_0_emif_bus_ce_in;
  wire [31:0]dsp6455_0_emif_bus_data_in;
  wire [31:0]dsp6455_0_emif_bus_data_out;
  wire dsp6455_0_emif_bus_oe_in;
  wire dsp6455_0_emif_bus_rdy_out;
  wire dsp6455_0_emif_bus_we_in;
  wire dsp6455_0_intr;
  wire [31:0]dsp6455_1_emif_bus_addr_in;
  wire [3:0]dsp6455_1_emif_bus_be_in;
  wire dsp6455_1_emif_bus_ce_in;
  wire [31:0]dsp6455_1_emif_bus_data_in;
  wire [31:0]dsp6455_1_emif_bus_data_out;
  wire dsp6455_1_emif_bus_oe_in;
  wire dsp6455_1_emif_bus_rdy_out;
  wire dsp6455_1_emif_bus_we_in;
  wire dsp6455_1_intr;
  wire [2:0]flash_high_addr_out;
  wire [31:0]flash_intf_addr;
  wire flash_intf_adv_ldn;
  wire [1:0]flash_intf_ben;
  wire [0:0]flash_intf_ce;
  wire [0:0]flash_intf_ce_n;
  wire flash_intf_clken;
  wire flash_intf_cre;
  wire [0:0]flash_intf_dq_i_0;
  wire [1:1]flash_intf_dq_i_1;
  wire [10:10]flash_intf_dq_i_10;
  wire [11:11]flash_intf_dq_i_11;
  wire [12:12]flash_intf_dq_i_12;
  wire [13:13]flash_intf_dq_i_13;
  wire [14:14]flash_intf_dq_i_14;
  wire [15:15]flash_intf_dq_i_15;
  wire [2:2]flash_intf_dq_i_2;
  wire [3:3]flash_intf_dq_i_3;
  wire [4:4]flash_intf_dq_i_4;
  wire [5:5]flash_intf_dq_i_5;
  wire [6:6]flash_intf_dq_i_6;
  wire [7:7]flash_intf_dq_i_7;
  wire [8:8]flash_intf_dq_i_8;
  wire [9:9]flash_intf_dq_i_9;
  wire [0:0]flash_intf_dq_io_0;
  wire [1:1]flash_intf_dq_io_1;
  wire [10:10]flash_intf_dq_io_10;
  wire [11:11]flash_intf_dq_io_11;
  wire [12:12]flash_intf_dq_io_12;
  wire [13:13]flash_intf_dq_io_13;
  wire [14:14]flash_intf_dq_io_14;
  wire [15:15]flash_intf_dq_io_15;
  wire [2:2]flash_intf_dq_io_2;
  wire [3:3]flash_intf_dq_io_3;
  wire [4:4]flash_intf_dq_io_4;
  wire [5:5]flash_intf_dq_io_5;
  wire [6:6]flash_intf_dq_io_6;
  wire [7:7]flash_intf_dq_io_7;
  wire [8:8]flash_intf_dq_io_8;
  wire [9:9]flash_intf_dq_io_9;
  wire [0:0]flash_intf_dq_o_0;
  wire [1:1]flash_intf_dq_o_1;
  wire [10:10]flash_intf_dq_o_10;
  wire [11:11]flash_intf_dq_o_11;
  wire [12:12]flash_intf_dq_o_12;
  wire [13:13]flash_intf_dq_o_13;
  wire [14:14]flash_intf_dq_o_14;
  wire [15:15]flash_intf_dq_o_15;
  wire [2:2]flash_intf_dq_o_2;
  wire [3:3]flash_intf_dq_o_3;
  wire [4:4]flash_intf_dq_o_4;
  wire [5:5]flash_intf_dq_o_5;
  wire [6:6]flash_intf_dq_o_6;
  wire [7:7]flash_intf_dq_o_7;
  wire [8:8]flash_intf_dq_o_8;
  wire [9:9]flash_intf_dq_o_9;
  wire [0:0]flash_intf_dq_t_0;
  wire [1:1]flash_intf_dq_t_1;
  wire [10:10]flash_intf_dq_t_10;
  wire [11:11]flash_intf_dq_t_11;
  wire [12:12]flash_intf_dq_t_12;
  wire [13:13]flash_intf_dq_t_13;
  wire [14:14]flash_intf_dq_t_14;
  wire [15:15]flash_intf_dq_t_15;
  wire [2:2]flash_intf_dq_t_2;
  wire [3:3]flash_intf_dq_t_3;
  wire [4:4]flash_intf_dq_t_4;
  wire [5:5]flash_intf_dq_t_5;
  wire [6:6]flash_intf_dq_t_6;
  wire [7:7]flash_intf_dq_t_7;
  wire [8:8]flash_intf_dq_t_8;
  wire [9:9]flash_intf_dq_t_9;
  wire flash_intf_lbon;
  wire [0:0]flash_intf_oen;
  wire [1:0]flash_intf_qwen;
  wire flash_intf_rnw;
  wire flash_intf_rpn;
  wire [0:0]flash_intf_wait;
  wire flash_intf_wen;
  wire gt_refclk_clk_n;
  wire gt_refclk_clk_p;
  wire [0:0]gt_serial_rx0_rxn;
  wire [0:0]gt_serial_rx0_rxp;
  wire [0:0]gt_serial_rx1_rxn;
  wire [0:0]gt_serial_rx1_rxp;
  wire [0:0]gt_serial_rx2_rxn;
  wire [0:0]gt_serial_rx2_rxp;
  wire [0:0]gt_serial_rx3_rxn;
  wire [0:0]gt_serial_rx3_rxp;
  wire [0:0]gt_serial_tx0_txn;
  wire [0:0]gt_serial_tx0_txp;
  wire [0:0]gt_serial_tx1_txn;
  wire [0:0]gt_serial_tx1_txp;
  wire [0:0]gt_serial_tx2_txn;
  wire [0:0]gt_serial_tx2_txp;
  wire [0:0]gt_serial_tx3_txn;
  wire [0:0]gt_serial_tx3_txp;
  wire heartbeat_out;
  wire links_config_out;
  wire resetn_in;
  wire rx_high_429_in;
  wire rx_low_429_in;
  wire [0:31]s_axis_next_rx_tdata;
  wire [0:3]s_axis_next_rx_tkeep;
  wire s_axis_next_rx_tlast;
  wire s_axis_next_rx_tvalid;
  wire [0:31]s_axis_next_tx_tdata;
  wire [0:3]s_axis_next_tx_tkeep;
  wire s_axis_next_tx_tlast;
  wire s_axis_next_tx_tready;
  wire s_axis_next_tx_tvalid;
  wire [0:31]s_axis_pre_rx_tdata;
  wire [0:3]s_axis_pre_rx_tkeep;
  wire s_axis_pre_rx_tlast;
  wire s_axis_pre_rx_tvalid;
  wire [0:31]s_axis_pre_tx_tdata;
  wire [0:3]s_axis_pre_tx_tkeep;
  wire s_axis_pre_tx_tlast;
  wire s_axis_pre_tx_tready;
  wire s_axis_pre_tx_tvalid;
  wire scm_mode_out;
  wire spix_0_rx_sclk_in;
  wire spix_0_rx_sdi_in;
  wire spix_0_rx_sen_in;
  wire spix_0_tx_sclk_out;
  wire spix_0_tx_sdo_out;
  wire spix_0_tx_sen_out;
  wire spix_1_rx_sclk_in;
  wire spix_1_rx_sdi_in;
  wire spix_1_rx_sen_in;
  wire spix_1_tx_sclk_out;
  wire spix_1_tx_sdo_out;
  wire spix_1_tx_sen_out;
  wire spix_2_rx_sclk_in;
  wire spix_2_rx_sdi_in;
  wire spix_2_rx_sen_in;
  wire spix_2_tx_sclk_out;
  wire spix_2_tx_sdo_out;
  wire spix_2_tx_sen_out;
  wire [7:0]spm_markaddr_out;
  wire uart_0_rxd_in;
  wire uart_0_txd_out;
  wire uart_1_rxd_in;
  wire uart_1_txd_out;
  wire uart_2_rxd_in;
  wire uart_2_txd_out;
  wire uart_3_rxd_in;
  wire uart_3_txd_out;
  wire uart_4_rxd_in;
  wire uart_4_txd_out;
  wire wf_0_reset_out;
  wire wf_1_reset_out;
  wire [31:0]wf_data_axis_0_rx_tdata;
  wire [3:0]wf_data_axis_0_rx_tkeep;
  wire [0:0]wf_data_axis_0_rx_tlast;
  wire [0:0]wf_data_axis_0_rx_tready;
  wire [0:0]wf_data_axis_0_rx_tvalid;
  wire [31:0]wf_data_axis_0_tx_tdata;
  wire [3:0]wf_data_axis_0_tx_tkeep;
  wire [0:0]wf_data_axis_0_tx_tlast;
  wire [0:0]wf_data_axis_0_tx_tready;
  wire [0:0]wf_data_axis_0_tx_tvalid;
  wire [31:0]wf_data_axis_1_rx_tdata;
  wire [3:0]wf_data_axis_1_rx_tkeep;
  wire [0:0]wf_data_axis_1_rx_tlast;
  wire [0:0]wf_data_axis_1_rx_tready;
  wire [0:0]wf_data_axis_1_rx_tvalid;
  wire [31:0]wf_data_axis_1_tx_tdata;
  wire [3:0]wf_data_axis_1_tx_tkeep;
  wire [0:0]wf_data_axis_1_tx_tlast;
  wire [0:0]wf_data_axis_1_tx_tready;
  wire [0:0]wf_data_axis_1_tx_tvalid;
  wire wf_data_user_clk;
  wire [7:0]wf_intr_in;
  wire [31:0]wf_m_axi_lite_0_araddr;
  wire [2:0]wf_m_axi_lite_0_arprot;
  wire wf_m_axi_lite_0_arready;
  wire wf_m_axi_lite_0_arvalid;
  wire [31:0]wf_m_axi_lite_0_awaddr;
  wire [2:0]wf_m_axi_lite_0_awprot;
  wire wf_m_axi_lite_0_awready;
  wire wf_m_axi_lite_0_awvalid;
  wire wf_m_axi_lite_0_bready;
  wire [1:0]wf_m_axi_lite_0_bresp;
  wire wf_m_axi_lite_0_bvalid;
  wire [31:0]wf_m_axi_lite_0_rdata;
  wire wf_m_axi_lite_0_rready;
  wire [1:0]wf_m_axi_lite_0_rresp;
  wire wf_m_axi_lite_0_rvalid;
  wire [31:0]wf_m_axi_lite_0_wdata;
  wire wf_m_axi_lite_0_wready;
  wire [3:0]wf_m_axi_lite_0_wstrb;
  wire wf_m_axi_lite_0_wvalid;
  wire [31:0]wf_m_axi_lite_1_araddr;
  wire [2:0]wf_m_axi_lite_1_arprot;
  wire wf_m_axi_lite_1_arready;
  wire wf_m_axi_lite_1_arvalid;
  wire [31:0]wf_m_axi_lite_1_awaddr;
  wire [2:0]wf_m_axi_lite_1_awprot;
  wire wf_m_axi_lite_1_awready;
  wire wf_m_axi_lite_1_awvalid;
  wire wf_m_axi_lite_1_bready;
  wire [1:0]wf_m_axi_lite_1_bresp;
  wire wf_m_axi_lite_1_bvalid;
  wire [31:0]wf_m_axi_lite_1_rdata;
  wire wf_m_axi_lite_1_rready;
  wire [1:0]wf_m_axi_lite_1_rresp;
  wire wf_m_axi_lite_1_rvalid;
  wire [31:0]wf_m_axi_lite_1_wdata;
  wire wf_m_axi_lite_1_wready;
  wire [3:0]wf_m_axi_lite_1_wstrb;
  wire wf_m_axi_lite_1_wvalid;

  bus_architecture bus_architecture_i
       (.axi_lite_aclk_out(axi_lite_aclk_out),
        .axi_lite_aresetn_out(axi_lite_aresetn_out),
        .b_code_in(b_code_in),
        .board_led_out(board_led_out),
        .clk_in(clk_in),
        .db_1_in(db_1_in),
        .debug_led_out(debug_led_out),
        .dsp6455_0_emif_bus_addr_in(dsp6455_0_emif_bus_addr_in),
        .dsp6455_0_emif_bus_be_in(dsp6455_0_emif_bus_be_in),
        .dsp6455_0_emif_bus_ce_in(dsp6455_0_emif_bus_ce_in),
        .dsp6455_0_emif_bus_data_in(dsp6455_0_emif_bus_data_in),
        .dsp6455_0_emif_bus_data_out(dsp6455_0_emif_bus_data_out),
        .dsp6455_0_emif_bus_oe_in(dsp6455_0_emif_bus_oe_in),
        .dsp6455_0_emif_bus_rdy_out(dsp6455_0_emif_bus_rdy_out),
        .dsp6455_0_emif_bus_we_in(dsp6455_0_emif_bus_we_in),
        .dsp6455_0_intr(dsp6455_0_intr),
        .dsp6455_1_emif_bus_addr_in(dsp6455_1_emif_bus_addr_in),
        .dsp6455_1_emif_bus_be_in(dsp6455_1_emif_bus_be_in),
        .dsp6455_1_emif_bus_ce_in(dsp6455_1_emif_bus_ce_in),
        .dsp6455_1_emif_bus_data_in(dsp6455_1_emif_bus_data_in),
        .dsp6455_1_emif_bus_data_out(dsp6455_1_emif_bus_data_out),
        .dsp6455_1_emif_bus_oe_in(dsp6455_1_emif_bus_oe_in),
        .dsp6455_1_emif_bus_rdy_out(dsp6455_1_emif_bus_rdy_out),
        .dsp6455_1_emif_bus_we_in(dsp6455_1_emif_bus_we_in),
        .dsp6455_1_intr(dsp6455_1_intr),
        .flash_high_addr_out(flash_high_addr_out),
        .flash_intf_addr(flash_intf_addr),
        .flash_intf_adv_ldn(flash_intf_adv_ldn),
        .flash_intf_ben(flash_intf_ben),
        .flash_intf_ce(flash_intf_ce),
        .flash_intf_ce_n(flash_intf_ce_n),
        .flash_intf_clken(flash_intf_clken),
        .flash_intf_cre(flash_intf_cre),
        .flash_intf_dq_i({flash_intf_dq_i_15,flash_intf_dq_i_14,flash_intf_dq_i_13,flash_intf_dq_i_12,flash_intf_dq_i_11,flash_intf_dq_i_10,flash_intf_dq_i_9,flash_intf_dq_i_8,flash_intf_dq_i_7,flash_intf_dq_i_6,flash_intf_dq_i_5,flash_intf_dq_i_4,flash_intf_dq_i_3,flash_intf_dq_i_2,flash_intf_dq_i_1,flash_intf_dq_i_0}),
        .flash_intf_dq_o({flash_intf_dq_o_15,flash_intf_dq_o_14,flash_intf_dq_o_13,flash_intf_dq_o_12,flash_intf_dq_o_11,flash_intf_dq_o_10,flash_intf_dq_o_9,flash_intf_dq_o_8,flash_intf_dq_o_7,flash_intf_dq_o_6,flash_intf_dq_o_5,flash_intf_dq_o_4,flash_intf_dq_o_3,flash_intf_dq_o_2,flash_intf_dq_o_1,flash_intf_dq_o_0}),
        .flash_intf_dq_t({flash_intf_dq_t_15,flash_intf_dq_t_14,flash_intf_dq_t_13,flash_intf_dq_t_12,flash_intf_dq_t_11,flash_intf_dq_t_10,flash_intf_dq_t_9,flash_intf_dq_t_8,flash_intf_dq_t_7,flash_intf_dq_t_6,flash_intf_dq_t_5,flash_intf_dq_t_4,flash_intf_dq_t_3,flash_intf_dq_t_2,flash_intf_dq_t_1,flash_intf_dq_t_0}),
        .flash_intf_lbon(flash_intf_lbon),
        .flash_intf_oen(flash_intf_oen),
        .flash_intf_qwen(flash_intf_qwen),
        .flash_intf_rnw(flash_intf_rnw),
        .flash_intf_rpn(flash_intf_rpn),
        .flash_intf_wait(flash_intf_wait),
        .flash_intf_wen(flash_intf_wen),
        .gt_refclk_clk_n(gt_refclk_clk_n),
        .gt_refclk_clk_p(gt_refclk_clk_p),
        .gt_serial_rx0_rxn(gt_serial_rx0_rxn),
        .gt_serial_rx0_rxp(gt_serial_rx0_rxp),
        .gt_serial_rx1_rxn(gt_serial_rx1_rxn),
        .gt_serial_rx1_rxp(gt_serial_rx1_rxp),
        .gt_serial_rx2_rxn(gt_serial_rx2_rxn),
        .gt_serial_rx2_rxp(gt_serial_rx2_rxp),
        .gt_serial_rx3_rxn(gt_serial_rx3_rxn),
        .gt_serial_rx3_rxp(gt_serial_rx3_rxp),
        .gt_serial_tx0_txn(gt_serial_tx0_txn),
        .gt_serial_tx0_txp(gt_serial_tx0_txp),
        .gt_serial_tx1_txn(gt_serial_tx1_txn),
        .gt_serial_tx1_txp(gt_serial_tx1_txp),
        .gt_serial_tx2_txn(gt_serial_tx2_txn),
        .gt_serial_tx2_txp(gt_serial_tx2_txp),
        .gt_serial_tx3_txn(gt_serial_tx3_txn),
        .gt_serial_tx3_txp(gt_serial_tx3_txp),
        .heartbeat_out(heartbeat_out),
        .links_config_out(links_config_out),
        .resetn_in(resetn_in),
        .rx_high_429_in(rx_high_429_in),
        .rx_low_429_in(rx_low_429_in),
        .s_axis_next_rx_tdata(s_axis_next_rx_tdata),
        .s_axis_next_rx_tkeep(s_axis_next_rx_tkeep),
        .s_axis_next_rx_tlast(s_axis_next_rx_tlast),
        .s_axis_next_rx_tvalid(s_axis_next_rx_tvalid),
        .s_axis_next_tx_tdata(s_axis_next_tx_tdata),
        .s_axis_next_tx_tkeep(s_axis_next_tx_tkeep),
        .s_axis_next_tx_tlast(s_axis_next_tx_tlast),
        .s_axis_next_tx_tready(s_axis_next_tx_tready),
        .s_axis_next_tx_tvalid(s_axis_next_tx_tvalid),
        .s_axis_pre_rx_tdata(s_axis_pre_rx_tdata),
        .s_axis_pre_rx_tkeep(s_axis_pre_rx_tkeep),
        .s_axis_pre_rx_tlast(s_axis_pre_rx_tlast),
        .s_axis_pre_rx_tvalid(s_axis_pre_rx_tvalid),
        .s_axis_pre_tx_tdata(s_axis_pre_tx_tdata),
        .s_axis_pre_tx_tkeep(s_axis_pre_tx_tkeep),
        .s_axis_pre_tx_tlast(s_axis_pre_tx_tlast),
        .s_axis_pre_tx_tready(s_axis_pre_tx_tready),
        .s_axis_pre_tx_tvalid(s_axis_pre_tx_tvalid),
        .scm_mode_out(scm_mode_out),
        .spix_0_rx_sclk_in(spix_0_rx_sclk_in),
        .spix_0_rx_sdi_in(spix_0_rx_sdi_in),
        .spix_0_rx_sen_in(spix_0_rx_sen_in),
        .spix_0_tx_sclk_out(spix_0_tx_sclk_out),
        .spix_0_tx_sdo_out(spix_0_tx_sdo_out),
        .spix_0_tx_sen_out(spix_0_tx_sen_out),
        .spix_1_rx_sclk_in(spix_1_rx_sclk_in),
        .spix_1_rx_sdi_in(spix_1_rx_sdi_in),
        .spix_1_rx_sen_in(spix_1_rx_sen_in),
        .spix_1_tx_sclk_out(spix_1_tx_sclk_out),
        .spix_1_tx_sdo_out(spix_1_tx_sdo_out),
        .spix_1_tx_sen_out(spix_1_tx_sen_out),
        .spix_2_rx_sclk_in(spix_2_rx_sclk_in),
        .spix_2_rx_sdi_in(spix_2_rx_sdi_in),
        .spix_2_rx_sen_in(spix_2_rx_sen_in),
        .spix_2_tx_sclk_out(spix_2_tx_sclk_out),
        .spix_2_tx_sdo_out(spix_2_tx_sdo_out),
        .spix_2_tx_sen_out(spix_2_tx_sen_out),
        .spm_markaddr_out(spm_markaddr_out),
        .uart_0_rxd_in(uart_0_rxd_in),
        .uart_0_txd_out(uart_0_txd_out),
        .uart_1_rxd_in(uart_1_rxd_in),
        .uart_1_txd_out(uart_1_txd_out),
        .uart_2_rxd_in(uart_2_rxd_in),
        .uart_2_txd_out(uart_2_txd_out),
        .uart_3_rxd_in(uart_3_rxd_in),
        .uart_3_txd_out(uart_3_txd_out),
        .uart_4_rxd_in(uart_4_rxd_in),
        .uart_4_txd_out(uart_4_txd_out),
        .wf_0_reset_out(wf_0_reset_out),
        .wf_1_reset_out(wf_1_reset_out),
        .wf_data_axis_0_rx_tdata(wf_data_axis_0_rx_tdata),
        .wf_data_axis_0_rx_tkeep(wf_data_axis_0_rx_tkeep),
        .wf_data_axis_0_rx_tlast(wf_data_axis_0_rx_tlast),
        .wf_data_axis_0_rx_tready(wf_data_axis_0_rx_tready),
        .wf_data_axis_0_rx_tvalid(wf_data_axis_0_rx_tvalid),
        .wf_data_axis_0_tx_tdata(wf_data_axis_0_tx_tdata),
        .wf_data_axis_0_tx_tkeep(wf_data_axis_0_tx_tkeep),
        .wf_data_axis_0_tx_tlast(wf_data_axis_0_tx_tlast),
        .wf_data_axis_0_tx_tready(wf_data_axis_0_tx_tready),
        .wf_data_axis_0_tx_tvalid(wf_data_axis_0_tx_tvalid),
        .wf_data_axis_1_rx_tdata(wf_data_axis_1_rx_tdata),
        .wf_data_axis_1_rx_tkeep(wf_data_axis_1_rx_tkeep),
        .wf_data_axis_1_rx_tlast(wf_data_axis_1_rx_tlast),
        .wf_data_axis_1_rx_tready(wf_data_axis_1_rx_tready),
        .wf_data_axis_1_rx_tvalid(wf_data_axis_1_rx_tvalid),
        .wf_data_axis_1_tx_tdata(wf_data_axis_1_tx_tdata),
        .wf_data_axis_1_tx_tkeep(wf_data_axis_1_tx_tkeep),
        .wf_data_axis_1_tx_tlast(wf_data_axis_1_tx_tlast),
        .wf_data_axis_1_tx_tready(wf_data_axis_1_tx_tready),
        .wf_data_axis_1_tx_tvalid(wf_data_axis_1_tx_tvalid),
        .wf_data_user_clk(wf_data_user_clk),
        .wf_intr_in(wf_intr_in),
        .wf_m_axi_lite_0_araddr(wf_m_axi_lite_0_araddr),
        .wf_m_axi_lite_0_arprot(wf_m_axi_lite_0_arprot),
        .wf_m_axi_lite_0_arready(wf_m_axi_lite_0_arready),
        .wf_m_axi_lite_0_arvalid(wf_m_axi_lite_0_arvalid),
        .wf_m_axi_lite_0_awaddr(wf_m_axi_lite_0_awaddr),
        .wf_m_axi_lite_0_awprot(wf_m_axi_lite_0_awprot),
        .wf_m_axi_lite_0_awready(wf_m_axi_lite_0_awready),
        .wf_m_axi_lite_0_awvalid(wf_m_axi_lite_0_awvalid),
        .wf_m_axi_lite_0_bready(wf_m_axi_lite_0_bready),
        .wf_m_axi_lite_0_bresp(wf_m_axi_lite_0_bresp),
        .wf_m_axi_lite_0_bvalid(wf_m_axi_lite_0_bvalid),
        .wf_m_axi_lite_0_rdata(wf_m_axi_lite_0_rdata),
        .wf_m_axi_lite_0_rready(wf_m_axi_lite_0_rready),
        .wf_m_axi_lite_0_rresp(wf_m_axi_lite_0_rresp),
        .wf_m_axi_lite_0_rvalid(wf_m_axi_lite_0_rvalid),
        .wf_m_axi_lite_0_wdata(wf_m_axi_lite_0_wdata),
        .wf_m_axi_lite_0_wready(wf_m_axi_lite_0_wready),
        .wf_m_axi_lite_0_wstrb(wf_m_axi_lite_0_wstrb),
        .wf_m_axi_lite_0_wvalid(wf_m_axi_lite_0_wvalid),
        .wf_m_axi_lite_1_araddr(wf_m_axi_lite_1_araddr),
        .wf_m_axi_lite_1_arprot(wf_m_axi_lite_1_arprot),
        .wf_m_axi_lite_1_arready(wf_m_axi_lite_1_arready),
        .wf_m_axi_lite_1_arvalid(wf_m_axi_lite_1_arvalid),
        .wf_m_axi_lite_1_awaddr(wf_m_axi_lite_1_awaddr),
        .wf_m_axi_lite_1_awprot(wf_m_axi_lite_1_awprot),
        .wf_m_axi_lite_1_awready(wf_m_axi_lite_1_awready),
        .wf_m_axi_lite_1_awvalid(wf_m_axi_lite_1_awvalid),
        .wf_m_axi_lite_1_bready(wf_m_axi_lite_1_bready),
        .wf_m_axi_lite_1_bresp(wf_m_axi_lite_1_bresp),
        .wf_m_axi_lite_1_bvalid(wf_m_axi_lite_1_bvalid),
        .wf_m_axi_lite_1_rdata(wf_m_axi_lite_1_rdata),
        .wf_m_axi_lite_1_rready(wf_m_axi_lite_1_rready),
        .wf_m_axi_lite_1_rresp(wf_m_axi_lite_1_rresp),
        .wf_m_axi_lite_1_rvalid(wf_m_axi_lite_1_rvalid),
        .wf_m_axi_lite_1_wdata(wf_m_axi_lite_1_wdata),
        .wf_m_axi_lite_1_wready(wf_m_axi_lite_1_wready),
        .wf_m_axi_lite_1_wstrb(wf_m_axi_lite_1_wstrb),
        .wf_m_axi_lite_1_wvalid(wf_m_axi_lite_1_wvalid));
  IOBUF flash_intf_dq_iobuf_0
       (.I(flash_intf_dq_o_0),
        .IO(flash_intf_dq_io[0]),
        .O(flash_intf_dq_i_0),
        .T(flash_intf_dq_t_0));
  IOBUF flash_intf_dq_iobuf_1
       (.I(flash_intf_dq_o_1),
        .IO(flash_intf_dq_io[1]),
        .O(flash_intf_dq_i_1),
        .T(flash_intf_dq_t_1));
  IOBUF flash_intf_dq_iobuf_10
       (.I(flash_intf_dq_o_10),
        .IO(flash_intf_dq_io[10]),
        .O(flash_intf_dq_i_10),
        .T(flash_intf_dq_t_10));
  IOBUF flash_intf_dq_iobuf_11
       (.I(flash_intf_dq_o_11),
        .IO(flash_intf_dq_io[11]),
        .O(flash_intf_dq_i_11),
        .T(flash_intf_dq_t_11));
  IOBUF flash_intf_dq_iobuf_12
       (.I(flash_intf_dq_o_12),
        .IO(flash_intf_dq_io[12]),
        .O(flash_intf_dq_i_12),
        .T(flash_intf_dq_t_12));
  IOBUF flash_intf_dq_iobuf_13
       (.I(flash_intf_dq_o_13),
        .IO(flash_intf_dq_io[13]),
        .O(flash_intf_dq_i_13),
        .T(flash_intf_dq_t_13));
  IOBUF flash_intf_dq_iobuf_14
       (.I(flash_intf_dq_o_14),
        .IO(flash_intf_dq_io[14]),
        .O(flash_intf_dq_i_14),
        .T(flash_intf_dq_t_14));
  IOBUF flash_intf_dq_iobuf_15
       (.I(flash_intf_dq_o_15),
        .IO(flash_intf_dq_io[15]),
        .O(flash_intf_dq_i_15),
        .T(flash_intf_dq_t_15));
  IOBUF flash_intf_dq_iobuf_2
       (.I(flash_intf_dq_o_2),
        .IO(flash_intf_dq_io[2]),
        .O(flash_intf_dq_i_2),
        .T(flash_intf_dq_t_2));
  IOBUF flash_intf_dq_iobuf_3
       (.I(flash_intf_dq_o_3),
        .IO(flash_intf_dq_io[3]),
        .O(flash_intf_dq_i_3),
        .T(flash_intf_dq_t_3));
  IOBUF flash_intf_dq_iobuf_4
       (.I(flash_intf_dq_o_4),
        .IO(flash_intf_dq_io[4]),
        .O(flash_intf_dq_i_4),
        .T(flash_intf_dq_t_4));
  IOBUF flash_intf_dq_iobuf_5
       (.I(flash_intf_dq_o_5),
        .IO(flash_intf_dq_io[5]),
        .O(flash_intf_dq_i_5),
        .T(flash_intf_dq_t_5));
  IOBUF flash_intf_dq_iobuf_6
       (.I(flash_intf_dq_o_6),
        .IO(flash_intf_dq_io[6]),
        .O(flash_intf_dq_i_6),
        .T(flash_intf_dq_t_6));
  IOBUF flash_intf_dq_iobuf_7
       (.I(flash_intf_dq_o_7),
        .IO(flash_intf_dq_io[7]),
        .O(flash_intf_dq_i_7),
        .T(flash_intf_dq_t_7));
  IOBUF flash_intf_dq_iobuf_8
       (.I(flash_intf_dq_o_8),
        .IO(flash_intf_dq_io[8]),
        .O(flash_intf_dq_i_8),
        .T(flash_intf_dq_t_8));
  IOBUF flash_intf_dq_iobuf_9
       (.I(flash_intf_dq_o_9),
        .IO(flash_intf_dq_io[9]),
        .O(flash_intf_dq_i_9),
        .T(flash_intf_dq_t_9));
endmodule
