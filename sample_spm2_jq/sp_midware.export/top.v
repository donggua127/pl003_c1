`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CETC-10
// Engineer: zhangqsh
//
// Create Date: 2017/02/15 13:59:18
// Design Name: SP_MIDWARE
// Module Name: top
// Project Name: KE600
// Target Devices: XC7KLX325T
// Tool Versions: Vivado 2017.2
// Description: This module is the top module for the design.
// flash device:28f00bp30e-bpi-x16,128MB
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module top(
//---------------------------------------+--------------------------------------
//--------------------------------- Clock&Reset --------------------------------
    input   wire        clk_100m_in_pad                 ,   // System clock @100MHz, from REF module
    input   wire        clk_32m512_in_pad               ,   // System clock @32.512MHz, from REF module
    (* ASYNC_REG = "TRUE" *)
    input   wire        reset_in_pad                    ,   // System reset, active low
    output  wire        heartbeat_out_pad               ,   // Heartbeat signal to DSP28235, active rising edge

    // Clocks for MGT
    input   wire        gtx_clk_125m_n_in_pad           ,
    input   wire        gtx_clk_125m_p_in_pad           ,

//---------------------------------------+--------------------------------------
//--------------------------------- TMS320C6455 --------------------------------
    // DSP6455 EMIFA
    input   wire        dsp6455_0_emif_ce2_in_pad       ,
    input   wire        dsp6455_0_emif_rnw_in_pad       ,
    output  wire        dsp6455_0_emif_ardy_out_pad     ,
    input   wire [3:0]  dsp6455_0_emif_be_in_pad        ,   // Active low
    input   wire [19:0] dsp6455_0_emif_addr_in_pad      ,
    inout   wire [31:0] dsp6455_0_emif_data_inout_pad   ,
    input   wire        dsp6455_0_emif_aoe_in_pad       ,
    input   wire        dsp6455_0_emif_awe_in_pad       ,
    output  wire        dsp6455_0_intr_out_pad          ,

//    input   wire        dsp6455_1_emif_ce2_in_pad       ,
    input   wire        dsp6455_1_emif_ce4_in_pad       ,
    input   wire        dsp6455_1_emif_rnw_in_pad       ,
    output  wire        dsp6455_1_emif_ardy_out_pad     ,
    input   wire [3:0]  dsp6455_1_emif_be_in_pad        ,
    input   wire [19:0] dsp6455_1_emif_addr_in_pad      ,
    inout   wire [31:0] dsp6455_1_emif_data_inout_pad   ,
    input   wire        dsp6455_1_emif_aoe_in_pad       ,
    input   wire        dsp6455_1_emif_awe_in_pad       ,

//---------------------------------------+--------------------------------------
//------------------------------ FLASH(28f00bp30e-bpi-x16) ------------------------------
    output  wire        s29gl_fcsb_out_pad              ,
    output  wire        s29gl_foeb_out_pad              ,
    output  wire        s29gl_fweb_out_pad              ,
    output  wire [22:0] s29gl_addr_out_pad              ,
    inout   wire [15:0] s29gl_data_inout_pad            ,
    output  wire        s29gl_advb_out_pad              ,

//---------------------------------------+--------------------------------------
//--------------------------------- LRM RS485s ---------------------------------
    (* ASYNC_REG = "TRUE" *)
    input   wire [7:0]  lrm_rs485_rxd_in_pad            ,
    output  wire [7:0]  lrm_rs485_txd_out_pad           ,
    output  wire [7:0]  lrm_rs485_den_out_pad           ,
    output  wire [7:0]  lrm_rs485_ren_out_pad           ,

//---------------------------------------+--------------------------------------
//---------------------------------- LRM LVDSs ---------------------------------
    inout   wire [35:0] lrm_lvds_p_inout_pad            ,
    inout   wire [35:0] lrm_lvds_n_inout_pad            ,

//---------------------------------------+--------------------------------------
//--------------------------------- Inter FPGA ---------------------------------
`ifdef FPGA0
    inout   wire [39:0] lvcmos_next_inout_pad           ,
    inout   wire [11:0] lvds_next_p_inout_pad           ,
    inout   wire [11:0] lvds_next_n_inout_pad           ,
`elsif FPGA1
    inout   wire [39:0] lvcmos_pre_inout_pad            ,
    inout   wire [11:0] lvds_pre_p_inout_pad            ,
    inout   wire [11:0] lvds_pre_n_inout_pad            ,
    inout   wire [19:0] lvcmos_next_inout_pad           ,
    inout   wire [11:0] lvds_next_p_inout_pad           ,
    inout   wire [11:0] lvds_next_n_inout_pad           ,
`elsif FPGA2
    inout   wire [19:0] lvcmos_pre_inout_pad            ,
    inout   wire [11:0] lvds_pre_p_inout_pad            ,
    inout   wire [11:0] lvds_pre_n_inout_pad            ,
    inout   wire [39:0] lvcmos_next_inout_pad           ,
    inout   wire [11:0] lvds_next_p_inout_pad           ,
    inout   wire [11:0] lvds_next_n_inout_pad           ,
`else
    inout   wire [39:0] lvcmos_pre_inout_pad            ,
    inout   wire [11:0] lvds_pre_p_inout_pad            ,
    inout   wire [11:0] lvds_pre_n_inout_pad            ,
`endif

//---------------------------------------+--------------------------------------
//----------------------------------- Aurora -----------------------------------
    input   wire        mgt_rx0_p_in_pad                ,
    input   wire        mgt_rx0_n_in_pad                ,
    output  wire        mgt_tx0_p_out_pad               ,
    output  wire        mgt_tx0_n_out_pad               ,

    input   wire        mgt_rx1_p_in_pad                ,
    input   wire        mgt_rx1_n_in_pad                ,
    output  wire        mgt_tx1_p_out_pad               ,
    output  wire        mgt_tx1_n_out_pad               ,

    input   wire        mgt_rx2_p_in_pad                ,
    input   wire        mgt_rx2_n_in_pad                ,
    output  wire        mgt_tx2_p_out_pad               ,
    output  wire        mgt_tx2_n_out_pad               ,

    input   wire        mgt_rx3_p_in_pad                ,
    input   wire        mgt_rx3_n_in_pad                ,
    output  wire        mgt_tx3_p_out_pad               ,
    output  wire        mgt_tx3_n_out_pad               ,

//---------------------------------------+--------------------------------------
//------------------------------------- GPO ------------------------------------
    output  wire [5:0]  gpo_out_pad                     ,

//---------------------------------------+--------------------------------------
//------------------------------------ DEBUG -----------------------------------
    output  wire [3:0]  board_led_out_pad               ,   // LEDs on board, light when high
    output  wire [1:0]  debug_led_out_pad                   // LEDs on external debug board
    );

////////////////////////////////////////////////////////////////////////////////
//                             OUTPUT ASSIGNMENT
////////////////////////////////////////////////////////////////////////////////
    assign gpo_out_pad[4:0] = 5'd0;
    assign s29gl_advb_out_pad = 1'b0;

