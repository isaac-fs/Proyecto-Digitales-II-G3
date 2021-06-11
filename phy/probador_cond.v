module probador_cond(//Salida de phy_rx
	       input [7:0] 	data_out_0_cond,
	       input [7:0] 	data_out_1_cond,
	       input [7:0] 	data_out_2_cond,
	       input [7:0] 	data_out_3_cond,
	       input 		valid_out_0_cond,        
	       input 		valid_out_1_cond,
	       input 		valid_out_2_cond,
	       input 		valid_out_3_cond,
	       //Salidas de recirculador hacia probador 
	       input [7:0] 	recirc_4_cond,
	       input [7:0] 	recirc_5_cond,
	       input [7:0] 	recirc_6_cond,
	       input [7:0] 	recirc_7_cond,
	       input 		valid_r_4,
	       input 		valid_r_5,
	       input 		valid_r_6,
	       input 		valid_r_7,
		
	       //Entradas de reloj
	       output reg 	clk_f,
	       output reg 	clk_2f,
	       output reg 	clk_4f,
	       output reg 	clk_32f,
	       //Reset
	       output reg 	reset_L,
	       //Entradas de datos y valid desde probador
	       output reg [7:0] data_in_0,
	       output reg [7:0] data_in_1,
	       output reg [7:0] data_in_2,
	       output reg [7:0] data_in_3,
	       output reg 	valid_in_0,
	       output reg 	valid_in_1,
	       output reg 	valid_in_2,
	       output reg 	valid_in_3
	       );
   
   
   

   //Reloj
   initial clk_f <= 0;
   always #32 clk_f <= ~clk_f;

   //Reloj 2f

   initial clk_2f <= 1;
   always #16 clk_2f <= ~clk_2f;

   //Reloj 4f

   initial clk_4f <= 1;
   always #8 clk_4f <= ~clk_4f;

   //Reloj 32f

   initial clk_32f <= 1;
   always #1 clk_32f <= ~clk_32f;

   //Secuencia de pruebas

   initial
     begin
	$dumpfile ("resultados.vcd");
	$dumpvars;

	valid_in_0 = 1; //Valores iniciales de valids
	valid_in_1 = 1;
	valid_in_2 = 1;
	valid_in_3 = 1;
	reset_L = 0;
	
        

	@(posedge clk_f);
	
	{data_in_0} <= {8'hFF};
	{data_in_1} <= {8'hEE};

	{data_in_2} <= {8'hDD};
	{data_in_3} <= {8'hCC};
	
	{reset_L} <= 1;

	@(posedge clk_f);
	{data_in_0} <= {8'hBB};
	{data_in_1} <= {8'hAA};

	{data_in_2} <= {8'h99};
	{data_in_3} <= {8'h88};

        @(posedge clk_f);
	{data_in_0} <= {8'hEA};
	{data_in_1} <= {8'hDE};

	{data_in_2} <= {8'h77};
	{data_in_3} <= {8'h66};


	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};


	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};
	valid_in_0 <=0;
	valid_in_1 <=0;
	valid_in_2 <=0;
	valid_in_3 <=0;
	
	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};
	valid_in_0 <=0;
	valid_in_1 <=0;
	valid_in_2 <=0;
	valid_in_3 <=0;
	
	
	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};
	valid_in_0 <=0;
	valid_in_1 <=0;
	valid_in_2 <=0;
	valid_in_3 <=0;
	
	
	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};
	valid_in_0 <=0;
	valid_in_1 <=0;
	valid_in_2 <=0;
	valid_in_3 <=0;
	
	@(posedge clk_f);
	{data_in_0} <= {8'h15};
	{data_in_1} <= {8'h20};

	{data_in_2} <= {8'h33};
	{data_in_3} <= {8'h22};
	valid_in_0 <=1;
	valid_in_1 <=1;
	valid_in_2 <=1;
	valid_in_3 <=1;
	

	@(posedge clk_f);
	{data_in_0} <= {8'h16};
	{data_in_1} <= {8'h21};

	{data_in_2} <= {8'h22};
	{data_in_3} <= {8'h11};
	
	@(posedge clk_f);
	{data_in_0} <= {8'h16};
	{data_in_1} <= {8'h21};

	{data_in_2} <= {8'h22};
	{data_in_3} <= {8'h11};

	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};
	

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};



	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};
	valid_in_0= 0;
	reset_L=0;
	
	@(posedge clk_f);
	{data_in_0} <= {8'hCC};
	{data_in_1} <= {8'hFF};

	{data_in_2} <= {8'h55};
	{data_in_3} <= {8'h44};
	
	@(posedge clk_f);
	{data_in_0} <= {8'h15};
	{data_in_1} <= {8'h20};

	{data_in_2} <= {8'h33};
	{data_in_3} <= {8'h22};
	valid_in_0 <=1;
	valid_in_1 <=1;
	valid_in_2 <=1;
	valid_in_3 <=1;
	
     end // initial begin
endmodule // probador
