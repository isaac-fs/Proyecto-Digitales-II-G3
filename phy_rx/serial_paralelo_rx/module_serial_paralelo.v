module module_serial_paralelo (
    output reg [7:0]sp_out,
    output reg valid_out_sp,
    input data_in,
    input clk_4f,
    input clk_32f);
    

    reg [7:0] serial_in,q1;
    reg [2:0] counter;
    reg [2:0] BCcounter;

    
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

    always @(posedge clk_4f) begin
        
            sp_out <= q1;
            if (q1 == 'hBC) begin
                BCcounter <= BCcounter + 1;
                
                
                valid_out_sp <= 0;
                end
        else begin
            if (BCcounter == 4) begin
                
                
                valid_out_sp <= 1;
                
            end
        end 
        if (BCcounter == 4) begin
            if (q1 == 'hBC) begin
                BCcounter <= 'b100;
            end
            end
        end

    

endmodule