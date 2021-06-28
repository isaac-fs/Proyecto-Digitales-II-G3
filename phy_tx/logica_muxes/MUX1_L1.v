module MUX1_L1 (
		output reg [7:0] data_00,
               	output reg 	 valid_00,
		input 		 reset_L,
      		input 		 clk_2f,
		input [7:0] 	 data_0,
		input [7:0] 	 data_1,
		input 		 valid_0,
		input 		 valid_1);
   

   //Señales internas
   reg [7:0] 			 a;
   reg 				 selector_2f;
   reg 				 validt_00;
   

   //Lógica selector automático

   always @ (posedge clk_2f)
	begin
	if(~reset_L)
		selector_2f <= 1;
	else
		selector_2f <= ~selector_2f;
    end

   //Lógica MUX 

   always @(*)
     begin
	validt_00 = (valid_0 & ~selector_2f) | (valid_1 & selector_2f);

	if (~selector_2f)
	  a = data_0;
	else
	  a = data_1;
     end

   // Lógica Flop

   always @ (posedge clk_2f)
     begin
	if(validt_00 & reset_L)
	  begin
	     data_00 <= a;
	     valid_00 <= validt_00;
	  end

	else if(~reset_L)
	  data_00 <= 00000000;
	
	else
	  begin
	     data_00 <= data_00;
	     valid_00 <= validt_00;
	  end // else: !if(valid_t00)
	
     end
   
	
endmodule // MUX1_L1

   
   
   
