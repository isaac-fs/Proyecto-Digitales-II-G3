`timescale 	1ns/100ps // escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "../../cmos_cells/cmos_cells.v"
`include "recirculador.v"
`include "synt_recirculador.v"
`include "probador.v"


module testbench; // Testbench
	// Por lo general, las señales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de módulos.

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador_ of probador.v
	wire [7:0]	data_in_0;		// From probador_ of probador.v
	wire [7:0]	data_in_1;		// From probador_ of probador.v
	wire [7:0]	data_in_2;		// From probador_ of probador.v
	wire [7:0]	data_in_3;		// From probador_ of probador.v
	wire [7:0]	data_out_0_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_0_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_1_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_1_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_2_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_2_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_3_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_3_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_4_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_4_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_5_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_5_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_6_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_6_synt;	// From synt_recirculador of synt_recirculador.v
	wire [7:0]	data_out_7_cond;	// From cond_recirculador of recirculador.v
	wire [7:0]	data_out_7_synt;	// From synt_recirculador of synt_recirculador.v
	wire		idle;			// From probador_ of probador.v
	wire		valid_in_0;		// From probador_ of probador.v
	wire		valid_in_1;		// From probador_ of probador.v
	wire		valid_in_2;		// From probador_ of probador.v
	wire		valid_in_3;		// From probador_ of probador.v
	wire		valid_out_0_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_0_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_1_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_1_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_2_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_2_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_3_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_3_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_4_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_4_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_5_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_5_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_6_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_6_synt;	// From synt_recirculador of synt_recirculador.v
	wire		valid_out_7_cond;	// From cond_recirculador of recirculador.v
	wire		valid_out_7_synt;	// From synt_recirculador of synt_recirculador.v
	// End of automatics

	// Descripción conductual
	/* recirculador AUTO_TEMPLATE ( 
		.data_out_@ (data_out_\1_cond[7:0]), 
	.valid_out_@ (valid_out_\1_cond) );
	*/
	recirculador cond_recirculador (/*AUTOINST*/
					// Outputs
					.data_out_0	(data_out_0_cond[7:0]), // Templated
					.data_out_1	(data_out_1_cond[7:0]), // Templated
					.data_out_2	(data_out_2_cond[7:0]), // Templated
					.data_out_3	(data_out_3_cond[7:0]), // Templated
					.data_out_4	(data_out_4_cond[7:0]), // Templated
					.data_out_5	(data_out_5_cond[7:0]), // Templated
					.data_out_6	(data_out_6_cond[7:0]), // Templated
					.data_out_7	(data_out_7_cond[7:0]), // Templated
					.valid_out_0	(valid_out_0_cond), // Templated
					.valid_out_1	(valid_out_1_cond), // Templated
					.valid_out_2	(valid_out_2_cond), // Templated
					.valid_out_3	(valid_out_3_cond), // Templated
					.valid_out_4	(valid_out_4_cond), // Templated
					.valid_out_5	(valid_out_5_cond), // Templated
					.valid_out_6	(valid_out_6_cond), // Templated
					.valid_out_7	(valid_out_7_cond), // Templated
					// Inputs
					.idle		(idle),
					.clk		(clk),
					.data_in_0	(data_in_0[7:0]),
					.data_in_1	(data_in_1[7:0]),
					.data_in_2	(data_in_2[7:0]),
					.data_in_3	(data_in_3[7:0]),
					.valid_in_0	(valid_in_0),
					.valid_in_1	(valid_in_1),
					.valid_in_2	(valid_in_2),
					.valid_in_3	(valid_in_3));
	
	// Descripción estructural
	/* synt_recirculador AUTO_TEMPLATE ( 
		.data_out_@ (data_out_\1_synt[7:0]), 
	.valid_out_@ (valid_out_\1_synt) );
	*/
	synt_recirculador synt_recirculador (/*AUTOINST*/
					     // Outputs
					     .data_out_0	(data_out_0_synt[7:0]), // Templated
					     .data_out_1	(data_out_1_synt[7:0]), // Templated
					     .data_out_2	(data_out_2_synt[7:0]), // Templated
					     .data_out_3	(data_out_3_synt[7:0]), // Templated
					     .data_out_4	(data_out_4_synt[7:0]), // Templated
					     .data_out_5	(data_out_5_synt[7:0]), // Templated
					     .data_out_6	(data_out_6_synt[7:0]), // Templated
					     .data_out_7	(data_out_7_synt[7:0]), // Templated
					     .valid_out_0	(valid_out_0_synt), // Templated
					     .valid_out_1	(valid_out_1_synt), // Templated
					     .valid_out_2	(valid_out_2_synt), // Templated
					     .valid_out_3	(valid_out_3_synt), // Templated
					     .valid_out_4	(valid_out_4_synt), // Templated
					     .valid_out_5	(valid_out_5_synt), // Templated
					     .valid_out_6	(valid_out_6_synt), // Templated
					     .valid_out_7	(valid_out_7_synt), // Templated
					     // Inputs
					     .clk		(clk),
					     .data_in_0		(data_in_0[7:0]),
					     .data_in_1		(data_in_1[7:0]),
					     .data_in_2		(data_in_2[7:0]),
					     .data_in_3		(data_in_3[7:0]),
					     .idle		(idle),
					     .valid_in_0	(valid_in_0),
					     .valid_in_1	(valid_in_1),
					     .valid_in_2	(valid_in_2),
					     .valid_in_3	(valid_in_3));
	
	// Probador: generador de señales y monitor
	probador probador_(/*AUTOINST*/
			   // Outputs
			   .idle		(idle),
			   .clk			(clk),
			   .data_in_0		(data_in_0[7:0]),
			   .data_in_1		(data_in_1[7:0]),
			   .data_in_2		(data_in_2[7:0]),
			   .data_in_3		(data_in_3[7:0]),
			   .valid_in_0		(valid_in_0),
			   .valid_in_1		(valid_in_1),
			   .valid_in_2		(valid_in_2),
			   .valid_in_3		(valid_in_3),
			   // Inputs
			   .data_out_0_cond	(data_out_0_cond[7:0]),
			   .data_out_1_cond	(data_out_1_cond[7:0]),
			   .data_out_2_cond	(data_out_2_cond[7:0]),
			   .data_out_3_cond	(data_out_3_cond[7:0]),
			   .data_out_4_cond	(data_out_4_cond[7:0]),
			   .data_out_5_cond	(data_out_5_cond[7:0]),
			   .data_out_6_cond	(data_out_6_cond[7:0]),
			   .data_out_7_cond	(data_out_7_cond[7:0]),
			   .valid_out_0_cond	(valid_out_0_cond),
			   .valid_out_1_cond	(valid_out_1_cond),
			   .valid_out_2_cond	(valid_out_2_cond),
			   .valid_out_3_cond	(valid_out_3_cond),
			   .valid_out_4_cond	(valid_out_4_cond),
			   .valid_out_5_cond	(valid_out_5_cond),
			   .valid_out_6_cond	(valid_out_6_cond),
			   .valid_out_7_cond	(valid_out_7_cond),
			   .data_out_0_synt	(data_out_0_synt[7:0]),
			   .data_out_1_synt	(data_out_1_synt[7:0]),
			   .data_out_2_synt	(data_out_2_synt[7:0]),
			   .data_out_3_synt	(data_out_3_synt[7:0]),
			   .data_out_4_synt	(data_out_4_synt[7:0]),
			   .data_out_5_synt	(data_out_5_synt[7:0]),
			   .data_out_6_synt	(data_out_6_synt[7:0]),
			   .data_out_7_synt	(data_out_7_synt[7:0]),
			   .valid_out_0_synt	(valid_out_0_synt),
			   .valid_out_1_synt	(valid_out_1_synt),
			   .valid_out_2_synt	(valid_out_2_synt),
			   .valid_out_3_synt	(valid_out_3_synt),
			   .valid_out_4_synt	(valid_out_4_synt),
			   .valid_out_5_synt	(valid_out_5_synt),
			   .valid_out_6_synt	(valid_out_6_synt),
			   .valid_out_7_synt	(valid_out_7_synt));
endmodule