////////////////////////////////////////////////////////////////////////////////
//                            PARAMETER DECLARATION
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//                            REG & WIRE DECLARATION
////////////////////////////////////////////////////////////////////////////////
    //=============== Clock&Reset ================
    wire            clk_100m_ibuf;
    wire            clk_32m512_ibuf;

    //=============== Inner control ==============
    wire            sat_mode;       // Control the mutiplex of LRM LVDS output
    wire            links_config;   // 1 JIDS, 0 ohters
    wire [2:0]      flash_zone_sel;
    wire [31:0]     flash_addr;
    wire [1:0]      flash_intf_qwen;
    wire            scm_mode;
    wire [7:0]      spm_markaddr;
    //=============== Information ================
    wire [7:0]      db_1_in;

    //================ Inter-FPGA ================
    wire [39:0]     lvcmos_pre_in;
    wire [39:0]     lvcmos_pre_out;
    wire [39:0]     lvcmos_pre_tri;

    wire [39:0]     lvcmos_next_in;
    wire [39:0]     lvcmos_next_out;
    wire [39:0]     lvcmos_next_tri;

    wire [11:0]     lvds_pre_in;
    wire [11:0]     lvds_pre_out;
    wire [11:0]     lvds_pre_tri;

    wire [11:0]     lvds_next_in;
    wire [11:0]     lvds_next_out;
    wire [11:0]     lvds_next_tri;

    //================ LRM RS485 =================
    wire [5:0]      lrm_rs485_txd;  // RS485 discrete output
    // wire []      lrm_rs485_rxd;

    // To UVPA/MCTRA/UVPS etc.
    wire [4:0]      uart_txd;       // UART (RS485/LVDS)
    wire [4:0]      uart_rxd;

    //================= LRM LVDS =================
    wire [35:0]     lrm_lvds_buf_in;
    wire [35:0]     lrm_lvds_buf_out;
    wire [35:0]     lrm_lvds_buf_tri;   // 0:output; 1:input
    // lrm_lvds_buf_out[25:23] is used as discrete signal or SPI signal. Following
    // signals is only for output signals.
    wire [2:0]      lrm_lvds_25_23_as_spi;
    wire [2:0]      lrm_lvds_25_23_as_dis;

    wire [6:0]      lrm_lvds_in;    // LVDS discrete input
    wire [18:0]     lrm_lvds_out;   // LVDS discrete output

    // SPI to DCTR
    wire [2:0]      spi_rx_sclk;    // SPI (LVDS)
    wire [2:0]      spi_rx_sdi;
    wire [2:0]      spi_rx_sen;
    wire [2:0]      spi_tx_sclk;
    wire [2:0]      spi_tx_sdo;
    wire [2:0]      spi_tx_sen;

    //========== DSP6455 EMIFA interface =========
    wire            dsp6455_0_emif_ce;
    wire [3:0]      dsp6455_0_emif_be;
    wire            dsp6455_0_emif_ardy;
    wire [31:0]     dsp6455_0_emif_addr;
    wire [31:0]     dsp6455_0_emif_rdata;
    wire            dsp6455_0_emif_we;
    wire            dsp6455_0_emif_oe;
    reg  [31:0]     dsp6455_0_emif_lock = 32'd0;
    wire [31:0]     dsp6455_0_emif_wdata;
    wire            dsp6455_0_intr;

    wire            dsp6455_1_emif_ce;
    wire [3:0]      dsp6455_1_emif_be;
    wire            dsp6455_1_emif_ardy;
    wire [31:0]     dsp6455_1_emif_addr;
    wire [31:0]     dsp6455_1_emif_rdata;
    wire            dsp6455_1_emif_we;
    wire            dsp6455_1_emif_oe;
    reg [31:0]      dsp6455_1_emif_lock = 32'd0;
    wire [31:0]     dsp6455_1_emif_wdata;
    wire            dsp6455_1_intr;

    //============= Waveform signal ==============
    wire            wf_axi_lite_aclk;
    wire            wf_axi_lite_aresetn;
    wire            wf_0_reset;
    wire            wf_1_reset;
    wire [7:0]      wf_intr;
    wire [6:0]      wf_sig_in;
    wire [24:0]     wf_sig_out;

    //============ WF AXI Lite master ============
    wire [31:0]     wf_s_axi_lite_0_araddr;
    wire [2:0]      wf_s_axi_lite_0_arprot;
    wire            wf_s_axi_lite_0_arready;
    wire            wf_s_axi_lite_0_arvalid;
    wire [31:0]     wf_s_axi_lite_0_awaddr;
    wire [2:0]      wf_s_axi_lite_0_awprot;
    wire            wf_s_axi_lite_0_awready;
    wire            wf_s_axi_lite_0_awvalid;
    wire            wf_s_axi_lite_0_bready;
    wire [1:0]      wf_s_axi_lite_0_bresp;
    wire            wf_s_axi_lite_0_bvalid;
    wire [31:0]     wf_s_axi_lite_0_rdata;
    wire            wf_s_axi_lite_0_rready;
    wire [1:0]      wf_s_axi_lite_0_rresp;
    wire            wf_s_axi_lite_0_rvalid;
    wire [31:0]     wf_s_axi_lite_0_wdata;
    wire            wf_s_axi_lite_0_wready;
    wire [3:0]      wf_s_axi_lite_0_wstrb;
    wire            wf_s_axi_lite_0_wvalid;
    wire [31:0]     wf_s_axi_lite_1_araddr;
    wire [2:0]      wf_s_axi_lite_1_arprot;
    wire            wf_s_axi_lite_1_arready;
    wire            wf_s_axi_lite_1_arvalid;
    wire [31:0]     wf_s_axi_lite_1_awaddr;
    wire [2:0]      wf_s_axi_lite_1_awprot;
    wire            wf_s_axi_lite_1_awready;
    wire            wf_s_axi_lite_1_awvalid;
    wire            wf_s_axi_lite_1_bready;
    wire [1:0]      wf_s_axi_lite_1_bresp;
    wire            wf_s_axi_lite_1_bvalid;
    wire [31:0]     wf_s_axi_lite_1_rdata;
    wire            wf_s_axi_lite_1_rready;
    wire [1:0]      wf_s_axi_lite_1_rresp;
    wire            wf_s_axi_lite_1_rvalid;
    wire [31:0]     wf_s_axi_lite_1_wdata;
    wire            wf_s_axi_lite_1_wready;
    wire [3:0]      wf_s_axi_lite_1_wstrb;
    wire            wf_s_axi_lite_1_wvalid;

    //============== WF AXI stream ===============
    wire            wf_axis_zif_clk;
    wire [31:0]     wf_axis_0_rx_tdata;
    wire [3:0]      wf_axis_0_rx_tkeep;
    wire            wf_axis_0_rx_tlast;
    wire            wf_axis_0_rx_tvalid;
    wire            wf_axis_0_rx_tready;
    wire [31:0]     wf_axis_0_tx_tdata;
    wire [3:0]      wf_axis_0_tx_tkeep;
    wire            wf_axis_0_tx_tlast;
    wire            wf_axis_0_tx_tready;
    wire            wf_axis_0_tx_tvalid;

    wire [31:0]     wf_axis_1_rx_tdata;
    wire [3:0]      wf_axis_1_rx_tkeep;
    wire            wf_axis_1_rx_tlast;
    wire            wf_axis_1_rx_tvalid;
    wire            wf_axis_1_rx_tready;
    wire [31:0]     wf_axis_1_tx_tdata;
    wire [3:0]      wf_axis_1_tx_tkeep;
    wire            wf_axis_1_tx_tlast;
    wire            wf_axis_1_tx_tready;
    wire            wf_axis_1_tx_tvalid;

    wire            wf_axis_pre_clk;
    wire [31:0]     wf_axis_pre_rx_tdata;
    wire [3:0]      wf_axis_pre_rx_tkeep;
    wire            wf_axis_pre_rx_tlast;
    wire            wf_axis_pre_rx_tvalid;
    wire            wf_axis_pre_rx_tready;
    wire [31:0]     wf_axis_pre_tx_tdata;
    wire [3:0]      wf_axis_pre_tx_tkeep;
    wire            wf_axis_pre_tx_tlast;
    wire            wf_axis_pre_tx_tready;
    wire            wf_axis_pre_tx_tvalid;

    wire            wf_axis_next_clk;
    wire [31:0]     wf_axis_next_rx_tdata;
    wire [3:0]      wf_axis_next_rx_tkeep;
    wire            wf_axis_next_rx_tlast;
    wire            wf_axis_next_rx_tvalid;
    wire            wf_axis_next_rx_tready;
    wire [31:0]     wf_axis_next_tx_tdata;
    wire [3:0]      wf_axis_next_tx_tkeep;
    wire            wf_axis_next_tx_tlast;
    wire            wf_axis_next_tx_tready;
    wire            wf_axis_next_tx_tvalid;

    //============= Waveform signal ==============
