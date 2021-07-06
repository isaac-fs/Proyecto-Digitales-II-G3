module probador #(
    parameter FIFO_DEPTH = 8, // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10,
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH)
) ( 
	// Módulo probador: generador de señales y monitor de datos.
	// Entradas del monitor de datos
		// Condicional
    input [FIFO_WORD_SIZE-1:0] data_out,
    input empty_flag,
    input full_flag,
    input almost_empty_flag,
    input almost_full_flag,
    input error_flag,
		// Síntesis
	input [FIFO_WORD_SIZE-1:0] data_out_SYNTH,
    input empty_flag_SYNTH,
    input full_flag_SYNTH,
    input almost_empty_flag_SYNTH,
    input almost_full_flag_SYNTH,
    input error_flag_SYNTH,
    // Salidas del generador de señales
    output reg clk,
    output reg reset_L,
    output reg [FIFO_WORD_SIZE-1:0] data_in,
    output reg wr_en, // En arquitectura fifo_wr
    output reg rd_en, // En arquitectura fifo_rd
	output reg init, // Estado de cambio de thresholds
    output reg [FIFO_PTR_SIZE-1:0] almost_empty_threshold_input,
    output reg [FIFO_PTR_SIZE-1:0] almost_full_threshold_input);
	

    integer prob_i; // contador

	// checker
    integer check = 1;
    always @(*) begin
		check = 0;
        if (data_out == data_out_SYNTH) 
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
		$dumpfile("testbench/simulacion.vcd");	// Nombre de archivo del "dump"
		$dumpvars;              // Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		$display ("\t\ttime\tclk,\tcheck");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b%d", clk, check);
        
        // Inicialización de datos
		reset_L = 0;
		wr_en = 0;
		rd_en = 0;
		data_in = 10'h000;
		init = 1; // Estado de cambio de thresholds
    	almost_empty_threshold_input = 2;
    	almost_full_threshold_input = 6;
		// Inicio de pruebas
		
		@(posedge clk);
			reset_L <= 1;	
		
		@(posedge clk) begin
			init <= 0;
			wr_en <= 1;
			data_in <= 'h001;
			almost_empty_threshold_input <= 0;
    		almost_full_threshold_input <= 0;
		end
		
		repeat (8) begin
			@(posedge clk) begin
				wr_en <= 1;
				data_in <= data_in + 1;
			end
		end

		repeat (8) begin
			@(posedge clk) begin
				wr_en <= 0; 
				rd_en <= 1;
				data_in <= data_in + 1;
			end
		end

		@(posedge clk) begin
			reset_L <= 0;
		end

		#50

		// Final de pruebas
		$finish; // Termina de almacenar señales
	end
endmodule
