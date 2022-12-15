`timescale 1ns / 1ns

module program_counter(
  input clk,
  input abs,
  input jmp,
  input [15:0] abs_addr,
  input [15:0] jmp_addr,
  output [15:0] pc_out
);
reg [15:0] out_addr_reg,out_addr_nxt;
assign pc_out=out_addr_reg;

always @(posedge clk) begin
  out_addr_reg <= out_addr_nxt;
end

always @ * begin
  if (abs) begin
    out_addr_nxt = abs_addr;
  end else if (jmp) begin
    out_addr_nxt = jmp_addr;
end
end
endmodule
