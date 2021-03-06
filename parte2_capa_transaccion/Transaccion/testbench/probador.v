module probador #(
    parameter NUM_FIFOS = 8,
    parameter FIFO_DEPTH = 8, // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10,
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH)
) ( 
// Módulo probador: generador de señales y monitor de datos.
// Entradas del monitor de datos
// Condicional
	input [FIFO_WORD_SIZE-1:0] data_out0,
	input [FIFO_WORD_SIZE-1:0] data_out1,
   	input [FIFO_WORD_SIZE-1:0] data_out2,
  	input [FIFO_WORD_SIZE-1:0] data_out3,
    //Salidas desde contadores
	input [4:0] data,
    input 	 valid,
// Síntesis
	input [FIFO_WORD_SIZE-1:0] data_out0_synth,
	input [FIFO_WORD_SIZE-1:0] data_out1_synth,
   	input [FIFO_WORD_SIZE-1:0] data_out2_synth,
  	input [FIFO_WORD_SIZE-1:0] data_out3_synth,
    	//Salidas desde contadores
	input [4:0] data_synth,
    	input 	 valid_synth,
// Salidas del generador de señales
    	output reg clk,
// Salidas para los FIFO in
	output reg [FIFO_WORD_SIZE-1:0]  dest_n_data_in0,
	output reg 	 push_FIFO_in0,
    	output reg [FIFO_WORD_SIZE-1:0]  dest_n_data_in1,
    	output reg 	 push_FIFO_in1,
	output reg [FIFO_WORD_SIZE-1:0]  dest_n_data_in2,
	output reg 	 push_FIFO_in2,
	output reg [FIFO_WORD_SIZE-1:0]  dest_n_data_in3,
	output reg 	 push_FIFO_in3, 
// Salidas para los FIFO out 
	output reg 	 pop_FIFO_out0,
	output reg 	 pop_FIFO_out1,
	output reg 	 pop_FIFO_out2,
	output reg 	 pop_FIFO_out3, 
// Salidas hacia contadores
	output reg 	 req,
	output reg [1:0]  idx,
// Salidas para la FSM
    	output reg reset_L,
    	output reg init,
    	output reg [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input,
    	output reg [FIFO_PTR_SIZE-1:0] almost_full_threshold_input,
    	output reg [NUM_FIFOS-1:0] FIFOs_empty);
	

    integer prob_i; // contador
	// checker
    integer check;
    always @(*) begin
		check = 0;
        if (data_out0 == data_out0_synth && data_out1 == data_out1_synth && data_out2 == data_out2_synth&& data_out3 == data_out3_synth) 
            check = 1;    
        else
            check = 0;    
    end 

    // Reloj
	initial	clk <= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always #10 clk <= ~clk;		// Hace "toggle" cada 2*1ns

	// Bloque de procedimiento, no sintetizable, se recorre una única vez.
	// Generalmente, los initial sólo se usan en los testbench o probadores.
	// Se recomienda siempre sincronizar con el reloj y utilizar asignaciones no bloqueantes en la generación de señales.
	initial begin
		$dumpfile("testbench/transaccion_sim.vcd");	// Nombre de archivo del "dump"
		$dumpvars;              // Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		//$display ("\t\ttime\tclk,\tcheck");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		//$monitor($time,"\t%b%d", clk, check);
        
		// ** MODIFICAR A PARTIR DE ACÁ
        // Inicialización de datos
		reset_L = 0;
		init = 0;
		almost_empty_threshold_input = 0;
		almost_full_threshold_input = 0;
	// Entradas para el contador
		req= 0;
		idx = 0;
	// Entradas para el FIFO out
		pop_FIFO_out0 = 0;
		pop_FIFO_out1 = 0;
		pop_FIFO_out2 = 0;
		pop_FIFO_out3 = 0;
	// Entradas para el FIFO in
		push_FIFO_in0 = 0;
		push_FIFO_in1 = 0;
		push_FIFO_in2 = 0;
		push_FIFO_in3 = 0;
		dest_n_data_in0 = 0;
		dest_n_data_in1 = 0;
		dest_n_data_in2 = 0;
		dest_n_data_in3 = 0;
		
		@(posedge clk) begin
			reset_L <= 1;
			init <= 1;
			almost_empty_threshold_input <= 3;
			almost_full_threshold_input <= 5;
		end

		@(posedge clk)

		@(posedge clk) begin
			almost_empty_threshold_input <= 2;
			almost_full_threshold_input <= 6;
		end

		@(posedge clk) begin
			init <= 0;
			almost_empty_threshold_input <= 2;
			almost_full_threshold_input <= 6;
		end


		// Prueba almost full
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h0A6;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h000;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h0CC;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h001;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h012;
		end
		
		// Se dejan todos los FIFO out con 5 datos para luego provocar nada mas el almost 			full en el FIFO out 0.
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h1A6;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h15B;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h1CC;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h15B;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h1BB;
		end
	
		// Se deja el FIFO out 1 con 5 datos
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h2A6;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h25B;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h2CC;
		end

		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h201;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h237;
		end
		
	
		// Se deja el FIFO out 2 con 5 datos
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h3A6;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h35B;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h3CC;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h301;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h321;
		end

		// // Se deja el FIFO out 3 con 5 datos	

		// Llevar a 6
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h0A6;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h1A6;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 0;
		end

		// pop
		@(posedge clk) begin
		pop_FIFO_out0 <= 1;
		end

		//----------------------------
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h1A6;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h2A6;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h2A6;
		end

		// pop
		@(posedge clk) begin
		pop_FIFO_out0 <= 0;	
		pop_FIFO_out1 <= 1;
		end

		//----------------------------
		@(posedge clk) begin
		pop_FIFO_out1 <= 0;
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h3A6;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h3A6;
		end

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		dest_n_data_in0 <= 10'h3A6;
		end

		// pop
		@(posedge clk) begin
		pop_FIFO_out2 <= 1;
		end

		@(posedge clk) begin
		pop_FIFO_out2 <= 1;
		end

		@(posedge clk) begin
		pop_FIFO_out2 <= 1;
		end

		@(posedge clk) begin
		pop_FIFO_out2 <= 1;
		end

		@(posedge clk) begin
		pop_FIFO_out2 <= 0;
		end
		
		// LLENAR FIFOS DE ENTRADA

		@(posedge clk) begin
		push_FIFO_in0 <= 0;
		dest_n_data_in0 <= 0;
		end

		repeat(6) begin
			@(posedge clk) begin
				push_FIFO_in1 <= 1;
				dest_n_data_in1 <= dest_n_data_in1 + 1;
			end
		end

		@(posedge clk) begin
		push_FIFO_in1 <= 0;
		dest_n_data_in1 <= 0;
		end

		repeat(6) begin
			@(posedge clk) begin
				push_FIFO_in2 <= 1;
				dest_n_data_in2 <= dest_n_data_in2 + 1;
			end
		end

		@(posedge clk) begin
		push_FIFO_in2 <= 0;
		dest_n_data_in2 <= 0;
		end

		repeat(6) begin
			@(posedge clk) begin
				push_FIFO_in3 <= 1;
				dest_n_data_in3 <= dest_n_data_in3 + 1;
			end
		end

		@(posedge clk) begin
		push_FIFO_in3 <= 0;
		dest_n_data_in3 <= 0;
		end


		//Vaciar FIFOS
		repeat(2) begin
			@(posedge clk) begin
				pop_FIFO_out0 <= 1;
			end
		end

		@(posedge clk) begin
		pop_FIFO_out0 <= 0;
		end

		repeat(5) begin
			@(posedge clk) begin
				pop_FIFO_out1 <= 1;
			end
		end

		@(posedge clk) begin
		pop_FIFO_out1 <= 0;
		end

		repeat(2) begin
			@(posedge clk) begin
				pop_FIFO_out2 <= 1;
			end
		end

		@(posedge clk) begin
		pop_FIFO_out2 <= 0;
		end

		repeat(12) begin
			@(posedge clk) begin
				pop_FIFO_out3 <= 1;
			end
		end

		@(posedge clk) begin
		pop_FIFO_out3 <= 0;
		end

		repeat(18) begin
			@(posedge clk) begin
				pop_FIFO_out0 <= 1;
			end
		end

		@(posedge clk) begin
		pop_FIFO_out0 <= 0;
		end

		//////////////////////////////

		#60

		
		@(posedge clk) begin
		req <= 1;
		idx <= 0;
		end
		@(posedge clk);
		@(posedge clk);
		//Se dejan dos ciclos entre cada request para un indice diferente para evitar 			problemas de que los bits no cambian al mismo tiempo
		@(posedge clk) begin
		req <= 1;
		idx <= 1;
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk) begin
		req <= 1;
		idx <= 2;
		end
		@(posedge clk) begin
		req <= 1;
		idx <= 3;
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk) begin
		req <= 0;
		idx <= 0;
		end
		
		#600
		//LLenar con 4 cada FIFO in

		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		push_FIFO_in1 <= 1;
		push_FIFO_in2 <= 1;
		push_FIFO_in3 <= 1;
		dest_n_data_in0 <= 10'h0A6;
		dest_n_data_in1 <= 10'h145;
		dest_n_data_in2 <= 10'h278;
		dest_n_data_in3 <= 10'h389;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		push_FIFO_in1 <= 1;
		push_FIFO_in2 <= 1;
		push_FIFO_in3 <= 1;
		dest_n_data_in0 <= 10'h15B;
		dest_n_data_in1 <= 10'h23A;
		dest_n_data_in2 <= 10'h399;
		dest_n_data_in3 <= 10'h00B;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		push_FIFO_in1 <= 1;
		push_FIFO_in2 <= 1;
		push_FIFO_in3 <= 1;
		dest_n_data_in0 <= 10'h3CC;
		dest_n_data_in1 <= 10'h017;
		dest_n_data_in2 <= 10'h1F8;
		dest_n_data_in3 <= 10'h24C;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 1;
		push_FIFO_in1 <= 1;
		push_FIFO_in2 <= 1;
		push_FIFO_in3 <= 1;
		dest_n_data_in0 <= 10'h201;
		dest_n_data_in1 <= 10'h37E;
		dest_n_data_in2 <= 10'h0F8;
		dest_n_data_in3 <= 10'h129;
		end
		
		@(posedge clk) begin
		push_FIFO_in0 <= 0;
		push_FIFO_in1 <= 0;
		push_FIFO_in2 <= 0;
		push_FIFO_in3 <= 0;
		dest_n_data_in0 <= 0;
		dest_n_data_in1 <= 0;
		dest_n_data_in2 <= 0;
		dest_n_data_in3 <= 0;
		end
		//////////////////////xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
		//Se dan varios ciclos de reloj para que los datos lleguen
		#600
		@(posedge clk) begin
		pop_FIFO_out0 <= 1;
		pop_FIFO_out1 <= 1;
		pop_FIFO_out2 <= 1;
		pop_FIFO_out3 <= 1;
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk) begin
		pop_FIFO_out0 <= 0;
		pop_FIFO_out1 <= 0;
		pop_FIFO_out2 <= 0;
		pop_FIFO_out3 <= 0;
		end
		
		// Ahora que todos estan vacios se vuelve a contar las palabras
		@(posedge clk) begin
		req <= 1;
		idx <= 0;
		end
		//Se dejan dos ciclos entre cada request para un indice diferente para evitar 			problemas de que los bits no cambian al mismo tiempo
		@(posedge clk);
		@(posedge clk);
		@(posedge clk) begin
		req <= 1;
		idx <= 1;
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk) begin
		req <= 1;
		idx <= 2;
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk) begin
		req <= 1;
		idx <= 3;
		end
		@(posedge clk);
		@(posedge clk);

		#100
		// Final de pruebas
		
		$finish; // Termina de almacenar señales
	end
endmodule
