module probador_memoria(output reg clk,
			output reg 	 wr_en,
			output reg 	 rd_en,
			output reg 	 reset_L,
			output reg [9:0] data_in,
			output reg [2:0] wr_ptr,
			output reg [2:0] rd_ptr,
			input [9:0] 	 data_out_synth,
			input [9:0] 	 data_out);
   
   
    //Reloj
   initial clk <= 0;
   always #1 clk <= ~clk;

    //Secuencia de prueba 
   initial begin
      $dumpfile("memoria.vcd");
      $dumpvars();
      {reset_L,wr_en, rd_en}  <= 0;
      {wr_ptr, rd_ptr} <= 0;
      data_in <= 0;
      
      
      @(posedge clk);
      @(posedge clk);
      reset_L <= 1;
     //Solo escritura
      @(posedge clk);
      wr_en <= 1;
      data_in <= 'h0FF;
      wr_ptr <= 'b000;
      @(posedge clk);
      data_in <= 'h011;
      wr_ptr <= 'b010;
      @(posedge clk);
      data_in <= 'h022;
      wr_ptr <= 'b100;
       @(posedge clk);
      data_in <= 'h033;
      wr_ptr <= 'b110;
      //Escritura y lectura
       @(posedge clk);
      rd_en <= 1;
      data_in <= 'h044;
      wr_ptr <= 'b001;
      rd_ptr <= 'b000;
      @(posedge clk);
      data_in <= 'h055;
      wr_ptr <= 'b011;
      rd_ptr <= 'b010;
       @(posedge clk);
      data_in <= 'h066;
      wr_ptr <= 'b101;
      rd_ptr <= 'b100;
      @(posedge clk);
      data_in <= 'h077;
      wr_ptr <= 'b111;
      rd_ptr <= 'b110;
      //Solo lectura
      @(posedge clk);
      wr_en <= 0; 
      data_in <= 'h088;
      rd_ptr <= 'b101;
       @(posedge clk); 
      data_in <= 'h099;
      rd_ptr <= 'b111;
      @(posedge clk);
      reset_L <= 0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      

     
      $finish;
      
   end // initial begin
endmodule // probador_memoria
