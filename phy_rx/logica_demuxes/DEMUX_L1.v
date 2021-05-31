module DEMUX_L1 (
        input [7:0] data_00,
        input [7:0] data_11,
		
        input 		        valid_00,
        input 		        valid_11,
        input 		        clk_f,
      	
		output reg [7:0] 	data_0,
		output reg [7:0] 	data_1,
        output reg [7:0] 	data_2,
        output reg [7:0] 	data_3,
		output reg 		    valid_0,
		output reg 		    valid_1,
        output reg 		    valid_2,
		output reg 		    valid_3
        );

   //Señales internas
   reg [7:0] 	        c;
   reg [7:0]            d;
   reg [7:0] 	        e;
   reg [7:0]            f;
   
   reg 	                validt_0;
   reg 	                validt_1;
   reg 	                validt_2;
   reg 	                validt_3;

   //Lógica selector automático

   /*always @ (posedge clk_4f)
        begin
	        selector_4f <= ~selector_4f;
        end
        
   always @ (posedge clk_2f)
        begin
	        selector_2f <= ~selector_2f;
        end*/

   //Lógica DEMUX 

   always @(*)
     begin
	    /*validt_00 = (valid_000 & ~selector_4f) | (valid_000 & selector_4f);
        validt_11 = (valid_000 & ~selector_4f) | (valid_000 & selector_4f);*/
        
        //data_11 = 8'h00;
        //data_00 = 8'h00;
        //validt_00 = 1;

	    if (clk_f & valid_00) begin
	        c <= data_00;
            validt_0 <= valid_00;
        end
	    else if (clk_f & ~valid_00) begin
            c <= c;
            validt_0 <= valid_00;
        end 

        if (~clk_f & valid_00) begin
	        d <= data_00;
            validt_1 <= valid_00;
        end
	    else if (~clk_f & ~valid_00) begin
            d <= d;
            validt_1 <= valid_00;
        end 

        if (clk_f & valid_11) begin
	        e <= data_11;
            validt_2 <= valid_11;
        end
	    else if (clk_f & ~valid_11) begin
            e <= e;
            validt_2 <= valid_11;
        end 

        if (~clk_f & valid_11) begin
	        f <= data_11;
            validt_3 <= valid_11;
        end
	    else if (~clk_f & ~valid_11) begin
            f <= f;
            validt_3 <= valid_11;
        end 
     end

   // Lógica Flop

   always @ (posedge clk_f)
    begin

	    if(validt_0)
	        begin
	            data_0 <= c;
	            valid_0 <= validt_0;
	        end
	
	    else
	        begin
                data_0 <= data_0;
                valid_0 <= validt_0;
	        end      
    
        if(validt_1)
	        begin
                data_1 <= d;
                valid_1 <= validt_1;
	        end
	
	    else
	        begin
                data_1 <= data_1;
                valid_1 <= validt_1;
	        end

         if(validt_2)
	        begin
	            data_2 <= e;
	            valid_2 <= validt_2;
	        end
	
	    else
	        begin
                data_2 <= data_2;
                valid_2 <= validt_2;
	        end      
    
        if(validt_3)
	        begin
                data_3 <= f;
                valid_3 <= validt_3;
	        end
	
	    else
	        begin
                data_3 <= data_3;
                valid_3 <= validt_3;
	        end
    end
   
	
endmodule // DEMUX_L1