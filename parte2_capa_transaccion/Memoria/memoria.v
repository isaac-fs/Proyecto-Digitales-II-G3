module memoria (input clk,
		input 		 wr_en,
		input 		 rd_en,
		input 		 reset_L,
		input [9:0] 	 data_in,
		input [3:0] 	 wr_add,
		input [3:0] 	 rd_add,
		output reg [9:0] data_out_mem);

   // wr_en y rd_en permiten escritura y lectura respectivamente
   // wr_add y rd_add brindan las direcciones para lecura y escritura en la memoria

   // Memoria de 10 bits de ancho y 8 de profundidad
   reg [9:0] 			 mem [7:0];
   integer 			 i;

   always @(posedge clk)
     begin
	if(!reset_L) //El reset en bajo limpia la memoria
	  begin
	     for (i=0; i<8; i = i+1)
	       mem[i] <= 0;
	     data_out_mem <= 0;
	  end
	else
	  begin //Lógica de lectura y escritura de la memoria
	     if(wr_en)
	       mem[wr_add] <= data_in;
	     if(rd_en)
	       data_out_mem <= mem[rd_add];
	  end // else: !if(!reset_L)
     end // always @ (posedge clk)
endmodule // memoria

   

	      
