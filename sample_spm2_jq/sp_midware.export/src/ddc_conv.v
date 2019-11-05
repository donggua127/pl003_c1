// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : ddc_conv.v
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

module ddc_conv #(
parameter                           U_DLY = 1
)(
input                               rst_n,
input                               axis_clk,
output  wire                        axis_tready,
input                               axis_tvalid,
input           [31:0]              axis_tdata,
input                               axis_tlast,
input                               clk_25d6m,
input           [15:0]              lo_sin,
input           [15:0]              lo_cos,
input                               lbs_clk,
input           [13:0]              lbs_addr,
output  wire    [31:0]              ddc_conv_data,
output  reg     [13:0]              ddc_conv_waddr
);
// Parameter Define
//160k: 26843546
//96k : 16106127
localparam                          FW_CLKEN_160K = 32'd26843546;
localparam                          FW_CLKEN_96K = 32'd16106127;
localparam                          MAX_ADDR = 14'd11519;


// Register Define
reg     [2:0]                       ram_wen_sync;
reg     [13:0]                      ram_waddr_sync0;
reg     [13:0]                      ram_waddr_sync1;
reg     [4:0]                       ram_wen_flag;
reg                                 ram_wen_sw;
reg     [4:0]                       ififo_wen_cnt;
(* MARK_DEBUG="true" *)
reg     [13:0]                      ram_waddr;
reg                                 ififo_wen_enb;
reg     [31:0]                      mult_idata_cut;
reg     [31:0]                      mult_qdata_cut;

// Wire Define
wire                                ififo_wen;
wire                                ififo_ren;
wire    [31:0]                      ififo_din;
wire    [31:0]                      ififo_dout;
wire                                ififo_full;
wire                                ififo_empty;
wire    [31:0]                      mult_qdata;
wire    [31:0]                      mult_idata;
wire    [15:0]                      midband_idata;
(* MARK_DEBUG="true" *)
wire    [15:0]                      fir_dec_idata_cut;
(* MARK_DEBUG="true" *)
wire    [15:0]                      fir_dec_qdata_cut;
(* MARK_DEBUG="true" *)
wire    [15:0]                      cic_idata_cut;
wire    [15:0]                      cic_qdata_cut;
(* MARK_DEBUG="true" *)
wire                                cic_ivalid;
wire                                cic_qvalid;
(* MARK_DEBUG="true" *)
wire                                fir_dec_valid;
wire    [39:0]                      fir_dec_idata;
wire    [39:0]                      fir_dec_qdata;
wire    [47:0]                      cic_idata;
wire    [47:0]                      cic_qdata;
(* MARK_DEBUG="true" *)
wire    [15:0]                      midband_qdata;
wire                                ddc_fir_ivalid;
wire    [47:0]                      ddc_fir_idata;
wire                                ddc_fir_qvalid;
wire    [47:0]                      ddc_fir_qdata;
wire                                ram_wen;
(* MARK_DEBUG="true" *)
wire    [15:0]                      ddc_fir_idata_cut;
(* MARK_DEBUG="true" *)
wire    [15:0]                      ddc_fir_qdata_cut;

assign ififo_wen = axis_tvalid & ififo_wen_enb & axis_tready;
assign ififo_din = axis_tdata;
assign axis_tready = ~ififo_full;

