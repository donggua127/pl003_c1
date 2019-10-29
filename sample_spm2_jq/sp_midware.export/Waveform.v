`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2017/08/07 22:17:15
// Design Name:
// Module Name: Waveform
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Waveform(
    // System signals
    input   wire        clk_100M_in             ,
    input   wire        clk_32M512_in           ,
    input   wire        reset0_in               ,
    input   wire        reset1_in               ,
    input   wire        axi_lite_aclk_in        ,
    input   wire        axi_lite_aresetn_in     ,
    // AXI Lite slave interface 0
    input   wire [31:0] s_axi_lite_0_araddr_in  ,
    input   wire [2:0]  s_axi_lite_0_arprot_in  ,
    output  wire        s_axi_lite_0_arready_out,
    input   wire        s_axi_lite_0_arvalid_in ,
    input   wire [31:0] s_axi_lite_0_awaddr_in  ,
    input   wire [2:0]  s_axi_lite_0_awprot_in  ,
    output  wire        s_axi_lite_0_awready_out,
    input   wire        s_axi_lite_0_awvalid_in ,
    input   wire        s_axi_lite_0_bready_in  ,
    output  wire [1:0]  s_axi_lite_0_bresp_out  ,
    output  wire        s_axi_lite_0_bvalid_out ,
    output  wire [31:0] s_axi_lite_0_rdata_out  ,
    input   wire        s_axi_lite_0_rready_in  ,
    output  wire [1:0]  s_axi_lite_0_rresp_out  ,
    output  wire        s_axi_lite_0_rvalid_out ,
    input   wire [31:0] s_axi_lite_0_wdata_in   ,
    output  wire        s_axi_lite_0_wready_out ,
    input   wire [3:0]  s_axi_lite_0_wstrb_in   ,
    input   wire        s_axi_lite_0_wvalid_in  ,
    // AXI Lite slave interface 1
    input   wire [31:0] s_axi_lite_1_araddr_in  ,
    input   wire [2:0]  s_axi_lite_1_arprot_in  ,
    output  wire        s_axi_lite_1_arready_out,
    input   wire        s_axi_lite_1_arvalid_in ,
    input   wire [31:0] s_axi_lite_1_awaddr_in  ,
    input   wire [2:0]  s_axi_lite_1_awprot_in  ,
    output   wire       s_axi_lite_1_awready_out,
    input   wire        s_axi_lite_1_awvalid_in ,
    input   wire        s_axi_lite_1_bready_in  ,
    output  wire [1:0]  s_axi_lite_1_bresp_out  ,
    output  wire        s_axi_lite_1_bvalid_out ,
    output  wire [31:0] s_axi_lite_1_rdata_out  ,
    input   wire        s_axi_lite_1_rready_in  ,
    output  wire [1:0]  s_axi_lite_1_rresp_out  ,
    output  wire        s_axi_lite_1_rvalid_out ,
    input   wire [31:0] s_axi_lite_1_wdata_in   ,
    output  wire        s_axi_lite_1_wready_out ,
    input   wire [3:0]  s_axi_lite_1_wstrb_in   ,
    input   wire        s_axi_lite_1_wvalid_in  ,
    // AXI stream interface for ZIF sample data
    input   wire        axis_zif_clk_in         ,
    input   wire [31:0] axis_0_rx_tdata_in      ,
    input   wire [3:0]  axis_0_rx_tkeep_in      ,
    input   wire        axis_0_rx_tlast_in      ,
    input   wire        axis_0_rx_tvalid_in     ,
    output  wire [31:0] axis_0_tx_tdata_out     ,
    output  wire [3:0]  axis_0_tx_tkeep_out     ,
    output  wire        axis_0_tx_tlast_out     ,
    input   wire        axis_0_tx_tready_in     ,
    output  wire        axis_0_tx_tvalid_out    ,
    input   wire [31:0] axis_1_rx_tdata_in      ,
    input   wire [3:0]  axis_1_rx_tkeep_in      ,
    input   wire        axis_1_rx_tlast_in      ,
    input   wire        axis_1_rx_tvalid_in     ,
    output  wire [31:0] axis_1_tx_tdata_out     ,
    output  wire [3:0]  axis_1_tx_tkeep_out     ,
    output  wire        axis_1_tx_tlast_out     ,
    input   wire        axis_1_tx_tready_in     ,
    output  wire        axis_1_tx_tvalid_out    ,
    // AXI stream interface for inter-FPGA communication (Shared)
    input   wire        axis_pre_clk_in         ,
    input   wire [31:0] axis_pre_rx_tdata_in    ,
    input   wire [3:0]  axis_pre_rx_tkeep_in    ,
    input   wire        axis_pre_rx_tlast_in    ,
    input   wire        axis_pre_rx_tvalid_in   ,
    output  wire [31:0] axis_pre_tx_tdata_out   ,
    output  wire [3:0]  axis_pre_tx_tkeep_out   ,
    output  wire        axis_pre_tx_tlast_out   ,
    input   wire        axis_pre_tx_tready_in   ,
    output  wire        axis_pre_tx_tvalid_out  ,
    input   wire        axis_next_clk_in        ,
    input   wire [31:0] axis_next_rx_tdata_in   ,
    input   wire [3:0]  axis_next_rx_tkeep_in   ,
    input   wire        axis_next_rx_tlast_in   ,
    input   wire        axis_next_rx_tvalid_in  ,
    output  wire [31:0] axis_next_tx_tdata_out  ,
    output  wire [3:0]  axis_next_tx_tkeep_out  ,
    output  wire        axis_next_tx_tlast_out  ,
    input   wire        axis_next_tx_tready_in  ,
    output  wire        axis_next_tx_tvalid_out ,
    // Inter-FPGA discrete signals (Shared)
    input   wire [11:0] lvds_pre_sig_in         ,
    output  wire [11:0] lvds_pre_sig_out        ,
    output  wire [11:0] lvds_pre_sig_tri_out    ,
    input   wire [39:0] lvcmos_pre_sig_in       ,
    output  wire [39:0] lvcmos_pre_sig_out      ,
    output  wire [39:0] lvcmos_pre_sig_tri_out  ,
    input   wire [11:0] lvds_next_sig_in        ,
    output  wire [11:0] lvds_next_sig_out       ,
    output  wire [11:0] lvds_next_sig_tri_out   ,
    input   wire [39:0] lvcmos_next_sig_in      ,
    output  wire [39:0] lvcmos_next_sig_out     ,
    output  wire [39:0] lvcmos_next_sig_tri_out ,
    // LRM Discrete signals (Shared)
    input   wire [6:0]  lrm_sig_in              ,
    output  wire [24:0] lrm_sig_out             ,
    // Interrupt
    output  wire [7:0]  intr_out
);

////////////////////////////////////////////////////////////////////////////////
//                             OUTPUT ASSIGNMENT
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//                            PARAMETER DECLARATION
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//                            REG & WIRE DECLARATION
////////////////////////////////////////////////////////////////////////////////

wave_pro
u_wave_pro(
    .rst_n                      (axi_lite_aresetn_in       ),
    .axi4_lite_clk              (axi_lite_aclk_in          ),
    .axi4_lite_awvalid          (s_axi_lite_0_awvalid_in    ),
    .axi4_lite_awready          (s_axi_lite_0_awready_out   ),
    .axi4_lite_awaddr           (s_axi_lite_0_awaddr_in     ),
    .axi4_lite_wvalid           (s_axi_lite_0_wvalid_in     ),
    .axi4_lite_wready           (s_axi_lite_0_wready_out    ),
    .axi4_lite_wdata            (s_axi_lite_0_wdata_in      ),
    .axi4_lite_bvalid           (s_axi_lite_0_bvalid_out    ),
    .axi4_lite_bready           (s_axi_lite_0_bready_in     ),
    .axi4_lite_bresp            (s_axi_lite_0_bresp_out     ),
    .axi4_lite_arvalid          (s_axi_lite_0_arvalid_in    ),
    .axi4_lite_arready          (s_axi_lite_0_arready_out   ),
    .axi4_lite_araddr           (s_axi_lite_0_araddr_in     ),
    .axi4_lite_rvalid           (s_axi_lite_0_rvalid_out    ),
    .axi4_lite_rready           (s_axi_lite_0_rready_in     ),
    .axi4_lite_rdata            (s_axi_lite_0_rdata_out     ),
    .axi4_lite_rresp            (s_axi_lite_0_rresp_out     ),

    .axis_clk                   (axis_zif_clk_in            ),
    .axis_rx_tready             (/*not used*/               ),
    .axis_rx_tvalid             (axis_0_rx_tvalid_in        ),
    .axis_rx_tdata              (axis_0_rx_tdata_in         ),
    .axis_rx_tlast              (axis_0_rx_tlast_in         ),
    .axis_tx_tvalid             (axis_0_tx_tvalid_out       ),
    .axis_tx_tdata              (axis_0_tx_tdata_out        ),
    .axis_tx_tready             (axis_0_tx_tready_in        ),
    .axis_tx_tlast              (axis_0_tx_tlast_out        )
);
assign axis_0_tx_tkeep_out = 4'hf;


//======================================+=======================================
// 2.                         Slave AXI Lite Bus 1
//------------------------------------------------------------------------------
    waveform_biu2 #(
        .C_S_AXI_DATA_WIDTH(32),
        .C_S_AXI_ADDR_WIDTH(8)
    ) waveform_biu2 (
        // AXI interface
        .s_axi_aclk_in      (axi_lite_aclk_in           ),
        .s_axi_aresetn_in   (axi_lite_aresetn_in        ),
        .s_axi_awaddr_in    (s_axi_lite_1_awaddr_in     ),
        .s_axi_awprot_in    (s_axi_lite_1_awprot_in     ),
        .s_axi_awvalid_in   (s_axi_lite_1_awvalid_in    ),
        .s_axi_awready_out  (s_axi_lite_1_awready_out   ),
        .s_axi_wdata_in     (s_axi_lite_1_wdata_in      ),
        .s_axi_wstrb_in     (s_axi_lite_1_wstrb_in      ),
        .s_axi_wvalid_in    (s_axi_lite_1_wvalid_in     ),
        .s_axi_wready_out   (s_axi_lite_1_wready_out    ),
        .s_axi_bresp_out    (s_axi_lite_1_bresp_out     ),
        .s_axi_bvalid_out   (s_axi_lite_1_bvalid_out    ),
        .s_axi_bready_in    (s_axi_lite_1_bready_in     ),
        .s_axi_araddr_in    (s_axi_lite_1_araddr_in     ),
        .s_axi_arprot_in    (s_axi_lite_1_arprot_in     ),
        .s_axi_arvalid_in   (s_axi_lite_1_arvalid_in    ),
        .s_axi_arready_out  (s_axi_lite_1_arready_out   ),
        .s_axi_rdata_out    (s_axi_lite_1_rdata_out     ),
        .s_axi_rresp_out    (s_axi_lite_1_rresp_out     ),
        .s_axi_rvalid_out   (s_axi_lite_1_rvalid_out    ),
        .s_axi_rready_in    (s_axi_lite_1_rready_in     )
    );

assign intr_out = 8'd0;
assign lrm_sig_out = 25'd0;

assign lvds_pre_sig_tri_out    = 12'hfff;
assign lvcmos_pre_sig_tri_out  = 40'hffffffffff;
assign lvds_next_sig_tri_out   = 12'hfff;
assign lvcmos_next_sig_tri_out = 40'hffffffffff;

assign lvds_pre_sig_out        = 'd0;
assign lvcmos_pre_sig_out      = 'd0;
assign lvds_next_sig_out       = 'd0;
assign lvcmos_next_sig_out     = 'd0;


assign axis_pre_tx_tdata_out   = 32'd0;
assign axis_pre_tx_tkeep_out   = 4'd0;
assign axis_pre_tx_tlast_out   = 1'b0;
assign axis_pre_tx_tvalid_out  = 1'b0;

assign axis_next_tx_tdata_out  = 32'd0;
assign axis_next_tx_tkeep_out  = 4'd0;
assign axis_next_tx_tlast_out  = 1'b0;
assign axis_next_tx_tvalid_out = 1'b0;
endmodule
