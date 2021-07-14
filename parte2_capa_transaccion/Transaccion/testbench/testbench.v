`include "synthesis/cmos_cells/cmos_cells.v"
`include "rtl/transaccion.v"
`include "synthesis/transaccion_synth.v"
`include "testbench/probador.v"

`timescale 	1ns/100ps // escala	unidad temporal (valor de "#1") / precisión

module testbench; // Testbench

    parameter NUM_FIFOS = 8;
    parameter FIFO_DEPTH = 8; // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10;
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH);

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire [NUM_FIFOS-1:0] FIFOs_empty;	// From probador_0 of probador.v
	wire [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input;// From probador_0 of probador.v
	wire [FIFO_PTR_SIZE-1:0] almost_full_threshold_input;// From probador_0 of probador.v
	wire		clk;			// From probador_0 of probador.v
	wire [4:0]	data;			// From transaccion_0 of transaccion.v
	wire [FIFO_WORD_SIZE-1:0] data_out0;	// From transaccion_0 of transaccion.v
	wire [FIFO_WORD_SIZE-1:0] data_out0_synth;// From transaccion_synth_0 of transaccion_synth.v
	wire [FIFO_WORD_SIZE-1:0] data_out1;	// From transaccion_0 of transaccion.v
	wire [FIFO_WORD_SIZE-1:0] data_out1_synth;// From transaccion_synth_0 of transaccion_synth.v
	wire [FIFO_WORD_SIZE-1:0] data_out2;	// From transaccion_0 of transaccion.v
	wire [FIFO_WORD_SIZE-1:0] data_out2_synth;// From transaccion_synth_0 of transaccion_synth.v
	wire [FIFO_WORD_SIZE-1:0] data_out3;	// From transaccion_0 of transaccion.v
	wire [FIFO_WORD_SIZE-1:0] data_out3_synth;// From transaccion_synth_0 of transaccion_synth.v
	wire [4:0]	data_synth;		// From transaccion_synth_0 of transaccion_synth.v
	wire [FIFO_WORD_SIZE-1:0] dest_n_data_in0;// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] dest_n_data_in1;// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] dest_n_data_in2;// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] dest_n_data_in3;// From probador_0 of probador.v
	wire [1:0]	idx;			// From probador_0 of probador.v
	wire		init;			// From probador_0 of probador.v
	wire		pop_FIFO_out0;		// From probador_0 of probador.v
	wire		pop_FIFO_out1;		// From probador_0 of probador.v
	wire		pop_FIFO_out2;		// From probador_0 of probador.v
	wire		pop_FIFO_out3;		// From probador_0 of probador.v
	wire		push_FIFO_in0;		// From probador_0 of probador.v
	wire		push_FIFO_in1;		// From probador_0 of probador.v
	wire		push_FIFO_in2;		// From probador_0 of probador.v
	wire		push_FIFO_in3;		// From probador_0 of probador.v
	wire		req;			// From probador_0 of probador.v
	wire		reset_L;		// From probador_0 of probador.v
	wire		valid;			// From transaccion_0 of transaccion.v
	wire		valid_synth;		// From transaccion_synth_0 of transaccion_synth.v
	// End of automatics

	// Descripción conductual
	transaccion transaccion_0 (/*AUTOINST*/
				   // Outputs
				   .data_out0		(data_out0[FIFO_WORD_SIZE-1:0]),
				   .data_out1		(data_out1[FIFO_WORD_SIZE-1:0]),
				   .data_out2		(data_out2[FIFO_WORD_SIZE-1:0]),
				   .data_out3		(data_out3[FIFO_WORD_SIZE-1:0]),
				   .data		(data[4:0]),
				   .valid		(valid),
				   // Inputs
				   .clk			(clk),
				   .dest_n_data_in0	(dest_n_data_in0[FIFO_WORD_SIZE-1:0]),
				   .push_FIFO_in0	(push_FIFO_in0),
				   .dest_n_data_in1	(dest_n_data_in1[FIFO_WORD_SIZE-1:0]),
				   .push_FIFO_in1	(push_FIFO_in1),
				   .dest_n_data_in2	(dest_n_data_in2[FIFO_WORD_SIZE-1:0]),
				   .push_FIFO_in2	(push_FIFO_in2),
				   .dest_n_data_in3	(dest_n_data_in3[FIFO_WORD_SIZE-1:0]),
				   .push_FIFO_in3	(push_FIFO_in3),
				   .pop_FIFO_out0	(pop_FIFO_out0),
				   .pop_FIFO_out1	(pop_FIFO_out1),
				   .pop_FIFO_out2	(pop_FIFO_out2),
				   .pop_FIFO_out3	(pop_FIFO_out3),
				   .req			(req),
				   .idx			(idx[1:0]),
				   .reset_L		(reset_L),
				   .init		(init),
				   .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
				   .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
	
	// Descripción estructural
	/* transaccion_synth AUTO_TEMPLATE (
				.data_out@  (data_out\1_synth[FIFO_WORD_SIZE-1:0]),
			       .data	(data_synth[4:0]),
			       .valid		(valid_synth));
	 */
        transaccion_synth transaccion_synth_0 (/*AUTOINST*/
					       // Outputs
					       .data		(data_synth[4:0]), // Templated
					       .data_out0	(data_out0_synth[FIFO_WORD_SIZE-1:0]), // Templated
					       .data_out1	(data_out1_synth[FIFO_WORD_SIZE-1:0]), // Templated
					       .data_out2	(data_out2_synth[FIFO_WORD_SIZE-1:0]), // Templated
					       .data_out3	(data_out3_synth[FIFO_WORD_SIZE-1:0]), // Templated
					       .valid		(valid_synth),	 // Templated
					       // Inputs
					       .almost_empty_threshold_input(almost_empty_threshold_input[2:0]),
					       .almost_full_threshold_input(almost_full_threshold_input[2:0]),
					       .clk		(clk),
					       .dest_n_data_in0	(dest_n_data_in0[9:0]),
					       .dest_n_data_in1	(dest_n_data_in1[9:0]),
					       .dest_n_data_in2	(dest_n_data_in2[9:0]),
					       .dest_n_data_in3	(dest_n_data_in3[9:0]),
					       .idx		(idx[1:0]),
					       .init		(init),
					       .pop_FIFO_out0	(pop_FIFO_out0),
					       .pop_FIFO_out1	(pop_FIFO_out1),
					       .pop_FIFO_out2	(pop_FIFO_out2),
					       .pop_FIFO_out3	(pop_FIFO_out3),
					       .push_FIFO_in0	(push_FIFO_in0),
					       .push_FIFO_in1	(push_FIFO_in1),
					       .push_FIFO_in2	(push_FIFO_in2),
					       .push_FIFO_in3	(push_FIFO_in3),
					       .req		(req),
					       .reset_L		(reset_L));

	// Probador: generador de señales y monitor
	probador probador_0(/*AUTOINST*/
			    // Outputs
			    .clk		(clk),
			    .dest_n_data_in0	(dest_n_data_in0[FIFO_WORD_SIZE-1:0]),
			    .push_FIFO_in0	(push_FIFO_in0),
			    .dest_n_data_in1	(dest_n_data_in1[FIFO_WORD_SIZE-1:0]),
			    .push_FIFO_in1	(push_FIFO_in1),
			    .dest_n_data_in2	(dest_n_data_in2[FIFO_WORD_SIZE-1:0]),
			    .push_FIFO_in2	(push_FIFO_in2),
			    .dest_n_data_in3	(dest_n_data_in3[FIFO_WORD_SIZE-1:0]),
			    .push_FIFO_in3	(push_FIFO_in3),
			    .pop_FIFO_out0	(pop_FIFO_out0),
			    .pop_FIFO_out1	(pop_FIFO_out1),
			    .pop_FIFO_out2	(pop_FIFO_out2),
			    .pop_FIFO_out3	(pop_FIFO_out3),
			    .req		(req),
			    .idx		(idx[1:0]),
			    .reset_L		(reset_L),
			    .init		(init),
			    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
			    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]),
			    .FIFOs_empty	(FIFOs_empty[NUM_FIFOS-1:0]),
			    // Inputs
			    .data_out0		(data_out0[FIFO_WORD_SIZE-1:0]),
			    .data_out1		(data_out1[FIFO_WORD_SIZE-1:0]),
			    .data_out2		(data_out2[FIFO_WORD_SIZE-1:0]),
			    .data_out3		(data_out3[FIFO_WORD_SIZE-1:0]),
			    .data		(data[4:0]),
			    .valid		(valid),
			    .data_out0_synth	(data_out0_synth[FIFO_WORD_SIZE-1:0]),
			    .data_out1_synth	(data_out1_synth[FIFO_WORD_SIZE-1:0]),
			    .data_out2_synth	(data_out2_synth[FIFO_WORD_SIZE-1:0]),
			    .data_out3_synth	(data_out3_synth[FIFO_WORD_SIZE-1:0]),
			    .data_synth		(data_synth[4:0]),
			    .valid_synth	(valid_synth));
endmodule

// Local Variables:
// verilog-library-directories:("." "../rtl/" "../synthesis/")
// End:
