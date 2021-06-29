`timescale 	1ns	/ 100ps
`include "Serial_paralelo_tx.v"
`include "serial_paralelo_synth.v"
`include "../cmos_cells.v"
`include "probador.v"

module BancoPruebas_PtoS; 

	wire clk_4f, clk_32f, data_in, idle_cond, reset, idle_yosys;

 	serial_paralelo_synth		serial_paralelo_synth(/*AUTOINST*/
						   // Outputs
						   .idle		(idle_yosys),
						   // Inputs
						   .clk_32f		(clk_32f),
						   .clk_4f		(clk_4f),
						   .data_in		(data_in),
						   .reset		(reset));
						 
	Serial_paralelo_tx		Serial_paralelo_tx(/*AUTOINST*/
							  // Outputs
							  .idle		(idle_cond),
							  // Inputs
							  .clk_4f		(clk_4f),
							  .clk_32f		(clk_32f),
							  .data_in		(data_in),
							  .reset		(reset));
						 
	probador					probador(/*AUTOINST*/
								 // Outputs
								 .clk_4f		(clk_4f),
								 .clk_32f		(clk_32f),
								 .data_in		(data_in),
								 .reset			(reset),
								 // Inputs
								 .idle_cond	(idle_cond),

								 .idle_yosys	(idle_yosys));

endmodule
