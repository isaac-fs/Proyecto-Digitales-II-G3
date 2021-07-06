`include "synthesis/cmos_cells/cmos_cells.v"
`include "rtl/arbitro.v"
`include "synthesis/arbitro_synth.v"
`include "testbench/probador.v"

`timescale 	1ns/100ps // escala	unidad temporal (valor de "#1") / precisión

module testbench; // Testbench

    parameter FIFO_WORD_SIZE = 10;

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		almostfull_p0;		// From probador_0 of probador.v
	wire		almostfull_p1;		// From probador_0 of probador.v
	wire		almostfull_p2;		// From probador_0 of probador.v
	wire		almostfull_p3;		// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_in_0;	// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_in_1;	// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_in_2;	// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_in_3;	// From probador_0 of probador.v
	wire [FIFO_WORD_SIZE-1:0] data_out_0;	// From arbitro_cond of arbitro.v
	wire [FIFO_WORD_SIZE-1:0] data_out_0_synth;// From arbitro_synth of arbitro_synth.v
	wire [FIFO_WORD_SIZE-1:0] data_out_1;	// From arbitro_cond of arbitro.v
	wire [FIFO_WORD_SIZE-1:0] data_out_1_synth;// From arbitro_synth of arbitro_synth.v
	wire [FIFO_WORD_SIZE-1:0] data_out_2;	// From arbitro_cond of arbitro.v
	wire [FIFO_WORD_SIZE-1:0] data_out_2_synth;// From arbitro_synth of arbitro_synth.v
	wire [FIFO_WORD_SIZE-1:0] data_out_3;	// From arbitro_cond of arbitro.v
	wire [FIFO_WORD_SIZE-1:0] data_out_3_synth;// From arbitro_synth of arbitro_synth.v
	wire		empty_p0;		// From probador_0 of probador.v
	wire		empty_p1;		// From probador_0 of probador.v
	wire		empty_p2;		// From probador_0 of probador.v
	wire		empty_p3;		// From probador_0 of probador.v
	wire		pop_p0;			// From arbitro_cond of arbitro.v
	wire		pop_p0_synth;		// From arbitro_synth of arbitro_synth.v
	wire		pop_p1;			// From arbitro_cond of arbitro.v
	wire		pop_p1_synth;		// From arbitro_synth of arbitro_synth.v
	wire		pop_p2;			// From arbitro_cond of arbitro.v
	wire		pop_p2_synth;		// From arbitro_synth of arbitro_synth.v
	wire		pop_p3;			// From arbitro_cond of arbitro.v
	wire		pop_p3_synth;		// From arbitro_synth of arbitro_synth.v
	wire		push_p0;		// From arbitro_cond of arbitro.v
	wire		push_p0_synth;		// From arbitro_synth of arbitro_synth.v
	wire		push_p1;		// From arbitro_cond of arbitro.v
	wire		push_p1_synth;		// From arbitro_synth of arbitro_synth.v
	wire		push_p2;		// From arbitro_cond of arbitro.v
	wire		push_p2_synth;		// From arbitro_synth of arbitro_synth.v
	wire		push_p3;		// From arbitro_cond of arbitro.v
	wire		push_p3_synth;		// From arbitro_synth of arbitro_synth.v
	// End of automatics

	// Descripción conductual
	arbitro arbitro_cond (	
		/*AUTOINST*/
			      // Outputs
			      .data_out_0	(data_out_0[FIFO_WORD_SIZE-1:0]),
			      .data_out_1	(data_out_1[FIFO_WORD_SIZE-1:0]),
			      .data_out_2	(data_out_2[FIFO_WORD_SIZE-1:0]),
			      .data_out_3	(data_out_3[FIFO_WORD_SIZE-1:0]),
			      .pop_p0		(pop_p0),
			      .pop_p1		(pop_p1),
			      .pop_p2		(pop_p2),
			      .pop_p3		(pop_p3),
			      .push_p0		(push_p0),
			      .push_p1		(push_p1),
			      .push_p2		(push_p2),
			      .push_p3		(push_p3),
			      // Inputs
			      .empty_p0		(empty_p0),
			      .empty_p1		(empty_p1),
			      .empty_p2		(empty_p2),
			      .empty_p3		(empty_p3),
			      .almostfull_p0	(almostfull_p0),
			      .almostfull_p1	(almostfull_p1),
			      .almostfull_p2	(almostfull_p2),
			      .almostfull_p3	(almostfull_p3),
			      .data_in_0	(data_in_0[FIFO_WORD_SIZE-1:0]),
			      .data_in_1	(data_in_1[FIFO_WORD_SIZE-1:0]),
			      .data_in_2	(data_in_2[FIFO_WORD_SIZE-1:0]),
			      .data_in_3	(data_in_3[FIFO_WORD_SIZE-1:0]));
	
	// Descripción estructural
	/*arbitro_synth AUTO_TEMPLATE (
			.data_out_0	(data_out_0_synth[FIFO_WORD_SIZE-1:0]),
			.data_out_1	(data_out_1_synth[FIFO_WORD_SIZE-1:0]),
			.data_out_2	(data_out_2_synth[FIFO_WORD_SIZE-1:0]),
			.data_out_3	(data_out_3_synth[FIFO_WORD_SIZE-1:0]),
			.pop_p0		(pop_p0_synth),
			.pop_p1		(pop_p1_synth),
			.pop_p2		(pop_p2_synth),
			.pop_p3		(pop_p3_synth),
			.push_p0		(push_p0_synth),
			.push_p1		(push_p1_synth),
			.push_p2		(push_p2_synth),
			.push_p3		(push_p3_synth),
			.data_in_0		(data_in_0[FIFO_WORD_SIZE-1:0]),
			.data_in_1		(data_in_1[FIFO_WORD_SIZE-1:0]),
			.data_in_2		(data_in_2[FIFO_WORD_SIZE-1:0]),
			.data_in_3		(data_in_3[FIFO_WORD_SIZE-1:0]),
			);*/
	arbitro_synth arbitro_synth (
		/*AUTOINST*/
				     // Outputs
				     .data_out_0	(data_out_0_synth[FIFO_WORD_SIZE-1:0]), // Templated
				     .data_out_1	(data_out_1_synth[FIFO_WORD_SIZE-1:0]), // Templated
				     .data_out_2	(data_out_2_synth[FIFO_WORD_SIZE-1:0]), // Templated
				     .data_out_3	(data_out_3_synth[FIFO_WORD_SIZE-1:0]), // Templated
				     .pop_p0		(pop_p0_synth),	 // Templated
				     .pop_p1		(pop_p1_synth),	 // Templated
				     .pop_p2		(pop_p2_synth),	 // Templated
				     .pop_p3		(pop_p3_synth),	 // Templated
				     .push_p0		(push_p0_synth), // Templated
				     .push_p1		(push_p1_synth), // Templated
				     .push_p2		(push_p2_synth), // Templated
				     .push_p3		(push_p3_synth), // Templated
				     // Inputs
				     .almostfull_p0	(almostfull_p0),
				     .almostfull_p1	(almostfull_p1),
				     .almostfull_p2	(almostfull_p2),
				     .almostfull_p3	(almostfull_p3),
				     .data_in_0		(data_in_0[FIFO_WORD_SIZE-1:0]), // Templated
				     .data_in_1		(data_in_1[FIFO_WORD_SIZE-1:0]), // Templated
				     .data_in_2		(data_in_2[FIFO_WORD_SIZE-1:0]), // Templated
				     .data_in_3		(data_in_3[FIFO_WORD_SIZE-1:0]), // Templated
				     .empty_p0		(empty_p0),
				     .empty_p1		(empty_p1),
				     .empty_p2		(empty_p2),
				     .empty_p3		(empty_p3));

	// Probador: generador de señales y monitor
	probador probador_0(
		/*AUTOINST*/
			    // Outputs
			    .empty_p0		(empty_p0),
			    .empty_p1		(empty_p1),
			    .empty_p2		(empty_p2),
			    .empty_p3		(empty_p3),
			    .almostfull_p0	(almostfull_p0),
			    .almostfull_p1	(almostfull_p1),
			    .almostfull_p2	(almostfull_p2),
			    .almostfull_p3	(almostfull_p3),
			    .data_in_0		(data_in_0[FIFO_WORD_SIZE-1:0]),
			    .data_in_1		(data_in_1[FIFO_WORD_SIZE-1:0]),
			    .data_in_2		(data_in_2[FIFO_WORD_SIZE-1:0]),
			    .data_in_3		(data_in_3[FIFO_WORD_SIZE-1:0]),
			    // Inputs
			    .data_out_0		(data_out_0[FIFO_WORD_SIZE-1:0]),
			    .data_out_1		(data_out_1[FIFO_WORD_SIZE-1:0]),
			    .data_out_2		(data_out_2[FIFO_WORD_SIZE-1:0]),
			    .data_out_3		(data_out_3[FIFO_WORD_SIZE-1:0]),
			    .pop_p0		(pop_p0),
			    .pop_p1		(pop_p1),
			    .pop_p2		(pop_p2),
			    .pop_p3		(pop_p3),
			    .push_p0		(push_p0),
			    .push_p1		(push_p1),
			    .push_p2		(push_p2),
			    .push_p3		(push_p3),
			    .data_out_0_synth	(data_out_0_synth[FIFO_WORD_SIZE-1:0]),
			    .data_out_1_synth	(data_out_1_synth[FIFO_WORD_SIZE-1:0]),
			    .data_out_2_synth	(data_out_2_synth[FIFO_WORD_SIZE-1:0]),
			    .data_out_3_synth	(data_out_3_synth[FIFO_WORD_SIZE-1:0]),
			    .pop_p0_synth	(pop_p0_synth),
			    .pop_p1_synth	(pop_p1_synth),
			    .pop_p2_synth	(pop_p2_synth),
			    .pop_p3_synth	(pop_p3_synth),
			    .push_p0_synth	(push_p0_synth),
			    .push_p1_synth	(push_p1_synth),
			    .push_p2_synth	(push_p2_synth),
			    .push_p3_synth	(push_p3_synth));
endmodule

// Local Variables:
// verilog-library-directories:("." "../rtl/" "../synthesis/")
// End:
