`include "phy_rx.v"
`include "phy_tx.v"


module phy (   input [7:0] data_in_0,
    		input [7:0] data_in_1,
    		input [7:0] data_in_2,
    		input [7:0] data_in_3,
    		input reset_L,
    		
		input valid_in_0,
    		input valid_in_1,
    		input valid_in_2,
    		input valid_in_3,
		
		input clk_f,
		input clk_2f,
		input clk_4f,
		input clk_32f,
		
		//output wire  datos_paralelo_serial_tx,
		//output wire  datos_paralelo_serial_rx,
		
	       output  	[7:0] recirc_4,
	       output  	[7:0] recirc_5,
	       output  	[7:0] recirc_6,
	       output  	[7:0] recirc_7,
	       output       	valid_r_4,
	       output       	valid_r_5,
	       output      	valid_r_6,
	       output       	valid_r_7,
		
		output 	[7:0] data_out_0,
		output  	[7:0] data_out_1,
        	output 	[7:0] data_out_2,
        	output 	[7:0] data_out_3,
		output 	valid_out_0,
		output 	valid_out_1,
        	output 	valid_out_2,
		output 	valid_out_3);
		

/*AUTOWIRE*/			
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			data_out;		// From phy_tx of phy_tx.v
wire			idle_out;		// From phy_rx of phy_rx.v
// End of automatics

phy_tx	phy_tx(/*AUTOINST*/
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
	       .clk_2f			(clk_2f),
	       .clk_4f			(clk_4f),
	       .clk_32f			(clk_32f),
	       .reset_L			(reset_L),
	       .data_in_0		(data_in_0[7:0]),
	       .data_in_1		(data_in_1[7:0]),
	       .data_in_2		(data_in_2[7:0]),
	       .data_in_3		(data_in_3[7:0]),
	       .valid_in_0		(valid_in_0),
	       .valid_in_1		(valid_in_1),
	       .valid_in_2		(valid_in_2),
	       .valid_in_3		(valid_in_3),
	       .data_in			(idle_out));

phy_rx phy_rx(/*AUTOINST*/
	      // Outputs
	      .idle_out			(idle_out),
	      .data_out_0		(data_out_0[7:0]),
	      .data_out_1		(data_out_1[7:0]),
	      .data_out_2		(data_out_2[7:0]),
	      .data_out_3		(data_out_3[7:0]),
	      .valid_out_0		(valid_out_0),
	      .valid_out_1		(valid_out_1),
	      .valid_out_2		(valid_out_2),
	      .valid_out_3		(valid_out_3),
	      // Inputs
	      .rst_L			(reset_L),
	      .clk_f			(clk_f),
	      .clk_2f			(clk_2f),
	      .clk_4f			(clk_4f),
	      .clk_32f			(clk_32f),
	      .datos_paralelo_serial	(data_out));  


	       endmodule // phy

