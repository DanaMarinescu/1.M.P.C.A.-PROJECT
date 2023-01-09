module SP( clk, loadSP, insp, address);
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