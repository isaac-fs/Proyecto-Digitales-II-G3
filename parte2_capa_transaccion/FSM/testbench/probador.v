module probador #(
    parameter NUM_FIFOS = 8,
    parameter FIFO_DEPTH = 8, // DEBE SER UNA POTENCIA DE 2
    parameter FIFO_WORD_SIZE = 10,
    parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH)
) ( 
// Módulo probador: generador de señales y monitor de datos.
// Entradas del monitor de datos
	// Condicional
	input idle,
    input [FIFO_PTR_SIZE-1:0] almost_empty_threshold,
    input [FIFO_PTR_SIZE-1:0] almost_full_threshold,
	// Síntesis
	input idle_synth,
    input [FIFO_PTR_SIZE-1:0] almost_empty_threshold_synth,
    input [FIFO_PTR_SIZE-1:0] almost_full_threshold_synth,
// Salidas del generador de señales
    output reg clk,
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
        if (idle == idle_synth && almost_empty_threshold == almost_empty_threshold_synth && almost_full_threshold == almost_full_threshold_synth) 
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
		$dumpfile("testbench/FSM_sim.vcd");	// Nombre de archivo del "dump"
		$dumpvars;              // Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		$display ("\t\ttime\tclk,\tcheck");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b%d", clk, check);
        
		// ** MODIFICAR A PARTIR DE ACÁ
        // Inicialización de datos
		reset_L = 0;
		init = 0;
		almost_empty_threshold_input = 0;
		almost_full_threshold_input = 0;
		FIFOs_empty = 'hFF;

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
			almost_empty_threshold_input <= 1;
			almost_full_threshold_input <= 7;
			FIFOs_empty <= 'hFE;
		end

		@(posedge clk) begin
			FIFOs_empty <= 'hFD;
		end

		@(posedge clk) begin
			FIFOs_empty <= 'hFE;
		end

		@(posedge clk) begin
			FIFOs_empty <= 'hFF;
		end

		@(posedge clk) begin
			FIFOs_empty <= 'hFF;
		end

		@(posedge clk)
		// Final de pruebas

		$finish; // Termina de almacenar señales
	end
endmodule
