`include "rtl/FIFO.v"
`include "rtl/arbitro.v"
`include "rtl/contadores.v"
`include "rtl/FSM.v"

module transaccion #(
		parameter NUM_FIFOS = 8,
    	parameter FIFO_DEPTH = 8, // DEBE SER UNA POTENCIA DE 2
    	parameter FIFO_WORD_SIZE = 10,
    	parameter FIFO_PTR_SIZE = $clog2(FIFO_DEPTH)
)( 			// Reloj		
			input clk, 
			//Entradas hacia FIFOS in 
		    input [FIFO_WORD_SIZE-1:0]  dest_n_data_in0,
		    input 	 push_FIFO_in0,
		    input [FIFO_WORD_SIZE-1:0]  dest_n_data_in1,
		    input 	 push_FIFO_in1,
		    input [FIFO_WORD_SIZE-1:0]  dest_n_data_in2,
		    input 	 push_FIFO_in2,
		    input [FIFO_WORD_SIZE-1:0]  dest_n_data_in3,
		    input 	 push_FIFO_in3,
		    // Entradas hacia FIFOS out
		    input 	 pop_FIFO_out0,
		    input 	 pop_FIFO_out1,
		    input 	 pop_FIFO_out2,
		    input 	 pop_FIFO_out3,
		    //Entradas hacia contadores 
		    input 	 req,
		    input [1:0]  idx,
		    //Entradas hacia FSM
		    input 	 reset_L,
		    input 	 init,
		    input [FIFO_PTR_SIZE-1:0]  almost_empty_threshold_input,
		    input [FIFO_PTR_SIZE-1:0]  almost_full_threshold_input,
		    //Salidas desde FIFOs out
		    output [FIFO_WORD_SIZE-1:0] data_out0,
		    output [FIFO_WORD_SIZE-1:0] data_out1,
		    output [FIFO_WORD_SIZE-1:0] data_out2,
		    output [FIFO_WORD_SIZE-1:0] data_out3,
		    //Salidas desde contadores
		    output [4:0] data,
		    output 	 valid);

   // Quité el AUTOWIRE para que no se borren los cables puestos a mano
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			almost_empty_flag_in0;	// From FIFO_in0 of FIFO.v
   wire			almost_empty_flag_in1;	// From FIFO_in1 of FIFO.v
   wire			almost_empty_flag_in2;	// From FIFO_in2 of FIFO.v
   wire			almost_empty_flag_in3;	// From FIFO_in3 of FIFO.v
   wire			almost_empty_flag_out0;	// From FIFO_out0 of FIFO.v
   wire			almost_empty_flag_out1;	// From FIFO_out1 of FIFO.v
   wire			almost_empty_flag_out2;	// From FIFO_out2 of FIFO.v
   wire			almost_empty_flag_out3;	// From FIFO_out3 of FIFO.v
   wire [FIFO_PTR_SIZE-1:0] almost_empty_threshold;// From FSM of FSM.v
   wire			almost_full_flag_in0;	// From FIFO_in0 of FIFO.v
   wire			almost_full_flag_in1;	// From FIFO_in1 of FIFO.v
   wire			almost_full_flag_in2;	// From FIFO_in2 of FIFO.v
   wire			almost_full_flag_in3;	// From FIFO_in3 of FIFO.v
   wire			almost_full_flag_out0;	// From FIFO_out0 of FIFO.v
   wire			almost_full_flag_out1;	// From FIFO_out1 of FIFO.v
   wire			almost_full_flag_out2;	// From FIFO_out2 of FIFO.v
   wire			almost_full_flag_out3;	// From FIFO_out3 of FIFO.v
   wire [FIFO_PTR_SIZE-1:0] almost_full_threshold;// From FSM of FSM.v
   wire [FIFO_WORD_SIZE-1:0] data_F_A_0;	// From FIFO_in0 of FIFO.v
   wire [FIFO_WORD_SIZE-1:0] data_F_A_1;	// From FIFO_in1 of FIFO.v
   wire [FIFO_WORD_SIZE-1:0] data_F_A_2;	// From FIFO_in2 of FIFO.v
   wire [FIFO_WORD_SIZE-1:0] data_F_A_3;	// From FIFO_in3 of FIFO.v
   wire [FIFO_WORD_SIZE-1:0] data_A_F_0;	// A mano
   wire [FIFO_WORD_SIZE-1:0] data_A_F_1;	// A mano
   wire [FIFO_WORD_SIZE-1:0] data_A_F_2;	// A mano
   wire [FIFO_WORD_SIZE-1:0] data_A_F_3;	// A mano
   wire			empty_flag_in0;		// From FIFO_in0 of FIFO.v
   wire			empty_flag_in1;		// From FIFO_in1 of FIFO.v
   wire			empty_flag_in2;		// From FIFO_in2 of FIFO.v
   wire			empty_flag_in3;		// From FIFO_in3 of FIFO.v
   wire			empty_flag_out0;	// From FIFO_out0 of FIFO.v
   wire			empty_flag_out1;	// From FIFO_out1 of FIFO.v
   wire			empty_flag_out2;	// From FIFO_out2 of FIFO.v
   wire			empty_flag_out3;	// From FIFO_out3 of FIFO.v
   wire			error_flag_in0;		// From FIFO_in0 of FIFO.v
   wire			error_flag_in1;		// From FIFO_in1 of FIFO.v
   wire			error_flag_in2;		// From FIFO_in2 of FIFO.v
   wire			error_flag_in3;		// From FIFO_in3 of FIFO.v
   wire			error_flag_out0;	// From FIFO_out0 of FIFO.v
   wire			error_flag_out1;	// From FIFO_out1 of FIFO.v
   wire			error_flag_out2;	// From FIFO_out2 of FIFO.v
   wire			error_flag_out3;	// From FIFO_out3 of FIFO.v
   wire			full_flag_in0;		// From FIFO_in0 of FIFO.v
   wire			full_flag_in1;		// From FIFO_in1 of FIFO.v
   wire			full_flag_in2;		// From FIFO_in2 of FIFO.v
   wire			full_flag_in3;		// From FIFO_in3 of FIFO.v
   wire			full_flag_out0;		// From FIFO_out0 of FIFO.v
   wire			full_flag_out1;		// From FIFO_out1 of FIFO.v
   wire			full_flag_out2;		// From FIFO_out2 of FIFO.v
   wire			full_flag_out3;		// From FIFO_out3 of FIFO.v
   wire			idle;			// From FSM of FSM.v
   // End of automatics