//    wire            mw_429_gd_high;
//    wire            mw_429_gd_low;
    wire            mw_b_code;
    wire            led_pulse;

    genvar k;

////////////////////////////////////////////////////////////////////////////////
//                                     CODE
////////////////////////////////////////////////////////////////////////////////
//                                   CONTENTS
// 1. Clock
// 2. Inter-FPGA interface
// 3. LRM interface
// 4. DSP EMIF interface
// 5. Midware
// 6. User waveform
//
//======================================+=======================================
// 1.                                 Clock
//------------------------------------------------------------------------------
// Clock structure:
//
//  100MHz---[IBUFGDS]---[clk_gen]---System
//                    |--------------Waveform
//
//  32.512MHz---[IBUFGDS]---Waveform
//
//------------------------------------------------------------------------------
    // 100MHz
    IBUFG clkin100M_buf
    (
        .O  (clk_100m_ibuf),
        .I  (clk_100m_in_pad)
    );

    // 32.512MHz
    IBUFG clkin32M512_buf
    (
        .O  (clk_32m512_ibuf),
        .I  (clk_32m512_in_pad)
    );

//======================================+=======================================
// 2.                         Inter-FPGA interface
//------------------------------------------------------------------------------
`ifdef FPGA0
    assign db_1_in = 8'd0;

    assign lvcmos_pre_in = 40'd0;
    assign lvds_pre_in =12'd0;

    generate
    for (k = 0; k < 40; k = k + 1)
    begin
        IOBUF #(
            .DRIVE(12), // Specify the output drive strength
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVCMOS33"),
            .SLEW("SLOW")
        ) IOBUF_next (
            .IO(lvcmos_next_inout_pad[k]),  // Buffer inout port (connect directly to top-level port)
            .O(lvcmos_next_in[k]),          // Buffer output
            .I(lvcmos_next_out[k]),         // Buffer input
            .T(lvcmos_next_tri[k])          // 3-state enable input, high=input, low=output
        );
    end

    for (k = 0; k < 12; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_next (
            .IO(lvds_next_p_inout_pad[k]),  // Diff_p inout (connect directly to top-level port)
            .IOB(lvds_next_n_inout_pad[k]), // Diff_n inout (connect directly to top-level port)
            .O(lvds_next_in[k]),            // Buffer output
            .I(lvds_next_out[k]),           // Buffer input
            .T(lvds_next_tri[k])            // 3-state enable input, high=input, low=output
        );
    end
    endgenerate

`elsif FPGA1
    assign db_1_in = 8'd1;

    assign lvcmos_next_in[39:20] = 20'd0;

    generate
    for (k = 0; k < 40; k = k + 1)
    begin
        IOBUF #(
            .DRIVE(12), // Specify the output drive strength
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVCMOS33"),
            .SLEW("SLOW")
        ) IOBUF_pre (
            .IO(lvcmos_pre_inout_pad[k]),     // Buffer inout port (connect directly to top-level port)
            .O(lvcmos_pre_in[k]),             // Buffer output
            .I(lvcmos_pre_out[k]),            // Buffer input
            .T(lvcmos_pre_tri[k])             // 3-state enable input, high=input, low=output
        );
    end

    for (k = 0; k < 20; k = k + 1)
    begin
        IOBUF #(
            .DRIVE(12), // Specify the output drive strength
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVCMOS33"),
            .SLEW("SLOW")
        ) IOBUF_next (
            .IO(lvcmos_next_inout_pad[k]),  // Buffer inout port (connect directly to top-level port)
            .O(lvcmos_next_in[k]),            // Buffer output
            .I(lvcmos_next_out[k]),           // Buffer input
            .T(lvcmos_next_tri[k])            // 3-state enable input, high=input, low=output
        );
    end

    for (k = 0; k < 12; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_pre (
            .IO(lvds_pre_p_inout_pad[k]),  // Diff_p inout (connect directly to top-level port)
            .IOB(lvds_pre_n_inout_pad[k]), // Diff_n inout (connect directly to top-level port)
            .O(lvds_pre_in[k]),             // Buffer output
            .I(lvds_pre_out[k]),            // Buffer input
            .T(lvds_pre_tri[k])             // 3-state enable input, high=input, low=output
        );
    end
    endgenerate

    generate
    for (k = 0; k < 12; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_next (
            .IO(lvds_next_p_inout_pad[k]),  // Diff_p inout (connect directly to top-level port)
            .IOB(lvds_next_n_inout_pad[k]), // Diff_n inout (connect directly to top-level port)
            .O(lvds_next_in[k]),            // Buffer output
            .I(lvds_next_out[k]),           // Buffer input
            .T(lvds_next_tri[k])            // 3-state enable input, high=input, low=output
        );
    end
    endgenerate

`elsif FPGA2
    assign db_1_in = 8'd2;

    assign lvcmos_pre_in[39:20] = 20'd0;

    generate
    for (k = 0; k < 20; k = k + 1)
    begin
        IOBUF #(
            .DRIVE(12), // Specify the output drive strength
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVCMOS33"),
            .SLEW("SLOW")
        ) IOBUF_pre (
            .IO(lvcmos_pre_inout_pad[k]),   // Buffer inout port (connect directly to top-level port)
            .O(lvcmos_pre_in[k]),             // Buffer output
            .I(lvcmos_pre_out[k]),            // Buffer input
            .T(lvcmos_pre_tri[k])             // 3-state enable input, high=input, low=output
        );
    end

    for (k = 0; k < 40; k = k + 1)
    begin
        IOBUF #(
            .DRIVE(12), // Specify the output drive strength
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUF_next (
            .IO(lvcmos_next_inout_pad[k]),  // Buffer inout port (connect directly to top-level port)
            .O(lvcmos_next_in[k]),          // Buffer output
            .I(lvcmos_next_out[k]),         // Buffer input
            .T(lvcmos_next_tri[k])          // 3-state enable input, high=input, low=output
        );
    end

    for (k = 0; k < 12; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_pre (
            .IO(lvds_pre_p_inout_pad[k]),  // Diff_p inout (connect directly to top-level port)
            .IOB(lvds_pre_n_inout_pad[k]), // Diff_n inout (connect directly to top-level port)
            .O(lvds_pre_in[k]),             // Buffer output
            .I(lvds_pre_out[k]),            // Buffer input
            .T(lvds_pre_tri[k])             // 3-state enable input, high=input, low=output
        );
    end
    endgenerate

    generate
    for (k = 0; k < 12; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_next (
            .IO(lvds_next_p_inout_pad[k]),  // Diff_p inout (connect directly to top-level port)
            .IOB(lvds_next_n_inout_pad[k]), // Diff_n inout (connect directly to top-level port)
            .O(lvds_next_in[k]),            // Buffer output
            .I(lvds_next_out[k]),           // Buffer input
            .T(lvds_next_tri[k])            // 3-state enable input, high=input, low=output
        );
    end
    endgenerate

`else
    assign db_1_in = 8'd3;

    assign lvcmos_next_in = 40'd0;
    assign lvds_next_in = 12'd0;

    generate
    for (k = 0; k < 40; k = k + 1)
    begin
        IOBUF #(
            .DRIVE(12), // Specify the output drive strength
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUF_pre (
            .IO(lvcmos_pre_inout_pad[k]),   // Buffer inout port (connect directly to top-level port)
            .O(lvcmos_pre_in[k]),           // Buffer output
            .I(lvcmos_pre_out[k]),          // Buffer input
            .T(lvcmos_pre_tri[k])           // 3-state enable input, high=input, low=output
        );
    end

    for (k = 0; k < 12; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_pre (
            .IO(lvds_pre_p_inout_pad[k]),  // Diff_p inout (connect directly to top-level port)
            .IOB(lvds_pre_n_inout_pad[k]), // Diff_n inout (connect directly to top-level port)
            .O(lvds_pre_in[k]),             // Buffer output
            .I(lvds_pre_out[k]),            // Buffer input
            .T(lvds_pre_tri[k])             // 3-state enable input, high=input, low=output
        );
    end
    endgenerate

`endif

//======================================+=======================================
// 3.                             LRM interface
//------------------------------------------------------------------------------
// Re-assign LRM interface, including RS485 UART / RS485 descrete / LVDS descrete
// / LVDS SPI / LVDS UART.
// In this part, we set the direction of RS485 and differential-buffered LVDS.
// We classified the signals into bus and discrete signals. Bus signals are UART
// and SPI. Then we concatenate all discrete signals into vectors of input/output
// signals to/from waveform component, and named them as 'wf_sig_in' and
// 'wf_sig_out'. For different waveform, the usage of discrete signals is
// different. See channel sheet of <<SPM back board connection.xlsx>> for the
// usage of discrete signals for every waveform.
//------------------------------------------------------------------------------

    // Set direction for RS485
    assign lrm_rs485_den_out_pad = 8'b1110_1101; // Active high
    assign lrm_rs485_ren_out_pad = 8'b1110_1101; // Active low

    // Set direction for LVDS
    generate
    for (k = 0; k < 36; k = k + 1)
    begin
        IOBUFDS #(
            .DIFF_TERM("TRUE"),
            .IBUF_LOW_PWR("TRUE"),
            .IOSTANDARD("LVDS_18"),
            .SLEW("SLOW")
        ) IOBUFDS_inst (
            .IO(lrm_lvds_p_inout_pad[k]),    // Diff_p inout (connect directly to top-level port)
            .IOB(lrm_lvds_n_inout_pad[k]),   // Diff_n inout (connect directly to top-level port)
            .O(lrm_lvds_buf_in[k]),          // Buffer output
            .I(lrm_lvds_buf_out[k]),         // Buffer input
            .T(lrm_lvds_buf_tri[k])          // 3-state enable input, high=input, low=output
        );
    end
    endgenerate
    assign lrm_lvds_buf_tri = 36'b0111_1110_1111_1111_1011_0000_1110_0011_1000;

    // --------- Remap RS485 and LVDS ---------
    // Refer to the MAX_TYPE sheet of <<SPM back board connection.xlsx>>.
    // UART
    assign {lrm_lvds_buf_out[18], lrm_lvds_buf_out[7],lrm_lvds_buf_out[1], lrm_rs485_txd_out_pad[2], lrm_rs485_txd_out_pad[0]} = scm_mode ? {uart_txd[4:3],lrm_lvds_buf_in[30],uart_txd[1],lrm_lvds_buf_in[34]}:uart_txd;

    assign uart_rxd = scm_mode ? {lrm_lvds_buf_in[17], lrm_lvds_buf_in[10], 3'b111} : {lrm_lvds_buf_in[17], lrm_lvds_buf_in[10], lrm_lvds_buf_in[4],1'b1, lrm_rs485_rxd_in_pad[1]};

    // RS485 Discrete

    // assign lrm_rs485_rxd = ; // No RS485 input

    // SPI, lrm_lvds_buf_in[22:20] and lrm_lvds_buf_out[25:23] are re-used as SPI for SAT waveform
//    assign spi_rx_sclk  = {lrm_lvds_buf_in[20], lrm_lvds_buf_in[13], lrm_lvds_buf_in[2]};
//    assign spi_rx_sen   = ~{lrm_lvds_buf_in[21], lrm_lvds_buf_in[14], lrm_lvds_buf_in[3]};
//    assign spi_rx_sdi   = {lrm_lvds_buf_in[22], lrm_lvds_buf_in[15], lrm_lvds_buf_in[4]};
//    assign {lrm_lvds_25_23_as_spi[0], lrm_lvds_buf_out[16], lrm_lvds_buf_out[5]} = spi_tx_sclk[2:0];
//    assign {lrm_lvds_25_23_as_spi[1], lrm_lvds_buf_out[17], lrm_lvds_buf_out[6]} = ~spi_tx_sen[2:0];
//    assign {lrm_lvds_25_23_as_spi[2], lrm_lvds_buf_out[18], lrm_lvds_buf_out[7]} = spi_tx_sdo[2:0];

    // LVDS Discrete
    assign lrm_lvds_in = {3'b0,mw_b_code,2'b0, lrm_lvds_buf_in[16]};

    assign lrm_lvds_buf_out[12] = scm_mode ? lrm_lvds_buf_in[31] : lrm_lvds_out[0];
    assign lrm_lvds_buf_out[15:13] = lrm_lvds_buf_in[22:20];
    assign lrm_lvds_buf_out[35] = scm_mode ? lrm_rs485_rxd_in_pad[1] : 1'b1;
    assign lrm_lvds_buf_out[28] = scm_mode ? lrm_lvds_buf_in[4] : 1'b1;
    // Mutiplex lrm_lvds_buf_out[25:23] between SAT waveform and others
//    assign lrm_lvds_buf_out[25:23] = (sat_mode) ? lrm_lvds_25_23_as_spi : lrm_lvds_25_23_as_dis;

    // --------- Concatenate discrete signals ---------
    // TO waveform
    assign wf_sig_in = lrm_lvds_in;

    assign lrm_rs485_txd = wf_sig_out[5:0];
    assign lrm_lvds_out = wf_sig_out[24:6];
//======================================+=======================================
// 4.                           DSP EMIF interface
//------------------------------------------------------------------------------
    // DSP6455 0
    assign dsp6455_0_emif_ce    = dsp6455_0_emif_ce2_in_pad;
    assign dsp6455_0_emif_oe    = dsp6455_0_emif_aoe_in_pad;
    assign dsp6455_0_emif_we    = dsp6455_0_emif_awe_in_pad;
    assign dsp6455_0_emif_be    = ~dsp6455_0_emif_be_in_pad;
    assign dsp6455_0_emif_ardy_out_pad = dsp6455_0_emif_ardy | dsp6455_0_emif_ce ? 1'bz : 1'b0;

    // dsp6455_0_emif_addr_in_pad[19:11] device choise; [10:0] device operation offset address
    assign dsp6455_0_emif_addr    = {10'd0, dsp6455_0_emif_addr_in_pad[19:0], 2'b00};

    assign dsp6455_0_emif_data_inout_pad = ((dsp6455_0_emif_ce == 1'b0)
                                && (dsp6455_0_emif_oe == 1'b0))
                                ? dsp6455_0_emif_rdata : 32'hzzzzzzzz;
    assign dsp6455_0_emif_wdata   = dsp6455_0_emif_data_inout_pad;
    assign dsp6455_0_intr_out_pad = dsp6455_0_intr;

    // DSP6455 1
`ifdef FPGA0
    assign dsp6455_1_emif_ce = (links_config) ? dsp6455_1_emif_ce4_in_pad : 1'b1;
`elsif FPGA1
    assign dsp6455_1_emif_ce = 1'b1;
`elsif FPGA2
    assign dsp6455_1_emif_ce = 1'b1;
`else
    assign dsp6455_1_emif_ce = 1'b1;
`endif

    assign dsp6455_1_emif_oe    = dsp6455_1_emif_aoe_in_pad;
    assign dsp6455_1_emif_we    = dsp6455_1_emif_awe_in_pad;
    assign dsp6455_1_emif_be    = ~dsp6455_1_emif_be_in_pad;
    assign dsp6455_1_emif_ardy_out_pad = dsp6455_1_emif_ardy | dsp6455_1_emif_ce ? 1'bz : 1'b0;

    assign dsp6455_1_emif_addr      = {10'd0, dsp6455_1_emif_addr_in_pad[19:0],2'b0};

    assign dsp6455_1_emif_data_inout_pad = ((dsp6455_1_emif_ce == 1'b0)
                                && (dsp6455_1_emif_oe == 1'b0))
                                ? dsp6455_1_emif_rdata : 32'hzzzzzzzz;
    assign dsp6455_1_emif_wdata   = dsp6455_1_emif_data_inout_pad;
    assign gpo_out_pad[5] = dsp6455_1_intr;   // Used as interrupt to DSP 1

//======================================+=======================================
// 5.                               Midware
//------------------------------------------------------------------------------
    bus_architecture_wrapper bus_architecture (
        .clk_in                     (clk_100m_ibuf          ),
        .resetn_in                  (reset_in_pad           ),
        .heartbeat_out              (heartbeat_out_pad      ),
        // EMIF from TMS320C6455 0
        .dsp6455_0_emif_bus_ce_in   (dsp6455_0_emif_ce      ),
        .dsp6455_0_emif_bus_oe_in   (dsp6455_0_emif_oe      ),
        .dsp6455_0_emif_bus_we_in   (dsp6455_0_emif_we      ),
        .dsp6455_0_emif_bus_be_in   (dsp6455_0_emif_be      ),
        .dsp6455_0_emif_bus_rdy_out (dsp6455_0_emif_ardy    ),
        .dsp6455_0_emif_bus_addr_in (dsp6455_0_emif_addr    ),
        .dsp6455_0_emif_bus_data_out(dsp6455_0_emif_rdata   ),
        .dsp6455_0_emif_bus_data_in (dsp6455_0_emif_wdata   ),
        .dsp6455_0_intr             (dsp6455_0_intr         ),
        // EMIF from TMS320C6455 1
        .dsp6455_1_emif_bus_ce_in   (dsp6455_1_emif_ce      ),
        .dsp6455_1_emif_bus_oe_in   (dsp6455_1_emif_oe      ),
        .dsp6455_1_emif_bus_we_in   (dsp6455_1_emif_we      ),
        .dsp6455_1_emif_bus_be_in   (dsp6455_1_emif_be      ),
        .dsp6455_1_emif_bus_rdy_out (dsp6455_1_emif_ardy    ),
        .dsp6455_1_emif_bus_addr_in (dsp6455_1_emif_addr    ),
        .dsp6455_1_emif_bus_data_out(dsp6455_1_emif_rdata   ),
        .dsp6455_1_emif_bus_data_in (dsp6455_1_emif_wdata   ),
        .dsp6455_1_intr             (dsp6455_1_intr         ),
        // Aurora
        .gt_refclk_clk_n            (gtx_clk_125m_n_in_pad  ),
        .gt_refclk_clk_p            (gtx_clk_125m_p_in_pad  ),
        .gt_serial_rx0_rxn          (mgt_rx0_n_in_pad       ),
        .gt_serial_rx0_rxp          (mgt_rx0_p_in_pad       ),
        .gt_serial_tx0_txn          (mgt_tx0_n_out_pad      ),
        .gt_serial_tx0_txp          (mgt_tx0_p_out_pad      ),
        .gt_serial_rx1_rxn          (mgt_rx1_n_in_pad       ),
        .gt_serial_rx1_rxp          (mgt_rx1_p_in_pad       ),
        .gt_serial_tx1_txn          (mgt_tx1_n_out_pad      ),
        .gt_serial_tx1_txp          (mgt_tx1_p_out_pad      ),
        .gt_serial_rx2_rxn          (mgt_rx2_n_in_pad       ),
        .gt_serial_rx2_rxp          (mgt_rx2_p_in_pad       ),
        .gt_serial_tx2_txn          (mgt_tx2_n_out_pad      ),
        .gt_serial_tx2_txp          (mgt_tx2_p_out_pad      ),
        .gt_serial_rx3_rxn          (mgt_rx3_n_in_pad       ),
        .gt_serial_rx3_rxp          (mgt_rx3_p_in_pad       ),
        .gt_serial_tx3_txn          (mgt_tx3_n_out_pad      ),
        .gt_serial_tx3_txp          (mgt_tx3_p_out_pad      ),
        // LRM SPI to DCTR
        .spix_0_rx_sclk_in          (spi_rx_sclk[0]         ),
        .spix_0_rx_sdi_in           (spi_rx_sdi[0]          ),
        .spix_0_rx_sen_in           (spi_rx_sen[0]          ),
        .spix_0_tx_sclk_out         (spi_tx_sclk[0]         ),
        .spix_0_tx_sdo_out          (spi_tx_sdo[0]          ),
        .spix_0_tx_sen_out          (spi_tx_sen[0]          ),
        .spix_1_rx_sclk_in          (spi_rx_sclk[1]         ),
        .spix_1_rx_sdi_in           (spi_rx_sdi[1]          ),
        .spix_1_rx_sen_in           (spi_rx_sen[1]          ),
        .spix_1_tx_sclk_out         (spi_tx_sclk[1]         ),
        .spix_1_tx_sdo_out          (spi_tx_sdo[1]          ),
        .spix_1_tx_sen_out          (spi_tx_sen[1]          ),
        .spix_2_rx_sclk_in          (spi_rx_sclk[2]         ),
        .spix_2_rx_sdi_in           (spi_rx_sdi[2]          ),
        .spix_2_rx_sen_in           (spi_rx_sen[2]          ),
        .spix_2_tx_sclk_out         (spi_tx_sclk[2]         ),
        .spix_2_tx_sdo_out          (spi_tx_sdo[2]          ),
        .spix_2_tx_sen_out          (spi_tx_sen[2]          ),
        // LRM RS485 UART
        .uart_0_rxd_in              (uart_rxd[0]            ),
        .uart_0_txd_out             (uart_txd[0]            ),
        .uart_1_rxd_in              (uart_rxd[1]            ),
        .uart_1_txd_out             (uart_txd[1]            ),
        .uart_2_rxd_in              (uart_rxd[2]            ),
        .uart_2_txd_out             (uart_txd[2]            ),
        .uart_3_rxd_in              (uart_rxd[3]            ),
        .uart_3_txd_out             (uart_txd[3]            ),
        .uart_4_rxd_in              (uart_rxd[4]            ),
        .uart_4_txd_out             (uart_txd[4]            ),
        // Waveform signals
        .axi_lite_aclk_out          (wf_axi_lite_aclk       ),
        .axi_lite_aresetn_out       (wf_axi_lite_aresetn    ),
        .wf_0_reset_out             (wf_0_reset             ),
        .wf_1_reset_out             (wf_1_reset             ),
        .wf_intr_in                 (wf_intr                ),
        // Waveform AXI Lite (master)
        .wf_m_axi_lite_0_araddr     (wf_s_axi_lite_0_araddr ),
        .wf_m_axi_lite_0_arprot     (wf_s_axi_lite_0_arprot ),
        .wf_m_axi_lite_0_arready    (wf_s_axi_lite_0_arready),
        .wf_m_axi_lite_0_arvalid    (wf_s_axi_lite_0_arvalid),
        .wf_m_axi_lite_0_awaddr     (wf_s_axi_lite_0_awaddr ),
        .wf_m_axi_lite_0_awprot     (wf_s_axi_lite_0_awprot ),
        .wf_m_axi_lite_0_awready    (wf_s_axi_lite_0_awready),
        .wf_m_axi_lite_0_awvalid    (wf_s_axi_lite_0_awvalid),
        .wf_m_axi_lite_0_bready     (wf_s_axi_lite_0_bready ),
        .wf_m_axi_lite_0_bresp      (wf_s_axi_lite_0_bresp  ),
        .wf_m_axi_lite_0_bvalid     (wf_s_axi_lite_0_bvalid ),
        .wf_m_axi_lite_0_rdata      (wf_s_axi_lite_0_rdata  ),
        .wf_m_axi_lite_0_rready     (wf_s_axi_lite_0_rready ),
        .wf_m_axi_lite_0_rresp      (wf_s_axi_lite_0_rresp  ),
        .wf_m_axi_lite_0_rvalid     (wf_s_axi_lite_0_rvalid ),
        .wf_m_axi_lite_0_wdata      (wf_s_axi_lite_0_wdata  ),
        .wf_m_axi_lite_0_wready     (wf_s_axi_lite_0_wready ),
        .wf_m_axi_lite_0_wstrb      (wf_s_axi_lite_0_wstrb  ),
        .wf_m_axi_lite_0_wvalid     (wf_s_axi_lite_0_wvalid ),
        .wf_m_axi_lite_1_araddr     (wf_s_axi_lite_1_araddr ),
        .wf_m_axi_lite_1_arprot     (wf_s_axi_lite_1_arprot ),
        .wf_m_axi_lite_1_arready    (wf_s_axi_lite_1_arready),
        .wf_m_axi_lite_1_arvalid    (wf_s_axi_lite_1_arvalid),
        .wf_m_axi_lite_1_awaddr     (wf_s_axi_lite_1_awaddr ),
        .wf_m_axi_lite_1_awprot     (wf_s_axi_lite_1_awprot ),
        .wf_m_axi_lite_1_awready    (wf_s_axi_lite_1_awready),
        .wf_m_axi_lite_1_awvalid    (wf_s_axi_lite_1_awvalid),
        .wf_m_axi_lite_1_bready     (wf_s_axi_lite_1_bready ),
        .wf_m_axi_lite_1_bresp      (wf_s_axi_lite_1_bresp  ),
        .wf_m_axi_lite_1_bvalid     (wf_s_axi_lite_1_bvalid ),
        .wf_m_axi_lite_1_rdata      (wf_s_axi_lite_1_rdata  ),
        .wf_m_axi_lite_1_rready     (wf_s_axi_lite_1_rready ),
        .wf_m_axi_lite_1_rresp      (wf_s_axi_lite_1_rresp  ),
        .wf_m_axi_lite_1_rvalid     (wf_s_axi_lite_1_rvalid ),
        .wf_m_axi_lite_1_wdata      (wf_s_axi_lite_1_wdata  ),
        .wf_m_axi_lite_1_wready     (wf_s_axi_lite_1_wready ),
        .wf_m_axi_lite_1_wstrb      (wf_s_axi_lite_1_wstrb  ),
        .wf_m_axi_lite_1_wvalid     (wf_s_axi_lite_1_wvalid ),
        // Waveform AXI stream for ZIF sample data
        .wf_data_user_clk           (wf_axis_zif_clk        ),
        .wf_data_axis_0_rx_tdata    (wf_axis_0_rx_tdata     ),
        .wf_data_axis_0_rx_tkeep    (wf_axis_0_rx_tkeep     ),
        .wf_data_axis_0_rx_tlast    (wf_axis_0_rx_tlast     ),
        .wf_data_axis_0_rx_tvalid   (wf_axis_0_rx_tvalid    ),
        .wf_data_axis_0_rx_tready   (1'b1                   ),
        .wf_data_axis_0_tx_tdata    (wf_axis_0_tx_tdata     ),
        .wf_data_axis_0_tx_tkeep    (wf_axis_0_tx_tkeep     ),
        .wf_data_axis_0_tx_tlast    (wf_axis_0_tx_tlast     ),
        .wf_data_axis_0_tx_tvalid   (wf_axis_0_tx_tvalid    ),
        .wf_data_axis_0_tx_tready   (wf_axis_0_tx_tready    ),
        .wf_data_axis_1_rx_tdata    (wf_axis_1_rx_tdata     ),
        .wf_data_axis_1_rx_tkeep    (wf_axis_1_rx_tkeep     ),
        .wf_data_axis_1_rx_tlast    (wf_axis_1_rx_tlast     ),
        .wf_data_axis_1_rx_tvalid   (wf_axis_1_rx_tvalid    ),
        .wf_data_axis_1_rx_tready   (1'b1                   ),
        .wf_data_axis_1_tx_tdata    (wf_axis_1_tx_tdata     ),
        .wf_data_axis_1_tx_tkeep    (wf_axis_1_tx_tkeep     ),
        .wf_data_axis_1_tx_tlast    (wf_axis_1_tx_tlast     ),
        .wf_data_axis_1_tx_tvalid   (wf_axis_1_tx_tvalid    ),
        .wf_data_axis_1_tx_tready   (wf_axis_1_tx_tready    ),
        // AXI stream interface for inter-FPGA communication (Shared)
        .s_axis_pre_rx_tdata        (wf_axis_pre_rx_tdata   ),
        .s_axis_pre_rx_tkeep        (wf_axis_pre_rx_tkeep   ),
        .s_axis_pre_rx_tlast        (wf_axis_pre_rx_tlast   ),
        .s_axis_pre_rx_tvalid       (wf_axis_pre_rx_tvalid  ),
        .s_axis_pre_tx_tdata        (wf_axis_pre_tx_tdata   ),
        .s_axis_pre_tx_tkeep        (wf_axis_pre_tx_tkeep   ),
        .s_axis_pre_tx_tlast        (wf_axis_pre_tx_tlast   ),
        .s_axis_pre_tx_tready       (wf_axis_pre_tx_tready  ),
        .s_axis_pre_tx_tvalid       (wf_axis_pre_tx_tvalid  ),
        .s_axis_next_rx_tdata       (wf_axis_next_rx_tdata  ),
        .s_axis_next_rx_tkeep       (wf_axis_next_rx_tkeep  ),
        .s_axis_next_rx_tlast       (wf_axis_next_rx_tlast  ),
        .s_axis_next_rx_tvalid      (wf_axis_next_rx_tvalid ),
        .s_axis_next_tx_tdata       (wf_axis_next_tx_tdata  ),
        .s_axis_next_tx_tkeep       (wf_axis_next_tx_tkeep  ),
        .s_axis_next_tx_tlast       (wf_axis_next_tx_tlast  ),
        .s_axis_next_tx_tready      (wf_axis_next_tx_tready ),
        .s_axis_next_tx_tvalid      (wf_axis_next_tx_tvalid ),
        // Flash(S29GL02GP)
        .flash_high_addr_out        (flash_zone_sel         ),
        .flash_intf_addr            (flash_addr             ),
        .flash_intf_ce_n            (s29gl_fcsb_out_pad     ),
        .flash_intf_dq_io           (s29gl_data_inout_pad   ),
        .flash_intf_oen             (s29gl_foeb_out_pad     ),
        .flash_intf_qwen            (flash_intf_qwen        ),
        // Information
        .db_1_in                    (db_1_in                ),
        // Inner control
        .links_config_out           (links_config           ),
        .scm_mode_out               (scm_mode               ),

        .rx_high_429_in             (1'b0                   ),
        .rx_low_429_in              (1'b0                   ),
        .b_code_in                  (mw_b_code              ),
        .spm_markaddr_out           (spm_markaddr           ),
        // LEDs
        .board_led_out              (board_led_out_pad      ),
        .debug_led_out              (/*not used*/               )
    );

    assign s29gl_addr_out_pad[19:0] = {flash_addr[20:2], ~flash_addr[1]};
    assign s29gl_addr_out_pad[22:20] = flash_zone_sel;
    assign s29gl_fweb_out_pad = flash_intf_qwen[0];

    // Midware FPGA
`ifdef FPGA0
    assign mw_b_code = lrm_lvds_buf_in[19];
`elsif FPGA1
    assign mw_b_code = 1'b0;
`elsif FPGA2
    assign mw_b_code = 1'b0;
`else
    assign mw_b_code = 1'b0;
`endif

//======================================+=======================================
// 6.                            User waveform
//------------------------------------------------------------------------------
// Two reset signals are connected to the waveform component, and can be asserted
// independently by DSP.
//------------------------------------------------------------------------------
    Waveform Waveform (
        // System signals
        .clk_100M_in                (clk_100m_ibuf          ),  // Output from IBUFGDS
        .clk_32M512_in              (clk_32m512_ibuf        ),  // Output from IBUFGDS
        .reset0_in                  (wf_0_reset             ),
        .reset1_in                  (wf_1_reset             ),
        .axi_lite_aclk_in           (wf_axi_lite_aclk       ),
        .axi_lite_aresetn_in        (wf_axi_lite_aresetn    ),
        // AXI Lite slave interface 0
        .s_axi_lite_0_araddr_in     (wf_s_axi_lite_0_araddr ),
        .s_axi_lite_0_arprot_in     (wf_s_axi_lite_0_arprot ),
        .s_axi_lite_0_arready_out   (wf_s_axi_lite_0_arready),
        .s_axi_lite_0_arvalid_in    (wf_s_axi_lite_0_arvalid),
        .s_axi_lite_0_awaddr_in     (wf_s_axi_lite_0_awaddr ),
        .s_axi_lite_0_awprot_in     (wf_s_axi_lite_0_awprot ),
        .s_axi_lite_0_awready_out   (wf_s_axi_lite_0_awready),
        .s_axi_lite_0_awvalid_in    (wf_s_axi_lite_0_awvalid),
        .s_axi_lite_0_bready_in     (wf_s_axi_lite_0_bready ),
        .s_axi_lite_0_bresp_out     (wf_s_axi_lite_0_bresp  ),
        .s_axi_lite_0_bvalid_out    (wf_s_axi_lite_0_bvalid ),
        .s_axi_lite_0_rdata_out     (wf_s_axi_lite_0_rdata  ),
        .s_axi_lite_0_rready_in     (wf_s_axi_lite_0_rready ),
        .s_axi_lite_0_rresp_out     (wf_s_axi_lite_0_rresp  ),
        .s_axi_lite_0_rvalid_out    (wf_s_axi_lite_0_rvalid ),
        .s_axi_lite_0_wdata_in      (wf_s_axi_lite_0_wdata  ),
        .s_axi_lite_0_wready_out    (wf_s_axi_lite_0_wready ),
        .s_axi_lite_0_wstrb_in      (wf_s_axi_lite_0_wstrb  ),
        .s_axi_lite_0_wvalid_in     (wf_s_axi_lite_0_wvalid ),
        // AXI Lite slave interface 1
        .s_axi_lite_1_araddr_in     (wf_s_axi_lite_1_araddr ),
        .s_axi_lite_1_arprot_in     (wf_s_axi_lite_1_arprot ),
        .s_axi_lite_1_arready_out   (wf_s_axi_lite_1_arready),
        .s_axi_lite_1_arvalid_in    (wf_s_axi_lite_1_arvalid),
        .s_axi_lite_1_awaddr_in     (wf_s_axi_lite_1_awaddr ),
        .s_axi_lite_1_awprot_in     (wf_s_axi_lite_1_awprot ),
        .s_axi_lite_1_awready_out   (wf_s_axi_lite_1_awready),
        .s_axi_lite_1_awvalid_in    (wf_s_axi_lite_1_awvalid),
        .s_axi_lite_1_bready_in     (wf_s_axi_lite_1_bready ),
        .s_axi_lite_1_bresp_out     (wf_s_axi_lite_1_bresp  ),
        .s_axi_lite_1_bvalid_out    (wf_s_axi_lite_1_bvalid ),
        .s_axi_lite_1_rdata_out     (wf_s_axi_lite_1_rdata  ),
        .s_axi_lite_1_rready_in     (wf_s_axi_lite_1_rready ),
        .s_axi_lite_1_rresp_out     (wf_s_axi_lite_1_rresp  ),
        .s_axi_lite_1_rvalid_out    (wf_s_axi_lite_1_rvalid ),
        .s_axi_lite_1_wdata_in      (wf_s_axi_lite_1_wdata  ),
        .s_axi_lite_1_wready_out    (wf_s_axi_lite_1_wready ),
        .s_axi_lite_1_wstrb_in      (wf_s_axi_lite_1_wstrb  ),
        .s_axi_lite_1_wvalid_in     (wf_s_axi_lite_1_wvalid ),
        // AXI stream interface for ZIF sample data
        .axis_zif_clk_in            (wf_axis_zif_clk        ),
        .axis_0_rx_tdata_in         (wf_axis_0_rx_tdata     ),
        .axis_0_rx_tkeep_in         (wf_axis_0_rx_tkeep     ),
        .axis_0_rx_tlast_in         (wf_axis_0_rx_tlast     ),
        .axis_0_rx_tvalid_in        (wf_axis_0_rx_tvalid    ),
        .axis_0_tx_tdata_out        (wf_axis_0_tx_tdata     ),
        .axis_0_tx_tkeep_out        (wf_axis_0_tx_tkeep     ),
        .axis_0_tx_tlast_out        (wf_axis_0_tx_tlast     ),
        .axis_0_tx_tready_in        (wf_axis_0_tx_tready    ),
        .axis_0_tx_tvalid_out       (wf_axis_0_tx_tvalid    ),
        .axis_1_rx_tdata_in         (wf_axis_1_rx_tdata     ),
        .axis_1_rx_tkeep_in         (wf_axis_1_rx_tkeep     ),
        .axis_1_rx_tlast_in         (wf_axis_1_rx_tlast     ),
        .axis_1_rx_tvalid_in        (wf_axis_1_rx_tvalid    ),
        .axis_1_tx_tdata_out        (wf_axis_1_tx_tdata     ),
        .axis_1_tx_tkeep_out        (wf_axis_1_tx_tkeep     ),
        .axis_1_tx_tlast_out        (wf_axis_1_tx_tlast     ),
        .axis_1_tx_tready_in        (wf_axis_1_tx_tready    ),
        .axis_1_tx_tvalid_out       (wf_axis_1_tx_tvalid    ),
        // AXI stream interface for inter-FPGA communication (Shared)
        .axis_pre_clk_in            (wf_axis_zif_clk        ),
        .axis_pre_rx_tdata_in       (wf_axis_pre_rx_tdata   ),
        .axis_pre_rx_tkeep_in       (wf_axis_pre_rx_tkeep   ),
        .axis_pre_rx_tlast_in       (wf_axis_pre_rx_tlast   ),
        .axis_pre_rx_tvalid_in      (wf_axis_pre_rx_tvalid  ),
        .axis_pre_tx_tdata_out      (wf_axis_pre_tx_tdata   ),
        .axis_pre_tx_tkeep_out      (wf_axis_pre_tx_tkeep   ),
        .axis_pre_tx_tlast_out      (wf_axis_pre_tx_tlast   ),
        .axis_pre_tx_tready_in      (wf_axis_pre_tx_tready  ),
        .axis_pre_tx_tvalid_out     (wf_axis_pre_tx_tvalid  ),
        .axis_next_clk_in           (wf_axis_zif_clk        ),
        .axis_next_rx_tdata_in      (wf_axis_next_rx_tdata  ),
        .axis_next_rx_tkeep_in      (wf_axis_next_rx_tkeep  ),
        .axis_next_rx_tlast_in      (wf_axis_next_rx_tlast  ),
        .axis_next_rx_tvalid_in     (wf_axis_next_rx_tvalid ),
        .axis_next_tx_tdata_out     (wf_axis_next_tx_tdata  ),
        .axis_next_tx_tkeep_out     (wf_axis_next_tx_tkeep  ),
        .axis_next_tx_tlast_out     (wf_axis_next_tx_tlast  ),
        .axis_next_tx_tready_in     (wf_axis_next_tx_tready ),
        .axis_next_tx_tvalid_out    (wf_axis_next_tx_tvalid ),
        // Inter-FPGA discrete signals (Shared)
        .lvds_pre_sig_in            (lvds_pre_in            ),
        .lvds_pre_sig_out           (lvds_pre_out           ),
        .lvds_pre_sig_tri_out       (lvds_pre_tri           ),
        .lvcmos_pre_sig_in          (lvcmos_pre_in          ),
        .lvcmos_pre_sig_out         (lvcmos_pre_out         ),
        .lvcmos_pre_sig_tri_out     (lvcmos_pre_tri         ),
        .lvds_next_sig_in           (lvds_next_in           ),
        .lvds_next_sig_out          (lvds_next_out          ),
        .lvds_next_sig_tri_out      (lvds_next_tri          ),
        .lvcmos_next_sig_in         (lvcmos_next_in         ),
        .lvcmos_next_sig_out        (lvcmos_next_out        ),
        .lvcmos_next_sig_tri_out    (lvcmos_next_tri        ),
        // LRM Discrete signals (Shared)
        .lrm_sig_in                 (wf_sig_in              ),
        .lrm_sig_out                (wf_sig_out             ),
        .led_pulse                  (led_pulse              ),
        // Interrupt
        .intr_out                   (wf_intr                )
    );

    assign debug_led_out_pad = {1'b0,led_pulse};
endmodule

//module Waveform(
//    // System signals
//    input   wire        clk_100M_in             ,
//    input   wire        clk_32M512_in           ,
//    input   wire        reset0_in               ,
//    input   wire        reset1_in               ,
//    input   wire        axi_lite_aclk_in        ,
//    input   wire        axi_lite_aresetn_in     ,
//    // AXI Lite slave interface 0
//    input   wire [31:0] s_axi_lite_0_araddr_in  ,
//    input   wire [2:0]  s_axi_lite_0_arprot_in  ,
//    output  wire        s_axi_lite_0_arready_out,
//    input   wire        s_axi_lite_0_arvalid_in ,
//    input   wire [31:0] s_axi_lite_0_awaddr_in  ,
//    input   wire [2:0]  s_axi_lite_0_awprot_in  ,
//    input   wire        s_axi_lite_0_awready_in ,
//    input   wire        s_axi_lite_0_awvalid_in ,
//    input   wire        s_axi_lite_0_bready_in  ,
//    output  wire [1:0]  s_axi_lite_0_bresp_out  ,
//    output  wire        s_axi_lite_0_bvalid_out ,
//    output  wire [31:0] s_axi_lite_0_rdata_out  ,
//    input   wire        s_axi_lite_0_rready_in  ,
//    output  wire [1:0]  s_axi_lite_0_rresp_out  ,
//    output  wire        s_axi_lite_0_rvalid_out ,
//    input   wire [31:0] s_axi_lite_0_wdata_in   ,
//    output  wire        s_axi_lite_0_wready_out ,
//    input   wire [3:0]  s_axi_lite_0_wstrb_in   ,
//    input   wire        s_axi_lite_0_wvalid_in  ,
//    // AXI Lite slave interface 1
//    input   wire [31:0] s_axi_lite_1_araddr_in  ,
//    input   wire [2:0]  s_axi_lite_1_arprot_in  ,
//    output  wire        s_axi_lite_1_arready_out,
//    input   wire        s_axi_lite_1_arvalid_in ,
//    input   wire [31:0] s_axi_lite_1_awaddr_in  ,
//    input   wire [2:0]  s_axi_lite_1_awprot_in  ,
//    input   wire        s_axi_lite_1_awready_in ,
//    input   wire        s_axi_lite_1_awvalid_in ,
//    input   wire        s_axi_lite_1_bready_in  ,
//    output  wire [1:0]  s_axi_lite_1_bresp_out  ,
//    output  wire        s_axi_lite_1_bvalid_out ,
//    output  wire [31:0] s_axi_lite_1_rdata_out  ,
//    input   wire        s_axi_lite_1_rready_in  ,
//    output  wire [1:0]  s_axi_lite_1_rresp_out  ,
//    output  wire        s_axi_lite_1_rvalid_out ,
//    input   wire [31:0] s_axi_lite_1_wdata_in   ,
//    output  wire        s_axi_lite_1_wready_out ,
//    input   wire [3:0]  s_axi_lite_1_wstrb_in   ,
//    input   wire        s_axi_lite_1_wvalid_in  ,
//    // AXI stream interface for ZIF sample data
//    input   wire        axis_zif_clk_in         ,
//    input   wire [15:0] axis_0_rx_tdata_in      ,
//    input   wire [1:0]  axis_0_rx_tkeep_in      ,
//    input   wire        axis_0_rx_tlast_in      ,
//    input   wire        axis_0_rx_tvalid_in     ,
//    output  wire [15:0] axis_0_tx_tdata_out     ,
//    output  wire [1:0]  axis_0_tx_tkeep_out     ,
//    output  wire        axis_0_tx_tlast_out     ,
//    input   wire        axis_0_tx_tready_in     ,
//    output  wire        axis_0_tx_tvalid_out    ,
//    input   wire [15:0] axis_1_rx_tdata_in      ,
//    input   wire [1:0]  axis_1_rx_tkeep_in      ,
//    input   wire        axis_1_rx_tlast_in      ,
//    input   wire        axis_1_rx_tvalid_in     ,
//    // AXI stream interface for inter-FPGA communication (Shared)
//    input   wire        axis_pre_clk_in         ,
//    input   wire [15:0] axis_pre_rx_tdata_in    ,
//    input   wire [1:0]  axis_pre_rx_tkeep_in    ,
//    input   wire        axis_pre_rx_tlast_in    ,
//    input   wire        axis_pre_rx_tvalid_in   ,
//    output  wire [15:0] axis_pre_tx_tdata_out   ,
//    output  wire [1:0]  axis_pre_tx_tkeep_out   ,
//    output  wire        axis_pre_tx_tlast_out   ,
//    input   wire        axis_pre_tx_tready_in   ,
//    output  wire        axis_pre_tx_tvalid_out  ,
//    input   wire        axis_next_clk_in        ,
//    input   wire [15:0] axis_next_rx_tdata_in   ,
//    input   wire [1:0]  axis_next_rx_tkeep_in   ,
//    input   wire        axis_next_rx_tlast_in   ,
//    input   wire        axis_next_rx_tvalid_in  ,
//    output  wire [15:0] axis_next_tx_tdata_out  ,
//    output  wire [1:0]  axis_next_tx_tkeep_out  ,
//    output  wire        axis_next_tx_tlast_out  ,
//    input   wire        axis_next_tx_tready_in  ,
//    output  wire        axis_next_tx_tvalid_out ,
//    // Inter-FPGA discrete signals (Shared)
//    input   wire [11:0] lvds_pre_sig_in         ,
//    output  wire [11:0] lvds_pre_sig_out        ,
//    output  wire [11:0] lvds_pre_sig_tri_out    ,
//    input   wire [39:0] lvcmos_pre_sig_in       ,
//    output  wire [39:0] lvcmos_pre_sig_out      ,
//    output  wire [39:0] lvcmos_pre_sig_tri_out  ,
//    input   wire [11:0] lvds_next_sig_in        ,
//    output  wire [11:0] lvds_next_sig_out       ,
//    output  wire [11:0] lvds_next_sig_tri_out   ,
//    input   wire [39:0] lvcmos_next_sig_in      ,
//    output  wire [39:0] lvcmos_next_sig_out     ,
//    output  wire [39:0] lvcmos_next_sig_tri_out ,
//    // LRM Discrete signals (Shared)
//    input   wire [2:0]  lrm_sig_in              ,
//    output  wire [21:0] lrm_sig_out             ,
//    // Interrupt
//    output  wire [7:0]  intr_out
//);

//endmodule
