// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : dds_clken.v
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

module dds_clken #(
parameter                           U_DLY = 1
)(
input                               clk,
input                               rst_n,
input           [31:0]              fw,
output  reg                         enb
);
// Parameter Define

// Register Define
reg     [32:0]                      acc;
reg                                 acc_msb;

// Wire Define

//160k: 26843546
//96k : 16106127

always @ (posedge clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            acc <= 33'd0;
            acc_msb <= 1'b0;
            enb <= 1'b0;
        end
    else
        begin
            acc <= #U_DLY acc + fw;

            acc_msb <= #U_DLY acc[32];

            if(acc_msb != acc[32])
                enb <= #U_DLY 1'b1;
            else
                enb <= #U_DLY 1'b0;
        end
end
endmodule

