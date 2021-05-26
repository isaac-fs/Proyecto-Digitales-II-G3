module probador( // Módulo probador: generador de señales y monitor de datos.
	// Entradas del monitor de datos
    input [7:0] data_000_cond,
    input valid_000_cond,
	input [7:0] data_000_synt,
    input valid_000_synt,
	// Recirculacion
	//cond
	input [7:0] data_r_0_cond,
    input valid_r_0_cond,
	input [7:0] data_r_1_cond,
    input valid_r_1_cond,
	input [7:0] data_r_2_cond,
    input valid_r_2_cond,
	input [7:0] data_r_3_cond,
    input valid_r_3_cond,
	//synt
	input [7:0] data_r_0_synt,
    input valid_r_0_synt,
	input [7:0] data_r_1_synt,
    input valid_r_1_synt,
	input [7:0] data_r_2_synt,
    input valid_r_2_synt,
	input [7:0] data_r_3_synt,
    input valid_r_3_synt,
	// control
	output reg idle,
    output reg clk_f,
	output reg clk_2f,
	output reg clk_4f, 
	// Salidas del generador de señales 
    // Desde probador o lógica superior
    output reg [7:0] data_0,
    output reg [7:0] data_1,
    output reg [7:0] data_2,
    output reg [7:0] data_3,
    // Valids de entrada correspondientes 
    output reg valid_0,
    output reg valid_1,
    output reg valid_2,
    output reg valid_3);

	// contador
	integer i = 0;

	//Reloj f
	initial clk_f <= 0;
   	always #20 clk_f <= ~clk_f;
         
   //Reloj 2f

   initial clk_2f <= 1;
   always #10 clk_2f <= ~clk_2f;

   //Reloj 4f

   initial clk_4f <= 1;
   always #5 clk_4f <= ~clk_4f;

	// Bloque de procedimiento, no sintetizable, se recorre una única vez.
	// Generalmente, los initial sólo se usan en los testbench o probadores.
	// Se recomienda siempre sincronizar con el reloj y utilizar asignaciones no bloqueantes en la generación de señales.
	initial begin
		$dumpfile("phy_tx.vcd");	// Nombre de archivo del "dump"
		$dumpvars;              // Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		$display ("\t\ttime\tclk,\tcheck");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b", clk_f);
        
        // Inicialización de datos
		idle <= 1;
		@(posedge clk_f) begin
		// Desde probador o lógica superior
		data_0 <= 8'h0A;
		data_1 <= 8'h0B;
		data_2 <= 8'h0C;
		data_3 <= 8'h0D;
		// Valids de entrada correspondientes 
		valid_0 <= 1'b1;
		valid_1 <= 1'b1;
		valid_2 <= 1'b1;
		valid_3 <= 1'b1;
		end

		for (i = 0; i < 8; i = i + 1) begin
			if (i==2) begin
				//idle = 1;
			end

			if (i==5) begin
				valid_0 <= 1'b0;
				valid_1 <= 1'b0;
				valid_2 <= 1'b0;
				valid_3 <= 1'b0;
			end
			
			if (i==6) begin
				idle <= 0;
			end

			@(posedge clk_f) begin
				// Espera/sincroniza con el flanco positivo del reloj
				data_0 <= data_0 + 4;
				data_1 <= data_1 + 2;
				data_2 <= data_2 + 3;
				data_3 <= data_3 + 4;
			end
		end

		@(posedge clk_f) begin
			// Finalización de datos
			idle <= 0;
			// Desde probador o lógica superior
			data_0 <= 8'h00;
			data_1 <= 8'h00;
			data_2 <= 8'h00;
			data_3 <= 8'h00;
			// Valids de entrada correspondientes 
			valid_0 <= 1'b0;
			valid_1 <= 1'b0;
			valid_2 <= 1'b0;
			valid_3 <= 1'b0;
		end
		$finish; // Termina de almacenar señales
	end
endmodule
