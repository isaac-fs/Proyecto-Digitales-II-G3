module MUX1_L1 (
		output reg [7:0] data_00,
		output reg 	 valid_00,
		input 		 reset_L,
		input 		 clk_f,
		input		 clk_2f,
		input [7:0] 	 data_0,
		input [7:0] 	 data_1,
		input 		 valid_0,
		input 		 valid_1);
   

   //Señales internas
   reg [7:0] 			 a;
   wire 		  selector_2f;
   reg 				 validt_00;
   

   //Lógica selector automático

   assign selector_2f = ~clk_f;

   //Lógica MUX 

   always @(*)
     begin
	a = 0;
	validt_00 = 0;

	if (~selector_2f) begin
		a = data_0;
		validt_00 = valid_0;
	end
	  
	else begin
		a = data_1;
		validt_00 = valid_1;
	end
	  
     end

   // Lógica Flop

   always @ (posedge clk_2f)
     begin
	if(reset_L)
	  begin
	     data_00 <= a;
	     valid_00 <= validt_00;
	  end

	else if(~reset_L) begin
		data_00 <= 0;
		valid_00 <= 0;
	end
	
    end
   
	
endmodule // MUX1_L1

   
   
   
