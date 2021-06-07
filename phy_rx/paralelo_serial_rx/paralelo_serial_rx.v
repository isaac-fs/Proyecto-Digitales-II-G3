module paralelo_serial_rx(
    input active,
    input clk_4f, 
    input clk_32f,
    input rst_L,
    output reg idle_out);

    reg [2:0] 				 index = 000;
    reg [7:0] 				 data2send = 000;

    //Lógica de index
    always @ (posedge clk_32f) begin
        if (~rst_L) begin
            index <= 000;
            //idle_out <= 8'h00;
        end
	        
      else begin
        if(index < 7)
            index <= index +1;
        else
            index <= 0;	
      end
    end // always @ (posedge clk_32f)

    always @(*) begin
        idle_out <= data2send[7-index];
    end
    //Lógica de la salida

    always @ (posedge clk_4f) begin 
        if (active)
            data2send = 8'h7C; // Enviar IDLE;
        else
            data2send = 8'hBC; // Enviar COM;
    end // always @ (*)

endmodule