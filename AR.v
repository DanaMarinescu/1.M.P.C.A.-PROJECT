module AR(clk,rst,inop, opcode);
input clk,rst;
input [9:0] inop;
output [9:0] opcode;
reg [9:0]AR_reg;

assign opcode=AR_reg;
always @ (posedge rst, posedge clk)begin
  if(rst) begin
    AR_reg<=10'd0;
end 
else begin
  AR_reg<=inop;
end
end
endmodule

module AR_tb();
reg clk, rst;
reg [9:0] inop;
wire [9:0] opcode;
AR cut(
  .clk(clk),
  .rst(rst),
  .inop(inop),
  .opcode(opcode)
);

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
  
initial
begin
  inop=0;
end

initial begin
  #(1*CLK_PERIOD) ;
  inop=6'b110;
  #(1*CLK_PERIOD) ;
  rst = 1;
  inop=6'b100;
  #(RST_DURATION) ;
  rst = 0;
end

endmodule