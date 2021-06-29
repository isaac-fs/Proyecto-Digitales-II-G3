`timescale 	1ns/100ps // escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "../../cmos_cells/cmos_cells.v"
`include "paralelo_serial_rx.v"
`include "paralelo_serial_rx_synth.v"
`include "probador.v"


module testbench; // Testbench
	// Por lo general, las señales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de módulos.

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		active;			// From probador_ of probador.v
	wire		clk_32f;		// From probador_ of probador.v
	wire		clk_4f;			// From probador_ of probador.v
	wire		idle_out_cond;		// From paralelo_serial_rx_0 of paralelo_serial_rx.v
	wire		idle_out_synth;		// From paralelo_serial_rx_synth_0 of paralelo_serial_rx_synth.v
	wire		rst_L;			// From probador_ of probador.v
	// End of automatics
	
	// Descripción conductual
	/* paralelo_serial_rx AUTO_TEMPLATE ( 
		.idle_out (idle_out_cond));
	*/
	paralelo_serial_rx paralelo_serial_rx_0 (/*AUTOINST*/
						 // Outputs
						 .idle_out		(idle_out_cond), // Templated
						 // Inputs
						 .active		(active),
						 .clk_4f		(clk_4f),
						 .clk_32f		(clk_32f),
						 .rst_L			(rst_L));
					
	
	// Descripción estructural
	/* paralelo_serial_rx_synth AUTO_TEMPLATE ( 
		.idle_out (idle_out_synth));
	*/
	paralelo_serial_rx_synth paralelo_serial_rx_synth_0 (/*AUTOINST*/
							     // Outputs
							     .idle_out		(idle_out_synth), // Templated
							     // Inputs
							     .active		(active),
							     .clk_32f		(clk_32f),
							     .clk_4f		(clk_4f),
							     .rst_L		(rst_L));
	
	// Probador: generador de señales y monitor
	probador probador_(/*AUTOINST*/
			   // Outputs
			   .active		(active),
			   .rst_L		(rst_L),
			   .clk_4f		(clk_4f),
			   .clk_32f		(clk_32f),
			   // Inputs
			   .idle_out_cond	(idle_out_cond),
			   .idle_out_synth	(idle_out_synth));
endmodule
