module probador( // Módulo probador: generador de señales y monitor de datos.
	// Entradas del monitor de datos
	// Conductual
	input idle_out_cond,
	// Síntesis
	input idle_out_synth,
    // Salidas del generador de señales
	output reg active,
	output reg rst_L,
	output reg clk_4f,
	output reg clk_32f
);

	// Reloj
	initial	clk_4f <= 1;			// Valor inicial al reloj, sino siempre será indeterminado
	initial	clk_32f <= 1;			// Valor inicial al reloj, sino siempre será indeterminado
	always #40 clk_4f <= ~clk_4f;		// Hace "toggle" cada 2*1ns
	always #5 clk_32f <= ~clk_32f;		// Hace "toggle" cada 2*1ns
	
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
		active = 1'b1;
		rst_L = 1'b0;
		#10;
		rst_L = 1'b1;
		active = 1'b0;
		#20;
		active = 1'b1;
		#20;
		active = 1'b0;
		#40;
		active = 1'b1;
		#20;
		active = 1'b0;
		#20;
		active = 1'b0;
		#20;
		active = 1'b1;
		#20;
		// active = 1'b0;
		// #20;
		// active = 1'b1;
		// #20;
		// active = 1'b0;
		// #20;

		$finish; // Termina de almacenar señales
		end
endmodule
