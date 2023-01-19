`timescale 1ns / 1ps
/*
In mem se vor salva instructiunile incepand de la locatia 0
La input primeste adresa instructiunii in memorie, si la output pune instructiunea corespunzatoare
Ex pentru adresa 3 in decimal la output se va pune instructiunea de la locatia mem[3] 
*/
module instruction_memory (
  input clk,
  input rst,
  input [15:0] addr,
  output [15:0] instruction
);
  reg [15:0] mem[127:0];
assign instruction=mem[addr];
//aici se vor scrie instructiunile
//exemplu:
  always @ (posedge rst)begin
  mem[0] = 16'b0010010000000011; 
  mem[1] = 16'b0010010000000011; 
  mem[2] = 16'b0010010000000011; 
  mem[3] = 16'b0010010000000011; 
  mem[4] = 16'b0010010000000011;
  mem[5] = 16'b0110010000000001; 
  mem[6] = 16'b0110010000000001; 
  mem[7] = 16'b0110010000000001;
  end  
endmodule
