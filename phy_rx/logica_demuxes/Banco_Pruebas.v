`timescale 1ns / 100ps

`include "DEMUX_L1.v"
`include "DEMUX_L2.v"
`include "probadorPrueba.v"



module Banco_pruebas;
   //Cables 
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_2f;			// From probadorPrueba of probadorPrueba.v
   wire			clk_4f;			// From probadorPrueba of probadorPrueba.v
   wire			clk_f;			// From probadorPrueba of probadorPrueba.v
   wire [7:0]		data_0;			// From DEMUX_L1 of DEMUX_L1.v
   wire [7:0]		data_00;		// From DEMUX_L2 of DEMUX_L2.v
   wire [7:0]		data_000;		// From probadorPrueba of probadorPrueba.v
   wire [7:0]		data_1;			// From DEMUX_L1 of DEMUX_L1.v
   wire [7:0]		data_11;		// From DEMUX_L2 of DEMUX_L2.v
   wire [7:0]		data_2;			// From DEMUX_L1 of DEMUX_L1.v
   wire [7:0]		data_3;			// From DEMUX_L1 of DEMUX_L1.v
   wire			valid_0;		// From DEMUX_L1 of DEMUX_L1.v
   wire			valid_00;		// From DEMUX_L2 of DEMUX_L2.v
   wire			valid_000;		// From probadorPrueba of probadorPrueba.v
   wire			valid_1;		// From DEMUX_L1 of DEMUX_L1.v
   wire			valid_11;		// From DEMUX_L2 of DEMUX_L2.v
   wire			valid_2;		// From DEMUX_L1 of DEMUX_L1.v
   wire			valid_3;		// From DEMUX_L1 of DEMUX_L1.v
   // End of automatics

   
   //Instancia DEMUX_L1 Conductual

   DEMUX_L1 DEMUX_L1(/*AUTOINST*/
		     // Outputs
		     .data_0		(data_0[7:0]),
		     .data_1		(data_1[7:0]),
		     .data_2		(data_2[7:0]),
		     .data_3		(data_3[7:0]),
		     .valid_0		(valid_0),
		     .valid_1		(valid_1),
		     .valid_2		(valid_2),
		     .valid_3		(valid_3),
		     // Inputs
		     .data_00		(data_00[7:0]),
		     .data_11		(data_11[7:0]),
		     .valid_00		(valid_00),
		     .valid_11		(valid_11),
		     .clk_f		(clk_f),
		     .clk_2f		(clk_2f));

	//Instancia DEMUX_L2 Conductual

    DEMUX_L2 DEMUX_L2(/*AUTOINST*/
		      // Outputs
		      .data_00		(data_00[7:0]),
		      .data_11		(data_11[7:0]),
		      .valid_00		(valid_00),
		      .valid_11		(valid_11),
		      // Inputs
		      .data_000		(data_000[7:0]),
		      .valid_000	(valid_000),
		      .clk_4f		(clk_4f),
		      .clk_2f		(clk_2f));
 
   //Instancia probador

   probadorPrueba probadorPrueba(/*AUTOINST*/
				 // Outputs
				 .clk_f			(clk_f),
				 .clk_2f		(clk_2f),
				 .clk_4f		(clk_4f),
				 .data_000		(data_000[7:0]),
				 .valid_000		(valid_000),
				 // Inputs
				 .data_0		(data_0[7:0]),
				 .data_1		(data_1[7:0]),
				 .data_2		(data_2[7:0]),
				 .data_3		(data_3[7:0]),
				 .valid_0		(valid_0),
				 .valid_1		(valid_1),
				 .valid_2		(valid_2),
				 .valid_3		(valid_3),
				 .data_00		(data_00[7:0]),
				 .valid_00		(valid_00),
				 .data_11		(data_11[7:0]),
				 .valid_11		(valid_11));
   

endmodule // Banco_pruebas
