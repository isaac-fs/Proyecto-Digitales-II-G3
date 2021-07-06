module contadores ( // Contador de salida de datos para 4 salidas
    input clk, // para contar los datos
    input rst_l // reset en bajo
    input req, // request para poder leer los FIFOs
    input pop_0; // pops del probador
    input pop_1;    
    input pop_2;
    input pop_3;
    input [1:0] idx, // indice de cual FIFO leer
    input IDLE, // desde la FSM
    output reg [4:0] data, // cuenta del idx seleccionados
    output reg valid); // si la cuenta es válida i.e. si se leyó en IDLE
/*
Almacenan la cantidad de
palabras que pasan por FIFO,
para leerlos el probador
pone un 1 en req y el idx a
leer, los contadores regresan
el dato y un valid.

Va pegado a las salidas de los FIFOs de salida.
*/    

reg [4:0] contador [3:0]; // contador con palabras de 5 bits y profundidad de 4

always @(posedge clk) begin
    if(~rst_l) begin
        data <= 0;
        valid <= 0;
        contador <= 0;
    end else begin
        if (pop_0)
            contador[0] = contador[0] + 1;

        if (pop_1)
            contador[1] = contador[1] + 1;

        if (pop_2)
            contador[2] = contador[2] + 1;

        if (pop_3)
            contador[3] = contador[3] + 1;

        if(req && IDLE) begin
            data <= contador[idx];
            valid <= 1;
        end else begin
            data <= contador[idx];
            valid <= 0;
        end
    end // if ~rst
end // always posedge clk
endmodule