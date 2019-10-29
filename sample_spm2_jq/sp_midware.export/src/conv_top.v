// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : conv_top.v
// Module Ver   : V1.0
// Abstract     :
//
// CopyRight(c) 2014, Authors
// All Rights Reserved
//
// Modification History:
// V1.0         initial
// =================================================================================/
`timescale 1ns/1ns

module conv_top #(
parameter                           U_DLY = 1
)(
input                               rst_n,
input                               lbs_clk,
input           [15:0]              lbs_addr,
input           [31:0]              lbs_din,
output  reg     [31:0]              lbs_dout,
input                               lbs_we,
input                               lbs_re,

input                               axis_clk,
output  wire                        axis_0_rx_tready,
input                               axis_0_rx_tvalid,
input           [31:0]              axis_0_rx_tdata,
input                               axis_0_rx_tlast,
output  wire                        axis_1_rx_tready,
input                               axis_1_rx_tvalid,
input           [31:0]              axis_1_rx_tdata,
input                               axis_1_rx_tlast,
output  wire                        axis_0_tx_tvalid,
output  wire    [31:0]              axis_0_tx_tdata,
input                               axis_0_tx_tready,
output  wire                        axis_0_tx_tlast,
output  wire                        axis_1_tx_tvalid,
output  wire    [31:0]              axis_1_tx_tdata,
input                               axis_1_tx_tready,
output  wire                        axis_1_tx_tlast,
output  reg                         led_pulse
);
// Parameter Define

// Register Define
reg                                 tx_chn_sel;
reg                                 rx_chn_sel;
reg     [3:0]                       led_cnt;
reg     [1:0]                       rx_chn_sel_sync;
reg     [1:0]                       tx_chn_sel_sync;

// Wire Define
wire                                clk_25d6m;
wire                                lo_valid;
wire    [15:0]                      lo_cos;
wire    [15:0]                      lo_sin;
wire    [31:0]                      ddc_conv_data;
wire    [13:0]                      ddc_conv_waddr;
wire    [31:0]                      duc_base_data;
wire    [31:0]                      duc_cmd_register;
wire                                axis_tx_tvalid;
wire                                axis_tx_tlast;
wire    [31:0]                      axis_tx_tdata;
wire                                axis_tx_tready;
wire                                axis_rx_tready;
wire                                axis_rx_tvalid;
wire    [31:0]                      axis_rx_tdata;
wire                                axis_rx_tlast;
(* MARK_DEBUG="true" *)
wire                                locked;


clk_wiz_25d6M
u_clk_25d6m
(
    .clk_out1                   (clk_25d6m                  ),     // output clk_out1
    .reset                      (~rst_n                     ), // input reset
    .locked                     (locked                     ),       // output locked
    .clk_in1                    (lbs_clk                    )       // input clk_in1
);

dds_compiler_4d2M
u_dds_compiler_4d2m(
    .aclk                       (clk_25d6m                  ),                              // input wire aclk
    .m_axis_data_tvalid         (lo_valid                   ),  // output wire m_axis_data_tvalid
    .m_axis_data_tdata          ({lo_cos,lo_sin}            )     // output wire [31 : 0] m_axis_data_tdata
);

always @(posedge axis_clk)
begin
    rx_chn_sel_sync <= #U_DLY {rx_chn_sel_sync[0],rx_chn_sel};
    tx_chn_sel_sync <= #U_DLY {tx_chn_sel_sync[0],tx_chn_sel};
end

assign axis_0_rx_tready = axis_rx_tready;
assign axis_1_rx_tready = axis_rx_tready;
assign axis_rx_tdata = (rx_chn_sel_sync[1]) ? axis_1_rx_tdata : axis_0_rx_tdata;
assign axis_rx_tvalid = (rx_chn_sel_sync[1]) ? axis_1_rx_tvalid : axis_0_rx_tvalid;
assign axis_rx_tlast = (rx_chn_sel_sync[1]) ? axis_1_rx_tlast : axis_0_rx_tlast;

ddc_conv #(
    .U_DLY                      (U_DLY                      )
)
u_ddc_conv(
    .rst_n                      (rst_n & locked             ),
    .axis_clk                   (axis_clk                   ),
    .axis_tready                (axis_rx_tready             ),
    .axis_tvalid                (axis_rx_tvalid             ),
    .axis_tdata                 (axis_rx_tdata              ),
    .axis_tlast                 (axis_rx_tlast              ),
    .clk_25d6m                  (clk_25d6m                  ),
    .lo_sin                     (lo_sin                     ),
    .lo_cos                     (lo_cos                     ),
    .lbs_clk                    (lbs_clk                    ),
    .lbs_addr                   (lbs_addr                   ),
    .ddc_conv_data              (ddc_conv_data              ),
    .ddc_conv_waddr             (ddc_conv_waddr             )
);

duc_conv #(
    .U_DLY                      (U_DLY                      )
)
u_duc_conv(
    .rst_n                      (rst_n & locked             ),
    .lbs_clk                    (lbs_clk                    ),
    .lbs_we                     (lbs_we                     ),
    .lbs_addr                   (lbs_addr                   ),
    .lbs_din                    (lbs_din                    ),
    .clk_25d6m                  (clk_25d6m                  ),
    .lo_sin                     (lo_sin                     ),
    .lo_cos                     (lo_cos                     ),
    .axis_clk                   (axis_clk                   ),
    .duc_tvalid                 (axis_tx_tvalid             ),
    .duc_tlast                  (axis_tx_tlast              ),
    .duc_tdata                  (axis_tx_tdata              ),
    .duc_tready                 (axis_tx_tready             ),
    .duc_base_data              (duc_base_data              ),
    .duc_cmd_register           (duc_cmd_register           )
);
assign axis_0_tx_tvalid = (tx_chn_sel_sync[1]) ? 1'b0 : axis_tx_tvalid;
assign axis_1_tx_tvalid = (tx_chn_sel_sync[1]) ? axis_tx_tvalid : 1'b0;
assign axis_0_tx_tlast = (tx_chn_sel_sync[1]) ? 1'b0 : axis_tx_tlast;
assign axis_1_tx_tlast = (tx_chn_sel_sync[1]) ? axis_tx_tlast : 1'b0;
assign axis_0_tx_tdata = axis_tx_tdata;
assign axis_1_tx_tdata = axis_tx_tdata;
assign axis_tx_tready = (tx_chn_sel_sync[1]) ? axis_1_tx_tready : axis_0_tx_tready;

always @ (posedge lbs_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            tx_chn_sel <= 1'b0;
            rx_chn_sel <= 1'b0;
            led_pulse <= 1'b0;
            led_cnt <= #U_DLY 4'd0;
        end
    else
        begin
            if(lbs_we == 1'b1 && lbs_addr == 16'd16001)
                begin
                    if(lbs_din == 32'h0000_5555)
                        rx_chn_sel <= #U_DLY 1'b0;
                    else if(lbs_din == 32'h0000_8888)
                        rx_chn_sel <= #U_DLY 1'b1;
                    else;
                end
            else;

            if(lbs_we == 1'b1 && lbs_addr == 16'd16002)
                begin
                    if(lbs_din == 32'h0000_5555)
                        tx_chn_sel <= #U_DLY 1'b0;
                    else if(lbs_din == 32'h0000_8888)
                        tx_chn_sel <= #U_DLY 1'b1;
                    else;
                end
            else;

            if(lbs_we == 1'b1 && lbs_addr == 16'd16003 && lbs_din == 32'h0000_5555)
                led_pulse <= #U_DLY 1'b1;
            else if(led_cnt == 4'd0)
                led_pulse <= #U_DLY 1'b0;
            else;

            if(led_pulse == 1'b1)
                led_cnt <= #U_DLY 4'd9;
            else if(led_cnt > 4'd0)
                led_cnt <= #U_DLY led_cnt - 4'd1;
            else;
        end
end

always @ (posedge lbs_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        lbs_dout <= 32'd0;
    else
        begin
            if(lbs_addr <= 16'd11520)   //2d00
                lbs_dout <= #U_DLY ddc_conv_data;   //
            else if(lbs_addr == 16'd11521)
                lbs_dout <= #U_DLY {18'd0,ddc_conv_waddr};
            else if(lbs_addr >= 16'd12000 && lbs_addr <= 16'd14304)
                lbs_dout <= #U_DLY duc_base_data;
            else if(lbs_addr == 16'd16000)
                lbs_dout <= #U_DLY duc_cmd_register;
            else if(lbs_addr == 16'd16001)
                lbs_dout <= #U_DLY {31'd0,rx_chn_sel};
            else if(lbs_addr == 16'd16002)
                lbs_dout <= #U_DLY {31'd0,tx_chn_sel};
            else
                lbs_dout <= #U_DLY 32'd0;
        end
end

endmodule

