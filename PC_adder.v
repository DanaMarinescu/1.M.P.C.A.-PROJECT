`timescale 1ns / 1ns
/*
increment pc
*/
module PC_adder(
  input clk,rst,
  input next,
  input [15:0] addr_in,
  output reg [15:0] addr_out
  );
  always @ (posedge rst, posedge clk)begin
    if(rst) begin 
      addr_out<=16'd0;
    end
    else begin
    addr_out<=addr_in+next;
  end
  end
endmodule
  
  
