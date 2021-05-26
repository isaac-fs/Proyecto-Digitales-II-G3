`include "./recirculador/recirculador.v"
`include "./logica_muxes/MUX1_L1.v"
`include "./logica_muxes/MUX_L2.v"

module phy_tx (
	output [7:0] data_000,
	output 	     valid_000,
  output [7:0]  recirc_0,
	output [7:0]  recirc_1,
	output [7:0]  recirc_2,
	output [7:0]  recirc_3,
  output 	     valid_r_0,
	output 	     valid_r_1,
	output 	     valid_r_2,
	output 	     valid_r_3,
  input 	     idle,
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
   
  wire [7:0] 	data_r_0, data_r_1, data_r_2, data_r_3, data__00,data__11;
  wire 	valid_int_0, valid_int_1, valid_int_2, valid_int_3, valid__00, valid__11;  
   
   recirculador recirculador1 (/*AUTOINST*/
        // Outputs
        .data_out_0	(data_r_0),
        .data_out_1	(data_r_1),
        .data_out_2	(data_r_2),
        .data_out_3	(data_r_3),
        .data_out_4	(recirc_0),
        .data_out_5	(recirc_1),
        .data_out_6	(recirc_2),
        .data_out_7	(recirc_3),
        .valid_out_0	(valid_int_0),
        .valid_out_1	(valid_int_1),
        .valid_out_2	(valid_int_2),
        .valid_out_3	(valid_int_3),
        .valid_out_4	(valid_r_0),
        .valid_out_5	(valid_r_1),
        .valid_out_6	(valid_r_2),
        .valid_out_7	(valid_r_3),
        // Inputs
        .idle		(idle),
        .clk		(clk_f),
        .data_in_0	(data_0),
        .data_in_1	(data_1),
        .data_in_2	(data_2),
        .data_in_3	(data_3),
        .valid_in_0	(valid_0),
        .valid_in_1	(valid_1),
        .valid_in_2	(valid_2),
        .valid_in_3	(valid_3));

   MUX1_L1 MUX1    (data__00,
		    valid__00,
		    clk_2f,
		    data_r_0,
		    data_r_1,
		    valid_int_0,
		    valid_int_1);//MUX 1 de L1
   
   MUX1_L1 MUX2   (data__11,
		   valid__11,
		   clk_2f,
		   data_r_2,
		   data_r_3,
		   valid_int_2,
		   valid_int_3);//MUX 2 de L1

   MUX_L2 MUX3  (data_000,
      valid_000,
      clk_4f,
      data__00,
      data__11,
      valid__00,
      valid__11);// MUX de L2
endmodule // phy_tx
   
   
   

 
	
	
