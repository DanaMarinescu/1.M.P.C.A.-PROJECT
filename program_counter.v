`timescale 1ns / 1ns
/*
 outputs the program counter address using the input signals
 pc is incremented in an external module, pc_next is the addres incremented by 1
 pc_write is the immediate address from the current jump instruction
*/
module program_counter(
  input clk,
  input rst,
  input abs,
  input jmp,
  input [15:0] pc_nxt,
  input [15:0] pc_write,
  output reg[15:0] pc_out
);

always @(posedge clk,posedge rst) begin
  if (rst == 1)begin
    pc_out<=16'h0000;
  end else if( jmp==1)begin// jmp signal is 1 only if the branch conditions are true from the flags
  pc_out<= pc_write;
  end else if (abs==1) begin//absolute jump, jump to any address
    pc_out<=pc_write;
    end else begin//normal pc increment
      pc_out<=pc_nxt;
      end
end
endmodule
