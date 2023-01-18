module IR(inop, opcode);
  
input [5:0] inop;
output [5:0] opcode;
reg [5:0]IR_reg;

assign opcode=IR_reg;
always @ (inop)begin
  IR_reg<=inop;
end

endmodule

/*module IR_tb();
reg clk, loadIR;
reg [5:0] inop;
wire [5:0] opcode;
IR cut(
  .clk(clk),
  .loadIR(loadIR),
  .inop(inop),
  .opcode(opcode)
);

initial begin
  clk=0;
  loadIR=0;
  inop=0;
  
  #10
  
  clk=1;
  forever #30  clk = ~clk;
  end
initial begin
#100
  loadIR=0;
  inop=6'b110;
#100
  loadIR=1;
end
endmodule*/