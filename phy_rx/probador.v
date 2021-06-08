/* Genera señales para probar el phyrx.*/
module probador(
	// señales para leer: conductual
	input idle_out_cond,
    input [7:0] data_out_0_cond,
    input [7:0] data_out_1_cond,
    input [7:0] data_out_2_cond,
    input [7:0] data_out_3_cond,
    input valid_out_0_cond,        
    input valid_out_1_cond,
    input valid_out_2_cond,
    input valid_out_3_cond,
	// señales para leer: estructural
	input idle_out_synth,
    input [7:0] data_out_0_synth,
    input [7:0] data_out_1_synth,
    input [7:0] data_out_2_synth,
    input [7:0] data_out_3_synth,
    input valid_out_0_synth,     
    input valid_out_1_synth,
    input valid_out_2_synth,
    input valid_out_3_synth,
	// señales para generar
	output reg rst_L,
	output reg clk_f,
	output reg clk_2f,
    output reg clk_4f,
    output reg clk_32f,
	output reg datos_paralelo_serial
    ); 


    // Relojes
	initial	clk_f 	<= 0;
	initial	clk_2f 	<= 1;
	initial	clk_4f 	<= 1;
   	initial	clk_32f <= 1;
	always	#160 clk_f <= ~clk_f;
   	always	#80 clk_2f <= ~clk_2f; 
   	always	#40 clk_4f <= ~clk_4f;
   	always	#5 clk_32f <= ~clk_32f; 


	reg [7:0] data;

	initial begin
		$dumpfile("phy_rx.vcd"); // Nombre de archivo del "dump"
		$dumpvars; // Directiva para "dumpear" variables
		rst_L = 0;
		datos_paralelo_serial = 1;
		
		@(posedge clk_32f);
		rst_L <= 1;
		datos_paralelo_serial <= 1;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 1;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 1;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 1;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		#10 data  <= 8'hF2;
		
		// Segundo dato

		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 1;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 1;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 0;
		
		@(posedge clk_32f);
		datos_paralelo_serial <= 1;
		#10 data  <= 'h15;

		repeat (4) begin // primeros 4 BC

			@(posedge clk_32f);
			datos_paralelo_serial <= 1;

			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			#10 data  <= 'hBC;
		end	
			
		repeat (3) begin
			// Tercer dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			#10data  <= 'hDD;

			// Cuarto dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			#10 data  <= 'h45;
			
			// Quinto dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			#10 data  <= 'hAA;
		

			// Sexto dato

			// @(posedge clk_32f);
			// datos_paralelo_serial <= 1;

			// @(posedge clk_32f);
			// datos_paralelo_serial <= 0;
			
			// @(posedge clk_32f);
			// datos_paralelo_serial <= 1;
			
			// @(posedge clk_32f);
			// datos_paralelo_serial <= 1;
			
			// @(posedge clk_32f);
			// datos_paralelo_serial <= 1;
			
			// @(posedge clk_32f);
			// datos_paralelo_serial <= 1;
			
			// @(posedge clk_32f);
			// datos_paralelo_serial <= 0;
			
			// @(posedge clk_32f);
			// datos_paralelo_serial <= 0;
			// #10 data  <= 'hBC;
			
			// Septimo dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
		
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			#10 data  <= 'h13;
			
			//Octavo dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 1;

			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			#10 data  <= 'hBC;

			// Tercer dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			#10 data  <= 'hDD;

			// Cuarto dato

			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 0;
			
			@(posedge clk_32f);
			datos_paralelo_serial <= 1;
			#10 data  <= 'h45;

			@(posedge clk_32f);		
		end // repeat
		$finish;
	end // initial
endmodule
