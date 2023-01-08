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