module arbitro #( // Un árbitro para 4 FIFOS
	parameter FIFO_WORD_SIZE = 10
) (
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
	input [FIFO_WORD_SIZE-1:0] data_in_0,
	input [FIFO_WORD_SIZE-1:0] data_in_1,
	input [FIFO_WORD_SIZE-1:0] data_in_2,
	input [FIFO_WORD_SIZE-1:0] data_in_3,
	// Desde el demux a los FIFOS de salida
	// Hacia los FIFOS de salida
    output reg data_out_0,
    output reg data_out_1,
    output reg data_out_2,
    output reg data_out_3,
	// Los POP y PUSH son READ_ENABLE y WRITE_ENABLE, respectivamente en los FIFOS
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

	reg out_FIFOS_almost_full;
	reg in_FIFOS_empty;

	always @(*) begin
	    // out_FIFOS_almost_full -> Señal que indica que por lo menos uno de los FIFOs de salida está almost full
		out_FIFOS_almost_full = (almostfull_p0 || almostfull_p1 || almostfull_p2 || almostfull_p3);
		// in_FIFOS_empty -> Señal que indica que todos los FIFO de entrada están vacíos
		in_FIFOS_empty = (empty_p0 && empty_p1 && empty_p2 && empty_p3);
	end

	//Lógica POP
	always @(*) begin
		// Valores predeterminados. Necesarios para que no aparezcan LATCH D en síntesis.
		// Además si no se cumple ningún if por defecto cae acá
		pop_p0 = 0;
		pop_p1 = 0;
		pop_p2 = 0;
		pop_p3 = 0;

		if(!out_FIFOS_almost_full)
			begin
				if(!empty_p0)
					pop_p0 = 1;
				else if (!empty_p1)
					pop_p1 = 1;
				else if (!empty_p2)
					pop_p2 = 1;
				else if (!empty_p3)
					pop_p3 = 1;
			end // if (!out_FIFOS_almost_full)
	end // always @ (*)

	// Lógica MUX/DEMUX -> El FIFO donde SI escribe lo determina el push

	reg [1:0] dest; // Selector del demux 

	always @(*) begin
		//mux_out = 0; // Valor por defecto
		dest = mux_out[FIFO_WORD_SIZE-1:FIFO_WORD_SIZE-2]; // -> DEST sólo puede tomar valores 0, 1, 2 y 3.
		// Multiplexor
		if(pop_p0)
			mux_out = data_in_0;
		else if (pop_p1)
			mux_out = data_in_1;
		else if (pop_p2)
			mux_out = data_in_2;
		else if (pop_3)
			mux_out = data_in_3;

		// Demultiplexor
		case(dest)
			'b00: data_out_0 = mux_out;
			'b01: data_out_1 = mux_out;
			'b10: data_out_2 = mux_out;
			'b11: data_out_3 = mux_out;
			default: begin
				// Valores por defecto
				data_out_0 = 0; 
				data_out_1 = 0; 
				data_out_2 = 0; 
				data_out_3 = 0;
			end
		endcase
	end

	//Lógica de PUSH
	always @(*) begin
		if(!in_FIFOS_empty && !out_FIFOS_almost_full) begin
		/* El árbitro hace push siempre y cuando los fifos de entrada 
		no estén vacíos y no haya ningún fifo de salida en almost full - Freddy (2021)*/
				case(dest)
					'b00: push_p0 = 1;
					'b01: push_p1 = 1;
					'b10: push_p2 = 1;
					'b11: push_p3 = 1;
					default: begin
						// Valores por defecto
						push_p0 = 0;
						push_p1 = 0;
						push_p2 = 0;
						push_p3 = 0;
					end
				endcase						
		end // end // if (!out_FIFOS_almost_full && !in_FIFOS_empty)
	end// always @ (*)
endmodule // arbitro