always @ (posedge axis_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            ififo_wen_cnt <= 5'd0;
            ififo_wen_enb <= 1'b0;
        end
    else
        begin
            if(ififo_wen_cnt < 5'h1f)
                ififo_wen_cnt <= #U_DLY ififo_wen_cnt + 5'd1;
            else;

            if(ififo_wen_cnt == 5'h1f)
                ififo_wen_enb <= #U_DLY 1'b1;
            else
                ififo_wen_enb <= #U_DLY 1'b0;
        end
end

fwft_d2kw32
u_in_fifo(
    .rst                        (~rst_n                     ),
    .wr_clk                     (axis_clk                   ),
    .rd_clk                     (clk_25d6m                  ),
    .din                        (ififo_din                  ),
    .wr_en                      (ififo_wen                  ),
    .rd_en                      (ififo_ren                  ),
    .dout                       (ififo_dout                 ),
    .full                       (ififo_full                 ),
    .empty                      (ififo_empty                ),
    .wr_rst_busy                (/*not used*/               ),
    .rd_rst_busy                (/*not used*/               )
);

assign ififo_ren = ~ififo_empty;
assign midband_idata = ififo_dout[15:0];
assign midband_qdata = ififo_dout[15:0];

mult_signed
u0_mult_signed(
    .CLK                        (clk_25d6m                  ),      // input wire CLK
    .A                          (midband_idata              ),      // input wire [15 : 0] A
    .B                          (lo_cos                     ),      // input wire [15 : 0] B
    .P                          (mult_idata                  )       // output wire [31 : 0] P
);

mult_signed
u1_mult_signed(
    .CLK                        (clk_25d6m                  ),      // input wire CLK
    .A                          (midband_qdata              ),      // input wire [15 : 0] A
    .B                          (lo_sin                     ),      // input wire [15 : 0] B
    .P                          (mult_qdata                 )       // output wire [31 : 0] P
);

always @(posedge clk_25d6m)
begin
    if(mult_idata[31:30] == 2'b00 || mult_idata[31:30] == 2'b11)
        mult_idata_cut <= #U_DLY {mult_idata[31],mult_idata[29:0],1'b0};
    else if(mult_idata[31:30] == 2'b01)
        mult_idata_cut <= #U_DLY {mult_idata[31],31'h7fff_ffff};
    else if(mult_idata[31:30] == 2'b10)
        mult_idata_cut <= #U_DLY {mult_idata[31],31'd0};
    else;

    if(mult_qdata[31:30] == 2'b00 || mult_qdata[31:30] == 2'b11)
        mult_qdata_cut <= #U_DLY {mult_qdata[31],mult_qdata[29:0],1'b0};
    else if(mult_qdata[31:30] == 2'b01)
        mult_qdata_cut <= #U_DLY {mult_qdata[31],31'h7fff_ffff};
    else if(mult_qdata[31:30] == 2'b10)
        mult_qdata_cut <= #U_DLY {mult_qdata[31],31'd0};
    else;
end

fir_lpf_4d2M
u0_fir_lpm_4d2m(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tvalid         (1'b1                       ),
    .s_axis_data_tready         (                           ),
    .s_axis_data_tdata          (mult_idata_cut             ),
    .m_axis_data_tvalid         (ddc_fir_ivalid             ),
    .m_axis_data_tdata          (ddc_fir_idata              )
);

fir_lpf_4d2M
u1_fir_lpm_4d2m(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tvalid         (1'b1                       ),
    .s_axis_data_tready         (                           ),
    .s_axis_data_tdata          (mult_qdata_cut             ),
    .m_axis_data_tvalid         (ddc_fir_qvalid             ),
    .m_axis_data_tdata          (ddc_fir_qdata              )
);

//dds_clken #(
//    .U_DLY                      (U_DLY                      )
//)
//u_dds_clken(
//    .clk                        (clk_25d6m                  ),
//    .rst_n                      (rst_n                      ),
//    .fw                         (FW_CLKEN_160K              ),
//    .enb                        (ram_wen                    )
//);


always @ (posedge clk_25d6m or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            ram_waddr <= 14'd0;
            ram_wen_sw <= 1'b0;
        end
    else
        begin
            if(ram_wen == 1'b1)
                begin
                    if(ram_waddr < MAX_ADDR)
                        ram_waddr <= #U_DLY ram_waddr + 14'd1;
                    else
                        ram_waddr <= #U_DLY 14'd0;
                end
            else;

            if(ram_wen == 1'b1)
                ram_wen_sw <= #U_DLY ~ram_wen_sw;
            else;
        end
end


assign ddc_fir_idata_cut = {ddc_fir_idata[47:32]};
assign ddc_fir_qdata_cut = {ddc_fir_qdata[47:32]};


//fir_dec_idata[34:19]
cic_compiler_20d
u0_cic_compiler(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tdata          (ddc_fir_idata_cut          ),
    .s_axis_data_tvalid         (ddc_fir_ivalid             ),
    .s_axis_data_tready         (/*not used*/               ),
    .m_axis_data_tdata          (cic_idata                  ),
    .m_axis_data_tvalid         (cic_ivalid                 )
);

cic_compiler_20d
u1_cic_compiler(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tdata          (ddc_fir_qdata_cut          ),
    .s_axis_data_tvalid         (ddc_fir_qvalid             ),
    .s_axis_data_tready         (/*not used*/               ),
    .m_axis_data_tdata          (cic_qdata                  ),
    .m_axis_data_tvalid         (cic_qvalid                 )
);

assign cic_idata_cut = {cic_idata[41:26]};
assign cic_qdata_cut = {cic_qdata[41:26]};

fir_lpf_dec8
u0_fir_lpf_dec8(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tvalid         (cic_ivalid                 ),
    .s_axis_data_tready         (/*not used*/               ),
    .s_axis_data_tdata          (cic_idata_cut              ),
    .m_axis_data_tvalid         (fir_dec_valid              ),
    .m_axis_data_tdata          (fir_dec_idata              )
);

fir_lpf_dec8
u1_fir_lpf_dec8(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tvalid         (cic_qvalid                 ),
    .s_axis_data_tready         (/*not used*/               ),
    .s_axis_data_tdata          (cic_qdata_cut              ),
    .m_axis_data_tvalid         (/*not used*/               ),
    .m_axis_data_tdata          (fir_dec_qdata              )
);

assign fir_dec_idata_cut = {fir_dec_idata[34:19]};
assign fir_dec_qdata_cut = {fir_dec_qdata[34:19]};
sdpram_d12kw32
u_ram(
    .clka                       (clk_25d6m                  ),
    .wea                        (ram_wen                    ),
    .addra                      (ram_waddr                  ),
    .dina                       ({fir_dec_idata_cut,fir_dec_qdata_cut}),
    .clkb                       (lbs_clk                    ),
    .addrb                      (lbs_addr                   ),
    .doutb                      (ddc_conv_data              )
);
assign ram_wen = fir_dec_valid;

// synchronized WADDR
always @ (posedge lbs_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            ram_wen_sync <= 3'd0;
            ram_waddr_sync0 <= 14'd0;
            ram_waddr_sync1 <= 14'd0;
            ram_wen_flag <= 5'd0;
            ddc_conv_waddr <= 14'd0;
        end
    else
        begin
            ram_wen_sync <= #U_DLY {ram_wen_sync[1:0],ram_wen_sw};

            ram_wen_flag <= #U_DLY {ram_wen_flag[3:0],ram_wen_sync[2]^ram_wen_sync[1]};

            ram_waddr_sync0 <= #U_DLY ram_waddr;
            ram_waddr_sync1 <= #U_DLY ram_waddr_sync0;


            if(ram_wen_flag[4] == 1'b1)
                ddc_conv_waddr <= #U_DLY ram_waddr_sync1;
            else;

        end
end

endmodule

