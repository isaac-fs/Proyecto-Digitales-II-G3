module arbitro (
	input clk,
	// Señales de empty de los FIFOS de entrada
	input empty_p0,
	input empty_p1,
	input empty_p2,
	input empty_p3,
	// Señales de almost full de los FIFOS de salida
	input almostfull_p0,
	input almostfull_p1,
	input almostfull_p2,
	input almostfull_p3,
	// Desde los FIFOS de entrada hacia el mux
	input [9:0] data_in0,
	input [9:0] data_in1,
	input [9:0] data_in2,
	input [9:0] data_in3,
	// Desde el demux a los FIFOS de salida
	// Hacia los FIFOS de salida
    output reg data_out_0;
    output reg data_out_1;
    output reg data_out_2;
    output reg data_out_3;
	// Señales de pop hacia los FIFOS de entrada
	output reg pop_p0,
	output reg pop_p1,
	output reg pop_p2,
	output reg pop_p3,
	// Señales de push hacia los FIFOS de salida
	output reg push_p0,
	output reg push_p1,
	output reg push_p2,
	output reg push_p3);

	reg almost_full; // Si se asignan valores acá luego hay problemas en la sísntesis
	reg FIFOs_empty; // Lo mejor es tratarlos con señales de reset o valores por defecto en el always.
	reg [1:0] dest;

	// almost_full ->Indica que por lo menos uno de los FIFOs de salida está almost full
	// FIFOs_empty -> Indica que todos los FIFO de entrada están vacíos
	always @(*) begin
	    // Señal que indica si al menos un FIFO de salida está almost full
		almost_full = (almostfull_p0 || almostfull_p1 || almostfull_p2 || almostfull_p3);
		FIFOs_empty = (empty_p0 && empty_p1 && empty_p2 && empty_p3);
		dest = data2send[9:8];
	end

	//Lógica POP
	always @(*) begin
		// Valores predeterminados. Necesarios para que no aparezcan LATCH D en síntesis.
		pop_p0 = 0;
		pop_p1 = 0;
		pop_p2 = 0;
		pop_p3 = 0;
		
		if(!almost_full)
			begin
				if(!empty_p0)
					pop_p0 = 1;
				else if (!empty_p1)
					pop_p1 = 1;
				else if (!empty_p2)
					pop_p2 = 1;
				else if (!empty_p3)
					pop_p3 = 1;
			end // if (!almost_full)
	end // always @ (*)

	// Lógica MUX/DEMUX ->  data2send se conecta a los 4 FIFOs de salida. El FIFO donde SI escribe lo determina el push
	always(*) begin
		if(pop_p0)
			data2send = data_in0;
		else if (pop_p1)
			data2send = data_in1;
		else if (pop_p2)
			data2send = data_in2;
		else if (pop_3)
			data2send = data_in3;
		else
			data2send = 0;
	end

	//Lógica de PUSH
	always @(*) begin
		if(!almost_full) begin
			if(!FIFOs_empty) begin
				if (dest == 'b00) begin
						push_p0 = 1;
						push_p1 = 0;
						push_p2 = 0;
						push_p3 = 0;
					end
					else if (dest == 'b01) begin
						push_p0 = 0;
						push_p1 = 1;
						push_p2 = 0;
						push_p3 = 0;
					end
					else if (dest == 'b10) begin
						push_p0 = 0;
						push_p1 = 0;
						push_p2 = 1;
						push_p3 = 0;
					end
					else if (dest == 'b11) begin
						push_p0 = 0;
						push_p1 = 0;
						push_p2 = 0;
						push_p3 = 1;
					end
					else begin
						push_p0 = 0;
						push_p1 = 0;
						push_p2 = 0;
						push_p3 = 0;
					end
					
			end // if (!FIFOs_empty)
			else begin
				push_p0 = 0;
				push_p1 = 0;
				push_p2 = 0;
				push_p3 = 0;
			end // else: !if(!FIFOs_empty)
		end // if (!almost_full)
		else begin
			push_p0 = 0;
			push_p1 = 0;
			push_p2 = 0;
			push_p3 = 0;
		end
	end // always @ (*)
endmodule // arbitro


