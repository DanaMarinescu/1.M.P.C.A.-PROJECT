module AR( clk, loadAR, inard, address);
input clk;
input loadAR;
input [9:0] inard;
output [9:0] address;

reg [9:0] address;
reg [9:0] temp;

always@(posedge clk)
begin
	if(loadAR == 1) begin
	temp <= inard;
	end
address <= temp[9:0];
end
endmodule

module AR_tb();
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
endmodule