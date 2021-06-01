module probador( // Módulo probador: generador de señales y monitor de datos.
	// Entradas del monitor de datos
	// Conductual
	input [7:0] idle_out_cond,
	// Síntesis
	input [7:0] idle_out_synth,
    // Salidas del generador de señales
	output reg active
	// output reg clk
);

	// Reloj
	// initial	clk <= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	// always #8 clk <= ~clk;		// Hace "toggle" cada 2*1ns
	
	// Bloque de procedimiento, no sintetizable, se recorre una única vez.
	// Generalmente, los initial sólo se usan en los testbench o probadores.
	// Se recomienda siempre sincronizar con el reloj y utilizar asignaciones no bloqueantes en la generación de señales.
	initial begin
		$dumpfile("paralelo_serial_rx.vcd");	// Nombre de archivo del "dump"
		$dumpvars;              // Directiva para "dumpear" variables
		// // Mensaje que se imprime en consola una vez
		// $display ("\t\ttime\tclk");
		// // Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		// $monitor($time,"\t%b", clk);
        
        // Inicialización de datos
		active = 1'b0;
		#8;
		active = 1'b1;
		#8;
		active = 1'b0;
		#8;
		active = 1'b1;
		#16;
		active = 1'b0;
		#8;
		active = 1'b0;
		#8;
		active = 1'b1;
		#8;
		active = 1'b0;
		#8;
		active = 1'b1;
		#16;
		active = 1'b0;
		#8;

		$finish; // Termina de almacenar señales
		end
endmodule
