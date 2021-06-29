`timescale 1ns / 100ps
`include "cmos_cells.v"
`include "MUXES.v"
`include "MUXES_synth.v"
`include "probador.v"


module Banco_pruebas;
   //Cables 
 /*AUTOWIRE*/
 // Beginning of automatic wires (for undeclared instantiated-module outputs)
 wire			clk_2f;			// From probador of probador.v
 wire			clk_4f;			// From probador of probador.v
 wire			clk_f;			// From probador of probador.v
 wire [7:0]		data_0;			// From probador of probador.v
 wire [7:0]		data_000_cond;		// From MUXES of MUXES.v
 wire [7:0]		data_000_synth;		// From MUXES_synth of MUXES_synth.v
 wire [7:0]		data_1;			// From probador of probador.v
 wire [7:0]		data_2;			// From probador of probador.v
 wire [7:0]		data_3;			// From probador of probador.v
 wire			reset_L;		// From probador of probador.v
 wire			valid_0;		// From probador of probador.v
 wire			valid_000_cond;		// From MUXES of MUXES.v
 wire			valid_000_synth;	// From MUXES_synth of MUXES_synth.v
 wire			valid_1;		// From probador of probador.v
 wire			valid_2;		// From probador of probador.v
 wire			valid_3;		// From probador of probador.v
 // End of automatics

   //Instancia MUXES Conductual

   /* MUXES AUTO_TEMPLATE (
    .data_000 (data_000_cond[7:0]),
    .valid_000 (valid_000_cond));
    */

   MUXES MUXES(/*AUTOINST*/
	       // Outputs
	       .data_000		(data_000_cond[7:0]),	 // Templated
	       .valid_000		(valid_000_cond),	 // Templated
	       // Inputs
	       .reset_L			(reset_L),
	       .clk_f			(clk_f),
	       .clk_2f			(clk_2f),
	       .clk_4f			(clk_4f),
	       .data_0			(data_0[7:0]),
	       .data_1			(data_1[7:0]),
	       .data_2			(data_2[7:0]),
	       .data_3			(data_3[7:0]),
	       .valid_0			(valid_0),
	       .valid_1			(valid_1),
	       .valid_2			(valid_2),
	       .valid_3			(valid_3));

   //Instancia Sintetizado
    /* MUXES_synth AUTO_TEMPLATE (
    .data_000 (data_000_synth[7:0]),
    .valid_000 (valid_000_synth));
    */
   

   MUXES_synth MUXES_synth(/*AUTOINST*/
			   // Outputs
			   .data_000		(data_000_synth[7:0]), // Templated
			   .valid_000		(valid_000_synth), // Templated
			   // Inputs
			   .clk_2f		(clk_2f),
			   .clk_4f		(clk_4f),
			   .clk_f		(clk_f),
			   .data_0		(data_0[7:0]),
			   .data_1		(data_1[7:0]),
			   .data_2		(data_2[7:0]),
			   .data_3		(data_3[7:0]),
			   .reset_L		(reset_L),
			   .valid_0		(valid_0),
			   .valid_1		(valid_1),
			   .valid_2		(valid_2),
			   .valid_3		(valid_3));

   //Instancia probador

   probador probador(/*AUTOINST*/
		     // Outputs
		     .clk_f		(clk_f),
		     .clk_2f		(clk_2f),
		     .clk_4f		(clk_4f),
		     .data_0		(data_0[7:0]),
		     .data_1		(data_1[7:0]),
		     .data_2		(data_2[7:0]),
		     .data_3		(data_3[7:0]),
		     .valid_0		(valid_0),
		     .valid_1		(valid_1),
		     .valid_2		(valid_2),
		     .valid_3		(valid_3),
		     .reset_L		(reset_L),
		     // Inputs
		     .data_000_cond	(data_000_cond[7:0]),
		     .valid_000_cond	(valid_000_cond),
		     .data_000_synth	(data_000_synth[7:0]),
		     .valid_000_synth	(valid_000_synth));
   

endmodule // Banco_pruebas
