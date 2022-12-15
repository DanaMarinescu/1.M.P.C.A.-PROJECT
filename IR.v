module IR( clk, loadIR, inop, opcode);
input clk;
input loadIR;
input [5:0] inop;
output [5:0] opcode;

reg [5:0] opcode;
reg [5:0] temp;

always@(posedge clk)
begin
	if(loadIR == 1) begin
	temp <= inop;
	end
opcode <= temp[5:0];
end
endmodule