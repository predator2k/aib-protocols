// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2021 Intel Corporation.
/////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------
// Description: CSR control top module
//
//
// Change log
// 
/////////////////////////////////////////////////////////////////////////////////////////

module axi_st_csr (
	input 					clk,	
	input 					rst_n,
	
	input	[31:0]			master_address,       // width = 32,       master.address
    output	[31:0]			master_readdata,      // width = 32,             .readdata
    input					master_read,          //  width = 1,             .read
    input					master_write,         //  width = 1,             .write
    input	[31:0]			master_writedata,     // width = 32,             .writedata
    output					master_waitrequest,   //  width = 1,             .waitrequest
    output					master_readdatavalid, //  width = 1,             .readdatavalid
    output	[3:0]			master_byteenable,    //  width = 4,             .byteenable
	
	input 	[1:0]			chkr_pass,
	input					align_error,
	input 					ldr_tx_online,
	input 					ldr_rx_online,
	input 					fllr_tx_online,
	input 					fllr_rx_online,
	output	[31:0]			o_delay_x_value,
	output	[31:0]			o_delay_y_value,
	output	[31:0]			o_delay_z_value,
	
	
	`ifdef AXIST_DUAL
	  input 	[1:0]			f2l_chkr_pass,
	  input					    f2l_align_error,
	  output 					f2l_csr_patgen_en,
	  output 	[1:0]			f2l_csr_patgen_sel,
	  output 	[8:0]			f2l_csr_patgen_cnt,
	  output 					f2l_csr_cntuspatt_en,
	`endif
	
	output 					axist_rstn_out,
	
	output 					csr_patgen_en,
	output 	[1:0]			csr_patgen_sel,
	output 	[8:0]			csr_patgen_cnt,
	output 					csr_cntuspatt_en	

	
	);
	
	wire [15:0]				csr_wr_rd_addr;		
	wire					csr_wr_en;
	wire					csr_rd_en;
	wire [31:0]				csr_wr_data;
	
	wire [31:0]				csr_rd_datain;
	wire					csr_rd_dvalid;
	
	
	jtag2avmm_bridge jtag_bridge(

	.clk (clk),
	.rst_n (rst_n),
    
	.master_address(master_address),       // width = 32,       master.address
    .master_readdata(master_readdata),      // width = 32,             .readdata
    .master_read(master_read),          //  width = 1,             .read
    .master_write(master_write),         //  width = 1,             .write
    .master_writedata(master_writedata),     // width = 32,             .writedata
    .master_waitrequest(master_waitrequest),   //  width = 1,             .waitrequest
    .master_readdatavalid(master_readdatavalid), //  width = 1,             .readdatavalid
    .master_byteenable(master_byteenable),    //  width = 4,             .byteenable
	
	.wr_rd_addr(csr_wr_rd_addr),		
	.wr_en(csr_wr_en),
	.rd_en(csr_rd_en),
	.wr_data(csr_wr_data),
	
	.rd_datain(csr_rd_datain),
	.rd_dvalid(csr_rd_dvalid)
	
);

csr_ctrl csr(
	.clk(clk),	
	.rst_n(rst_n),
	
	.wr_rd_addr(csr_wr_rd_addr),		
	.wr_en(csr_wr_en),
	.rd_en(csr_rd_en),
	.wr_data(csr_wr_data),
	
	.rd_datain(csr_rd_datain),
	.rd_dvalid(csr_rd_dvalid),
	
	.chkr_pass(chkr_pass),
	.align_error(align_error),
	.ldr_tx_online(ldr_tx_online),
	.ldr_rx_online(ldr_rx_online),
	.fllr_tx_online(fllr_tx_online),
	.fllr_rx_online(fllr_rx_online),
	.o_delay_x_value(o_delay_x_value),
	.o_delay_y_value(o_delay_y_value),
	.o_delay_z_value(o_delay_z_value),
	.axist_rstn_out(axist_rstn_out),
	
	`ifdef AXIST_DUAL
	  .f2l_chkr_pass(f2l_chkr_pass),
	  .f2l_align_error(f2l_align_error),
	  .f2l_csr_patgen_en(f2l_csr_patgen_en),
	  .f2l_csr_patgen_sel(f2l_csr_patgen_sel),
	  .f2l_csr_patgen_cnt(f2l_csr_patgen_cnt),
	  .f2l_csr_cntuspatt_en(f2l_csr_cntuspatt_en),
	`endif
	.csr_patgen_en(csr_patgen_en),
	.csr_patgen_sel(csr_patgen_sel),
	.csr_patgen_cnt(csr_patgen_cnt),
	.csr_cntuspatt_en(csr_cntuspatt_en)
	
	
);

endmodule