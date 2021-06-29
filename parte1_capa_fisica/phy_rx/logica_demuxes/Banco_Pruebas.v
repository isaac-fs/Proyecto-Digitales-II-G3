`timescale 1ns / 100ps
`include "cmos_cells.v"
`include "DEMUXES.v"
`include "DEMUXES_synth.v"
`include "probadorPrueba.v"

module Banco_pruebas;
   //Cables 
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_2f;			// From probadorPrueba of probadorPrueba.v
   wire			clk_4f;			// From probadorPrueba of probadorPrueba.v
   wire			clk_f;			// From probadorPrueba of probadorPrueba.v
   wire [7:0]		data_000;		// From probadorPrueba of probadorPrueba.v
   wire [7:0]		data_0_cond;		// From DEMUXES of DEMUXES.v
   wire [7:0]		data_0_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire [7:0]		data_1_cond;		// From DEMUXES of DEMUXES.v
   wire [7:0]		data_1_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire [7:0]		data_2_cond;		// From DEMUXES of DEMUXES.v
   wire [7:0]		data_2_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire [7:0]		data_3_cond;		// From DEMUXES of DEMUXES.v
   wire [7:0]		data_3_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire			reset_L;		// From probadorPrueba of probadorPrueba.v
   wire			valid_000;		// From probadorPrueba of probadorPrueba.v
   wire			valid_0_cond;		// From DEMUXES of DEMUXES.v
   wire			valid_0_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire			valid_1_cond;		// From DEMUXES of DEMUXES.v
   wire			valid_1_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire			valid_2_cond;		// From DEMUXES of DEMUXES.v
   wire			valid_2_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   wire			valid_3_cond;		// From DEMUXES of DEMUXES.v
   wire			valid_3_synth;		// From DEMUXES_synth of DEMUXES_synth.v
   // End of automatics
  
  

   
   //Instancia DEMUXES Conductual

   /* DEMUXES AUTO_TEMPLATE (
	.data_0	(data_0_cond[7:0]),
	.data_1	(data_1_cond[7:0]),
	.data_2	(data_2_cond[7:0]),
	.data_3	(data_3_cond[7:0]),
	.valid_0 (valid_0_cond),
	.valid_1 (valid_1_cond),
	.valid_2 (valid_2_cond),
	.valid_3 (valid_3_cond));
    */

   DEMUXES DEMUXES(/*AUTOINST*/
		   // Outputs
		   .data_0		(data_0_cond[7:0]),	 // Templated
		   .data_1		(data_1_cond[7:0]),	 // Templated
		   .data_2		(data_2_cond[7:0]),	 // Templated
		   .data_3		(data_3_cond[7:0]),	 // Templated
		   .valid_0		(valid_0_cond),		 // Templated
		   .valid_1		(valid_1_cond),		 // Templated
		   .valid_2		(valid_2_cond),		 // Templated
		   .valid_3		(valid_3_cond),		 // Templated
		   // Inputs
		   .clk_f		(clk_f),
		   .clk_2f		(clk_2f),
		   .clk_4f		(clk_4f),
		   .data_000		(data_000[7:0]),
		   .valid_000		(valid_000));
		    

	//Instancia Sintetizado

     /* DEMUXES_synth AUTO_TEMPLATE (
	.data_0	(data_0_synth[7:0]),
	.data_1	(data_1_synth[7:0]),
	.data_2	(data_2_synth[7:0]),
	.data_3	(data_3_synth[7:0]),
	.valid_0 (valid_0_synth),
	.valid_1 (valid_1_synth),
	.valid_2 (valid_2_synth),
	.valid_3 (valid_3_synth));
    */
   

   DEMUXES_synth DEMUXES_synth(/*AUTOINST*/
			       // Outputs
			       .data_0		(data_0_synth[7:0]), // Templated
			       .data_1		(data_1_synth[7:0]), // Templated
			       .data_2		(data_2_synth[7:0]), // Templated
			       .data_3		(data_3_synth[7:0]), // Templated
			       .valid_0		(valid_0_synth), // Templated
			       .valid_1		(valid_1_synth), // Templated
			       .valid_2		(valid_2_synth), // Templated
			       .valid_3		(valid_3_synth), // Templated
			       // Inputs
			       .clk_2f		(clk_2f),
			       .clk_4f		(clk_4f),
			       .clk_f		(clk_f),
			       .data_000	(data_000[7:0]),
			       .valid_000	(valid_000));

   
   //Instancia probador

   probadorPrueba probadorPrueba(/*AUTOINST*/
				 // Outputs
				 .clk_f			(clk_f),
				 .clk_2f		(clk_2f),
				 .clk_4f		(clk_4f),
				 .reset_L		(reset_L),
				 .data_000		(data_000[7:0]),
				 .valid_000		(valid_000),
				 // Inputs
				 .data_0_cond		(data_0_cond[7:0]),
				 .data_1_cond		(data_1_cond[7:0]),
				 .data_2_cond		(data_2_cond[7:0]),
				 .data_3_cond		(data_3_cond[7:0]),
				 .valid_0_cond		(valid_0_cond),
				 .valid_1_cond		(valid_1_cond),
				 .valid_2_cond		(valid_2_cond),
				 .valid_3_cond		(valid_3_cond),
				 .data_0_synth		(data_0_synth[7:0]),
				 .data_1_synth		(data_1_synth[7:0]),
				 .data_2_synth		(data_2_synth[7:0]),
				 .data_3_synth		(data_3_synth[7:0]),
				 .valid_0_synth		(valid_0_synth),
				 .valid_1_synth		(valid_1_synth),
				 .valid_2_synth		(valid_2_synth),
				 .valid_3_synth		(valid_3_synth));
   

endmodule // Banco_pruebas
