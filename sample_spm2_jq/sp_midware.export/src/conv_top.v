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

// Wire Define
wire                                clk_25d6m;
wire                                lo_valid;
wire    [15:0]                      lo_cos;
wire    [15:0]                      lo_sin;
wire    [31:0]                      ddc_conv_data;
wire    [13:0]                      ddc_conv_waddr;
wire    [31:0]                      duc_base_data;
wire    [31:0]                      duc_cmd_register;
(* MARK_DEBUG="true" *)
wire                                locked;


clk_wiz_25d6M
u_clk_25d6m
(
    .clk_out1                   (clk_25d6m                  ),     // output clk_out1
    .reset                      (~rst_n                     ), // input reset
    .locked                     (locked                     ),       // output locked
    .clk_in1                    (axis_clk                   )       // input clk_in1
);

dds_compiler_4d2M
u_dds_compiler_4d2m(
    .aclk                       (clk_25d6m                  ),                              // input wire aclk
    .m_axis_data_tvalid         (lo_valid                   ),  // output wire m_axis_data_tvalid
    .m_axis_data_tdata          ({lo_cos,lo_sin}            )     // output wire [31 : 0] m_axis_data_tdata
);

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

always @ (posedge lbs_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        lbs_dout <= 32'd0;
    else
        begin
            if(lbs_addr <= 16'd11520)
                lbs_dout <= #U_DLY ddc_conv_data;
            else if(lbs_addr == 16'd11521)
                lbs_dout <= #U_DLY {18'd0,ddc_conv_waddr};
            else if(lbs_addr >= 16'd12000 && lbs_addr <= 16'd14304)
                lbs_dout <= #U_DLY duc_base_data;
            else if(lbs_addr == 16'd16000)
                lbs_dout <= #U_DLY duc_cmd_register;
            else
                lbs_dout <= #U_DLY 32'd0;
        end
end

endmodule

