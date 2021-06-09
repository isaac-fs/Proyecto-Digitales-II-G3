`timescale 1ns/100ps
`include "probador.v"
`include "phy.v"
`include "phy_synth.v"
`include "cmos_cells.v"


module BancoPrueba;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_2f;			// From probador of probador.v
   wire			clk_32f;		// From probador of probador.v
   wire			clk_4f;			// From probador of probador.v
   wire			clk_f;			// From probador of probador.v
   wire [7:0]		data_in_0;		// From probador of probador.v
   wire [7:0]		data_in_1;		// From probador of probador.v
   wire [7:0]		data_in_2;		// From probador of probador.v
   wire [7:0]		data_in_3;		// From probador of probador.v
   wire [7:0]		data_out_0;		// From phy of phy.v, ...
   wire [7:0]		data_out_1;		// From phy of phy.v, ...
   wire [7:0]		data_out_2;		// From phy of phy.v, ...
   wire [7:0]		data_out_3;		// From phy of phy.v, ...
   wire [7:0]		recirc_4;		// From phy of phy.v, ...
   wire [7:0]		recirc_5;		// From phy of phy.v, ...
   wire [7:0]		recirc_6;		// From phy of phy.v, ...
   wire [7:0]		recirc_7;		// From phy of phy.v, ...
   wire			reset_L;		// From probador of probador.v
   wire			valid_in_0;		// From probador of probador.v
   wire			valid_in_1;		// From probador of probador.v
   wire			valid_in_2;		// From probador of probador.v
   wire			valid_in_3;		// From probador of probador.v
   
   wire			valid_out_0;		// From phy of phy.v, ...
   wire			valid_out_1;		// From phy of phy.v, ...
   wire			valid_out_2;		// From phy of phy.v, ...
   wire			valid_out_3;		// From phy of phy.v, ...
   wire			valid_r_4;		// From phy of phy.v, ...
   wire			valid_r_5;		// From phy of phy.v, ...
   wire			valid_r_6;		// From phy of phy.v, ...
   wire			valid_r_7;		// From phy of phy.v, ...
   // End of automatics


   phy phy(/*AUTOINST*/
	   // Outputs
	   .recirc_4			(recirc_4[7:0]),
	   .recirc_5			(recirc_5[7:0]),
	   .recirc_6			(recirc_6[7:0]),
	   .recirc_7			(recirc_7[7:0]),
	   .valid_r_4			(valid_r_4),
	   .valid_r_5			(valid_r_5),
	   .valid_r_6			(valid_r_6),
	   .valid_r_7			(valid_r_7),
	   .data_out_0			(data_out_0[7:0]),
	   .data_out_1			(data_out_1[7:0]),
	   .data_out_2			(data_out_2[7:0]),
	   .data_out_3			(data_out_3[7:0]),
	   .valid_out_0			(valid_out_0),
	   .valid_out_1			(valid_out_1),
	   .valid_out_2			(valid_out_2),
	   .valid_out_3			(valid_out_3),
	   // Inputs
	   .data_in_0			(data_in_0[7:0]),
	   .data_in_1			(data_in_1[7:0]),
	   .data_in_2			(data_in_2[7:0]),
	   .data_in_3			(data_in_3[7:0]),
	   .reset_L			(reset_L),
	   .valid_in_0			(valid_in_0),
	   .valid_in_1			(valid_in_1),
	   .valid_in_2			(valid_in_2),
	   .valid_in_3			(valid_in_3),
	   .clk_f			(clk_f),
	   .clk_2f			(clk_2f),
	   .clk_4f			(clk_4f),
	   .clk_32f			(clk_32f));


   phy_synth phy_synth(/*AUTOINST*/
		       // Outputs
		       .data_out_0	(data_out_0[7:0]),
		       .data_out_1	(data_out_1[7:0]),
		       .data_out_2	(data_out_2[7:0]),
		       .data_out_3	(data_out_3[7:0]),
		       .recirc_4	(recirc_4[7:0]),
		       .recirc_5	(recirc_5[7:0]),
		       .recirc_6	(recirc_6[7:0]),
		       .recirc_7	(recirc_7[7:0]),
		       .valid_out_0	(valid_out_0),
		       .valid_out_1	(valid_out_1),
		       .valid_out_2	(valid_out_2),
		       .valid_out_3	(valid_out_3),
		       .valid_r_4	(valid_r_4),
		       .valid_r_5	(valid_r_5),
		       .valid_r_6	(valid_r_6),
		       .valid_r_7	(valid_r_7),
		       // Inputs
		       .clk_2f		(clk_2f),
		       .clk_32f		(clk_32f),
		       .clk_4f		(clk_4f),
		       .clk_f		(clk_f),
		       .data_in_0	(data_in_0[7:0]),
		       .data_in_1	(data_in_1[7:0]),
		       .data_in_2	(data_in_2[7:0]),
		       .data_in_3	(data_in_3[7:0]),
		       .reset_L		(reset_L),
		       .valid_in_0	(valid_in_0),
		       .valid_in_1	(valid_in_1),
		       .valid_in_2	(valid_in_2),
		       .valid_in_3	(valid_in_3));


   probador probador(/*AUTOINST*/
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
		     .valid_in_0	(valid_in_0),
		     .valid_in_1	(valid_in_1),
		     .valid_in_2	(valid_in_2),
		     .valid_in_3	(valid_in_3),
		     // Inputs
		     .data_out_0_cond	(data_out_0_cond[7:0]),
		     .data_out_1_cond	(data_out_1_cond[7:0]),
		     .data_out_2_cond	(data_out_2_cond[7:0]),
		     .data_out_3_cond	(data_out_3_cond[7:0]),
		     .valid_out_0_cond	(valid_out_0_cond),
		     .valid_out_1_cond	(valid_out_1_cond),
		     .valid_out_2_cond	(valid_out_2_cond),
		     .valid_out_3_cond	(valid_out_3_cond),
		     .recirc_4		(recirc_4[7:0]),
		     .recirc_5		(recirc_5[7:0]),
		     .recirc_6		(recirc_6[7:0]),
		     .recirc_7		(recirc_7[7:0]),
		     .valid_r_4		(valid_r_4),
		     .valid_r_5		(valid_r_5),
		     .valid_r_6		(valid_r_6),
		     .valid_r_7		(valid_r_7),
		     .recirc_synth_4	(recirc_synth_4[7:0]),
		     .recirc_synth_5	(recirc_synth_5[7:0]),
		     .recirc_synth_6	(recirc_synth_6[7:0]),
		     .recirc_synth_7	(recirc_synth_7[7:0]),
		     .valid_r_synth_4	(valid_r_synth_4),
		     .valid_r_synth_5	(valid_r_synth_5),
		     .valid_r_synth_6	(valid_r_synth_6),
		     .valid_r_synth_7	(valid_r_synth_7),
		     .data_out_0_synth	(data_out_0_synth[7:0]),
		     .data_out_1_synth	(data_out_1_synth[7:0]),
		     .data_out_2_synth	(data_out_2_synth[7:0]),
		     .data_out_3_synth	(data_out_3_synth[7:0]),
		     .valid_out_0_synth	(valid_out_0_synth),
		     .valid_out_1_synth	(valid_out_1_synth),
		     .valid_out_2_synth	(valid_out_2_synth),
		     .valid_out_3_synth	(valid_out_3_synth));

endmodule // BancoPrueba

