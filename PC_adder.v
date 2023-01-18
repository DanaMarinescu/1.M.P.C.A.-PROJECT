`timescale 1ns / 1ns
/*
increment pc
*/
module PC_adder(
  input next,
  input [15:0] addr_in,
  output reg [15:0] addr_out
  );
  always @ (addr_in)begin
    addr_out<=addr_in+next;
  end
endmodule
  
  
