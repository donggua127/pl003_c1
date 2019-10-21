// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : testmult.v
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

module testmult;

// Parameter Define

// Register Define

// Wire Define

reg clk;
reg [15:0] a,b;
wire [31:0] p;

initial
begin
    clk = 0;
    forever
        #(10) clk = ~clk;
end


mult_signed
u0_mult_signed(
    .CLK                        (clk                        ),      // input wire CLK
    .A                          (a                          ),      // input wire [15 : 0] A
    .B                          (b                          ),      // input wire [15 : 0] B
    .P                          (p                           )       // output wire [31 : 0] P
);

initial
begin
    @(posedge clk);
    a = 16'h8003;
    b = 16'hffff;

    @(posedge clk);
    a = 16'h8000;
    b = 16'h8000;

    @(posedge clk);
    a = 16'h8009;
    b = 16'h000a;
end
endmodule

