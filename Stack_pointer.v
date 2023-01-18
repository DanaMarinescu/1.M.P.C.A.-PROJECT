module Stack_pointer(
input enable,
input [5:0] opcode,
input [15:0] pc,
output reg [15:0] sp_out
);

reg [5:0]sp_reg;

always @ (*)begin
  if(enable)begin
    if(opcode&&6'b000101)begin //store
     sp_reg<=pc;
    end else if(opcode&&6'b000100)begin //load
              sp_out<= sp_reg;
             end
  end
end
endmodule



/*****Stack_pointer_tb*****/
/*
module Stack_pointer_tb;
reg clk, loadSP;
reg [15:0] insp;
wire [15:0] address;

Stack_pointer SP( .clk(clk), .loadSP(loadSP), .insp(insp), .address(address));

localparam CLK_PERIOD = 100;
  localparam RUNNING_CYCLES = 10;
  initial begin
    clk = 0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk = ~clk;
  end

initial begin
  insp = 16'h0000;
  loadSP = 1'b0;
end

initial begin
  insp = 16'ha42f;
  loadSP = 1'b1;
  
  #200
  insp = 16'h9bc2;
  loadSP = 1'b0;
  
  #100
  insp = 16'h7d10;
  loadSP = 1'b1;
  
  #100
  insp = 16'h22e4;
  loadSP = 1'b1;
  
end
endmodule
*/