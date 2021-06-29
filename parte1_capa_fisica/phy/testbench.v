`timescale 	1ns				/ 100ps
`include "cmos_cells.v"
`include "phy.v"
`include "probador_cond.v"

module testbench;
 /*AUTOWIRE*/
 // Beginning of automatic wires (for undeclared instantiated-module outputs)
 wire			clk_2f;			// From probador_cond of probador_cond.v
 wire			clk_32f;		// From probador_cond of probador_cond.v
 wire			clk_4f;			// From probador_cond of probador_cond.v
 wire			clk_f;			// From probador_cond of probador_cond.v
 wire [7:0]		data_in_0;		// From probador_cond of probador_cond.v
 wire [7:0]		data_in_1;		// From probador_cond of probador_cond.v
 wire [7:0]		data_in_2;		// From probador_cond of probador_cond.v
 wire [7:0]		data_in_3;		// From probador_cond of probador_cond.v
 wire [7:0]		data_out_0_cond;	// From phy of phy.v
 wire [7:0]		data_out_1_cond;	// From phy of phy.v
 wire [7:0]		data_out_2_cond;	// From phy of phy.v
 wire [7:0]		data_out_3_cond;	// From phy of phy.v
 wire [7:0]		recirc_4_cond;		// From phy of phy.v
 wire [7:0]		recirc_5_cond;		// From phy of phy.v
 wire [7:0]		recirc_6_cond;		// From phy of phy.v
 wire [7:0]		recirc_7_cond;		// From phy of phy.v
 wire			reset_L;		// From probador_cond of probador_cond.v
 wire			valid_in_0;		// From probador_cond of probador_cond.v
 wire			valid_in_1;		// From probador_cond of probador_cond.v
 wire			valid_in_2;		// From probador_cond of probador_cond.v
 wire			valid_in_3;		// From probador_cond of probador_cond.v
 wire			valid_out_0_cond;	// From phy of phy.v
 wire			valid_out_1_cond;	// From phy of phy.v
 wire			valid_out_2_cond;	// From phy of phy.v
 wire			valid_out_3_cond;	// From phy of phy.v
 wire			valid_r_4_cond;		// From phy of phy.v
 wire			valid_r_5_cond;		// From phy of phy.v
 wire			valid_r_6_cond;		// From phy of phy.v
 wire			valid_r_7_cond;		// From phy of phy.v
 // End of automatics
	// Descripción conductual
	/* phy AUTO_TEMPLATE ( 
	        .valid_r_@ (valid_r_\1_cond),
	        .recirc_@	(recirc_\1_cond[7:0]),
		.data_out_@	(data_out_\1_cond[7:0]),
		.valid_out_@ (valid_out_\1_cond));
		*/
    phy  phy(
		/*AUTOINST*/
	     // Outputs
	     .recirc_4			(recirc_4_cond[7:0]),	 // Templated
	     .recirc_5			(recirc_5_cond[7:0]),	 // Templated
	     .recirc_6			(recirc_6_cond[7:0]),	 // Templated
	     .recirc_7			(recirc_7_cond[7:0]),	 // Templated
	     .valid_r_4			(valid_r_4_cond),	 // Templated
	     .valid_r_5			(valid_r_5_cond),	 // Templated
	     .valid_r_6			(valid_r_6_cond),	 // Templated
	     .valid_r_7			(valid_r_7_cond),	 // Templated
	     .data_out_0		(data_out_0_cond[7:0]),	 // Templated
	     .data_out_1		(data_out_1_cond[7:0]),	 // Templated
	     .data_out_2		(data_out_2_cond[7:0]),	 // Templated
	     .data_out_3		(data_out_3_cond[7:0]),	 // Templated
	     .valid_out_0		(valid_out_0_cond),	 // Templated
	     .valid_out_1		(valid_out_1_cond),	 // Templated
	     .valid_out_2		(valid_out_2_cond),	 // Templated
	     .valid_out_3		(valid_out_3_cond),	 // Templated
	     // Inputs
	     .data_in_0			(data_in_0[7:0]),
	     .data_in_1			(data_in_1[7:0]),
	     .data_in_2			(data_in_2[7:0]),
	     .data_in_3			(data_in_3[7:0]),
	     .reset_L			(reset_L),
	     .valid_in_0		(valid_in_0),
	     .valid_in_1		(valid_in_1),
	     .valid_in_2		(valid_in_2),
	     .valid_in_3		(valid_in_3),
	     .clk_f			(clk_f),
	     .clk_2f			(clk_2f),
	     .clk_4f			(clk_4f),
	     .clk_32f			(clk_32f));

	probador_cond probador_cond(
		/*AUTOINST*/
				    // Outputs
				    .clk_f		(clk_f),
				    .clk_2f		(clk_2f),
				    .clk_4f		(clk_4f),
				    .clk_32f		(clk_32f),
				    .reset_L		(reset_L),
				    .data_in_0		(data_in_0[7:0]),
				    .data_in_1		(data_in_1[7:0]),
				    .data_in_2		(data_in_2[7:0]),
				    .data_in_3		(data_in_3[7:0]),
				    .valid_in_0		(valid_in_0),
				    .valid_in_1		(valid_in_1),
				    .valid_in_2		(valid_in_2),
				    .valid_in_3		(valid_in_3),
				    // Inputs
				    .data_out_0_cond	(data_out_0_cond[7:0]),
				    .data_out_1_cond	(data_out_1_cond[7:0]),
				    .data_out_2_cond	(data_out_2_cond[7:0]),
				    .data_out_3_cond	(data_out_3_cond[7:0]),
				    .valid_out_0_cond	(valid_out_0_cond),
				    .valid_out_1_cond	(valid_out_1_cond),
				    .valid_out_2_cond	(valid_out_2_cond),
				    .valid_out_3_cond	(valid_out_3_cond),
				    .recirc_4_cond	(recirc_4_cond[7:0]),
				    .recirc_5_cond	(recirc_5_cond[7:0]),
				    .recirc_6_cond	(recirc_6_cond[7:0]),
				    .recirc_7_cond	(recirc_7_cond[7:0]),
				    .valid_r_4		(valid_r_4_cond),
				    .valid_r_5		(valid_r_5_cond),
				    .valid_r_6		(valid_r_6_cond),
				    .valid_r_7		(valid_r_7_cond));
endmodule // testbench

