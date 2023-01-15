`timescale 1ns / 1ps
/*
In mem se vor salva instructiunile incepand de la locatia 0
La input primeste adresa instructiunii in memorie, si la output pune instructiunea corespunzatoare
Ex pentru adresa 3 in decimal la output se va pune instructiunea de la locatia mem[3] 
*/
module instruction_memory (
  input rst,
  input [15:0] addr,
  output [15:0] instruction
);
  reg [15:0] mem[127:0];
assign instruction=mem[addr];
//aici se vor scrie instructiunile
//exemplu:
  always @ (posedge rst)begin
  mem[0] = 16'h0001; 
  mem[1] = 16'h0100; 
  mem[2] = 16'h1590; 
  mem[3] = 16'h1902; 
  mem[4] = 16'h3109;
  mem[5] = 16'h4400; 
  mem[6] = 16'h8020; 
  mem[7] = 16'h1231;
  end  
endmodule
