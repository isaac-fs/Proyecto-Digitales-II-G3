module probador( 
      output reg clk,
      output reg rst_l,
      output reg req,
      output reg [9:0] data_in0,
      output reg [9:0] data_in1,
      output reg [9:0] data_in2,
      output reg [9:0] data_in3,
      output reg pop_0,
      output reg pop_1,
      output reg pop_2,
      output reg pop_3,
      output reg [1:0] idx, // indice de cual FIFO leer
      output reg idle,
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
      data_in0 = 0;
      data_in1 = 0;
      data_in2 = 0;
      data_in3 = 0;
      
      @(posedge clk) begin
         rst_l <= 1;
         data_in0 <= 040;
      end

      repeat(4) begin
         @(posedge clk) begin
            data_in0 <= data_in0 + 1;
            data_in1 <= data_in1 + 1;
            data_in2 <= data_in2 + 1;
            data_in3 <= data_in3 + 1;
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