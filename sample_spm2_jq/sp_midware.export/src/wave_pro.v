// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : wave_pro.v
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

module wave_pro #(
parameter                           U_DLY = 1
)(
input                               rst_n,
input                               axi4_lite_clk,
input                               axi4_lite_awvalid,
output  wire                        axi4_lite_awready,
input           [31:0]              axi4_lite_awaddr,
input                               axi4_lite_wvalid,
output  wire                        axi4_lite_wready,
input           [31:0]              axi4_lite_wdata,
output  wire                        axi4_lite_bvalid,
input                               axi4_lite_bready,
output  wire    [1:0]               axi4_lite_bresp,
input                               axi4_lite_arvalid,
output  wire                        axi4_lite_arready,
input           [31:0]              axi4_lite_araddr,
output  wire                        axi4_lite_rvalid,
input                               axi4_lite_rready,
output  wire    [31:0]              axi4_lite_rdata,
output  wire    [1:0]               axi4_lite_rresp,

input                               axis_clk,
output  wire                        axis_rx_tready,
input                               axis_rx_tvalid,
input           [31:0]              axis_rx_tdata,
input                               axis_rx_tlast,
output  wire                        axis_tx_tvalid,
output  wire    [31:0]              axis_tx_tdata,
input                               axis_tx_tready,
output  wire                        axis_tx_tlast
);
// Parameter Define

// Register Define
reg                                 cpu_we_dly;
reg                                 cpu_rd_dly;

// Wire Define
wire    [15:0]                      lbs_addr;
wire    [31:0]                      lbs_din;
wire    [31:0]                      lbs_dout;
wire                                lbs_we;
wire                                lbs_re;
(* MARK_DEBUG="true" *)
wire    [15:0]                      cpu_addr;
(* MARK_DEBUG="true" *)
wire                                cpu_cs;
(* MARK_DEBUG="true" *)
wire    [31:0]                      cpu_wdata;
(* MARK_DEBUG="true" *)
wire                                cpu_we;
(* MARK_DEBUG="true" *)
wire                                cpu_rd;
(* MARK_DEBUG="true" *)
wire    [31:0]                      cpu_rdata;

axi4_lite_pro #(
    .U_DLY                      (U_DLY                      ),
//  Bus protocol parameters
    .C_BASEADDR                 (32'h0000_0000              ),
    .C_HIGHADDR                 (32'h0000_ffff              )
)
u_axi4_lite(
    .rst_n                      (rst_n                      ),
    .clk                        (axi4_lite_clk              ),
    .awvalid                    (axi4_lite_awvalid          ),
    .awready                    (axi4_lite_awready          ),
    .awaddr                     (axi4_lite_awaddr           ),
    .wvalid                     (axi4_lite_wvalid           ),
    .wready                     (axi4_lite_wready           ),
    .wdata                      (axi4_lite_wdata            ),
    .bvalid                     (axi4_lite_bvalid           ),
    .bready                     (axi4_lite_bready           ),
    .bresp                      (axi4_lite_bresp            ),
    .arvalid                    (axi4_lite_arvalid          ),
    .arready                    (axi4_lite_arready          ),
    .araddr                     (axi4_lite_araddr           ),
    .rvalid                     (axi4_lite_rvalid           ),
    .rready                     (axi4_lite_rready           ),
    .rdata                      (axi4_lite_rdata            ),
    .rresp                      (axi4_lite_rresp            ),
    .cpu_addr                   (cpu_addr                   ),
    .cpu_cs                     (cpu_cs                     ),
    .cpu_wdata                  (cpu_wdata                  ),
    .cpu_we                     (cpu_we                     ),
    .cpu_rd                     (cpu_rd                     ),
    .cpu_rdata                  (cpu_rdata                  )
);

assign lbs_addr = {2'd0,cpu_addr[15:2]};
assign lbs_din = cpu_wdata;
assign cpu_rdata = lbs_dout;
always @(posedge axi4_lite_clk or negedge rst_n)
begin
    if (rst_n == 1'b0)
        begin
            cpu_we_dly <= 1'b1;
            cpu_rd_dly <= 1'b1;
        end
    else
        begin
            cpu_we_dly <= #U_DLY cpu_we;
            cpu_rd_dly <= #U_DLY cpu_rd;
        end
end

assign lbs_we = (~cpu_cs) & ({cpu_we_dly,cpu_we} == 2'b10);
assign lbs_rd = (~cpu_cs) & ({cpu_rd_dly,cpu_we} == 2'b10);

conv_top #(
    .U_DLY                      (U_DLY                      )
)
u_conv_top(
    .rst_n                      (rst_n                      ),
    .lbs_clk                    (axi4_lite_clk              ),
    .lbs_addr                   (lbs_addr                   ),
    .lbs_din                    (lbs_din                    ),
    .lbs_dout                   (lbs_dout                   ),
    .lbs_we                     (lbs_we                     ),
    .lbs_re                     (lbs_re                     ),

    .axis_clk                   (axis_clk                   ),
    .axis_rx_tready             (axis_rx_tready             ),
    .axis_rx_tvalid             (axis_rx_tvalid             ),
    .axis_rx_tdata              (axis_rx_tdata              ),
    .axis_rx_tlast              (axis_rx_tlast              ),
    .axis_tx_tvalid             (axis_tx_tvalid             ),
    .axis_tx_tdata              (axis_tx_tdata              ),
    .axis_tx_tready             (axis_tx_tready             ),
    .axis_tx_tlast              (axis_tx_tlast              )
);

endmodule

