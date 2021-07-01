`include "memoria.v"
module FIFO (
    input clk,
    input reset_L,
    input [9:0] data_in,
    input wr_en, // En arquitectura fifo_wr
    input rd_en, // En arquitectura fifo_rd
    output reg [9:0] data_out,
    output reg empty,
    output reg full,
    output reg almost_empty,
    output reg almost_full
);
    
// Un push es hacer un enable de write y poner el dato
// Un pop es hacer un enable de read y sacar el dato

// Memoria del FIFO
reg [2:0] rd_ptr, wr_ptr;

memoria memoria_fifo(
		     // Outputs
		     .data_out		(data_out[9:0]),
		     // Inputs
		     .clk		(clk),
		     .wr_en		(wr_en),
		     .rd_en		(rd_en),
		     .reset_L		(reset_L),
		     .data_in		(data_in[9:0]),
		     .wr_ptr		(wr_ptr[2:0]),
		     .rd_ptr		(rd_ptr[2:0]));

// Write logic -> IN: fifo_wr OUT: wr_ptr fifo_flag_wr
always @(posedge clk) begin
    if(~reset_L) begin
        wr_ptr <= 0;
    end
    else begin
        if (wr_en):
            wr_ptr <= wr_ptr + 1;
    end
end

// Read logic -> IN: fifo_rd OUT: rd_ptr fifo_flag_rd
always @(posedge clk) begin
    if(~reset_L) begin
        rd_ptr <= 0;
    end
    else begin
        if (rd_en):
            rd_ptr <= rd_ptr + 1;
    end
end

// FIFO flag control logic -> IN: fifo_flag_wr fifo_flag_rd 
//                         -> OUT: fifo_empty fifo_full 
//                                 fifo_almost_full 
//                                 fifo_almost_empty

endmodule
