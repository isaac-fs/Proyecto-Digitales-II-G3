module MUX_L2 (
		output reg [7:0] data_000,
               	output reg 	 valid_000,
      		input 		 clk_4f,
		input [7:0] 	 data_00,
		input [7:0] 	 data_11,
		input 		 valid_00,
		input 		 valid_11);

   //Señales internas
   reg [7:0] 			 a;
   reg 				 selector_4f = 1;
   reg 				 validt_000;
   

   //Lógica selector automático

   always @ (posedge clk_4f)
     begin
	selector_4f <= ~selector_4f;
     end

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
	if(validt_000)
	  begin
	     data_000 <= a;
	     valid_000 <= validt_000;
	  end
	
	else
	  begin
	     data_000 <= data_000;
	     valid_000 <= validt_000;
	  end // else: !if(valid_000_)
	
	
     end
   
	
endmodule // MUX_L2

