module probador_memoria(output reg clk,
			output reg 	 wr_en,
			output reg 	 rd_en,
			output reg 	 reset_L,
			output reg [9:0] data_in,
			output reg [3:0] wr_add,
			output reg [3:0] rd_add,
			input [9:0] 	 data_out_mem_synth,
			input [9:0] 	 data_out_mem);
   
   
    //Reloj
   initial clk <= 0;
   always #1 clk <= ~clk;

    //Secuencia de prueba 
   initial begin
      $dumpfile("memoria.vcd");
      $dumpvars();
      {reset_L,wr_en, rd_en}  <= 0;
      {wr_add, rd_add} <= 0;
      data_in <= 0;
      
      
      @(posedge clk);
      @(posedge clk);
      reset_L <= 1;
     //Solo escritura
      @(posedge clk);
      wr_en <= 1;
      data_in <= 'h0FF;
      wr_add <= 'b000;
      @(posedge clk);
      data_in <= 'h011;
      wr_add <= 'b010;
      @(posedge clk);
      data_in <= 'h022;
      wr_add <= 'b100;
       @(posedge clk);
      data_in <= 'h033;
      wr_add <= 'b110;
      //Escritura y lectura
       @(posedge clk);
      rd_en <= 1;
      data_in <= 'h044;
      wr_add <= 'b001;
      rd_add <= 'b000;
      @(posedge clk);
      data_in <= 'h055;
      wr_add <= 'b011;
      rd_add <= 'b010;
       @(posedge clk);
      data_in <= 'h066;
      wr_add <= 'b101;
      rd_add <= 'b100;
      @(posedge clk);
      data_in <= 'h077;
      wr_add <= 'b111;
      rd_add <= 'b110;
      //Solo lectura
      @(posedge clk);
      wr_en <= 0; 
      data_in <= 'h088;
      rd_add <= 'b101;
       @(posedge clk); 
      data_in <= 'h099;
      rd_add <= 'b111;
      @(posedge clk);
      reset_L <= 0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      

     
      $finish;
      
   end // initial begin
endmodule // probador_memoria
