`timescale 1ns / 1ns
/*
increment pc
*/
module PC_adder(
  input addr_in,
  output reg addr_out
  );
  always @ (addr_in)begin
    addr_out<=addr_in+1'b1;
  end
endmodule
  
  
