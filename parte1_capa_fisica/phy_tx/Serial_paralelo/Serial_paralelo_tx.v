module Serial_paralelo_tx (clk_4f, clk_32f, data_in, reset,  idle);

	input 				clk_4f;
	input 				clk_32f;
	input				data_in;
	input				reset;
	output reg 			idle;


	reg [2:0] cont, BC_counter;		
	reg active;
	reg [7:0] data2out; 
	

	
	always @ (posedge clk_4f) begin
    if (reset == 0) begin 
			BC_counter <= 0;
      		idle <= 0;
    end
		else begin
			if (data2out == 'hBC && BC_counter != 4)
				BC_counter <= BC_counter + 1;
			if (data2out != 'hBC && BC_counter != 4)
				BC_counter <= 0;
		end
		if (active == 1 && data2out =='h7C) begin
			idle <= 1;
		end
		else
			idle <= 0;

	end
	
	always @ (posedge clk_32f) begin
		if (reset==0) begin
			cont <= 0;
		end
		else begin
			cont <= cont + 1;
		end
		if (reset==0) begin
		  data2out <= 0;
		end
		else begin
		  data2out[7-cont] <= data_in;
		end
	end
	
	always @ (*) begin
		if (BC_counter == 4) 
			active = 1;
		else
			active = 0;
	end

endmodule
