`include "DEMUX_L1.v"
`include "DEMUX_L2.v"

module DEMUXES (
    output [7:0]  data_0,
	output [7:0]  data_1,
	output [7:0]  data_2,
	output [7:0]  data_3,
	output 	     valid_0,
	output 	     valid_1,
	output 	     valid_2,
	output 	     valid_3,
	input 	     clk_f,
	input 	     clk_2f,
	input 	     clk_4f,
	//input 	     reset_L,
    input [7:0]  data_000,
	input 	     valid_000);

   
   wire [7:0] 	 data00,data11;
   wire 	     valid00,valid11;
   
   
    DEMUX_L2 DEMUX_L2_1 (/*AUTOINST*/
			 // Outputs
			 .data_00		(data00[7:0]),
			 .data_11		(data11[7:0]),
			 .valid_00		(valid00),
			 .valid_11		(valid11),
			 // Inputs
			 .data_000		(data_000[7:0]),
			 .valid_000		(valid_000),
			 //.reset_L		(reset_L),
			 .clk_4f		(clk_4f),
			 .clk_2f		(clk_2f));//DEMUX de L2

    DEMUX_L1 DEMUX_L1_1 (/*AUTOINST*/
			 // Outputs
			 .data_0		(data_0[7:0]),
			 .data_1		(data_1[7:0]),
			 .data_2		(data_2[7:0]),
			 .data_3		(data_3[7:0]),
			 .valid_0		(valid_0),
			 .valid_1		(valid_1),
			 .valid_2		(valid_2),
			 .valid_3		(valid_3),
			 // Inputs
			 .data_00		(data00[7:0]),
			 .data_11		(data11[7:0]),
			 .valid_00		(valid00),
			 .valid_11		(valid11),
			 //.reset_L		(reset_L),
			 .clk_f			(clk_f),
			 .clk_2f		(clk_2f));//DEMUX 1 de L1

endmodule // MUXES
