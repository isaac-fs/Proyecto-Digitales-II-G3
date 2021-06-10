module DEMUX_L2 (
		input [7:0]         data_000,
        input 	            valid_000,
      	//input 		        clk_f,
      	input 		        clk_4f,
        input 		        clk_2f,
		output reg [7:0] 	data_00,
		output reg [7:0] 	data_11,
		output reg 		    valid_00,
		output reg 		    valid_11);

   //Señales internas
   reg [7:0] 	        a;
   reg [7:0]            b;
   reg 	                validt_00;
   reg 	                validt_11;

   //Lógica DEMUX 

   always @(posedge clk_4f)
     begin

	    if (valid_000) begin
	        a <= data_000;
            validt_00 <= valid_000;
        end
	    else if (~valid_000) begin
            a <= a;
            validt_00 <= valid_000;
        end 
     end

    always @(negedge clk_4f) begin
        if (valid_000) begin
	        b <= data_000;
            validt_11 <= valid_000;
        end
	    else if (~valid_000) begin
            b <= b;
            validt_11 <= valid_000;
        end 
    end
    
   // Lógica Flop
   always @ (posedge clk_2f)
    begin
	    if(validt_00)
	        begin
	            data_00 <= a;
	            valid_00 <= validt_00;
	        end
	    else
	        begin
                data_00 <= data_00;
                valid_00 <= validt_00;
	        end      
    end
   
   always @(posedge clk_2f) begin
       if(validt_11)
	        begin
                data_11 <= b;
                valid_11 <= validt_11;
	        end
	
	    else
	        begin
                data_11 <= data_11;
                valid_11 <= validt_11;
	        end
   end
	
endmodule // MUX_L2