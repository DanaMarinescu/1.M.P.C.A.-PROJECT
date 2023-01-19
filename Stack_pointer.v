module Stack_pointer(
input clk,rst,
input enable,
input [5:0] opcode,
input [15:0] pc,
output reg [15:0] sp_out
);

reg [5:0]sp_reg;

always @ (posedge rst, posedge clk)begin
  if(rst) begin
    sp_reg<=16'd0;
end
else begin
  if(enable)begin
    if(opcode&&6'b000101)begin //store
     sp_reg<=pc;
    end else if(opcode&&6'b000100)begin //load
              sp_out<= sp_reg;
             end
  end
end
end
endmodule



/*****Stack_pointer_tb*****/

module Stack_pointer_tb;
reg clk, rst, enable;
reg [5:0] opcode;
reg [15:0] pc;
wire [15:0] sp_out;

Stack_pointer SP( .clk(clk), .rst(rst), .enable(enable), .opcode(opcode), .pc(pc), .sp_out(sp_out));

localparam CLK_PERIOD = 100;
  localparam RUNNING_CYCLES = 10;
  initial begin
    clk = 0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk = ~clk;
  end

localparam RST_DURATION = 25;
initial begin
  rst = 1;
  #(RST_DURATION) ;
  rst = 0;
end

initial begin
  enable = 0;
  opcode = 6'b000000;
  pc = 16'h0000;
  end

initial begin
  #(1*CLK_PERIOD) ;
  enable = 1;
  opcode = 6'b000101;
  pc = 16'h0001;
  #(1*CLK_PERIOD) ;
  enable = 1;
  opcode = 6'b000100;
  pc = 16'h0001;
  #(1*CLK_PERIOD) ;
  enable = 1;
  opcode = 6'b000100;
  pc = 16'h0001;
end
endmodule