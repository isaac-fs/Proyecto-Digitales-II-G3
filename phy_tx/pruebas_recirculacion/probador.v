module probador( // Módulo probador: generador de señales y monitor de datos.
	// Entradas del monitor de datos
	// Conductual
    // Hacia lógica
    input [7:0] data_out_0_cond,
    input [7:0] data_out_1_cond,
    input [7:0] data_out_2_cond,
    input [7:0] data_out_3_cond,
    // Hacia recirculación
    input [7:0] data_out_4_cond,
    input [7:0] data_out_5_cond,
    input [7:0] data_out_6_cond,
    input [7:0] data_out_7_cond,
    // Valids de salida correspondientes
    input valid_out_0_cond,
    input valid_out_1_cond,
    input valid_out_2_cond,
    input valid_out_3_cond,
    input valid_out_4_cond,
    input valid_out_5_cond,
    input valid_out_6_cond,
	 input valid_out_7_cond,
	// Síntesis
    // Hacia lógica
    input [7:0] data_out_0_synt,
    input [7:0] data_out_1_synt,
    input [7:0] data_out_2_synt,
    input [7:0] data_out_3_synt,
    // Hacia recirculación
    input [7:0] data_out_4_synt,
    input [7:0] data_out_5_synt,
    input [7:0] data_out_6_synt,
    input [7:0] data_out_7_synt,
    // Valids de salida correspondientes
    input valid_out_0_synt,
    input valid_out_1_synt,
    input valid_out_2_synt,
    input valid_out_3_synt,
    input valid_out_4_synt,
    input valid_out_5_synt,
    input valid_out_6_synt,
    input valid_out_7_synt,

    // Salidas del generador de señales
	output reg idle,
    output reg clk,  
    // Desde probador o lógica superior
    output reg [7:0] data_in_0,
    output reg [7:0] data_in_1,
    output reg [7:0] data_in_2,
    output reg [7:0] data_in_3,
    // Valids de entrada correspondientes 
    output reg valid_in_0,
    output reg valid_in_1,
    output reg valid_in_2,
    output reg valid_in_3);

	// Reloj
	initial	clk <= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always #2 clk <= ~clk;		// Hace "toggle" cada 2*1ns

    integer i; // contador

	// checker
    integer check = 0;
    always @(*) begin
        if (data_out_0_cond == data_out_0_synt) 
            check <= 1;    
        else
            check <= 0;    
    end 

	// Bloque de procedimiento, no sintetizable, se recorre una única vez.
	// Generalmente, los initial sólo se usan en los testbench o probadores.
	// Se recomienda siempre sincronizar con el reloj y utilizar asignaciones no bloqueantes en la generación de señales.
	initial begin
		$dumpfile("recirculador.vcd");	// Nombre de archivo del "dump"
		$dumpvars;              // Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		$display ("\t\ttime\tclk,\tcheck");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b%d", clk, check);
        
        // Inicialización de datos
		idle <= 0;
		// Desde probador o lógica superior
		data_in_0 <= 8'h0A;
		data_in_1 <= 8'h0B;
		data_in_2 <= 8'h0C;
		data_in_3 <= 8'h0D;
		// Valids de entrada correspondientes 
		valid_in_0 <= 1'b1;
		valid_in_1 <= 1'b1;
		valid_in_2 <= 1'b1;
		valid_in_3 <= 1'b1;

		for (i = 0; i < 8; i = i + 1) begin
			if (i==2) begin
				idle = 1;
			end

			if (i==4) begin
				valid_in_0 <= 1'b0;
				valid_in_1 <= 1'b0;
				valid_in_2 <= 1'b0;
				valid_in_3 <= 1'b0;
			end
			
			if (i==6) begin
				idle = 0;
			end

			@(posedge clk) begin
				// Espera/sincroniza con el flanco positivo del reloj
				data_in_0 <= data_in_0 + 1;
				data_in_1 <= data_in_1 + 1;
				data_in_2 <= data_in_2 + 1;
				data_in_3 <= data_in_3 + 1;
			end
		end

		@(posedge clk) begin
			// Finalización de datos
			idle <= 0;
			// Desde probador o lógica superior
			data_in_0 <= 8'h00;
			data_in_1 <= 8'h00;
			data_in_2 <= 8'h00;
			data_in_3 <= 8'h00;
			// Valids de entrada correspondientes 
			valid_in_0 <= 1'b0;
			valid_in_1 <= 1'b0;
			valid_in_2 <= 1'b0;
			valid_in_3 <= 1'b0;
		end
		$finish; // Termina de almacenar señales
	end
endmodule
