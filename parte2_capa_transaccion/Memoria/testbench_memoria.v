`timescale 1ns / 100ps
`include "cmos_cells.v"
`include "memoria.v"
`include "memoria_synth.v"
`include "probador_memoria.v"


module testbench_memoria;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk;			// From probador_memoria of probador_memoria.v
   wire [9:0]		data_in;		// From probador_memoria of probador_memoria.v
   wire [9:0]		data_out;		// From memoria of memoria.v
   wire [9:0]		data_out_synth;	// From memoria_synth of memoria_synth.v
   wire [3:0]		rd_ptr;			// From probador_memoria of probador_memoria.v
   wire			rd_en;			// From probador_memoria of probador_memoria.v
   wire			reset_L;		// From probador_memoria of probador_memoria.v
   wire [3:0]		wr_ptr;			// From probador_memoria of probador_memoria.v
   wire			wr_en;			// From probador_memoria of probador_memoria.v
   // End of automatics



   //Instancia descripción conductual
   memoria memoria(/*AUTOINST*/
		   // Outputs
		   .data_out	(data_out[9:0]),
		   // Inputs
		   .clk			(clk),
		   .wr_en		(wr_en),
		   .rd_en		(rd_en),
		   .reset_L		(reset_L),
		   .data_in		(data_in[9:0]),
		   .wr_ptr		(wr_ptr[3:0]),
		   .rd_ptr		(rd_ptr[3:0]));

    //Instancia descripción estructural
    /* memoria_synth AUTO_TEMPLATE (
    .data_out (data_out_synth[9:0]),
       );
    */
   
   memoria_synth memoria_synth(/*AUTOINST*/
			       // Outputs
			       .data_out	(data_out_synth[9:0]), // Templated
			       // Inputs
			       .clk		(clk),
			       .data_in		(data_in[9:0]),
			       .rd_ptr		(rd_ptr[3:0]),
			       .rd_en		(rd_en),
			       .reset_L		(reset_L),
			       .wr_ptr		(wr_ptr[3:0]),
			       .wr_en		(wr_en));



   //Instancia probador

   probador_memoria probador_memoria(/*AUTOINST*/
				     // Outputs
				     .clk		(clk),
				     .wr_en		(wr_en),
				     .rd_en		(rd_en),
				     .reset_L		(reset_L),
				     .data_in		(data_in[9:0]),
				     .wr_ptr		(wr_ptr[3:0]),
				     .rd_ptr		(rd_ptr[3:0]),
				     // Inputs
				     .data_out_synth(data_out_synth[9:0]),
				     .data_out	(data_out[9:0]));

endmodule // testbench_memoria

   
		    
		    
