module  recirculador (
    input idle,
    input clk,  
    // Desde probador o lógica superior
    input [7:0] data_in_0,
    input [7:0] data_in_1,
    input [7:0] data_in_2,
    input [7:0] data_in_3,
    // Valids de entrada correspondientes 
    input valid_in_0,
    input valid_in_1,
    input valid_in_2,
    input valid_in_3,
    // Hacia lógica
    output reg [7:0] data_out_0,
    output reg [7:0] data_out_1,
    output reg [7:0] data_out_2,
    output reg [7:0] data_out_3,
    // Hacia recirculación
    output reg [7:0] data_out_4,
    output reg [7:0] data_out_5,
    output reg [7:0] data_out_6,
    output reg [7:0] data_out_7,
    // Valids de salida correspondientes
    output reg valid_out_0,
    output reg valid_out_1,
    output reg valid_out_2,
    output reg valid_out_3,
    output reg valid_out_4,
    output reg valid_out_5,
    output reg valid_out_6,
    output reg valid_out_7
);

    // Wires y regs internos
    // Desde los flops
    reg [7:0] data_ff_0, data_ff_1, data_ff_2, data_ff_3;
    // Valids de salida correspondientes
    reg valid_ff_0, valid_ff_1, valid_ff_2, valid_ff_3;
    
    // Etapa de flops de entrada
    always @(posedge clk) begin
        data_ff_0 <= data_in_0; 
        data_ff_1 <= data_in_1; 
        data_ff_2 <= data_in_2; 
        data_ff_3 <= data_in_3; 
        valid_ff_0 <= valid_in_0; 
        valid_ff_1 <= valid_in_1; 
        valid_ff_2 <= valid_in_2; 
        valid_ff_3 <= valid_in_3;
    end

    // Etapa de demux
    always @(*) begin
         // Valores iniciales
        // Hacia lógica
        data_out_0 = 8'h0;
        data_out_1 = 8'h0;
        data_out_2 = 8'h0;
        data_out_3 = 8'h0;
        // Hacia recirculación
        data_out_4 = 8'h0;
        data_out_5 = 8'h0;
        data_out_6 = 8'h0;
        data_out_7 = 8'h0;
        // Valids de salida correspondientes

        valid_out_0 = 1'b0;
        valid_out_1 = 1'b0;
        valid_out_2 = 1'b0;
        valid_out_3 = 1'b0;
        valid_out_4 = 1'b0;
        valid_out_5 = 1'b0;
        valid_out_6 = 1'b0;
        valid_out_7 = 1'b0;

        if(idle) begin // idle = IDLE
            // Enviar hacia abajo en la lógica
            data_out_0 <= data_ff_0;
            data_out_1 <= data_ff_1;
            data_out_2 <= data_ff_2;
            data_out_3 <= data_ff_3;

            valid_out_0 <= valid_ff_0;
            valid_out_1 <= valid_ff_1;
            valid_out_2 <= valid_ff_2;
            valid_out_3 <= valid_ff_3;
        end
        else begin 
            // Enviar a recirculación
            data_out_4 <= data_ff_0;
            data_out_5 <= data_ff_1;
            data_out_6 <= data_ff_2;
            data_out_7 <= data_ff_3;

            valid_out_4 <= valid_ff_0;
            valid_out_5 <= valid_ff_1;
            valid_out_6 <= valid_ff_2;
            valid_out_7 <= valid_ff_3;
        end
    end
endmodule