module paralelo_serial_rx(input active, output reg [7:0] idle_out);
    always@(*) begin
        idle_out = 8'h7C; // default
        if(active)
            idle_out = 8'h7C; // Enviar IDLE
        else
            idle_out = 8'hBC; // Enviar COM
    end 
endmodule