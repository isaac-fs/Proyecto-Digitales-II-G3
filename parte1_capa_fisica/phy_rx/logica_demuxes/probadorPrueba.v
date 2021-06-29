module probadorPrueba (
		    output reg 	     clk_f,
		    output reg 	     clk_2f,
		    output reg 	     clk_4f,
			output reg 	     reset_L,

			input  [7:0] 	 data_0_cond,
		    input  [7:0] 	 data_1_cond,
		    input  [7:0] 	 data_2_cond,
		    input  [7:0] 	 data_3_cond,
		    input 	     	 valid_0_cond,
		    input 	     	 valid_1_cond,
		    input  	     	 valid_2_cond,
		    input  	     	 valid_3_cond,
			
			input  [7:0] 	 data_0_synth,
		    input  [7:0] 	 data_1_synth,
		    input  [7:0] 	 data_2_synth,
		    input  [7:0] 	 data_3_synth,
		    input 	     	 valid_0_synth,
		    input 	     	 valid_1_synth,
		    input  	     	 valid_2_synth,
		    input  	     	 valid_3_synth,


		    output reg [7:0]    data_000,
		    output reg 	     	valid_000);


	
   //Reloj

   initial clk_f <= 0;
   always #20 clk_f <= ~clk_f;
         
   //Reloj 2f

   initial clk_2f <= 1;
   always #10 clk_2f <= ~clk_2f;

   //Reloj 4f

   initial clk_4f <= 1;
   always #5 clk_4f <= ~clk_4f;
   

   // Secuencia de prueba

   initial
    begin
		$dumpfile ("senales_DEMUX.vcd");
		$dumpvars;

		{data_000} = {8'hFF};
		valid_000 = 1; //Valores iniciales de valids
		reset_L = 1;
		
		repeat (2) begin
		
		@(posedge clk_4f);
		

		@(posedge clk_4f);
		{data_000} <= {8'hDD};
		

		@(posedge clk_4f);
		{data_000} <= {8'hEE};
		
		

		@(posedge clk_4f);
		{data_000} <= {8'hCC};
		
		

		@(posedge clk_4f);
		{data_000} <= {8'hBB};
		


		@(posedge clk_4f);
		{data_000} <= {8'h99};


		@(posedge clk_4f);
		{data_000} <= {8'hAA};


		@(posedge clk_4f);
		{data_000} <= {8'h88};


		@(posedge clk_4f);
		{data_000} <= {8'h88};


		{valid_000} <= 0;


		@(posedge clk_4f);
		{data_000} <= {8'h77};

		{valid_000} <= 1;

		@(posedge clk_4f);
		{data_000} <= {8'h77};

		{valid_000} <= 0;
		

		end

		$finish;

     end // initial begin

endmodule // 
