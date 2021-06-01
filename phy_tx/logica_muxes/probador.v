module probador (
		    output reg 	     clk_f,
		    output reg 	     clk_2f,
		    output reg 	     clk_4f,
		    output reg [7:0] data_0,
		    output reg [7:0] data_1,
		    output reg [7:0] data_2,
		    output reg [7:0] data_3,
		    output reg 	     valid_0,
		    output reg 	     valid_1,
		    output reg 	     valid_2,
		    output reg 	     valid_3,
		    output reg 	     reset_L,
		    input [7:0]      data_000_cond,
		    input 	     valid_000_cond,
		    input [7:0]      data_000_synth,
		    input 	     valid_000_synth);
   
		 
  
  

   
  

   
   //Reloj

   initial clk_f <= 0;
   always #20 clk_f <= ~clk_f;
         
   //Reloj 2f

   initial clk_2f <= 1;
   always #10 clk_2f <= ~clk_2f;

   //Reloj 4f

   initial clk_4f <= 1;
   always #5 clk_4f <= ~clk_4f;

   //Checker
   integer check = 0;
    always @(*) begin
        if (data_000_cond == data_000_synth) 
            check <= 1;    
        else
            check <= 0;    
    end 
   

   // Secuencia de prueba

   initial
     begin
	$dumpfile ("senales_MUX.vcd");
	$dumpvars;

	valid_0 = 1; //Valores iniciales de valids
	valid_1 = 1;
	valid_2 = 1;
	valid_3 = 1;
	reset_L = 1;
	
	

	@(posedge clk_f);
	{data_0} <= {8'hFF};
	{data_1} <= {8'hEE};

	{data_2} <= {8'hDD};
	{data_3} <= {8'hCC};
	

	@(posedge clk_f);
	{data_0} <= {8'hBB};
	{data_1} <= {8'hAA};

	{data_2} <= {8'h99};
	{data_3} <= {8'h88};

        @(posedge clk_f);
	{data_0} <= {8'hEA};
	{data_1} <= {8'hDE};

	{data_2} <= {8'h77};
	{data_3} <= {8'h66};


	{valid_0} <= 0;
	{valid_1} <= 0;
	
	{valid_3} <= 0;
	
	

	@(posedge clk_f);
	{data_0} <= {8'hCC};
	{data_1} <= {8'hFF};

	{data_2} <= {8'h55};
	{data_3} <= {8'h44};


	{valid_1} <= 0;
	{valid_2} <= 0;
	

	@(posedge clk_f);
	{data_0} <= {8'h15};
	{data_1} <= {8'h20};

	{data_2} <= {8'h33};
	{data_3} <= {8'h22};


	@(posedge clk_f);
	{data_0} <= {8'h16};
	{data_1} <= {8'h21};

	{data_2} <= {8'h22};
	{data_3} <= {8'h11};


	$finish;

     end // initial begin

endmodule // probador_l1


	
	

	
	
 
	  

  