//Notación
//_F_A_x = del FIFO al árbitro
//_A_F_x = del árbitro al FIFO


   
   //FIFOS de entrada
/*FIFO AUTO_TEMPLATE (
                 .data_out		(data_F_A_0[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_in0),
		 .full_flag		(full_flag_in0),
		 .almost_empty_flag	(almost_empty_flag_in0),
		 .almost_full_flag	(almost_full_flag_in0),
		 .error_flag		(error_flag_in0),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(dest_n_data_in0[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_FIFO_in0),
		 .rd_en			(pop_A_F_0),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
 */
 
  

    
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_in0(/*AUTOINST*/
	   // Outputs
	   .data_out			(data_F_A_0[FIFO_WORD_SIZE-1:0]), // Templated
	   .empty_flag			(empty_flag_in0),	 // Templated
	   .full_flag			(full_flag_in0),	 // Templated
	   .almost_empty_flag		(almost_empty_flag_in0), // Templated
	   .almost_full_flag		(almost_full_flag_in0),	 // Templated
	   .error_flag			(error_flag_in0),	 // Templated
	   // Inputs
	   .clk				(clk),			 // Templated
	   .reset_L			(reset_L),		 // Templated
	   .data_in			(dest_n_data_in0[FIFO_WORD_SIZE-1:0]), // Templated
	   .wr_en			(push_FIFO_in0),	 // Templated
	   .rd_en			(pop_A_F_0),		 // Templated
	   .init			(init),			 // Templated
	   .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	   .almost_full_threshold_input	(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

   /*FIFO AUTO_TEMPLATE (
                 .data_out		(data_F_A_1[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_in1),
		 .full_flag		(full_flag_in1),
		 .almost_empty_flag	(almost_empty_flag_in1),
		 .almost_full_flag	(almost_full_flag_in1),
		 .error_flag		(error_flag_in1),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(dest_n_data_in1[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_FIFO_in1),
		 .rd_en			(pop_A_F_1),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
 */
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_in1(/*AUTOINST*/
	   // Outputs
	   .data_out			(data_F_A_1[FIFO_WORD_SIZE-1:0]), // Templated
	   .empty_flag			(empty_flag_in1),	 // Templated
	   .full_flag			(full_flag_in1),	 // Templated
	   .almost_empty_flag		(almost_empty_flag_in1), // Templated
	   .almost_full_flag		(almost_full_flag_in1),	 // Templated
	   .error_flag			(error_flag_in1),	 // Templated
	   // Inputs
	   .clk				(clk),			 // Templated
	   .reset_L			(reset_L),		 // Templated
	   .data_in			(dest_n_data_in1[FIFO_WORD_SIZE-1:0]), // Templated
	   .wr_en			(push_FIFO_in1),	 // Templated
	   .rd_en			(pop_A_F_1),		 // Templated
	   .init			(init),			 // Templated
	   .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	   .almost_full_threshold_input	(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

    /*FIFO AUTO_TEMPLATE (
                 .data_out		(data_F_A_2[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_in2),
		 .full_flag		(full_flag_in2),
		 .almost_empty_flag	(almost_empty_flag_in2),
		 .almost_full_flag	(almost_full_flag_in2),
		 .error_flag		(error_flag_in2),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(dest_n_data_in2[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_FIFO_in2),
		 .rd_en			(pop_A_F_2),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
     */
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_in2(/*AUTOINST*/
	   // Outputs
	   .data_out			(data_F_A_2[FIFO_WORD_SIZE-1:0]), // Templated
	   .empty_flag			(empty_flag_in2),	 // Templated
	   .full_flag			(full_flag_in2),	 // Templated
	   .almost_empty_flag		(almost_empty_flag_in2), // Templated
	   .almost_full_flag		(almost_full_flag_in2),	 // Templated
	   .error_flag			(error_flag_in2),	 // Templated
	   // Inputs
	   .clk				(clk),			 // Templated
	   .reset_L			(reset_L),		 // Templated
	   .data_in			(dest_n_data_in2[FIFO_WORD_SIZE-1:0]), // Templated
	   .wr_en			(push_FIFO_in2),	 // Templated
	   .rd_en			(pop_A_F_2),		 // Templated
	   .init			(init),			 // Templated
	   .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	   .almost_full_threshold_input	(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

   /*FIFO AUTO_TEMPLATE (
                 .data_out		(data_F_A_3[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_in3),
		 .full_flag		(full_flag_in3),
		 .almost_empty_flag	(almost_empty_flag_in3),
		 .almost_full_flag	(almost_full_flag_in3),
		 .error_flag		(error_flag_in3),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(dest_n_data_in3[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_FIFO_in3),
		 .rd_en			(pop_A_F_3),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
     */
   
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_in3(/*AUTOINST*/
	   // Outputs
	   .data_out			(data_F_A_3[FIFO_WORD_SIZE-1:0]), // Templated
	   .empty_flag			(empty_flag_in3),	 // Templated
	   .full_flag			(full_flag_in3),	 // Templated
	   .almost_empty_flag		(almost_empty_flag_in3), // Templated
	   .almost_full_flag		(almost_full_flag_in3),	 // Templated
	   .error_flag			(error_flag_in3),	 // Templated
	   // Inputs
	   .clk				(clk),			 // Templated
	   .reset_L			(reset_L),		 // Templated
	   .data_in			(dest_n_data_in3[FIFO_WORD_SIZE-1:0]), // Templated
	   .wr_en			(push_FIFO_in3),	 // Templated
	   .rd_en			(pop_A_F_3),		 // Templated
	   .init			(init),			 // Templated
	   .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	   .almost_full_threshold_input	(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

   //Arbitro

   arbitro #(
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE)
) arbitro(
		   // Outputs
		   .data_out_0		(data_A_F_0[FIFO_WORD_SIZE-1:0]),
		   .data_out_1		(data_A_F_1[FIFO_WORD_SIZE-1:0]),
		   .data_out_2		(data_A_F_2[FIFO_WORD_SIZE-1:0]),
		   .data_out_3		(data_A_F_3[FIFO_WORD_SIZE-1:0]),
		   .pop_p0		(pop_A_F_0),
		   .pop_p1		(pop_A_F_1),
		   .pop_p2		(pop_A_F_2),
		   .pop_p3		(pop_A_F_3),
		   .push_p0		(push_A_F_0),
		   .push_p1		(push_A_F_1),
		   .push_p2		(push_A_F_2),
		   .push_p3		(push_A_F_3),
		   // Inputs
		   .empty_p0		(empty_flag_in0),
		   .empty_p1		(empty_flag_in1),
		   .empty_p2		(empty_flag_in2),
		   .empty_p3		(empty_flag_in3),
		   .almostfull_p0	(almost_full_flag_out0),
		   .almostfull_p1	(almost_full_flag_out1),
		   .almostfull_p2	(almost_full_flag_out2),
		   .almostfull_p3	(almost_full_flag_out3),
		   .data_in_0		(data_F_A_0[FIFO_WORD_SIZE-1:0]),
		   .data_in_1		(data_F_A_1[FIFO_WORD_SIZE-1:0]),
		   .data_in_2		(data_F_A_2[FIFO_WORD_SIZE-1:0]),
		   .data_in_3		(data_F_A_3[FIFO_WORD_SIZE-1:0]));

   //FIFOS de salida

/*FIFO AUTO_TEMPLATE (
                 .data_out		(data_out0[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_out0),
		 .full_flag		(full_flag_out0),
		 .almost_empty_flag	(almost_empty_flag_out0),
		 .almost_full_flag	(almost_full_flag_out0),
		 .error_flag		(error_flag_out0),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(data_A_F_0[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_A_F_0),
		 .rd_en			(pop_FIFO_out0),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
 */

   
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_out0(/*AUTOINST*/
	    // Outputs
	    .data_out			(data_out0[FIFO_WORD_SIZE-1:0]), // Templated
	    .empty_flag			(empty_flag_out0),	 // Templated
	    .full_flag			(full_flag_out0),	 // Templated
	    .almost_empty_flag		(almost_empty_flag_out0), // Templated
	    .almost_full_flag		(almost_full_flag_out0), // Templated
	    .error_flag			(error_flag_out0),	 // Templated
	    // Inputs
	    .clk			(clk),			 // Templated
	    .reset_L			(reset_L),		 // Templated
	    .data_in			(data_A_F_0[FIFO_WORD_SIZE-1:0]), // Templated
	    .wr_en			(push_A_F_0),		 // Templated
	    .rd_en			(pop_FIFO_out0),	 // Templated
	    .init			(init),			 // Templated
	    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

/*FIFO AUTO_TEMPLATE (
                 .data_out		(data_out1[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_out1),
		 .full_flag		(full_flag_out1),
		 .almost_empty_flag	(almost_empty_flag_out1),
		 .almost_full_flag	(almost_full_flag_out1),
		 .error_flag		(error_flag_out1),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(data_A_F_1[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_A_F_1),
		 .rd_en			(pop_FIFO_out1),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
 */

   
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_out1(/*AUTOINST*/
	    // Outputs
	    .data_out			(data_out1[FIFO_WORD_SIZE-1:0]), // Templated
	    .empty_flag			(empty_flag_out1),	 // Templated
	    .full_flag			(full_flag_out1),	 // Templated
	    .almost_empty_flag		(almost_empty_flag_out1), // Templated
	    .almost_full_flag		(almost_full_flag_out1), // Templated
	    .error_flag			(error_flag_out1),	 // Templated
	    // Inputs
	    .clk			(clk),			 // Templated
	    .reset_L			(reset_L),		 // Templated
	    .data_in			(data_A_F_1[FIFO_WORD_SIZE-1:0]), // Templated
	    .wr_en			(push_A_F_1),		 // Templated
	    .rd_en			(pop_FIFO_out1),	 // Templated
	    .init			(init),			 // Templated
	    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

/*FIFO AUTO_TEMPLATE (
                 .data_out		(data_out2[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_out2),
		 .full_flag		(full_flag_out2),
		 .almost_empty_flag	(almost_empty_flag_out2),
		 .almost_full_flag	(almost_full_flag_out2),
		 .error_flag		(error_flag_out2),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(data_A_F_2[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_A_F_2),
		 .rd_en			(pop_FIFO_out2),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
 */
   
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_out2(/*AUTOINST*/
	    // Outputs
	    .data_out			(data_out2[FIFO_WORD_SIZE-1:0]), // Templated
	    .empty_flag			(empty_flag_out2),	 // Templated
	    .full_flag			(full_flag_out2),	 // Templated
	    .almost_empty_flag		(almost_empty_flag_out2), // Templated
	    .almost_full_flag		(almost_full_flag_out2), // Templated
	    .error_flag			(error_flag_out2),	 // Templated
	    // Inputs
	    .clk			(clk),			 // Templated
	    .reset_L			(reset_L),		 // Templated
	    .data_in			(data_A_F_2[FIFO_WORD_SIZE-1:0]), // Templated
	    .wr_en			(push_A_F_2),		 // Templated
	    .rd_en			(pop_FIFO_out2),	 // Templated
	    .init			(init),			 // Templated
	    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

/*FIFO AUTO_TEMPLATE (
                 .data_out		(data_out3[FIFO_WORD_SIZE-1:0]),
	         .empty_flag		(empty_flag_out3),
		 .full_flag		(full_flag_out3),
		 .almost_empty_flag	(almost_empty_flag_out3),
		 .almost_full_flag	(almost_full_flag_out3),
		 .error_flag		(error_flag_out3),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .data_in		(data_A_F_3[FIFO_WORD_SIZE-1:0]),
		 .wr_en			(push_A_F_3),
		 .rd_en			(pop_FIFO_out3),
		 .init			(init),
		 .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
		 .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]));
 */
   
   FIFO #(
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE)
) FIFO_out3(/*AUTOINST*/
	    // Outputs
	    .data_out			(data_out3[FIFO_WORD_SIZE-1:0]), // Templated
	    .empty_flag			(empty_flag_out3),	 // Templated
	    .full_flag			(full_flag_out3),	 // Templated
	    .almost_empty_flag		(almost_empty_flag_out3), // Templated
	    .almost_full_flag		(almost_full_flag_out3), // Templated
	    .error_flag			(error_flag_out3),	 // Templated
	    // Inputs
	    .clk			(clk),			 // Templated
	    .reset_L			(reset_L),		 // Templated
	    .data_in			(data_A_F_3[FIFO_WORD_SIZE-1:0]), // Templated
	    .wr_en			(push_A_F_3),		 // Templated
	    .rd_en			(pop_FIFO_out3),	 // Templated
	    .init			(init),			 // Templated
	    .almost_empty_threshold_input(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]), // Templated
	    .almost_full_threshold_input(almost_full_threshold_input[FIFO_PTR_SIZE-1:0])); // Templated

   //Contadores
   contadores contadores(
			 // Outputs
			 .data			(data[4:0]),
			 .valid			(valid),
			 // Inputs
			 .clk			(clk),
			 .rst_l			(reset_L),
			 .req			(req),
			 .pop_0			(pop_FIFO_out0),
			 .pop_1			(pop_FIFO_out1),
			 .pop_2			(pop_FIFO_out2),
			 .pop_3			(pop_FIFO_out3),
			 .idx			(idx[1:0]),
			 .idle			(idle),
			 .empty_FIFO_0		(empty_flag_out0),
			 .empty_FIFO_1		(empty_flag_out1),
			 .empty_FIFO_2		(empty_flag_out2),
			 .empty_FIFO_3		(empty_flag_out3));

wire [NUM_FIFOS-1:0] FIFOs_empty = {empty_flag_in0, empty_flag_in1, empty_flag_in2, empty_flag_in3, empty_flag_out0, empty_flag_out1, empty_flag_out2, empty_flag_out3};

   //FSM
   FSM #(   
	.NUM_FIFOS (NUM_FIFOS),
    .FIFO_DEPTH (FIFO_DEPTH),
    .FIFO_WORD_SIZE (FIFO_WORD_SIZE),
    .FIFO_PTR_SIZE (FIFO_PTR_SIZE),
    .NUM_FIFOS (NUM_FIFOS)
) FSM(/*AUTOINST*/
      // Outputs
      .idle				(idle),
      .almost_empty_threshold		(almost_empty_threshold[FIFO_PTR_SIZE-1:0]),
      .almost_full_threshold		(almost_full_threshold[FIFO_PTR_SIZE-1:0]),
      // Inputs
      .clk				(clk),
      .reset_L				(reset_L),
      .init				(init),
      .almost_empty_threshold_input	(almost_empty_threshold_input[FIFO_PTR_SIZE-1:0]),
      .almost_full_threshold_input	(almost_full_threshold_input[FIFO_PTR_SIZE-1:0]),
      .FIFOs_empty			(FIFOs_empty[NUM_FIFOS-1:0]));

endmodule // transaccion