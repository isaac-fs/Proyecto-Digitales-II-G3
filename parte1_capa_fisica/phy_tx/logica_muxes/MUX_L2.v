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
	validt_000 = 0; 
	a = 0;
	if (~selector_4f) begin
		a = data_00;
		validt_000 = valid_00;
	end
	else begin
		a = data_11;
		validt_000 = valid_11;
	end
	  
     end

   // Lógica Flop

   always @ (posedge clk_4f)
     begin
	if(reset_L)
	  begin
	     data_000 <= a;
	     valid_000 <= validt_000;
	  end
	else if(~reset_L) begin
		data_000 <= 0;
		valid_000 <= 0;
	end
    end
   
	
endmodule // MUX_L2

