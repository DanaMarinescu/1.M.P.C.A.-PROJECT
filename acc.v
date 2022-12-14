module acc(in, acc, clk, reset);
input [15:0] in;
input clk, reset;
output [15:0] acc;

reg [15:0] acc;

always@(clk) begin
if(reset)
  acc <= 16'b0000000000000000;
else
    acc <= in;
end
endmodule

module acc_tb;
reg [15:0] in;
reg clk;
reg reset;
wire [15:0] acc;

acc uut ( .in(in), .acc(acc), .clk(clk), .reset(reset) );

initial begin
  #5 reset<=1'b1;
  #5 reset<=1'b0;
  clk =1'b0;
  in = 16'b0000000000000001;
  #50 in = 16'b0000000000000010;
  #50 in = 16'b0000000000000011;
end
  always #10 clk = ~clk;
  initial#180 $stop;
endmodule