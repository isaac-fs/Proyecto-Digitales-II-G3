/* Banco de pruebas para el módulo: phyrx. Prueba la descripción conductual y la estructural a partir del probador: probadorRx2.v*/
`timescale 	1ns				/ 100ps
`include "cmos_cells.v"
`include "phy_rx.v"
`include "phy_rx_synth.v"
`include "probador.v"

module BancoPruebas;
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk_2f;			// From probador_ of probador.v
    wire		clk_32f;		// From probador_ of probador.v
    wire		clk_4f;			// From probador_ of probador.v
    wire		clk_f;			// From probador_ of probador.v
    wire [7:0]		data_out_0_cond;	// From phy_rx_0 of phy_rx.v
    wire [7:0]		data_out_0_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire [7:0]		data_out_1_cond;	// From phy_rx_0 of phy_rx.v
    wire [7:0]		data_out_1_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire [7:0]		data_out_2_cond;	// From phy_rx_0 of phy_rx.v
    wire [7:0]		data_out_2_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire [7:0]		data_out_3_cond;	// From phy_rx_0 of phy_rx.v
    wire [7:0]		data_out_3_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire		datos_paralelo_serial;	// From probador_ of probador.v
    wire [7:0]		idle_out_cond;		// From phy_rx_0 of phy_rx.v
    wire [7:0]		idle_out_synth;		// From phy_rx_synth_0 of phy_rx_synth.v
    wire		valid_out_0_cond;	// From phy_rx_0 of phy_rx.v
    wire		valid_out_0_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire		valid_out_1_cond;	// From phy_rx_0 of phy_rx.v
    wire		valid_out_1_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire		valid_out_2_cond;	// From phy_rx_0 of phy_rx.v
    wire		valid_out_2_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    wire		valid_out_3_cond;	// From phy_rx_0 of phy_rx.v
    wire		valid_out_3_synth;	// From phy_rx_synth_0 of phy_rx_synth.v
    // End of automatics

	// Descripción conductual
	/* phy_rx AUTO_TEMPLATE ( 
		.idle_out (idle_out_cond[7:0]),
		.data_out_@	(data_out_\1_cond[7:0]),
		.valid_out_@ (valid_out_\1_cond));
		*/
    phy_rx phy_rx_0(
		/*AUTOINST*/
		    // Outputs
		    .idle_out		(idle_out_cond[7:0]),	 // Templated
		    .data_out_0		(data_out_0_cond[7:0]),	 // Templated
		    .data_out_1		(data_out_1_cond[7:0]),	 // Templated
		    .data_out_2		(data_out_2_cond[7:0]),	 // Templated
		    .data_out_3		(data_out_3_cond[7:0]),	 // Templated
		    .valid_out_0	(valid_out_0_cond),	 // Templated
		    .valid_out_1	(valid_out_1_cond),	 // Templated
		    .valid_out_2	(valid_out_2_cond),	 // Templated
		    .valid_out_3	(valid_out_3_cond),	 // Templated
		    // Inputs
		    .clk_f		(clk_f),
		    .clk_2f		(clk_2f),
		    .clk_4f		(clk_4f),
		    .clk_32f		(clk_32f),
		    .datos_paralelo_serial(datos_paralelo_serial));

	// Descripción estructural
	/* phy_rx_synth AUTO_TEMPLATE ( 
		.data_out_@	(data_out_\1_synth[7:0]),
		.idle_out (idle_out_synth[7:0]),
		.valid_out_@ (valid_out_\1_synth));
		*/
	phy_rx_synth phy_rx_synth_0(/*AUTOINST*/
				    // Outputs
				    .data_out_0		(data_out_0_synth[7:0]), // Templated
				    .data_out_1		(data_out_1_synth[7:0]), // Templated
				    .data_out_2		(data_out_2_synth[7:0]), // Templated
				    .data_out_3		(data_out_3_synth[7:0]), // Templated
				    .idle_out		(idle_out_synth[7:0]), // Templated
				    .valid_out_0	(valid_out_0_synth), // Templated
				    .valid_out_1	(valid_out_1_synth), // Templated
				    .valid_out_2	(valid_out_2_synth), // Templated
				    .valid_out_3	(valid_out_3_synth), // Templated
				    // Inputs
				    .clk_2f		(clk_2f),
				    .clk_32f		(clk_32f),
				    .clk_4f		(clk_4f),
				    .clk_f		(clk_f),
				    .datos_paralelo_serial(datos_paralelo_serial));


	probador probador_(
		/*AUTOINST*/
			   // Outputs
			   .clk_f		(clk_f),
			   .clk_2f		(clk_2f),
			   .clk_4f		(clk_4f),
			   .clk_32f		(clk_32f),
			   .datos_paralelo_serial(datos_paralelo_serial),
			   // Inputs
			   .idle_out_cond	(idle_out_cond[7:0]),
			   .data_out_0_cond	(data_out_0_cond[7:0]),
			   .data_out_1_cond	(data_out_1_cond[7:0]),
			   .data_out_2_cond	(data_out_2_cond[7:0]),
			   .data_out_3_cond	(data_out_3_cond[7:0]),
			   .valid_out_0_cond	(valid_out_0_cond),
			   .valid_out_1_cond	(valid_out_1_cond),
			   .valid_out_2_cond	(valid_out_2_cond),
			   .valid_out_3_cond	(valid_out_3_cond),
			   .idle_out_synth	(idle_out_synth[7:0]),
			   .data_out_0_synth	(data_out_0_synth[7:0]),
			   .data_out_1_synth	(data_out_1_synth[7:0]),
			   .data_out_2_synth	(data_out_2_synth[7:0]),
			   .data_out_3_synth	(data_out_3_synth[7:0]),
			   .valid_out_0_synth	(valid_out_0_synth),
			   .valid_out_1_synth	(valid_out_1_synth),
			   .valid_out_2_synth	(valid_out_2_synth),
			   .valid_out_3_synth	(valid_out_3_synth));

endmodule
