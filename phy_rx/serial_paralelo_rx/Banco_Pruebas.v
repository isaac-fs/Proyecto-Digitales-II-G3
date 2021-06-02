/* Banco de pruebas para el módulo: phyrx. Prueba la descripción conductual y la estructural a partir del probador: probadorRx2.v*/
`timescale 	1ns				/ 100ps

`include "module_serial_paralelo.v"
`include "probador.v"

module BancoPruebas;
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk_32f;		// From probador_ of probador.v
    wire		clk_4f;			// From probador_ of probador.v
    wire		data_in;		// From probador_ of probador.v
    wire [7:0]		sp_out;			// From module_serial_paralelo_ of module_serial_paralelo.v
    wire		valid_out_sp;		// From module_serial_paralelo_ of module_serial_paralelo.v
    // End of automatics


    module_serial_paralelo module_serial_paralelo_(/*AUTOINST*/
						   // Outputs
						   .sp_out		(sp_out[7:0]),
						   .valid_out_sp	(valid_out_sp),
						   // Inputs
						   .data_in		(data_in),
						   .clk_4f		(clk_4f),
						   .clk_32f		(clk_32f));
		         


	probador probador_(/*AUTOINST*/
			   // Outputs
			   .clk_4f		(clk_4f),
			   .clk_32f		(clk_32f),
			   .data_in		(data_in));
			       


endmodule
