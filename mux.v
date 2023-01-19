`timescale 1ns / 1ns

module mux (zf, nf, cf, of, clk, sel, jmp, enable); 
  input   zf, nf, cf, of,clk; 
  input  [1:0] sel;
  input enable; 
  output reg jmp;  
 
  always @(zf or nf or cf or of or sel or posedge clk) 
  begin 
    if(enable)begin
    case (sel) 
      2'b00   : jmp = zf; 
      2'b01   : jmp = nf; 
      2'b10   : jmp = cf; 
      2'b11   : jmp = of; 
    endcase 
  end
  end 
endmodule 