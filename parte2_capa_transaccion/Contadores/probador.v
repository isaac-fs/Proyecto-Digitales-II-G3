module probador( 
      output reg clk,
      output reg rst_l,
      output reg req,
      output reg [9:0] data_out_FIFO_0,
      output reg [9:0] data_out_FIFO_1,
      output reg [9:0] data_out_FIFO_2,
      output reg [9:0] data_out_FIFO_3,
      output reg pop_0,
      output reg pop_1,
      output reg pop_2,
      output reg pop_3,
      output reg [1:0] idx, // indice de cual FIFO leer
      output reg idle,
      output reg empty_FIFO_0,    
      output reg empty_FIFO_1,
      output reg empty_FIFO_2,
      output reg empty_FIFO_3,   
      input [4:0] data,
      input [4:0] data_E,
      input valid,
      input valid_E);
 
   initial begin

      $dumpfile("test.vcd");
      $dumpvars;
      
      rst_l = 0;
      pop_0 = 0;
      pop_1 = 0;
      pop_2 = 0;
      pop_3 = 0;
      idx = 0;
      req = 0;
      idle = 0;
      data_out_FIFO_0 = 0;
      data_out_FIFO_1 = 0;
      data_out_FIFO_2 = 0;
      data_out_FIFO_3 = 0;
      empty_FIFO_0 = 0;    
      empty_FIFO_1 = 0;
      empty_FIFO_2 = 0;
      empty_FIFO_3 = 0;   
      
      @(posedge clk)
         rst_l <= 1;
         
      repeat(4) begin
         @(posedge clk) begin
            data_out_FIFO_0 <= data_out_FIFO_0 + 1;
            data_out_FIFO_1 <= data_out_FIFO_1 + 1;
            data_out_FIFO_2 <= data_out_FIFO_2 + 1;
            data_out_FIFO_3 <= data_out_FIFO_3 + 1;
            {pop_0, pop_1, pop_2, pop_3} <= {pop_0, pop_1, pop_2, pop_3} + 1;
         end
      end

      @(posedge clk) begin
         req <= 1;
         idx <= 2;
      end

      @(posedge clk) begin
         idle <= 1;
      end

       @(posedge clk) begin
         req <= 1;
         idx <= 3;
      end
      $finish;
      
   end //initial

   initial clk <= 0;
   always #2 clk <= ~clk;

endmodule // probador