// *********************************************************************************
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : axi4_lite_pro.v
// Module Name  :
// Called By    :
// Abstract     :
//
// CopyRight(c) 2014, Authors
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// 1. initial
// *********************************************************************************/
// *************************
// MODULE DEFINITION
// *************************
`timescale 1 ns / 1 ns
//the axi addresses are from 0x5000_0000 to 0x5000_ffff
module axi4_lite_pro #(
parameter             U_DLY      = 1,
//  Bus protocol parameters
parameter             C_BASEADDR = 32'hffff_ffff,
parameter             C_HIGHADDR = 32'h0000_0000,
parameter             C_S_AXI_DATA_WIDTH = 32   ,
parameter             C_S_AXI_ADDR_WIDTH = 32   ,
parameter             C_SLV_AWIDTH       = 32   ,
parameter             C_SLV_DWIDTH       = 32   ,
parameter             C_USE_WSTRB        = 0    ,
parameter             C_S_AXI_MIN_SIZE   = 32'h0000_01ff,
parameter             C_CPU_ADDR_WIDTH   = 16   ,
parameter             C_DPHASE_TIMEOUT   = 8
                      )
                      (
input                 rst_n,
input                 clk,
//axi-lite interface
input                 awvalid,
output reg            awready,
input      [31:0]     awaddr,
//input      [2:0]      awprot,                 //3'b001

input                 wvalid,
output reg            wready,
input      [31:0]     wdata,
//input      [3:0]      wstrb,

output reg            bvalid,
input                 bready,
output     [1:0]      bresp,                   //2'b00: OKAY    2'b01: EXOKAY    2'b10:SLVERR    2'b11:DECERR

input                 arvalid,
output reg            arready,
input      [31:0]     araddr,
//input      [2:0]      arprot,

output reg            rvalid,
input                 rready,
output reg [31:0]     rdata,
output     [1:0]      rresp,
//CPU register interface(PL)
output reg [C_CPU_ADDR_WIDTH-1:0]     cpu_addr,
output reg            cpu_cs,
output reg [31:0]     cpu_wdata,
output reg            cpu_we,
output reg            cpu_rd,
input      [31:0]     cpu_rdata
                      );

localparam            C_BASEADDR_DOMAN = C_BASEADDR >> 20;

reg                   access_process;
reg        [2:0]      cs_cnt;
reg        [1:0]      we_cnt;
reg                   rd_pre;
reg        [1:0]      rd_cnt;
reg                   cpu_rd_dly;

assign bresp = 2'b00;
assign rresp = 2'b00;

always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        begin
            awready <= 1'b0;
            arready <= 1'b0;
        end
    else
        begin
            if(access_process == 1'b0)
                begin
                    if(awready == 1'b1)
                        awready <= #U_DLY 1'b0;
                    else if(awvalid == 1'b1)
                        awready <= #U_DLY 1'b1;
                    else;
                end
            else
                awready <= #U_DLY 1'b0;

            if(access_process == 1'b0)
                begin
                    if(arready == 1'b1)
                        arready <= #U_DLY 1'b0;
                    else if(arvalid == 1'b1 && awvalid == 1'b0)     //write first
                        arready <= #U_DLY 1'b1;
                    else;
                end
            else
                arready <= #U_DLY 1'b0;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        access_process <= 1'b0;
    else
        begin
            if({awvalid,awready} == 2'b11 || {arvalid,arready} == 2'b11)
                access_process <= #U_DLY 1'b1;
            else if(cpu_cs == 1'b1)
                access_process <= #U_DLY 1'b0;
            else;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        begin
            wready <= 1'b0;
            bvalid <= 1'b0;
        end
    else
        begin
            if({wvalid,wready} == 2'b11)
                wready <= #U_DLY 1'b0;
            else if({awvalid,awready} == 2'b11)
                wready <= #U_DLY 1'b1;
            else;

            if(we_cnt == 2'b11 && cpu_we == 1'b0)
                bvalid <= #U_DLY 1'b1;
            else if(bready == 1'b1)
                bvalid <= #U_DLY 1'b0;
            else;
        end
end


always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        begin
            cpu_addr <= {C_CPU_ADDR_WIDTH{1'd0}};
            cpu_cs <= 1'b1;
            cs_cnt <= 3'b00;
        end
    else
        begin
            if({awvalid,awready} == 2'b11)
                cpu_addr <= #U_DLY awaddr[C_CPU_ADDR_WIDTH-1:0];
            else if({arvalid,arready} == 2'b11)
                cpu_addr <= #U_DLY araddr[C_CPU_ADDR_WIDTH-1:0];
            else;

            if(({awvalid,awready} == 2'b11 && awaddr[31:20] == C_BASEADDR_DOMAN) || ({arvalid,arready} == 2'b11 && araddr[31:20] == C_BASEADDR_DOMAN))
                cpu_cs <= #U_DLY 1'b0;
            else if(cs_cnt == 3'b111)
                cpu_cs <= #U_DLY 1'b1;
            else;

            if(({awvalid,awready} == 2'b11 && awaddr[31:20] == C_BASEADDR_DOMAN) || ({arvalid,arready} == 2'b11 && araddr[31:20] == C_BASEADDR_DOMAN))
                cs_cnt <= #U_DLY 3'd0;
            else if(cpu_cs == 1'b0)
                cs_cnt <= #U_DLY cs_cnt + 3'd1;
            else;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        begin
            cpu_wdata <= 32'd0;
            cpu_we <= 1'b1;
            we_cnt <= 2'b00;
            cpu_rd <= 1'b1;
            rd_pre <= 1'b0;
            rd_cnt <= 2'b00;
        end
    else
        begin
           if({wvalid,wready} == 2'b11)
               cpu_wdata <= #U_DLY wdata;
           else;

           if({wvalid,wready} == 2'b11)
               cpu_we <= #U_DLY 1'b0;
           else if(we_cnt == 2'b11)
               cpu_we <= #U_DLY 1'b1;
           else;

           if({wvalid,wready} == 2'b11)
               we_cnt <= #U_DLY 2'd0;
           else if(cpu_we == 1'b0)
               we_cnt <= #U_DLY we_cnt + 2'd1;
           else;

           if({arvalid,arready} == 2'b11)
               rd_pre <= #U_DLY 1'b1;
           else
               rd_pre <= #U_DLY 1'b0;

           if(rd_pre == 1'b1)
               cpu_rd <= #U_DLY 1'b0;
           else if(rd_cnt == 2'b11)
               cpu_rd <= #U_DLY 1'b1;
           else;

           if({arvalid,arready} == 2'b11)
               rd_cnt <= #U_DLY 2'd0;
           else if(cpu_rd == 1'b0)
               rd_cnt <= #U_DLY rd_cnt + 2'd1;
           else;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        begin
            cpu_rd_dly <= 1'b1;
            rvalid <= 1'b0;
            rdata <= 32'd0;
        end
    else
        begin
            cpu_rd_dly <= #U_DLY cpu_rd;

            if({cpu_rd_dly,cpu_rd} == 2'b01)
                rvalid <= #U_DLY 1'b1;
            else if(rready == 1'b1)
                rvalid <= #U_DLY 1'b0;
            else;

            if({cpu_rd_dly,cpu_rd} == 2'b01)
                rdata <= #U_DLY cpu_rdata;
            else;
        end
end



endmodule








