`timescale 1ns / 1ps

module instruction_memory_tb;
  reg rst;
  reg [15:0] addr;
  wire [15:0] instruction;
  
instruction_memory uut(.rst(rst), .addr(addr), .instruction(instruction));
initial begin 
  rst=1;
  #50
  rst=0;
  #50
  addr=16'b0;
  #50 
  addr=16'b1;
  #50 
  addr=16'b10;
  #50 
  addr=16'b11;
  #50 
  addr=16'b100;
  #50 
  addr=16'b101;
  #50 
  addr=16'b110;
  #50 
  addr=16'b111;
end
endmodule