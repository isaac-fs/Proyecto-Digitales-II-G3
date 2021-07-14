module memoria #(
	parameter MEM_DEPTH = 8,
	parameter WORD_SIZE = 10,
	parameter PTR_SIZE = $clog2(MEM_DEPTH) // $clog2() calcular el logaritmo en base 2
)(input clk,
	input wr_en,
	input rd_en,
	input reset_L,
	input [WORD_SIZE-1:0] data_in,
	input [PTR_SIZE-1:0] wr_ptr, 
	input [PTR_SIZE-1:0] rd_ptr,
	output reg [WORD_SIZE-1:0] data_out);

   // wr_en y rd_en permiten escritura y lectura respectivamente
   // wr_ptr y rd_ptr brindan las direcciones para lecura y escritura en la memoria

   // Memoria de 10 bits de ancho y 8 de profundidad
   reg [WORD_SIZE-1:0] mem [MEM_DEPTH-1:0];
   integer i;

   always @(posedge clk)
     begin
	if(!reset_L) //El reset en bajo limpia la memoria
	  begin
	    for (i=0; i<MEM_DEPTH; i = i+1)
			mem[i] <= 0;
	    	data_out <= 0;
		end
	else
	  begin //Lógica de lectura y escritura de la memoria
	     if(wr_en)
	       mem[wr_ptr] <= data_in;
	     if(rd_en)
	       data_out <= mem[rd_ptr];
	  end // else: !if(!reset_L)
	end // always @ (posedge clk)
endmodule // memoria

   

	      
