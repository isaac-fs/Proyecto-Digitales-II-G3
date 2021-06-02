/* Genera señales para probar el phyrx.*/
module probador(
	// señales para leer
	input [7:0] sp_out_cond,
	input [7:0] sp_out_synth, 
	input valid_out_sp_cond,
	input valid_out_sp_synth,
	input active_cond,
	input active_synth,
	// señales para generar
    output reg clk_4f,
    output reg clk_32f,
	output reg data_in
    ); 


    // Relojes
    initial	clk_4f 	<= 1;
	initial	clk_32f <= 1;
	always	#8 clk_4f 	<= ~clk_4f; 
    always	#1 clk_32f <= ~clk_32f; 


	reg [7:0] data;

	initial begin
		$dumpfile("serial_paralelo_rx.vcd"); // Nombre de archivo del "dump"
		$dumpvars; // Directiva para "dumpear" variables

			
		// Primer dato
		
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
		data  <= 8'hF2;
		
		// Segundo dato

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
		data_in <= 0;
		
		@(posedge clk_32f);
		data_in <= 1;
		data  <= 'h15;

		repeat (4) begin // primeros 4 BC

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
			data_in <= 1;
			
			@(posedge clk_32f);
			data_in <= 0;
			
			@(posedge clk_32f);
			data_in <= 0;
			data  <= 'hBC;
		end	
		
		// Tercer dato

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
		data_in <= 1;
		data  <= 'hDD;

		// Cuarto dato

		@(posedge clk_32f);
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
		data  <= 'h45;
		
		// Quinto dato

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
		data_in <= 1;
		
		@(posedge clk_32f);
		data_in <= 0;
		data  <= 'hAA;
	

		// Sexto dato

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
		data_in <= 1;
		
		@(posedge clk_32f);
		data_in <= 0;
		
		@(posedge clk_32f);
		data_in <= 0;
		data  <= 'hBC;
		
		// Septimo dato

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
		data_in <= 0;
		
		@(posedge clk_32f);
		data_in <= 1;
		
		@(posedge clk_32f);
		data_in <= 1;
		data  <= 'h13;
		
		// Octavo dato

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
		data_in <= 1;
		
		@(posedge clk_32f);
		data_in <= 0;
		
		@(posedge clk_32f);
		data_in <= 0;
		data  <= 'hBC;

		// Tercer dato

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
		data_in <= 1;
		data  <= 'hDD;

		// Cuarto dato

		@(posedge clk_32f);
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
		data  <= 'h45;

		@(posedge clk_32f);
		$finish;		
	end
endmodule