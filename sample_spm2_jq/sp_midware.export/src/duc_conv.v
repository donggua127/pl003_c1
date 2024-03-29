// =================================================================================/
// Project Name :
// Author       :
// Email        :
// Creat Time   :
// File Name    : duc_conv.v
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

module duc_conv #(
parameter                           U_DLY = 1
)(
input                               rst_n,
input                               lbs_clk,
input                               lbs_we,
input           [13:0]              lbs_addr,
input           [31:0]              lbs_din,
input                               clk_25d6m,
input           [15:0]              lo_sin,
input           [15:0]              lo_cos,
input                               axis_clk,
output  wire                        duc_tvalid,
output  reg                         duc_tlast,
output  wire    [31:0]              duc_tdata,
input                               duc_tready,
output  wire    [31:0]              duc_base_data,
output  wire    [31:0]              duc_cmd_register
);
// Parameter Define
localparam                          SAMPLE_RATE_SEL = 0;    //0:160k, 1:96k
localparam                          FW_CLKEN_160K = 32'd26843546;
localparam                          FW_CLKEN_96K = 32'd16106127;
localparam                          FW_CLKEN = (SAMPLE_RATE_SEL) ? FW_CLKEN_96K : FW_CLKEN_160K;
localparam                          START_ADDR = 14'd12000;
localparam                          MAX_ADDR_160K = 14'd15839;
localparam                          MAX_ADDR_96K = 14'd14303;
localparam                          MAX_ADDR = (SAMPLE_RATE_SEL) ? MAX_ADDR_96K : MAX_ADDR_160K;
localparam                          DUC_LENGTH = MAX_ADDR - START_ADDR;
localparam                          CMD_ADDR = 14'd16000;
localparam                          CMD_DOWN_START = 32'h0000_5555;
localparam                          CMD_DOWN_END = 32'h0000_8888;
localparam                          CMD_DOWN_TRIG = 32'h0000_FFFF;

// Register Define
reg     [7:0]                       tcnt;
(* MARK_DEBUG="true" *)
reg                                 down_start;
(* MARK_DEBUG="true" *)
reg                                 down_end;
reg                                 down_flag;
(* MARK_DEBUG="true" *)
reg                                 down_complete;
(* MARK_DEBUG="true" *)
reg                                 start_send;
reg     [2:0]                       send_end_sync;
reg     [11:0]                      ram_raddr;
reg     [2:0]                       start_send_sync;
(* MARK_DEBUG="true" *)
reg                                 send_flag;
reg                                 send_flag_dly;
reg                                 send_end;
reg                                 ram_wen;
reg     [13:0]                      ram_waddr;
reg     [31:0]                      ram_din;
reg     [31:0]                      cmd_register;
reg                                 down_trig;
reg     [4:0]                       ofifo_wen_cnt;
reg                                 ofifo_wen_enb;
reg     [15:0]                      duc_idata_cut;
reg     [15:0]                      duc_qdata_cut;
(* MARK_DEBUG="true" *)
reg     [15:0]                      baseband_idata;
(* MARK_DEBUG="true" *)
reg     [15:0]                      baseband_qdata;
reg     [3:0]                       sync_rst;
reg                                 send_flag_1dly;
reg     [6:0]                       cnt_us;
reg                                 pulse_us;
(* MARK_DEBUG="true" *)
reg     [19:0]                      cnt_trig;
(* MARK_DEBUG="true" *)
reg     [19:0]                      cnt_send;

// Wire Define
wire    [31:0]                      duc_idata;
wire    [31:0]                      duc_qdata;
wire    [31:0]                      ram_douta;
wire    [31:0]                      ram_dout;
wire                                clk_enb;
wire    [31:0]                      ofifo_din;
wire    [31:0]                      ofifo_dout;
wire                                ofifo_wen;
wire                                ofifo_ren;
wire                                ofifo_empty;
wire                                ofifo_full;
wire                                send_iready;
wire                                send_qready;
wire    [39:0]                      cic_idata;
wire                                cic_valid;
wire    [39:0]                      cic_qdata;
wire                                send_ready;
wire                                fir_ivalid;
wire    [31:0]                      fir_idata;
wire                                fir_qvalid;
wire    [31:0]                      fir_qdata;
wire                                rd_en;
wire    [31:0]                      fifo_ram_data;
wire                                full;
wire                                empty;
wire                                fir_iready;
wire                                fir_qready;
wire    [15:0]                      fir_idin;
wire    [15:0]                      fir_qdin;
wire    [31:0]                      duc_idata_tmp;
wire    [31:0]                      duc_qdata_tmp;
wire    [15:0]                      fir_idata_cut;
wire    [15:0]                      fir_qdata_cut;
(* MARK_DEBUG="true" *)
wire    [15:0]                      duc_add_idata;
(* MARK_DEBUG="true" *)
wire    [15:0]                      duc_add_qdata;

