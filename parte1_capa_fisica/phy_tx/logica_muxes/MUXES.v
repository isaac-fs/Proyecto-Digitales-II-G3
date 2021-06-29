`include "logica_muxes/MUX1_L1.v"
`include "logica_muxes/MUX_L2.v"

module MUXES (
	output [7:0] data_000,
	output 	     valid_000,
	input 	     reset_L,
	input 	     clk_f,
	input 	     clk_2f,
	input 	     clk_4f,
	input [7:0]  data_0,
	input [7:0]  data_1,
	input [7:0]  data_2,
	input [7:0]  data_3,
	input 	     valid_0,
	input 	     valid_1,
	input 	     valid_2,
	input 	     valid_3);
   
   wire [7:0] 	     data__00,data__11;
   wire 	     valid__00,valid__11;
   
   
   MUX1_L1 MUX1    (data__00,
		    valid__00,
		    reset_L,
		    clk_f,
			clk_2f,
		    data_0,
		    data_1,
		    valid_0,
		    valid_1);//MUX 1 de L1
   
   MUX1_L1 MUX2   (data__11,
		   valid__11,
		   reset_L,
		   clk_f,
		   clk_2f,
		   data_2,
		   data_3,
		   valid_2,
		   valid_3);//MUX 2 de L1

   MUX_L2 MUX3  (data_000,
		 valid_000,
		 reset_L,
		 clk_2f,
		 clk_4f,
		 data__00,
		 data__11,
		 valid__00,
		 valid__11);// MUX de L2
endmodule // MUXES


   
   
   

 
	
	
