`include "paralelo_serial_rx.v"
`include "serial_paralelo_rx.v"
`include "DEMUX_L1.v"
`include "DEMUX_L2.v"

module phy_rx (
	// inputs
	input clk_f,
	input clk_2f,
	input clk_4f,
	input clk_32f,
    input datos_paralelo_serial,
	// outputs
    output [7:0] idle_out,
    output [7:0] data_out_0,
    output [7:0] data_out_1,
    output [7:0] data_out_2,
    output [7:0] data_out_3,
    output valid_out_0,        
    output valid_out_1,
    output valid_out_2,
    output valid_out_3);

	wire [7:0] sp_out, data_00, data_11;
	wire active, valid_out_sp, valid_00, valid_11;

    serial_paralelo_rx serial_paralelo_rx_0(/*AUTOINST*/
					    // Outputs
					    .sp_out		(sp_out[7:0]),
					    .valid_out_sp	(valid_out_sp),
					    .active		(active),
					    // Inputs
					    .data_in		(datos_paralelo_serial),
					    .clk_4f		(clk_4f),
					    .clk_32f		(clk_32f));

    paralelo_serial_rx parelelo_serial_rx_0(/*AUTOINST*/
					    // Outputs
					    .idle_out		(idle_out[7:0]),
					    // Inputs
					    .active		(active));

    DEMUX_L2 demux_L2_0(/*AUTOINST*/
			// Outputs
			.data_00	(data_00[7:0]),
			.data_11	(data_11[7:0]),
			.valid_00	(valid_00),
			.valid_11	(valid_11),
			// Inputs
			.data_000	(sp_out[7:0]),
			.valid_000	(valid_out_sp),
			.clk_2f		(clk_2f),
			.clk_4f		(clk_4f));

    DEMUX_L1 demux_L1_0(/*AUTOINST*/
			// Outputs
			.data_0		(data_out_0[7:0]),
			.data_1		(data_out_1[7:0]),
			.data_2		(data_out_2[7:0]),
			.data_3		(data_out_3[7:0]),
			.valid_0	(valid_out_0),
			.valid_1	(valid_out_1),
			.valid_2	(valid_out_2),
			.valid_3	(valid_out_3),
			// Inputs
			.data_00	(data_00[7:0]),
			.data_11	(data_11[7:0]),
			.valid_00	(valid_00),
			.valid_11	(valid_11),
			.clk_2f		(clk_2f),
			.clk_f		(clk_f));
endmodule
