module paralelo_serial (
			output reg  data_out,
			input 	    reset_L,
			input 	    clk_32f,
			input [7:0] data_in,
			input 	    valid_in);
   
   reg [2:0] 				 index;
   reg [7:0] 				 data2send;
   
  
   

//Lógica de index
 always @ (posedge clk_32f)
   begin
      
      if (~reset_L)
	index <= 000;
      else
	begin
	   if(index <7)
	     index <= index +1;
	   else
	     index <= 0;
	end
   end // always @ (posedge clk_32f)
   



//Lógica de la salida

 always @ (*)
   begin
      if (valid_in)
	data2send = data_in;
      else
	data2send = 8'hBC;
      if (~reset_L)
	data_out = 0;
      else
	data_out = data2send[7-index];
   end // always @ (*)
    

endmodule // paralelo_serial

	      
			  
  
