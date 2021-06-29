module serial_paralelo_rx (
    output reg [7:0]sp_out,
    output reg valid_out_sp,
    output reg active,
    input data_in,
    input rst_L,
    input clk_4f,
    input clk_32f);

    reg [7:0] serial_in;
    reg [2:0] counter;
    reg [2:0] BCcounter;

     always @(posedge clk_32f) begin 
        if(~rst_L) begin
            counter <= 0;
            //serial_in <= 0;
        end
        else begin     
            counter <= counter + 1;
        end                         
    end      

    always @(negedge clk_32f) begin
        serial_in[7-counter] = data_in; 
    end

    always @(posedge clk_4f) begin
        if(~rst_L) begin
            BCcounter <= 0;
            //sp_out <= 0;  
        end
        else begin
            sp_out <= serial_in; 
            if (serial_in == 8'hBC && BCcounter < 4) 
                BCcounter <= BCcounter + 1;  
        end   
    end 

    always @(*) begin
        active = 1'b0;
        if(BCcounter < 4) begin
            active = 1'b0;
        end 
        else begin
            active = 1'b1; 
        end
    end

    always @(*) begin
        valid_out_sp = 1'b0;
        if (active && sp_out != 8'hBC)
            valid_out_sp = 1'b1;
        else
            valid_out_sp = 1'b0;
    end
endmodule
