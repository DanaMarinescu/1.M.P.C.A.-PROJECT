module Stack_pointer( clk, loadSP, insp, address);
input clk;
input loadSP;
input [15:0] insp;
output [15:0] address;

reg [15:0] address;
reg [15:0] temp;

always@(posedge clk)
begin
	if(loadSP == 1) begin
	temp <= insp;
	end
address <= temp[15:0];
end
endmodule


/*****Stack_pointer_tb*****/

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