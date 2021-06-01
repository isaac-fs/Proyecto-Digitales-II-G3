module probador(
		output reg 	 clk_4f,
		output reg 	 clk_32f,
		output reg [7:0] data_in,
		output reg 	 valid_in,
	        output reg 	 reset_L,
		input 		 data_out_cond,
		input 		 data_out_synth);
   
   

   
   //Reloj 4f

   initial clk_4f <= 1;
   always #8 clk_4f <= ~clk_4f;

   //Reloj 32f

   initial clk_32f <= 1;
   always #1 clk_32f <= ~clk_32f;

   //Checker
   integer check = 0;
    always @(*) begin
        if (data_out_cond == data_out_synth) 
            check <= 1;    
        else
            check <= 0;    
    end 
   
   // Secuencia de prueba

   initial
     begin
	$dumpfile ("senales_paralelo_serial.vcd");
	$dumpvars;

	valid_in = 1;
	reset_L = 0;
	@ (posedge clk_4f);

	{data_in} <= {8'hCC};
	

       	@ (posedge clk_4f);
	
      
	{data_in} <= {8'hAA};
	{reset_L} <= 1;
	

	@ (posedge clk_4f);
	
        {valid_in} <= 0;
	{data_in} <= {8'hDD};

	@ (posedge clk_4f);

	{valid_in} <= 1;
	{data_in} <= {8'hFF};

	@ (posedge clk_4f);

	{data_in} <= {8'hEE};

	@ (posedge clk_4f);
	

	$finish;

     end // initial begin
endmodule // probador


	 
		     

      


      
	
