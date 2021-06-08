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
		
	       output wire [7:0] recirc_4,
	       output wire [7:0] recirc_5,
	       output wire [7:0] recirc_6,
	       output wire [7:0] recirc_7,
	       output wire      valid_r_4,
	       output wire      valid_r_5,
	       output wire      valid_r_6,
	       output wire      valid_r_7,
		
		output wire [7:0] data_out0_phy,
		output wire [7:0] data_out1_phy,
        	output wire [7:0] data_out2_phy,
        	output wire [7:0] data_out3_phy,
		output wire 	valid_out0_phy,
		output wire 	valid_out1_phy,
        	output wire 	valid_out2_phy,
		output wire 	valid_out3_phy;
		

/*AUTOWIRE*/			

phy_tx	phy_tx_(/*AUTOINST*/
);

phy_rx phy_rx_(/*AUTOINST*/
);  


endmodule
