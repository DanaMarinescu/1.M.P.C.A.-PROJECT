`timescale 1ns / 1ns

module program_counter_tb;

reg clk,abs,jmp;
reg [15:0] abs_addr,jmp_addr;
wire [15:0] pc_out;

program_counter UUT (
  .clk(clk),
  .abs(abs),
  .jmp(jmp),
  .abs_addr(abs_addr),
  .jmp_addr(jmp_addr),
  .pc_out(pc_out)
);

initial begin
  clk = 0;
  abs=0;
  jmp=0;
  jmp_addr = 16'h0000;
  abs_addr = 16'h0000;
#10

    forever #50  clk = ~clk;
  end
initial begin
#100
  jmp_addr = 16'h0011;
  jmp=1;
  #100 jmp=0;
#100
  jmp_addr = 16'h1001;
  jmp=1;
  #100 jmp=0;
#100
  abs_addr = 16'h0203;
  abs=1;
  #100 abs=0;
#100
  abs_addr = 16'h5061;
  abs=1;
  #100 abs=0;
#300
  $finish();
end
endmodule
