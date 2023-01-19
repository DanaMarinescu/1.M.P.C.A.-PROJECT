module acc(clk,rst, in, acc);
input clk, rst;
input [15:0] in;
output [15:0] acc;
reg [15:0] acc_reg;

assign acc=acc_reg;
always @ (posedge rst, in)begin
  if(rst) begin
    acc_reg<=16'd0;
  end
  else begin
    acc_reg<=in;
  end
end
endmodule

module acc_tb;
reg clk;
reg rst;
reg [15:0] in;
wire [15:0] acc;

acc uut ( .clk(clk), .rst(rst), .in(in), .acc(acc));

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 100;
initial begin
  clk = 0;
  repeat (2*RUNNING_CYCLES) begin
    #(CLK_PERIOD/2) ;
    clk = ~clk;
  end
end
  
localparam RST_DURATION = 25;
initial begin
  rst = 1;
  #(RST_DURATION) ;
  rst = 0;
end
  
initial begin
  in = 16'b0000000000000001;
  #(1*CLK_PERIOD) ;
  in=16'b0000000000000010;
  #(1*CLK_PERIOD) ;
  rst = 1;
  in=16'b0000000000000011;
  #(RST_DURATION) ;
  rst = 0;
  in=16'b0000000000000100;
end

endmodule