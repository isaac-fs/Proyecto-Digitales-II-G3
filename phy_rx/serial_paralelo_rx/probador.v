/* Genera señales para probar el phyrx.*/
module probador(
    output reg clk_4f,
    output reg clk_32f,
	output reg data_in
    ); 


    // Relojes
    initial	clk_4f 	<= 1;
    initial	clk_32f <= 1;

    always	#20 clk_4f 	<= ~clk_4f; 
    always	#160 clk_32f 	<= ~clk_32f; 


	reg [7:0]data;
	initial begin
		$dumpfile("senales_serial_paralelo.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			        // Directiva para "dumpear" variables
		
		data_in <= 0;
        
		data <= 0;
		
		@(posedge clk_4f);
		repeat (4) begin
			repeat (4) begin
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data  <= 'hBC;
				
			end

				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data  <= 'hF2;
				

				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data  <= 'h15;
				

				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data  <= 'hDD;
				

				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data  <= 'h45;
				

			repeat (4) begin
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data  <= 'hBC;
				
			end


				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data  <= 'hAA;
			

				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data  <= 'hEE;
				

				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
            
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data  <= 'h13;
				

				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data  <= 'hCD;
				

			repeat (4) begin
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 1;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data_in <= 0;
                
				@(posedge clk_32f);
				data  <= 'hBC;
				
			end

			
		end 

		$finish;
	end


endmodule