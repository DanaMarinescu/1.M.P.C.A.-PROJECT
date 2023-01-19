module IR(clk,rst,inop, opcode);
input clk,rst;
input [5:0] inop;
output [5:0] opcode;
reg [5:0]IR_reg;

assign opcode=IR_reg;
always @ (posedge rst, posedge clk)begin
  if(rst) begin
    IR_reg<=6'd0;
  end 
  else begin
  IR_reg<=inop;
end
end

endmodule

module IR_tb();
reg clk, rst;
reg [5:0] inop;
wire [5:0] opcode;
IR cut(
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
  inop=6'b011110;
  #(1*CLK_PERIOD) ;
  rst = 1;
  inop=6'b101001;
  #(RST_DURATION) ;
  rst = 0;
end

endmodule