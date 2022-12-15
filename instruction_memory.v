`timescale 1ns / 1ps
module instruction_memory (
  input clock,
  input reset,
  input [15:0] addr,
  output [15:0] instruction
);
reg [15:0] instr_reg,instr_nxt;
reg [15:0] mem[1023:0];
reg [9:0] i;
assign instruction=instr_reg;
initial begin
  for (i = 0; i < 1024; i = i + 1) begin
    mem[i] = 16'h00000000;
  end
//exemplu
  mem[0] = 16'h0001; 
  mem[1] = 16'h0100; 
  mem[2] = 16'h1590; 
  mem[3] = 16'h1902; 
  mem[4] = 16'h3109;
  mem[5] = 16'h4400; 
  mem[6] = 16'h8020; 
  mem[7] = 16'h1231; 
end

always @(posedge clock or posedge reset) begin
  if (reset) begin
    instr_reg <= 16'h00000000;
  end else begin
    instr_reg <= instr_nxt;
  end
end
always @ * begin
  instr_nxt=mem[addr];
  end
endmodule
