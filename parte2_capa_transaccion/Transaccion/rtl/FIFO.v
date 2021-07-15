`include "rtl/memoria.v"
module FIFO  #(
    parameter FIFO_DEPTH = 8, // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10,
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH)
) (
    input clk,
    input reset_L,
    input [FIFO_WORD_SIZE-1:0] data_in,
    input wr_en, // En arquitectura fifo_wr
    input rd_en, // En arquitectura fifo_rd
    input init, // Estado de cambio de thresholds
    input [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input,
    input [FIFO_PTR_SIZE-1:0] almost_full_threshold_input,
    output [FIFO_WORD_SIZE-1:0] data_out,
    output reg empty_flag,
    output reg full_flag,
    output reg almost_empty_flag,
    output reg almost_full_flag,
    output reg error_flag);
    
// Un push es hacer un enable de write y poner el dato
// Un pop es hacer un enable de read y sacar el dato

// Set de parámetros internos
reg [FIFO_PTR_SIZE-1:0] almost_empty_threshold, almost_full_threshold;
always @(posedge clk) begin
    if(~reset_L) begin
        almost_empty_threshold <= 2;
        almost_full_threshold <= 6;
    end
    else if(reset_L && init) begin
        almost_empty_threshold <= almost_empty_threshold_input;
        almost_full_threshold <= almost_full_threshold_input;
    end
end

// Memoria del FIFO
reg [FIFO_PTR_SIZE-1:0] rd_ptr, wr_ptr;

memoria #(
    .MEM_DEPTH (FIFO_DEPTH),
    .WORD_SIZE (FIFO_WORD_SIZE),
    .PTR_SIZE (FIFO_PTR_SIZE) // $clog2() calcular el logaritmo en base 2
) memoria_fifo (
    // Outputs
    .data_out	(data_out[FIFO_WORD_SIZE-1:0]),
    // Inputs
    .clk		(clk),
    .wr_en		(wr_en),
    .rd_en		(rd_en),
    .reset_L	(reset_L),
    .data_in	(data_in[FIFO_WORD_SIZE-1:0]),
    .wr_ptr		(wr_ptr[FIFO_PTR_SIZE-1:0]),
    .rd_ptr		(rd_ptr[FIFO_PTR_SIZE-1:0]) 
);

// Write logic -> IN: fifo_wr OUT: wr_ptr wr_ptr_to_control
always @(posedge clk) begin
    if(~reset_L)
        wr_ptr <= 0;
    else if (wr_en)
        wr_ptr <= wr_ptr + 1; // wr_ptr_to_control         
end

// Read logic -> IN: fifo_rd OUT: rd_ptr rd_ptr_to_control
always @(posedge clk) begin
    if(~reset_L)
        rd_ptr <= 0;
    else if (rd_en)
        rd_ptr <= rd_ptr + 1; // rd_ptr_to_control    
end

// FIFO flag control logic -> IN: wr_ptr_to_control rd_ptr_to_control
//                         -> OUT: empty_flag full_flag almost_full_flag
//                                 almost_empty_flag error_flag

reg [FIFO_PTR_SIZE-1:0] N, ff_N;

always @(*) begin
    N = wr_ptr - rd_ptr; // Donde N es el número de elementos en memoria
end

always @(posedge clk) begin
    if (~reset_L) begin
        ff_N <= 0;
        empty_flag <= 1; 
        full_flag <= 0;
        almost_full_flag <= 0;
        almost_empty_flag <= 0;
    end
    else begin
        ff_N <= N;
    end
end

always @(*) begin
    if (N > 0 && N < FIFO_DEPTH) begin // Si tiene datos

        if(N <= almost_empty_threshold)
            almost_empty_flag = 1;
        else 
            almost_empty_flag = 0;

        if(N >= almost_full_threshold && !(ff_N == FIFO_DEPTH-1))
            almost_full_flag = 1;
        else    
            almost_full_flag = 0;
    end   

    if (N != 0) begin
        empty_flag = 0;
        full_flag = 0;
    end

    else if (N == 0) begin
        if(!(ff_N == FIFO_DEPTH-1) && (ff_N == 1 || ff_N == 0))
            empty_flag = 1;
        else
            empty_flag = 0;

        if((ff_N == FIFO_DEPTH-1))
            full_flag = 1;
        else    
            full_flag = 0;
    end
end

reg ff_rd_en, ff_wr_en;

// Logica de error
always @(posedge clk) begin
    if(~reset_L) begin
        ff_rd_en <= 0;
        ff_rd_en <= 0; 
    end else begin
        ff_rd_en <= rd_en;
        ff_wr_en <= wr_en;
    end
end

always @(*) begin
    error_flag = 0;
    if(ff_wr_en && !ff_rd_en && full_flag)
        error_flag <= 1;
end

endmodule
