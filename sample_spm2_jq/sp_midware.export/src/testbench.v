// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : testbench.v
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

module testbench;

// Parameter Define
localparam                          AXIS_CLK_FREQ_HZ = 62500000;
localparam                          LBS_CLK_FREQ_HZ = 100000000;

localparam                          LBS_CLK_HALF_PERIOD_NS = 1000000000.0/LBS_CLK_FREQ_HZ/2;
localparam                          AXIS_CLK_HALF_PERIOD_NS = 1000000000.0/AXIS_CLK_FREQ_HZ/2;
// Register Define
reg                                 rst_n;
reg                                 lbs_clk;
reg                                 axis_clk;
reg     [15:0]                      lbs_addr;
reg     [31:0]                      lbs_din;
reg                                 lbs_we;
reg                                 lbs_re;
reg     [15:0]                      duc_base_data[2303:0];

// Wire Define
wire                                axis_tx_tready;
wire                                axis_tx_tvalid;
wire    [31:0]                      axis_tx_tdata;
wire                                axis_tx_tlast;
wire                                axis_rx_tready;
wire                                axis_rx_tvalid;
wire    [31:0]                      axis_rx_tdata;
wire                                axis_rx_tlast;
wire    [31:0]                      lbs_dout;
wire                                led_pulse;

initial
begin
    rst_n = 1'b0;
    #1000;
    rst_n = 1'b1;
end


initial
begin
    lbs_clk = 1'b0;
    forever
        #(LBS_CLK_HALF_PERIOD_NS) lbs_clk = ~lbs_clk;
end

initial
begin
    axis_clk = 1'b0;
    forever
        #(AXIS_CLK_HALF_PERIOD_NS) axis_clk = ~axis_clk;
end

initial
begin
    $readmemh("f:/testdata.txt", duc_base_data);
end

integer i;
initial
begin
    lbs_we = 1'b0;
    lbs_din = 32'd0;
    lbs_re = 1'b0;
    lbs_addr = 16'd0;
    wait(rst_n == 1'b1);
    #18000;
    lbs_write(16'd16000,32'h0000_5555);
    for(i=0;i<2304;i=i+1)
        begin
            lbs_write(16'd12000+i,{duc_base_data[i],duc_base_data[i]});
        end
    lbs_write(16'd16000,32'h0000_8888);

    lbs_write(16'd16000,32'h0000_FFFF);
end

task lbs_write;
   input [15:0] addr;
   input [31:0] value;
   begin
       @(posedge lbs_clk);
       #1;
       lbs_we = 1'b1;
       lbs_addr = addr;
       lbs_din = value;
       @(posedge lbs_clk);
       #1;
       lbs_we = 1'b0;
   end
endtask

task lbs_read;
    input [15:0] addr;
    output [31:0] data;
    begin
       @(posedge lbs_clk);
       #1;
       lbs_re = 1'b1;
       lbs_addr = addr;
       @(posedge lbs_clk);
       #1;
       lbs_we = 1'b0;
       @(posedge lbs_clk);
       @(posedge lbs_clk);
       #1;
       data = lbs_dout;
    end
endtask



conv_top
u_conv_top(
    .rst_n                      (rst_n                      ),
    .lbs_clk                    (lbs_clk                    ),
    .lbs_addr                   (lbs_addr                   ),
    .lbs_din                    (lbs_din                    ),
    .lbs_dout                   (lbs_dout                   ),
    .lbs_we                     (lbs_we                     ),
    .lbs_re                     (lbs_re                     ),
    .axis_0_rx_tready           (axis_rx_tready             ),
    .axis_0_rx_tvalid           (axis_rx_tvalid             ),
    .axis_0_rx_tdata            (axis_rx_tdata              ),
    .axis_0_rx_tlast            (axis_rx_tlast              ),
    .axis_1_rx_tready           (                           ),
    .axis_1_rx_tvalid           (1'b0                       ),
    .axis_1_rx_tdata            (32'd0                      ),
    .axis_1_rx_tlast            (1'b0                       ),
    .axis_0_tx_tvalid           (axis_tx_tvalid             ),
    .axis_0_tx_tdata            (axis_tx_tdata              ),
    .axis_0_tx_tready           (axis_tx_tready             ),
    .axis_0_tx_tlast            (axis_tx_tlast              ),
    .axis_1_tx_tvalid           (/*not used*/               ),
    .axis_1_tx_tdata            (/*not used*/               ),
    .axis_1_tx_tready           (1'b0                       ),
    .axis_1_tx_tlast            (/*not used*/               ),
    .led_pulse                  (led_pulse                  ),
    .axis_clk                   (axis_clk                   )
);

assign axis_rx_tvalid = axis_tx_tvalid;
assign axis_rx_tdata = axis_tx_tdata;
assign axis_tx_tready = axis_rx_tready;
assign axis_rx_tlast = 1'b0;

endmodule

