module probadorPrueba (
		    output reg 	     clk_f,
		    output reg 	     clk_2f,
		    output reg 	     clk_4f,
			input  [7:0] 	 data_0,
		    input  [7:0] 	 data_1,
		    input  [7:0] 	 data_2,
		    input  [7:0] 	 data_3,
		    input 	     	 valid_0,
		    input 	     	 valid_1,
		    input  	     	 valid_2,
		    input  	     	 valid_3,
		    input [7:0]    data_00,
		    input  	     valid_00,
		    input  [7:0]    data_11,
		    input  	     valid_11,
		    output reg [7:0]     data_000,
		    output reg 	     	 valid_000);
	
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
		$dumpfile ("senales_DEMUX_L1.vcd");
		$dumpvars;

		{data_000} = {8'hFF};
		valid_000 = 1; //Valores iniciales de valids
		
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
