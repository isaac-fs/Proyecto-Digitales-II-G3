module MUX_L2 (
		output reg [7:0] data_000,
               	output reg 	 valid_000,
		input 		 reset_L,
		input 		 clk_2f,
		input		 clk_4f,
		input [7:0] 	 data_00,
		input [7:0] 	 data_11,
		input 		 valid_00,
		input 		 valid_11);

   //Señales internas
   reg [7:0] 			 a;
   wire 				 selector_4f;
   reg 				 validt_000;
   

   //Lógica selector automático

   assign selector_4f = ~clk_2f;

   //Lógica MUX 

   always @(*)
     begin
	validt_000 = (valid_00 & ~selector_4f) | (valid_11 & selector_4f);

	if (~selector_4f)
	  a = data_00;
	else
	  a = data_11;
     end

   // Lógica Flop

   always @ (posedge clk_4f)
     begin
	if(validt_000 & reset_L)
	  begin
	     data_000 <= a;
	     valid_000 <= validt_000;
	  end
	else if(~reset_L)
	  data_000 <= 00000000;
	
	else
	  begin
	     data_000 <= data_000;
	     valid_000 <= validt_000;
	  end // else: !if(valid_000_)
	
	
     end
   
	
endmodule // MUX_L2

