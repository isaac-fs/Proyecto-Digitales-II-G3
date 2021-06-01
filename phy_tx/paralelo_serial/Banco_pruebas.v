`timescale 1ns / 100ps
`include "cmos_cells.v"
`include "paralelo_serial.v"
`include "probador.v"
`include "paralelo_serial_synth.v"


module Banco_pruebas ;
   //Cables

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_32f;		// From probador of probador.v
   wire			clk_4f;			// From probador of probador.v
   wire [7:0]		data_in;		// From probador of probador.v
   wire			data_out_cond;		// From paralelo_serial of paralelo_serial.v
   wire			data_out_synth;		// From paralelo_serial_synth of paralelo_serial_synth.v
   wire			reset_L;		// From probador of probador.v
   wire			valid_in;		// From probador of probador.v
   // End of automatics


   //Instancia descripción conductual

   /* paralelo_serial AUTO_TEMPLATE (
   .data_out (data_out_cond));
    */
   
   paralelo_serial paralelo_serial(/*AUTOINST*/
				   // Outputs
				   .data_out		(data_out_cond), // Templated
				   // Inputs
				   .reset_L		(reset_L),
				   .clk_32f		(clk_32f),
				   .data_in		(data_in[7:0]),
				   .valid_in		(valid_in));

   //Instancia descripción estructural

   /* paralelo_serial_synth AUTO_TEMPLATE (
   .data_out (data_out_synth));
    */

   paralelo_serial_synth paralelo_serial_synth (/*AUTOINST*/
						// Outputs
						.data_out	(data_out_synth), // Templated
						// Inputs
						.clk_32f	(clk_32f),
						.data_in	(data_in[7:0]),
						.reset_L	(reset_L),
						.valid_in	(valid_in));
   



   //Instancia probador

   probador probador(/*AUTOINST*/
		     // Outputs
		     .clk_4f		(clk_4f),
		     .clk_32f		(clk_32f),
		     .data_in		(data_in[7:0]),
		     .valid_in		(valid_in),
		     .reset_L		(reset_L),
		     // Inputs
		     .data_out_cond	(data_out_cond),
		     .data_out_synth	(data_out_synth));



endmodule // Banco_pruebas

   
