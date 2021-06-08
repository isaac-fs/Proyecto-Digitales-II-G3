`timescale 1ns/100ps
`include "cmos_cells.v"
`include "phy_tx.v"
`include "phy_tx_synth.v"
`include "probador.v"

module testbench;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_2f;			// From probador of probador.v
   wire			clk_32f;		// From probador of probador.v
   wire			clk_4f;			// From probador of probador.v
   wire			clk_f;			// From probador of probador.v
   wire			data_in;		// From probador of probador.v
   wire [7:0]		data_in_0;		// From probador of probador.v
   wire [7:0]		data_in_1;		// From probador of probador.v
   wire [7:0]		data_in_2;		// From probador of probador.v
   wire [7:0]		data_in_3;		// From probador of probador.v
   wire			data_out;		// From phy_tx of phy_tx.v
   wire			data_out_synth;		// From phy_tx_synth of phy_tx_synth.v
   wire [7:0]		recirc_4;		// From phy_tx of phy_tx.v
   wire [7:0]		recirc_5;		// From phy_tx of phy_tx.v
   wire [7:0]		recirc_6;		// From phy_tx of phy_tx.v
   wire [7:0]		recirc_7;		// From phy_tx of phy_tx.v
   wire [7:0]		recirc_synth_4;		// From phy_tx_synth of phy_tx_synth.v
   wire [7:0]		recirc_synth_5;		// From phy_tx_synth of phy_tx_synth.v
   wire [7:0]		recirc_synth_6;		// From phy_tx_synth of phy_tx_synth.v
   wire [7:0]		recirc_synth_7;		// From phy_tx_synth of phy_tx_synth.v
   wire			reset_L;		// From probador of probador.v
   wire			valid_in_0;		// From probador of probador.v
   wire			valid_in_1;		// From probador of probador.v
   wire			valid_in_2;		// From probador of probador.v
   wire			valid_in_3;		// From probador of probador.v
   wire			valid_r_4;		// From phy_tx of phy_tx.v
   wire			valid_r_5;		// From phy_tx of phy_tx.v
   wire			valid_r_6;		// From phy_tx of phy_tx.v
   wire			valid_r_7;		// From phy_tx of phy_tx.v
   wire			valid_r_synth_4;	// From phy_tx_synth of phy_tx_synth.v
   wire			valid_r_synth_5;	// From phy_tx_synth of phy_tx_synth.v
   wire			valid_r_synth_6;	// From phy_tx_synth of phy_tx_synth.v
   wire			valid_r_synth_7;	// From phy_tx_synth of phy_tx_synth.v
   // End of automatics


   //Instancia de descripción conductual

   phy_tx phy_tx(/*AUTOINST*/
		 // Outputs
		 .data_out		(data_out),
		 .recirc_4		(recirc_4[7:0]),
		 .recirc_5		(recirc_5[7:0]),
		 .recirc_6		(recirc_6[7:0]),
		 .recirc_7		(recirc_7[7:0]),
		 .valid_r_4		(valid_r_4),
		 .valid_r_5		(valid_r_5),
		 .valid_r_6		(valid_r_6),
		 .valid_r_7		(valid_r_7),
		 // Inputs
		 .clk_f			(clk_f),
		 .clk_2f		(clk_2f),
		 .clk_4f		(clk_4f),
		 .clk_32f		(clk_32f),
		 .reset_L		(reset_L),
		 .data_in_0		(data_in_0[7:0]),
		 .data_in_1		(data_in_1[7:0]),
		 .data_in_2		(data_in_2[7:0]),
		 .data_in_3		(data_in_3[7:0]),
		 .valid_in_0		(valid_in_0),
		 .valid_in_1		(valid_in_1),
		 .valid_in_2		(valid_in_2),
		 .valid_in_3		(valid_in_3),
		 .data_in		(data_in));
   
   //Instancia de descripción estructural
   /* phy_tx_synth AUTO_TEMPLATE (
    .data_out (data_out_synth),
    .recirc_@ (recirc_synth_\1[7:0]),
    .valid_r_@ (valid_r_synth_\1));
    */

   phy_tx_synth phy_tx_synth(/*AUTOINST*/
			     // Outputs
			     .data_out		(data_out_synth), // Templated
			     .recirc_4		(recirc_synth_4[7:0]), // Templated
			     .recirc_5		(recirc_synth_5[7:0]), // Templated
			     .recirc_6		(recirc_synth_6[7:0]), // Templated
			     .recirc_7		(recirc_synth_7[7:0]), // Templated
			     .valid_r_4		(valid_r_synth_4), // Templated
			     .valid_r_5		(valid_r_synth_5), // Templated
			     .valid_r_6		(valid_r_synth_6), // Templated
			     .valid_r_7		(valid_r_synth_7), // Templated
			     // Inputs
			     .clk_2f		(clk_2f),
			     .clk_32f		(clk_32f),
			     .clk_4f		(clk_4f),
			     .clk_f		(clk_f),
			     .data_in		(data_in),
			     .data_in_0		(data_in_0[7:0]),
			     .data_in_1		(data_in_1[7:0]),
			     .data_in_2		(data_in_2[7:0]),
			     .data_in_3		(data_in_3[7:0]),
			     .reset_L		(reset_L),
			     .valid_in_0	(valid_in_0),
			     .valid_in_1	(valid_in_1),
			     .valid_in_2	(valid_in_2),
			     .valid_in_3	(valid_in_3));
   


   //Instancia de probador

   probador probador(/*AUTOINST*/
		     // Outputs
		     .clk_f		(clk_f),
		     .clk_2f		(clk_2f),
		     .clk_4f		(clk_4f),
		     .clk_32f		(clk_32f),
		     .reset_L		(reset_L),
		     .data_in_0		(data_in_0[7:0]),
		     .data_in_1		(data_in_1[7:0]),
		     .data_in_2		(data_in_2[7:0]),
		     .data_in_3		(data_in_3[7:0]),
		     .valid_in_0	(valid_in_0),
		     .valid_in_1	(valid_in_1),
		     .valid_in_2	(valid_in_2),
		     .valid_in_3	(valid_in_3),
		     .data_in		(data_in),
		     // Inputs
		     .data_out		(data_out),
		     .recirc_4		(recirc_4[7:0]),
		     .recirc_5		(recirc_5[7:0]),
		     .recirc_6		(recirc_6[7:0]),
		     .recirc_7		(recirc_7[7:0]),
		     .valid_r_4		(valid_r_4),
		     .valid_r_5		(valid_r_5),
		     .valid_r_6		(valid_r_6),
		     .valid_r_7		(valid_r_7),
		     .data_out_synth	(data_out_synth),
		     .recirc_synth_4	(recirc_synth_4[7:0]),
		     .recirc_synth_5	(recirc_synth_5[7:0]),
		     .recirc_synth_6	(recirc_synth_6[7:0]),
		     .recirc_synth_7	(recirc_synth_7[7:0]),
		     .valid_r_synth_4	(valid_r_synth_4),
		     .valid_r_synth_5	(valid_r_synth_5),
		     .valid_r_synth_6	(valid_r_synth_6),
		     .valid_r_synth_7	(valid_r_synth_7));

endmodule // testbench



   
   
