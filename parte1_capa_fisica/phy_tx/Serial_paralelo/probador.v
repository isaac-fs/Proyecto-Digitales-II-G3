module probador(clk_4f, clk_32f, data_in, reset, idle_cond, idle_yosys);

	output reg 			clk_4f;
	output reg 			clk_32f;
	output reg			data_in;
	output reg			reset;
	input 				idle_cond;
	input 				idle_yosys;		
	
	
    
	initial begin
		$dumpfile("serial.vcd");
		$dumpvars;
		//$display ("test");
		//$display ("\t\t\tclk,\tdata_out0,\tdata_out1,\treset_L,\tdata_in");
		//$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b", clk, reset_L, data_out0, data_out1, data_in);
			
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			//~ #1 data_in <= 'b0;
			
			//~ //AB
			data_in <= 'b0;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			
			
			
			//BC 4 veces
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b0;
			
			// BC
			@ (posedge clk_32f)
			data_in <= 'b1;
			reset <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			//7C
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b1;
			@ (posedge clk_32f)
			data_in <= 'b0;
			@ (posedge clk_32f)
			data_in <= 'b0;
			
			
			
		//~ $display ("contador: %d", contador);
		#100 $finish;			// Termina de almacenar señales
		
	end
	
	
	initial	clk_4f 	<= 1;			// Valor inicial al reloj, sino siempre será indeterminado
	initial	clk_32f	<= 1;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#8 clk_4f 	<= ~clk_4f;	
	always	#1 clk_32f 	<= ~clk_32f;
endmodule
