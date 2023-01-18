module AR(inop, opcode);
  
input [9:0] inop;
output [9:0] opcode;
reg [9:0]AR_reg;

assign opcode=AR_reg;
always @ (inop)begin
  AR_reg<=inop;
end
endmodule

/*module AR_tb();
reg clk, loadAR;
reg [9:0] inard;
wire [9:0] address;
AR cut(
  .clk(clk),
  .loadAR(loadAR),
  .inard(inard),
  .address(address)
);

initial begin
  clk=0;
  loadAR=0;
  inard=0;
  
  #10
  
  clk=1;
  forever #30  clk = ~clk;
  end
initial begin
#100
  loadAR=0;
  inard=6'b110;
#100
  loadAR=1;
end
endmodule*/