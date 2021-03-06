`include "synthesis/cmos_cells/cmos_cells.v"
`include "rtl/FIFO.v"
`include "synthesis/FIFO_synth.v"
`include "testbench/probador.v"

`timescale 	1ns/100ps // escala	unidad temporal (valor de "#1") / precisión

module testbench; // Testbench

    parameter FIFO_DEPTH = 8; // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10;
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH);

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		almost_empty_flag;	// From fifo_cond of FIFO.v
	wire		almost_empty_flag_SYNTH;// From fifo_synth of FIFO_synth.v
	wire [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input;// From probador_0 of probador.v
	wire		almost_full_flag;	// From fifo_cond of FIFO.v
	wire		almost_full_flag_SYNTH;	// From fifo_synth of FIFO_synth.v
	wire [FIFO_PTR_SIZE-1:0] almost_full_threshold_input;// From probador_0 of probador.v
	wire		clk;			// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_in;	// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_out;	// From fifo_cond of FIFO.v
	wire [FIFO_WORD_SIZE-1:0] data_out_SYNTH;// From fifo_synth of FIFO_synth.v
	wire		empty_flag;		// From fifo_cond of FIFO.v
	wire		empty_flag_SYNTH;	// From fifo_synth of FIFO_synth.v
	wire		error_flag;		// From fifo_cond of FIFO.v
	wire		error_flag_SYNTH;	// From fifo_synth of FIFO_synth.v
	wire		full_flag;		// From fifo_cond of FIFO.v
	wire		full_flag_SYNTH;	// From fifo_synth of FIFO_synth.v
	wire		init;			// From probador_0 of probador.v
	wire		rd_en;			// From probador_0 of probador.v
	wire		reset_L;		// From probador_0 of probador.v
	wire		valid;			// From fifo_cond of FIFO.v, ...
	wire		wr_en;			// From probador_0 of probador.v
	// End of automatics


	// Descripción conductual
	FIFO fifo_cond (	
		/*AUTOINST*/
			// Outputs
			.data_out	(data_out[FIFO_WORD_SIZE-1:0]),
			.empty_flag	(empty_flag),
			.full_flag	(full_flag),
			.almost_empty_flag(almost_empty_flag),
			.almost_full_flag(almost_full_flag),
			.error_flag	(error_flag),
			.valid		(valid),
			// Inputs
			.clk		(clk),
			.reset_L	(reset_L),
			.data_in	(data_in[FIFO_WORD_SIZE-1:0]),
			.wr_en		(wr_en),
			.rd_en		(rd_en),
			.init		(init),
			.almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
			.almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
	
	// Descripción estructural
	/*FIFO_synth AUTO_TEMPLATE (
			.data_out		(data_out_SYNTH[FIFO_WORD_SIZE-1:0]),
			.empty_flag		(empty_flag_SYNTH),
			.full_flag		(full_flag_SYNTH),
			.almost_empty_flag	(almost_empty_flag_SYNTH),
			.almost_full_flag	(almost_full_flag_SYNTH),
			.error_flag		(error_flag_SYNTH),
			);*/
	FIFO_synth fifo_synth (
		/*AUTOINST*/
			       // Outputs
			       .almost_empty_flag(almost_empty_flag_SYNTH), // Templated
			       .almost_full_flag(almost_full_flag_SYNTH), // Templated
			       .data_out	(data_out_SYNTH[FIFO_WORD_SIZE-1:0]), // Templated
			       .empty_flag	(empty_flag_SYNTH), // Templated
			       .error_flag	(error_flag_SYNTH), // Templated
			       .full_flag	(full_flag_SYNTH), // Templated
			       .valid		(valid),
			       // Inputs
			       .almost_empty_threshold_input(almost_empty_threshold_input[2:0]),
			       .almost_full_threshold_input(almost_full_threshold_input[2:0]),
			       .clk		(clk),
			       .data_in		(data_in[9:0]),
			       .init		(init),
			       .rd_en		(rd_en),
			       .reset_L		(reset_L),
			       .wr_en		(wr_en));

	// Probador: generador de señales y monitor
	probador probador_0(
		/*AUTOINST*/
			    // Outputs
			    .clk		(clk),
			    .reset_L		(reset_L),
			    .data_in		(data_in[FIFO_WORD_SIZE-1:0]),
			    .wr_en		(wr_en),
			    .rd_en		(rd_en),
			    .init		(init),
			    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
			    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]),
			    // Inputs
			    .data_out		(data_out[FIFO_WORD_SIZE-1:0]),
			    .empty_flag		(empty_flag),
			    .full_flag		(full_flag),
			    .almost_empty_flag	(almost_empty_flag),
			    .almost_full_flag	(almost_full_flag),
			    .error_flag		(error_flag),
			    .data_out_SYNTH	(data_out_SYNTH[FIFO_WORD_SIZE-1:0]),
			    .empty_flag_SYNTH	(empty_flag_SYNTH),
			    .full_flag_SYNTH	(full_flag_SYNTH),
			    .almost_empty_flag_SYNTH(almost_empty_flag_SYNTH),
			    .almost_full_flag_SYNTH(almost_full_flag_SYNTH),
			    .error_flag_SYNTH	(error_flag_SYNTH));
endmodule

// Local Variables:
// verilog-library-directories:("." "../rtl/" "../synthesis/")
// End:
