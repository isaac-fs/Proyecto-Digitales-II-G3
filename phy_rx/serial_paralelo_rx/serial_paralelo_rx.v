module serial_paralelo_rx (
    output reg [7:0]sp_out,
    output reg valid_out_sp,
    output reg active,
    input data_in,
    input clk_4f,
    input clk_32f);
    

    reg [7:0] serial_in, q1;
    reg [2:0] counter=0;
    reg [2:0] BCcounter=0;

    
    always @(posedge clk_32f) begin
            
            if (counter == 0) begin
                serial_in[7] <= data_in;
                counter <= counter + 1;
                q1 <= serial_in;
            end
            if (counter == 1) begin
                serial_in[6] <= data_in;
                counter <= counter + 1; 
            end
            if (counter == 2) begin
                serial_in[5] <= data_in;
                counter <= counter + 1; 
            end
            if (counter == 3) begin
                serial_in[4] <= data_in;
                counter <= counter + 1; 
            end
            if (counter == 4) begin
                serial_in[3] <= data_in;
                counter <= counter + 1; 
            end
            if (counter == 5) begin
                serial_in[2] <= data_in;
                counter <= counter + 1; 
            end
            if (counter == 6) begin
                serial_in[1] <= data_in;
                counter <= counter + 1;                    
            end
            if (counter == 7) begin
                serial_in[0] <= data_in;
                counter <= counter + 1;
            end 
    end

    always @(*) begin
        valid_out_sp = 0;
        if (active && q1 != 8'hBC)
            valid_out_sp = 1'b1;
        else
            valid_out_sp = 1'b0;
    end

    always @(posedge clk_4f) begin
        //q1 = 8'h0;
        //q1 <= serial_in;
        if (q1 == 8'hBC && BCcounter < 4) //
        BCcounter = BCcounter + 1;

        if(BCcounter < 4) begin
            sp_out <= q1;
            active <= 1'b0;
        end 
        else begin
            sp_out <= q1;
            active <= 1'b1; 
        end

    end
endmodule
