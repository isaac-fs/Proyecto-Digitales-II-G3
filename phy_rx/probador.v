module probador (
		    //output reg 	     clk_f,
		    output reg 	     clk_2f,
		    output reg 	     clk_4f,
		    /*output reg [7:0] data_0,
		    output reg [7:0] data_1,
		    output reg [7:0] data_2,
		    output reg [7:0] data_3,
		    output reg 	     valid_0,
		    output reg 	     valid_1,
		    output reg 	     valid_2,
		    output reg 	     valid_3,*/
		    input  [7:0]    data_00,
		    input  	     	valid_00,
		    input  [7:0]    data_11,
		    input  	     	valid_11,
		    output reg [7:0]    data_000,
		    output reg 	     	valid_000);
	
   //Reloj

   //initial clk_f <= 0;
   //always #20 clk_f <= ~clk_f;
         
   //Reloj 2f

   initial clk_2f <= 1;
   always #10 clk_2f <= ~clk_2f;

   //Reloj 4f

   initial clk_4f <= 1;
   always #5 clk_4f <= ~clk_4f;
   

   // Secuencia de prueba

   initial
    begin
		$dumpfile ("senales_DEMUX_L2.vcd");
		$dumpvars;

		valid_000 = 1; //Valores iniciales de valids
		//valid_1 = 1;
		//valid_2 = 1;
		//valid_3 = 1;
		
		
		repeat (2) begin
		@(posedge clk_4f);
		{data_000} <= {8'hFF};
		//{data_11} <= {8'hEE};

		//data_2} <= {8'hDD};
		//{data_3} <= {8'hCC};
		

		@(posedge clk_4f);
		{data_000} <= {8'hBB};
		//{data_11} <= {8'hAA};

		//{data_2} <= {8'h99};
		//{data_3} <= {8'h88};

		@(posedge clk_4f);
		{data_000} <= {8'hEA};
		//{data_11} <= {8'hDE};

		//{data_2} <= {8'h77};
		//{data_3} <= {8'h66};


		{valid_000} <= 1;
		//{valid_11} <= 0;
		
		//{valid_3} <= 0;
		

		@(posedge clk_4f);
		{data_000} <= {8'hCC};
		//{data_11} <= {8'hFF};

		//{data_2} <= {8'h55};
		//{data_3} <= {8'h44};


		//{valid_1} <= 0;
		//{valid_2} <= 0;
		

		@(posedge clk_4f);
		{data_000} <= {8'h15};
		//{data_11} <= {8'h20};

		//{data_2} <= {8'h33};
		//{data_3} <= {8'h22};


		@(posedge clk_4f);
		{data_000} <= {8'h16};
		//{data_11} <= {8'h21};

		//{data_2} <= {8'h22};
		//{data_3} <= {8'h11};
		end

		$finish;

     end // initial begin

endmodule // probador_l1
