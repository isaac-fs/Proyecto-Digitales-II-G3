module FSM #(
    parameter NUM_FIFOS = 8,
    parameter FIFO_DEPTH = 8, // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10,
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH)
)(
    input clk,
    input reset_L,
    input init,
    input [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input,
    input [FIFO_PTR_SIZE-1:0] almost_full_threshold_input,
    input [NUM_FIFOS-1:0] FIFOs_empty,
    output reg idle,
    output reg [FIFO_PTR_SIZE-1:0] almost_empty_threshold,
    output reg [FIFO_PTR_SIZE-1:0] almost_full_threshold);

    // Máquina de estados finita
    reg [16:0] estado_actual, proximo_estado; // estados actual y próximo

    // Estados:
    parameter RESET = 1; // codificado one-hot
    parameter INIT = 2;
    parameter IDLE = 4;
    parameter ACTIVE = 8;

    always @(posedge clk) begin // condición de reset
        if(~reset_L) begin
            estado_actual <= RESET;
            almost_empty_threshold <= 2;
            almost_full_threshold <= 6;
        end

        else begin
            estado_actual <= proximo_estado; // Flops de estado de FSM
        end
    end

    always @(*) begin // Lógica de estado próximo
        proximo_estado = estado_actual;
        idle = 1;

        case(estado_actual) 
            RESET: // 1
            begin
                if(reset_L)
                    proximo_estado = INIT;
                else
                    proximo_estado = RESET;
            end 

            INIT: // 2
            begin
                if(init) begin
                    proximo_estado = INIT;
                    almost_empty_threshold = almost_empty_threshold_input;
                    almost_full_threshold = almost_full_threshold_input;
                end

                else 
                    proximo_estado = IDLE;
            end

            IDLE: // 4
            begin
                if(&FIFOs_empty) begin
                    idle = 1;
                    proximo_estado = IDLE;
                end
                    
                else  begin
                    idle = 0;
                    proximo_estado = ACTIVE;
                end
            end

            ACTIVE: // 8
            begin
                if(&FIFOs_empty)
                    proximo_estado = IDLE;
                else
                    proximo_estado = ACTIVE;
            end

        endcase
    end
    
endmodule