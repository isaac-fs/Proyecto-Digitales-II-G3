/* Banco de pruebas para el módulo: phyrx. Prueba la descripción conductual y la estructural a partir del probador: probadorRx2.v*/
`timescale 	1ns				/ 100ps
`include "cmos_cells.v"
`include "serial_paralelo_rx.v"
`include "serial_paralelo_rx_synth.v"
`include "probador.v"

module BancoPruebas;
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		active_cond;		// From module_serial_paralelo_0 of serial_paralelo_rx.v
    wire		active_synth;		// From module_serial_paralelo_0_synth of serial_paralelo_rx_synth.v
    wire		clk_32f;		// From probador_ of probador.v
    wire		clk_4f;			// From probador_ of probador.v
    wire		data_in;		// From probador_ of probador.v
    wire		rst_L;			// From probador_ of probador.v
    wire [7:0]		sp_out_cond;		// From module_serial_paralelo_0 of serial_paralelo_rx.v
    wire [7:0]		sp_out_synth;		// From module_serial_paralelo_0_synth of serial_paralelo_rx_synth.v
    wire		valid_out_sp_cond;	// From module_serial_paralelo_0 of serial_paralelo_rx.v
    wire		valid_out_sp_synth;	// From module_serial_paralelo_0_synth of serial_paralelo_rx_synth.v
    // End of automatics

	// Descripción conductual
	/* serial_paralelo_rx AUTO_TEMPLATE ( 
		.sp_out (sp_out_cond[7:0]),
		.valid_out_sp (valid_out_sp_cond),
		.active(active_cond));
	*/
    serial_paralelo_rx module_serial_paralelo_0(
		/*AUTOINST*/
						// Outputs
						.sp_out		(sp_out_cond[7:0]), // Templated
						.valid_out_sp	(valid_out_sp_cond), // Templated
						.active		(active_cond),	 // Templated
						// Inputs
						.data_in	(data_in),
						.rst_L		(rst_L),
						.clk_4f		(clk_4f),
						.clk_32f	(clk_32f));

	// Descripción estructural
	/* serial_paralelo_rx_synth AUTO_TEMPLATE ( 
		.sp_out (sp_out_synth[7:0]),
		.valid_out_sp (valid_out_sp_synth),
		.active(active_synth));
	*/
	serial_paralelo_rx_synth module_serial_paralelo_0_synth(
		/*AUTOINST*/
								// Outputs
								.active		(active_synth),	 // Templated
								.sp_out		(sp_out_synth[7:0]), // Templated
								.valid_out_sp	(valid_out_sp_synth), // Templated
								// Inputs
								.clk_32f	(clk_32f),
								.clk_4f		(clk_4f),
								.data_in	(data_in),
								.rst_L		(rst_L));

	probador probador_(
		/*AUTOINST*/
			   // Outputs
			   .rst_L		(rst_L),
			   .clk_4f		(clk_4f),
			   .clk_32f		(clk_32f),
			   .data_in		(data_in),
			   // Inputs
			   .sp_out_cond		(sp_out_cond[7:0]),
			   .sp_out_synth	(sp_out_synth[7:0]),
			   .valid_out_sp_cond	(valid_out_sp_cond),
			   .valid_out_sp_synth	(valid_out_sp_synth),
			   .active_cond		(active_cond),
			   .active_synth	(active_synth));

endmodule
