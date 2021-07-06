module probador #(
    parameter FIFO_WORD_SIZE = 10
) ( 
	// Módulo probador: generador de señales y monitor de datos.
	// Entradas del monitor de datos
	// Condicional
	// Hacia los FIFOS de salida
	input [FIFO_WORD_SIZE-1:0] data_out_0,
	input [FIFO_WORD_SIZE-1:0] data_out_1,
	input [FIFO_WORD_SIZE-1:0] data_out_2,
	input [FIFO_WORD_SIZE-1:0] data_out_3,
	// Los POP y PUSH son READ_ENABLE y WRITE_ENABLE, respectivamente en los FIFOS
	// Señales de pop hacia los FIFOS de entrada 
	input pop_p0,
	input pop_p1,
	input pop_p2,
	input pop_p3,
	// Señales de push hacia los FIFOS de salida
	input push_p0,
	input push_p1,
	input push_p2,
	input push_p3,
	// Síntesis
	input [FIFO_WORD_SIZE-1:0] data_out_0_synth,
	input [FIFO_WORD_SIZE-1:0] data_out_1_synth,
	input [FIFO_WORD_SIZE-1:0] data_out_2_synth,
	input [FIFO_WORD_SIZE-1:0] data_out_3_synth,
	input pop_p0_synth,
	input pop_p1_synth,
	input pop_p2_synth,
	input pop_p3_synth,
	input push_p0_synth,
	input push_p1_synth,
	input push_p2_synth,
	input push_p3_synth,
    // Salidas del generador de señales
    // Señales de empty de los FIFOS de entrada
	output reg empty_p0,
	output reg empty_p1,
	output reg empty_p2,
	output reg empty_p3,
	// Señales de almost full de los FIFOS de salida
	output reg almostfull_p0,
	output reg almostfull_p1,
	output reg almostfull_p2,
	output reg almostfull_p3,
	// Desde los FIFOS de entrada hacia el mux
	output reg [FIFO_WORD_SIZE-1:0] data_in_0,
	output reg [FIFO_WORD_SIZE-1:0] data_in_1,
	output reg [FIFO_WORD_SIZE-1:0] data_in_2,
	output reg [FIFO_WORD_SIZE-1:0] data_in_3);
	

    integer prob_i; // contador

	// checker
    integer check = 1;
    always @(*) begin
		check = 0;
        if (data_out_0 == data_out_0_synth && data_out_1 == data_out_1_synth && data_out_2 == data_out_2_synth && data_out_3 == data_out_3_synth) 
            check = 1;    
        else
            check = 0;    
    end 

    // Reloj
	reg clk;
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
        
		// ** MODIFICAR A PARTIR DE ACÁ
        // Inicialización de datos
		empty_p0 <= 0;
		empty_p1 <= 0;
		empty_p2 <= 0;
		empty_p3 <= 0;
		almostfull_p0 <= 0;
		almostfull_p1 <= 0;
		almostfull_p2 <= 0;
		almostfull_p3 <= 0;		
		data_in_0 <= 10'h000;
		data_in_1 <= 10'h000;
		data_in_2 <= 10'h000;
		data_in_3 <= 10'h000;
		// Inicio de pruebas
		
		@(posedge clk) begin
		data_in_0 <= 10'h1A6;
		data_in_1 <= 10'h2B7;
		data_in_2 <= 10'h017;
		data_in_3 <= 10'h345;
		end
		
		@(posedge clk) begin
		data_in_0 <= 10'h2A6;
		data_in_1 <= 10'h1B7;
		data_in_2 <= 10'h317;
		data_in_3 <= 10'h145;
		end
		
		@(posedge clk) begin
		data_in_0 <= 10'h1A6;
		data_in_1 <= 10'h2B7;
		data_in_2 <= 10'h317;
		data_in_3 <= 10'h145;
		almostfull_p0 <= 1;
		end
		
		@(posedge clk) begin
		data_in_0 <= 10'h0A6;
		data_in_1 <= 10'h1B7;
		data_in_2 <= 10'h217;
		data_in_3 <= 10'h345;
		end
		
		
		@(posedge clk) begin
		almostfull_p0 <= 0;
		end
		
		
		@(posedge clk) begin
		empty_p0 <= 1;
		end
		
		@(posedge clk);
		@(posedge clk);
		 
		@(posedge clk) begin
		empty_p1 <= 1;
		end
		
		@(posedge clk);
		@(posedge clk);
		
		@(posedge clk) begin
		empty_p2 <= 1;
		end
		
		@(posedge clk) begin
		empty_p3 <= 1;
		end
		
		@(posedge clk) begin
		empty_p0 <= 0;
		empty_p1 <= 0;
		empty_p2 <= 0;
		empty_p3 <= 0;
		almostfull_p1 <= 1;
		end


		@(posedge clk) begin
		almostfull_p1 <= 0;
		end
		
		@(posedge clk) begin
		data_in_0 <= 10'h1A6;
		data_in_1 <= 10'h2B7;
		data_in_2 <= 10'h117;
		data_in_3 <= 10'h345;
		end
		
		@(posedge clk) begin
		data_in_0 <= 10'h2A6;
		data_in_1 <= 10'h1B7;
		data_in_2 <= 10'h317;
		data_in_3 <= 10'h145;
		end
		
		@(posedge clk) begin
		data_in_3 <= 10'h1A6;
		data_in_0 <= 10'h3B7;
		data_in_1 <= 10'h017;
		data_in_2 <= 10'h345;
		end
		
		@(posedge clk) begin
		data_in_3 <= 10'h1A6;
		data_in_2 <= 10'h1B7;
		data_in_1 <= 10'h317;
		data_in_0 <= 10'h345;
		end

		#50
		// Final de pruebas

		$finish; // Termina de almacenar señales
	end
endmodule
