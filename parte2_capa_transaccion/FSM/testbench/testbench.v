`include "synthesis/cmos_cells/cmos_cells.v"
`include "rtl/FSM.v"
`include "synthesis/FSM_synth.v"
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
	wire [FIFO_PTR_SIZE-1:0] almost_empty_threshold;// From FSM_0 of FSM.v
	wire [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input;// From probador_0 of probador.v
	wire [2:0]	almost_empty_threshold_synth;// From FSM_0_synth of FSM_synth.v
	wire [FIFO_PTR_SIZE-1:0] almost_full_threshold;// From FSM_0 of FSM.v
	wire [FIFO_PTR_SIZE-1:0] almost_full_threshold_input;// From probador_0 of probador.v
	wire [2:0]	almost_full_threshold_synth;// From FSM_0_synth of FSM_synth.v
	wire		clk;			// From probador_0 of probador.v
	wire		idle;			// From FSM_0 of FSM.v
	wire		idle_synth;		// From FSM_0_synth of FSM_synth.v
	wire		init;			// From probador_0 of probador.v
	wire		reset_L;		// From probador_0 of probador.v
	// End of automatics

	// Descripción conductual
	FSM FSM_0 (	
		/*AUTOINST*/
		   // Outputs
		   .idle		(idle),
		   .almost_empty_threshold(almost_empty_threshold[FIFO_PTR_SIZE-1:0]),
		   .almost_full_threshold(almost_full_threshold[FIFO_PTR_SIZE-1:0]),
		   // Inputs
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .init		(init),
		   .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		   .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]),
		   .FIFOs_empty		(FIFOs_empty[NUM_FIFOS-1:0]));
	
	// Descripción estructural
	/*FSM_synth AUTO_TEMPLATE (
				   .almost_empty_threshold(almost_empty_threshold_synth[2:0]),
			       .almost_full_threshold	(almost_full_threshold_synth[2:0]),
			       .idle		(idle_synth),
			);*/
	FSM_synth FSM_0_synth (
		/*AUTOINST*/
			       // Outputs
			       .almost_empty_threshold(almost_empty_threshold_synth[2:0]), // Templated
			       .almost_full_threshold(almost_full_threshold_synth[2:0]), // Templated
			       .idle		(idle_synth),	 // Templated
			       // Inputs
			       .FIFOs_empty	(FIFOs_empty[7:0]),
			       .almost_empty_threshold_input(almost_empty_threshold_input[2:0]),
			       .almost_full_threshold_input(almost_full_threshold_input[2:0]),
			       .clk		(clk),
			       .init		(init),
			       .reset_L		(reset_L));

	// Probador: generador de señales y monitor
	probador probador_0(
		/*AUTOINST*/
			    // Outputs
			    .clk		(clk),
			    .reset_L		(reset_L),
			    .init		(init),
			    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
			    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]),
			    .FIFOs_empty	(FIFOs_empty[NUM_FIFOS-1:0]),
			    // Inputs
			    .idle		(idle),
			    .almost_empty_threshold(almost_empty_threshold[FIFO_PTR_SIZE-1:0]),
			    .almost_full_threshold(almost_full_threshold[FIFO_PTR_SIZE-1:0]),
			    .idle_synth		(idle_synth),
			    .almost_empty_threshold_synth(almost_empty_threshold_synth[FIFO_PTR_SIZE-1:0]),
			    .almost_full_threshold_synth(almost_full_threshold_synth[FIFO_PTR_SIZE-1:0]));
endmodule

// Local Variables:
// verilog-library-directories:("." "../rtl/" "../synthesis/")
// End:
