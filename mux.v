`timescale 1ns / 1ns

module mux (zf, nf, cf, of, sel, jmp); 
  input  [3:0] zf, nf, cf, of; 
  input  [1:0] sel; 
  output reg [3:0] jmp;  
 
  always @(zf or nf or cf or of or sel) 
  begin 
    case (sel) 
      2'b00   : jmp = zf; 
      2'b01   : jmp = nf; 
      2'b10   : jmp = cf; 
      default : jmp = of; 
    endcase 
  end 
endmodule 