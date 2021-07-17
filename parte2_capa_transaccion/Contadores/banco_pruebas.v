`timescale 1ns /100ps
`include "cmos_cells.v"
`include "contadores_synth.v"
`include "contadores.v"
`include "probador.v"

module banco_pruebas;
//testbench 

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			clk;			// From probador of probador.v
wire [5:0]		data;			// From contadores of contadores.v
wire [5:0]		data_E;			// From contadores_synth_0 of contadores_synth.v
wire [9:0]		data_out_FIFO_0;	// From probador of probador.v
wire [9:0]		data_out_FIFO_1;	// From probador of probador.v
wire [9:0]		data_out_FIFO_2;	// From probador of probador.v
wire [9:0]		data_out_FIFO_3;	// From probador of probador.v
wire			empty_FIFO_0;		// From probador of probador.v
wire			empty_FIFO_1;		// From probador of probador.v
wire			empty_FIFO_2;		// From probador of probador.v
wire			empty_FIFO_3;		// From probador of probador.v
wire			idle;			// From probador of probador.v
wire [1:0]		idx;			// From probador of probador.v
wire			pop_0;			// From probador of probador.v
wire			pop_1;			// From probador of probador.v
wire			pop_2;			// From probador of probador.v
wire			pop_3;			// From probador of probador.v
wire			req;			// From probador of probador.v
wire			rst_l;			// From probador of probador.v
wire			valid;			// From contadores of contadores.v
wire			valid_E;		// From contadores_synth_0 of contadores_synth.v
// End of automatics
   

contadores contadores(/*AUTOINST*/
		      // Outputs
		      .data		(data[5:0]),
		      .valid		(valid),
		      // Inputs
		      .clk		(clk),
		      .rst_l		(rst_l),
		      .req		(req),
		      .pop_0		(pop_0),
		      .pop_1		(pop_1),
		      .pop_2		(pop_2),
		      .pop_3		(pop_3),
		      .idx		(idx[1:0]),
		      .idle		(idle),
		      .empty_FIFO_0	(empty_FIFO_0),
		      .empty_FIFO_1	(empty_FIFO_1),
		      .empty_FIFO_2	(empty_FIFO_2),
		      .empty_FIFO_3	(empty_FIFO_3));

/*contadores_synth AUTO_TEMPLATE(
	.data		(data_E[5:0]),
	.valid		(valid_E));*/
contadores_synth contadores_synth_0 (/*AUTOINST*/
				     // Outputs
				     .data		(data_E[5:0]),	 // Templated
				     .valid		(valid_E),	 // Templated
				     // Inputs
				     .clk		(clk),
				     .empty_FIFO_0	(empty_FIFO_0),
				     .empty_FIFO_1	(empty_FIFO_1),
				     .empty_FIFO_2	(empty_FIFO_2),
				     .empty_FIFO_3	(empty_FIFO_3),
				     .idle		(idle),
				     .idx		(idx[1:0]),
				     .pop_0		(pop_0),
				     .pop_1		(pop_1),
				     .pop_2		(pop_2),
				     .pop_3		(pop_3),
				     .req		(req),
				     .rst_l		(rst_l));

probador probador(/*AUTOINST*/
		  // Outputs
		  .clk			(clk),
		  .rst_l		(rst_l),
		  .req			(req),
		  .data_out_FIFO_0	(data_out_FIFO_0[9:0]),
		  .data_out_FIFO_1	(data_out_FIFO_1[9:0]),
		  .data_out_FIFO_2	(data_out_FIFO_2[9:0]),
		  .data_out_FIFO_3	(data_out_FIFO_3[9:0]),
		  .pop_0		(pop_0),
		  .pop_1		(pop_1),
		  .pop_2		(pop_2),
		  .pop_3		(pop_3),
		  .idx			(idx[1:0]),
		  .idle			(idle),
		  .empty_FIFO_0		(empty_FIFO_0),
		  .empty_FIFO_1		(empty_FIFO_1),
		  .empty_FIFO_2		(empty_FIFO_2),
		  .empty_FIFO_3		(empty_FIFO_3),
		  // Inputs
		  .data			(data[5:0]),
		  .data_E		(data_E[5:0]),
		  .valid		(valid),
		  .valid_E		(valid_E));

		  
endmodule
