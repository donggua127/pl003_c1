`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 16:32:10
// Design Name: 
// Module Name: waveform_biu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module waveform_biu2 #(
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 4
)(
    // AXI interface
    input   wire                                s_axi_aclk_in,
    input   wire                                s_axi_aresetn_in,
    // Write address channel
    input   wire [C_S_AXI_ADDR_WIDTH-1 : 0]     s_axi_awaddr_in,
    input   wire [2 : 0]                        s_axi_awprot_in,
    input   wire                                s_axi_awvalid_in,
    output  wire                                s_axi_awready_out,
    // Write data channel
    input   wire [C_S_AXI_DATA_WIDTH-1 : 0]     s_axi_wdata_in,
    input   wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb_in,
    input   wire                                s_axi_wvalid_in,
    output  wire                                s_axi_wready_out,
    // Write response channel
    output  wire [1 : 0]                        s_axi_bresp_out,
    output  wire                                s_axi_bvalid_out,
    input   wire                                s_axi_bready_in,
    // Read address channel
    input   wire [C_S_AXI_ADDR_WIDTH-1 : 0]     s_axi_araddr_in,
    input   wire [2 : 0]                        s_axi_arprot_in,
    input   wire                                s_axi_arvalid_in,
    output  wire                                s_axi_arready_out,
    // Read data channel
    output  wire [C_S_AXI_DATA_WIDTH-1 : 0]     s_axi_rdata_out,
    output  wire [1 : 0]                        s_axi_rresp_out,
    output  wire                                s_axi_rvalid_out,
    input   wire                                s_axi_rready_in
    );
////////////////////////////////////////////////////////////////////////////////
//                          OUTPUT ASSIGNMENT
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//                         PARAMETER DECLARATION
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//                         REG & WIRE DECLARATION
////////////////////////////////////////////////////////////////////////////////
    // AXI4 LITE signals
    reg  [C_S_AXI_ADDR_WIDTH-1 : 0] axi_awaddr;
    reg                             axi_awready;
    reg                             axi_wready;
    reg  [1 : 0]                    axi_bresp;
    reg                             axi_bvalid;
    reg  [C_S_AXI_ADDR_WIDTH-1 : 0] axi_araddr;
    reg                             axi_arready;
    reg  [C_S_AXI_DATA_WIDTH-1 : 0] axi_rdata;
    reg  [1 : 0]                    axi_rresp;
    reg                             axi_rvalid;

    // WREADY/RVALID delay control
    reg  [7:0]                      axi_wready_wait;
    reg  [7:0]                      axi_wready_cnt;
    reg  [7:0]                      axi_rvalid_wait;
    reg  [7:0]                      axi_rvalid_cnt;

    // The axi_awv_awr_flag flag marks the presence of write address valid
    reg axi_awv_awr_flag;
    //The axi_arv_arr_flag flag marks the presence of read address valid
    reg axi_arv_arr_flag;

    // Register logic
    wire                            slv_reg_rden;
    wire                            slv_reg_wren;
    reg [C_S_AXI_DATA_WIDTH-1:0]    reg_data_out;
    integer                         byte_index;

    reg                             wr_en;
    reg                             wr_en_r;
    wire                            wr_en_pulse;

    reg                             rd_en;
    reg                             rd_en_r;
    wire                            rd_en_pulse;

    // Registers
    // Magic Code "FFFF0001"                            // RW @0x00
    reg  [C_S_AXI_DATA_WIDTH-1:0]   reg_scratch;        // RW @0x04

////////////////////////////////////////////////////////////////////////////////
//                                  CODE
////////////////////////////////////////////////////////////////////////////////
    assign s_axi_awready_out    = axi_awready;
    assign s_axi_wready_out     = axi_wready;
    assign s_axi_bresp_out      = axi_bresp;
    assign s_axi_bvalid_out     = axi_bvalid;
    assign s_axi_arready_out    = axi_arready;
    assign s_axi_rdata_out      = axi_rdata;
    assign s_axi_rresp_out      = axi_rresp;
    assign s_axi_rvalid_out     = axi_rvalid;

//======================================+=======================================
// 1.                               BUS WRITE
//------------------------------------------------------------------------------
    // Implement axi_awready generation
    // axi_awready is asserted for one s_axi_aclk_in clock cycle when both
    // s_axi_awvalid_in are asserted. axi_awready is
    // de-asserted when reset is low.
    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_awready <= 1'b0;
            axi_awv_awr_flag <= 1'b0;
        end
        else
        begin
            if (~axi_awready && s_axi_awvalid_in && ~axi_awv_awr_flag)
            begin
                // slave is ready to accept write address when
                // there is a valid write address and write data
                // on the write address and data bus.
                axi_awready <= 1'b1;
                axi_awv_awr_flag <= 1'b1;
            end
            else if (axi_wready && s_axi_wvalid_in)
            begin
                axi_awv_awr_flag <= 1'b0;
            end
            else
            begin
                axi_awready <= 1'b0;
            end
        end
    end

    // Implement axi_awaddr latching
    // This process is used to latch the address when both
    // s_axi_awvalid_in and s_axi_wvalid_in are valid.
    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_awaddr <= 0;
        end
        else
        begin
            if (~axi_awready && s_axi_awvalid_in && ~axi_awv_awr_flag)
            begin
                // Write Address latching
                axi_awaddr <= s_axi_awaddr_in;
            end
        end
    end

    // Implement axi_wready generation
    // axi_wready is asserted for one s_axi_aclk_in clock cycle when both
    // s_axi_awvalid_in and s_axi_wvalid_in are asserted. axi_wready is
    // de-asserted when reset is low.
    // TODO: Modify here to extend write access process.
//    always @*
//    begin
//        case ( axi_awaddr )
//        8'h04: axi_wready_wait <= 8'd0;     // Wait 0 clocks
//        default: axi_wready_wait <= 8'd0;   // Wait 0 clocks
//        endcase
//    end
    always @* axi_wready_wait <= 8'd0;

    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_wready <= 1'b0;
            axi_wready_cnt <= 8'd0;
        end
        else
        begin
            if (~axi_wready && axi_awv_awr_flag && s_axi_wvalid_in)
            begin
                // slave is ready to accept write data when
                // there is a valid write address and write data
                // on the write address and data bus. This design
                // expects no outstanding transactions.
                if (axi_wready_cnt < axi_wready_wait)
                begin
                    axi_wready_cnt <= axi_wready_cnt + 1'd1;
                    axi_wready <= 1'b0;
                end
                else
                begin
                    axi_wready_cnt <= axi_wready_cnt;
                    axi_wready <= 1'b1;
                end
            end
            else
            begin
                axi_wready <= 1'b0;
                axi_wready_cnt <= 8'd0;
            end
        end
    end

    // Implement memory mapped register select and write logic generation
    // The write data is accepted and written to memory mapped registers when
    // axi_awready, s_axi_wvalid_in, axi_wready and s_axi_wvalid_in are asserted. Write strobes are used to
    // select byte enables of slave registers while writing.
    // These registers are cleared when reset (active low) is applied.
    // Slave register write enable is asserted when valid address and data are available
    // and the slave is ready to accept the write address and write data.
    assign slv_reg_wren = axi_wready && s_axi_wvalid_in && axi_awv_awr_flag;

    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            reg_scratch <= {C_S_AXI_DATA_WIDTH{1'b0}};
        end
        else
        begin
            if (slv_reg_wren)
            begin
            case ( axi_awaddr )
                8'h04:
                for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-3; byte_index = byte_index+1 )
                    if ( s_axi_wstrb_in[byte_index] == 1 )
                    begin
                        reg_scratch[(byte_index*8) +: 8] <= s_axi_wdata_in[(byte_index*8) +: 8];
                    end
                default:
                begin
                    reg_scratch   <= reg_scratch;
                end
            endcase
            end
        end
    end

    // Implement write response logic generation
    // The write response and response valid signals are asserted by the slave
    // when axi_wready, s_axi_wvalid_in, axi_wready and s_axi_wvalid_in are asserted.
    // This marks the acceptance of address and indicates the status of
    // write transaction.
    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_bvalid  <= 0;
            axi_bresp   <= 2'b0;
        end
        else
        begin
            if (axi_awv_awr_flag && ~axi_bvalid && axi_wready && s_axi_wvalid_in)
            begin
                // indicates a valid write response is available
                axi_bvalid <= 1'b1;
                axi_bresp  <= 2'b0; // 'OKAY' response
            end                     // work error responses in future
            else
            begin
                if (s_axi_bready_in && axi_bvalid)
                //check if bready is asserted while bvalid is high)
                //(there is a possibility that bready is always asserted high)
                begin
                    axi_bvalid <= 1'b0;
                end
            end
        end
    end

//======================================+=======================================
// 2.                               BUS READ
//------------------------------------------------------------------------------
    // Implement axi_arready generation
    // axi_arready is asserted for one s_axi_aclk_in clock cycle when
    // s_axi_arvalid_in is asserted. axi_awready is
    // de-asserted when reset (active low) is asserted.
    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_arready <= 1'b0;
            axi_arv_arr_flag <= 1'b0;
        end
        else
        begin
            if (~axi_arready && s_axi_arvalid_in && ~axi_arv_arr_flag)
            begin
                // indicates that the slave has acceped the valid read address
                axi_arready <= 1'b1;
                axi_arv_arr_flag <= 1'b1;
            end
            else if (s_axi_rready_in && axi_rvalid)
            begin
                axi_arv_arr_flag <= 1'b0;
            end
            else
            begin
                axi_arready <= 1'b0;
            end
        end
    end

    // Implement axi_araddr latching
    // This process is used to latch the address when both
    // s_axi_arvalid_in are valid.
    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_araddr  <= 32'b0;
        end
        else
        begin
            if (~axi_arready && s_axi_arvalid_in && ~axi_arv_arr_flag)
            begin
                // Read Address latching
                axi_araddr <= s_axi_araddr_in;
            end
        end
    end

    // Implement axi_arvalid generation
    // axi_rvalid is asserted for one s_axi_aclk_in clock cycle when both
    // s_axi_arvalid_in and axi_arready are asserted. The slave registers
    // data are available on the axi_rdata bus at this instance. The
    // assertion of axi_rvalid marks the validity of read data on the
    // bus and axi_rresp indicates the status of read transaction.axi_rvalid
    // is deasserted on reset (active low). axi_rresp and axi_rdata are
    // cleared to zero on reset (active low).
    // TODO: Modify here to extend write access process.
//    always @*
//    begin
//        case ( axi_araddr )
//        8'h00: axi_rvalid_wait <= 8'd2; // Wait 2 clocks
//        default: axi_rvalid_wait <= 8'd0;   // Wait 0 clocks
//        endcase
//    end
    always @* axi_rvalid_wait <= 8'd0;

    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_rvalid <= 0;
            axi_rresp  <= 0;
            axi_rvalid_cnt <= 8'd0;
        end
        else
        begin
            if (axi_arv_arr_flag && ~axi_rvalid)
            begin
                // Valid read data is available at the read data bus
                if (axi_rvalid_cnt < axi_rvalid_wait)
                begin
                    axi_rvalid_cnt <= axi_rvalid_cnt + 1'd1;
                    axi_rvalid <= 1'b0;
                end
                else
                begin
                    axi_rvalid_cnt <= axi_rvalid_cnt;
                    axi_rvalid <= 1'b1;
                end
                axi_rresp  <= 2'b0; // 'OKAY' response
            end
            else if (axi_rvalid && s_axi_rready_in)
            begin
                // Read data is accepted by the master
                axi_rvalid <= 1'b0;
                axi_rvalid_cnt <= 8'd0;
            end
            else
            begin
                // Wait for AXI_RREADY
                axi_rvalid <= axi_rvalid;
                axi_rvalid_cnt <= 8'd0;
            end
        end
    end

    // Implement memory mapped register select and read logic generation
    // Slave register read enable is asserted when valid address is available
    // and the slave is ready to accept the read address.
    assign slv_reg_rden = axi_arv_arr_flag & ~axi_rvalid;
    always @(*)
    begin
        // Address decoding for reading registers
        case ( axi_araddr )
            8'h00 : reg_data_out <= 32'hFFFF0001;
            8'h04 : reg_data_out <= reg_scratch;
            default : reg_data_out <= 32'd0;
        endcase
    end

    // Output register or memory read data
    always @( posedge s_axi_aclk_in )
    begin
        if ( s_axi_aresetn_in == 1'b0 )
        begin
            axi_rdata  <= 0;
        end
        else
        begin
            // When there is a valid read address (s_axi_arvalid_in) with
            // acceptance of read address by the slave (axi_arready),
            // output the read dada
            if (slv_reg_rden)
            begin
                axi_rdata <= reg_data_out;     // register read data
            end
        end
    end

//======================================+=======================================
// 3.                      Generate read/write pulse
//------------------------------------------------------------------------------
    always @(posedge s_axi_aclk_in) wr_en <= slv_reg_wren;
    always @(posedge s_axi_aclk_in) wr_en_r <= wr_en;
    assign wr_en_pulse = wr_en & (~wr_en_r);   // Rising edge

    always @(posedge s_axi_aclk_in) rd_en <= slv_reg_rden;
    always @(posedge s_axi_aclk_in) rd_en_r <= rd_en;
    assign rd_en_pulse = rd_en & (~rd_en_r);   // Rising edge

//======================================+=======================================
// 4.                             Register assign
//------------------------------------------------------------------------------

endmodule
