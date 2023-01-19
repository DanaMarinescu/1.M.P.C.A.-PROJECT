`timescale 1ns / 1ps

module instruction_memory_tb;
  reg clk;
  reg rst;
  reg [15:0] addr;
  wire [15:0] instruction;
  
instruction_memory uut(.clk(clk), .rst(rst), .addr(addr), .instruction(instruction));

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 100;
initial begin
  clk = 0;
  repeat (2*RUNNING_CYCLES) begin
    #(CLK_PERIOD/2) ;
    clk = ~clk;
  end
end
  
localparam RST_DURATION = 25;
initial begin
  rst = 1;
  #(RST_DURATION) ;
  rst = 0;
end

initial begin 
  #(1*CLK_PERIOD) ;
  addr=16'b0;
  #(1*CLK_PERIOD) ;
  addr=16'b1;
  #(1*CLK_PERIOD) ;
  addr=16'b10;
  #(1*CLK_PERIOD) ;
  addr=16'b11;
  #(1*CLK_PERIOD) ;
  addr=16'b100;
  #(1*CLK_PERIOD) ;
  addr=16'b101;
  #(1*CLK_PERIOD) ;
  addr=16'b110;
  #(1*CLK_PERIOD) ;
  addr=16'b111;
end
endmodule