assign duc_cmd_register = cmd_register;

always @ (posedge lbs_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            cmd_register <= 32'd0;
            down_start <= 1'b0;
            down_end <= 1'b0;
            down_flag <= 1'b0;
            down_complete <= 1'b0;
            down_trig <= 1'b0;
            start_send <= 1'b0;
            send_end_sync <= 3'd0;
        end
    else
        begin
            send_end_sync <= #U_DLY {send_end_sync[1:0],send_end};

            if(lbs_we == 1'b1 && lbs_addr == CMD_ADDR)
                cmd_register <= #U_DLY lbs_din;
            else if(send_end_sync[2] ^ send_end_sync[1])
                cmd_register <= #U_DLY 32'd0;
            else;

            if(lbs_we  == 1'b1 && lbs_addr == CMD_ADDR && lbs_din == CMD_DOWN_START)
                down_start <= #U_DLY 1'b1;
            else
                down_start <= #U_DLY 1'b0;

            if(lbs_we  == 1'b1 && lbs_addr == CMD_ADDR && lbs_din == CMD_DOWN_END)
                down_end <= #U_DLY 1'b1;
            else
                down_end <= #U_DLY 1'b0;

            if(down_start == 1'b1)
                down_flag <= #U_DLY 1'b1;
            else if(down_end == 1'b1)
                down_flag <= #U_DLY 1'b0;
            else;

            if(down_start == 1'b1)
                down_complete <= #U_DLY 1'b0;
            else if(down_flag == 1'b1 && down_end == 1'b1)
                down_complete <= #U_DLY 1'b1;
            else;

            if(lbs_we  == 1'b1 && lbs_addr == CMD_ADDR && lbs_din == CMD_DOWN_TRIG)
                down_trig <= #U_DLY 1'b1;
            else
                down_trig <= #U_DLY 1'b0;

            if(down_trig == 1'b1 && down_complete == 1'b1)
                start_send <= #U_DLY ~start_send;
            else;

        end
end

always @(posedge lbs_clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        begin
            cnt_us <= 7'd0;
            pulse_us <= 1'b0;
            cnt_trig <= 20'd0;
            cnt_send <= 20'd0;
        end
    else
        begin
            if(cnt_us < 7'd99)
                cnt_us <= #U_DLY cnt_us + 7'd1;
            else
                cnt_us <= #U_DLY 7'd0;

            if(cnt_us == 7'd99)
                pulse_us <= #U_DLY 1'b1;
            else
                pulse_us <= #U_DLY 1'b0;

            if(down_trig == 1'b1)
                cnt_trig <= #U_DLY 20'd0;
            else if(pulse_us == 1'b1)
                begin
                    if(cnt_trig < 20'hffff_f)
                        cnt_trig <= #U_DLY cnt_trig + 20'd1;
                    else;
                end
            else;

            if(down_trig == 1'b1 && down_complete == 1'b1)
                cnt_send <= #U_DLY 20'd0;
            else if(pulse_us == 1'b1)
                begin
                    if(cnt_send < 20'hffff_f)
                        cnt_send <= #U_DLY cnt_send + 20'd1;
                    else;
                end
            else;
        end
end

always @ (posedge lbs_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            ram_wen <= 1'b0;
            ram_waddr <= 14'd0;
            ram_din <= 32'd0;
        end
    else
        begin
            if(lbs_addr >= START_ADDR && lbs_addr <= MAX_ADDR)
                ram_wen <= #U_DLY lbs_we ;
            else;

            ram_waddr <= #U_DLY lbs_addr - START_ADDR;

            ram_din <= #U_DLY lbs_din;
        end
end

tdram_d4kw32
u_ram(
    .clka                       (lbs_clk                    ),  // input wire clka
    .wea                        (ram_wen                    ),  // input wire [0 : 0] wea
    .addra                      (ram_waddr                  ),  // input wire [13 : 0] addra
    .dina                       (ram_din                    ),  // input wire [31 : 0] dina
    .douta                      (duc_base_data              ),
    .clkb                       (clk_25d6m                  ),    // input wire clkb
    .addrb                      (ram_raddr                  ),  // input wire [13 : 0] addrb
    .doutb                      (ram_dout                   ),  // output wire [31 : 0] doutb
    .dinb                       (32'd0                      ),  // output wire [31 : 0] doutb
    .web                        (1'b0                       )       // input wire [0 : 0] wea
);

always @ (posedge clk_25d6m or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            start_send_sync <= 3'd0;
            ram_raddr <= 12'd0;
            send_flag <= 1'b0;
            send_flag_dly <= 1'b0;
            send_end <= 1'b0;
            baseband_idata <= 16'd0;
            baseband_qdata <= 16'd0;

            send_flag_1dly <= 1'b0;
        end
    else
        begin
            start_send_sync <= #U_DLY {start_send_sync[1:0],start_send};

            if((start_send_sync[2] ^ start_send_sync[1]) == 1'b1)
                send_flag <= #U_DLY 1'b1;
            else if(send_flag == 1'b1 && ram_raddr >= DUC_LENGTH)
                send_flag <= #U_DLY 1'b0;
            else;

            send_flag_dly <= #U_DLY send_flag;
            send_flag_1dly <= #U_DLY send_flag_dly;

            if({send_flag_dly,send_flag} == 2'b10)
                send_end <= #U_DLY ~send_end;
            else;


            if(send_flag == 1'b1)
                begin
                    if(ram_raddr < DUC_LENGTH)
                        ram_raddr <= #U_DLY ram_raddr + 12'd1;
                    else
                        ram_raddr <= #U_DLY 12'd0;
                end
            else if(send_flag == 1'b0)
                ram_raddr <= #U_DLY 12'd0;
            else;

            if(cic_valid == 1'b1)
                baseband_idata <= #U_DLY {cic_idata[37:22]};
            else
                baseband_idata <= #U_DLY 16'd3000;

            if(cic_valid == 1'b1)
                baseband_qdata <= #U_DLY {cic_qdata[37:22]};
            else
                baseband_qdata <= #U_DLY 16'd3000;
        end
end
assign send_ready = ~full;


always @(posedge clk_25d6m or negedge rst_n)
begin
    if(rst_n == 1'b0)
        sync_rst <= 4'b1111;
    else
        sync_rst <= #U_DLY {sync_rst[2:0],1'b0};
end


cfwft_4kd32 u_cfwft_d4kw32 (
  .clk(clk_25d6m),      // input wire clk
  .srst(sync_rst[3]),    // input wire srst
  .din({ram_dout[31:16],(~ram_dout[15:0])}),      // input wire [31 : 0] din
  .wr_en(send_flag_1dly),  // input wire wr_en
  .rd_en(rd_en),  // input wire rd_en
  .dout(fifo_ram_data),    // output wire [31 : 0] dout
  .full(full),    // output wire full
  .empty(empty)  // output wire empty
);

assign rd_en = (fir_iready & fir_qready) & (~empty);
assign fir_idin = (~empty) ? fifo_ram_data[31:16] : 16'd3000;
assign fir_qdin = (~empty) ? fifo_ram_data[15:0] : 16'd3000;

fir_lpf_insert8
u0_fir_lpm_insert8(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tvalid         (1'b1                       ),
    .s_axis_data_tready         (fir_iready                 ),
    .s_axis_data_tdata          (fir_idin                   ),
    .m_axis_data_tvalid         (fir_ivalid                 ),
    .m_axis_data_tdata          (fir_idata                  )
);

fir_lpf_insert8
u1_fir_lpm_insert8(
    .aclk                       (clk_25d6m                  ),
    .s_axis_data_tvalid         (1'b1                       ),
    .s_axis_data_tready         (fir_qready                ),
    .s_axis_data_tdata          (fir_qdin                  ),
    .m_axis_data_tvalid         (fir_qvalid                 ),
    .m_axis_data_tdata          (fir_qdata                  )
);

assign fir_idata_cut = {fir_idata[31:16]};
assign fir_qdata_cut = {fir_qdata[31:16]};

cic_compiler_160r
u0_cic_compiler(
    .aclk                       (clk_25d6m                  ),                              // input wire aclk
    .s_axis_data_tdata          (fir_idata_cut              ),    // input wire [15 : 0] s_axis_data_tdata
    .s_axis_data_tvalid         (fir_ivalid                 ),  // input wire s_axis_data_tvalid
    .s_axis_data_tready         (/*not used*/               ),  // output wire s_axis_data_tready
    .m_axis_data_tdata          (cic_idata                  ),    // output wire [31 : 0] m_axis_data_tdata
    .m_axis_data_tvalid         (cic_valid                  )    // output wire m_axis_data_tvalid
);


cic_compiler_160r
u1_cic_compiler(
    .aclk                       (clk_25d6m                  ),                              // input wire aclk
    .s_axis_data_tdata          (fir_qdata_cut              ),    // input wire [15 : 0] s_axis_data_tdata
    .s_axis_data_tvalid         (fir_qvalid                 ),  // input wire s_axis_data_tvalid
    .s_axis_data_tready         (/*not used*/               ),  // output wire s_axis_data_tready
    .m_axis_data_tdata          (cic_qdata                  ),    // output wire [31 : 0] m_axis_data_tdata
    .m_axis_data_tvalid         (/*not used*/               )    // output wire m_axis_data_tvalid
);

mult_signed
u0_mult_signed(
    .CLK                        (clk_25d6m                  ),      // input wire CLK
    .A                          (baseband_idata             ),      // input wire [15 : 0] A
    .B                          (lo_cos                     ),      // input wire [15 : 0] B
    .P                          (duc_idata                  )       // output wire [31 : 0] P
);

mult_signed
u1_mult_signed(
    .CLK                        (clk_25d6m                  ),      // input wire CLK
    .A                          (baseband_qdata             ),      // input wire [15 : 0] A
    .B                          (lo_sin                     ),      // input wire [15 : 0] B
    .P                          (duc_qdata                  )       // output wire [31 : 0] P
);

add_s16
u0_add_s16(
    .CLK                        (clk_25d6m                  ),
    .A                          ({duc_idata[31],duc_idata[29:15]}),
    .B                          ({duc_qdata[31],duc_qdata[29:15]}),
    .S                          (duc_add_idata              )
);

mult_signed
u2_mult_signed(
    .CLK                        (clk_25d6m                  ),      // input wire CLK
    .A                          (baseband_idata             ),      // input wire [15 : 0] A
    .B                          (lo_sin                     ),      // input wire [15 : 0] B
    .P                          (duc_idata_tmp              )       // output wire [31 : 0] P
);

mult_signed
u3_mult_signed(
    .CLK                        (clk_25d6m                  ),      // input wire CLK
    .A                          ((~baseband_qdata)          ),      // input wire [15 : 0] A
    .B                          (lo_cos                     ),      // input wire [15 : 0] B
    .P                          (duc_qdata_tmp              )       // output wire [31 : 0] P
);

add_s16
u1_add_s16(
    .CLK                        (clk_25d6m                  ),
    .A                          ({duc_idata_tmp[31],duc_idata_tmp[29:15]}),
    .B                          ({duc_qdata_tmp[31],duc_qdata_tmp[29:15]}),
    .S                          (duc_add_qdata              )
);

assign ofifo_din = {duc_add_idata,duc_add_qdata};

always @ (posedge clk_25d6m or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            ofifo_wen_cnt <= 5'b0;
            ofifo_wen_enb <= 1'b0;
        end
    else
        begin
            if(ofifo_wen_cnt < 5'h1f)
                ofifo_wen_cnt <= #U_DLY ofifo_wen_cnt + 5'd1;
            else;

            if(ofifo_wen_cnt == 5'h1f)
                ofifo_wen_enb <= #U_DLY 1'b1;
            else;
        end
end
assign ofifo_wen = 1'b1 & ofifo_wen_enb & (~ofifo_full);

fwft_d4kw32
u_out_fifo(
    .rst                        (~rst_n                     ),                  // input wire rst
    .wr_clk                     (clk_25d6m                  ),            // input wire wr_clk
    .rd_clk                     (axis_clk                   ),            // input wire rd_clk
    .din                        (ofifo_din                  ),                  // input wire [31 : 0] din
    .wr_en                      (ofifo_wen                  ),              // input wire wr_en
    .rd_en                      (ofifo_ren                  ),         // input wire rd_en
    .dout                       (ofifo_dout                 ),                // output wire [31 : 0] dout
    .full                       (ofifo_full                 ),                // output wire full
    .empty                      (ofifo_empty                ),              // output wire empty
    .wr_rst_busy                (/*not used*/               ),  // output wire wr_rst_busy
    .rd_rst_busy                (/*not used*/               )    // output wire rd_rst_busy
);

assign ofifo_ren = (~ofifo_empty) & duc_tready;
assign duc_tdata = ofifo_dout;
assign duc_tvalid = ~ofifo_empty;

always @ (posedge axis_clk or negedge rst_n )
begin
    if (rst_n == 1'b0)
        begin
            tcnt <= 8'd0;
            duc_tlast <= 1'b0;
        end
    else
        begin
            if({duc_tvalid,duc_tready,duc_tlast} == 3'b111)
                tcnt <= #U_DLY 8'd0;
            else if({duc_tvalid,duc_tready} == 2'b11)
                tcnt <= #U_DLY tcnt + 8'd1;
            else;

            if({duc_tvalid,duc_tready,duc_tlast} == 3'b111)
                duc_tlast <= #U_DLY 1'b0;
            else if({duc_tvalid,duc_tready} == 2'b11 && tcnt == 8'hFE)
                duc_tlast <= #U_DLY 1'b1;
            else;
        end
end

endmodule

