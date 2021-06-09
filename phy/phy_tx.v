`include "MUXES.v"
`include "recirculador.v"
`include "paralelo_serial_tx.v"
`include "Serial_paralelo_tx.v"

module phy_tx (//Salida de paralelo a serial
	       output 	    data_out,
	       //Salidas de reciculador hacia probador 
	       output [7:0] recirc_4,
	       output [7:0] recirc_5,
	       output [7:0] recirc_6,
	       output [7:0] recirc_7,
	       output 	    valid_r_4,
	       output 	    valid_r_5,
	       output 	    valid_r_6,
	       output 	    valid_r_7,
	       //Entradas de reloj
	       input 	    clk_f,
	       input 	    clk_2f,
	       input 	    clk_4f,
	       input 	    clk_32f,
	       //Reset
	       input 	    reset_L,
	       //Entradas de datos y valid desde probador
	       input [7:0]  data_in_0,
	       input [7:0]  data_in_1,
	       input [7:0]  data_in_2,
	       input [7:0]  data_in_3,
	       input 	    valid_in_0,
	       input 	    valid_in_1,
	       input 	    valid_in_2,
	       input 	    valid_in_3,
	       //Entrada desde el phy_rx
	       input 	    data_in);
   
   

   

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [7:0]		data_000;		// From muxes_tx of MUXES.v
   wire			idle;			// From serial_paralelo_tx of Serial_paralelo_tx.v
   wire [7:0]		recirc_0;		// From recirculador_tx of recirculador.v
   wire [7:0]		recirc_1;		// From recirculador_tx of recirculador.v
   wire [7:0]		recirc_2;		// From recirculador_tx of recirculador.v
   wire [7:0]		recirc_3;		// From recirculador_tx of recirculador.v
   wire			valid_000;		// From muxes_tx of MUXES.v
   wire			valid_r_0;		// From recirculador_tx of recirculador.v
   wire			valid_r_1;		// From recirculador_tx of recirculador.v
   wire			valid_r_2;		// From recirculador_tx of recirculador.v
   wire			valid_r_3;		// From recirculador_tx of recirculador.v
   // End of automatics

   /* recirculador AUTO_TEMPLATE (
    .data_out_@ (recirc_\1[7:0]),
    .clk (clk_f),
    .valid_out_@ (valid_r_\1));
    */

   recirculador recirculador_tx(/*AUTOINST*/
				// Outputs
				.data_out_0	(recirc_0[7:0]), // Templated
				.data_out_1	(recirc_1[7:0]), // Templated
				.data_out_2	(recirc_2[7:0]), // Templated
				.data_out_3	(recirc_3[7:0]), // Templated
				.data_out_4	(recirc_4[7:0]), // Templated
				.data_out_5	(recirc_5[7:0]), // Templated
				.data_out_6	(recirc_6[7:0]), // Templated
				.data_out_7	(recirc_7[7:0]), // Templated
				.valid_out_0	(valid_r_0),	 // Templated
				.valid_out_1	(valid_r_1),	 // Templated
				.valid_out_2	(valid_r_2),	 // Templated
				.valid_out_3	(valid_r_3),	 // Templated
				.valid_out_4	(valid_r_4),	 // Templated
				.valid_out_5	(valid_r_5),	 // Templated
				.valid_out_6	(valid_r_6),	 // Templated
				.valid_out_7	(valid_r_7),	 // Templated
				// Inputs
				.idle		(idle),
				.clk		(clk_f),	 // Templated
				.data_in_0	(data_in_0[7:0]),
				.data_in_1	(data_in_1[7:0]),
				.data_in_2	(data_in_2[7:0]),
				.data_in_3	(data_in_3[7:0]),
				.valid_in_0	(valid_in_0),
				.valid_in_1	(valid_in_1),
				.valid_in_2	(valid_in_2),
				.valid_in_3	(valid_in_3));
   /* MUXES AUTO_TEMPLATE (
    .data_@ (recirc_\1[7:0]),
    .valid_@ (valid_r_\1),
    .data_000 (data_000[7:0]),
    .valid_000 (valid_000));
    */
   
   MUXES muxes_tx(/*AUTOINST*/
		  // Outputs
		  .data_000		(data_000[7:0]),	 // Templated
		  .valid_000		(valid_000),		 // Templated
		  // Inputs
		  .reset_L		(reset_L),
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f),
		  .data_0		(recirc_0[7:0]),	 // Templated
		  .data_1		(recirc_1[7:0]),	 // Templated
		  .data_2		(recirc_2[7:0]),	 // Templated
		  .data_3		(recirc_3[7:0]),	 // Templated
		  .valid_0		(valid_r_0),		 // Templated
		  .valid_1		(valid_r_1),		 // Templated
		  .valid_2		(valid_r_2),		 // Templated
		  .valid_3		(valid_r_3));		 // Templated

    /* paralelo_serial AUTO_TEMPLATE (
    .data_in (data_000[7:0]),
    .valid_in (valid_000));
    */
   
   paralelo_serial_tx paralelo_serial_tx(/*AUTOINST*/
				      // Outputs
				      .data_out		(data_out),
				      // Inputs
				      .reset_L		(reset_L),
				      .clk_32f		(clk_32f),
				      .data_in		(data_000[7:0]), // Templated
				      .valid_in		(valid_000));	 // Templated

    /* Serial_paralelo_tx  AUTO_TEMPLATE (
    .reset (reset_L));
    */

   Serial_paralelo_tx serial_paralelo_tx(/*AUTOINST*/
					 // Outputs
					 .idle			(idle),
					 // Inputs
					 .clk_4f		(clk_4f),
					 .clk_32f		(clk_32f),
					 .data_in		(data_in),
					 .reset			(reset_L));	 // Templated
     
   
	        
   

     endmodule // phy_tx

				
				
	       
	       
