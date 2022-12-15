//////////////////////////////////////////////////////////////////////
//	Program to realise Datamemory in the CPU		/////
////////////////////////////////////////////////////////////////////

module datamem(clk, we_DM, dataDM, addDM, outDM);
input clk;
input we_DM;
input [15:0] dataDM;
input [15:0] addDM;
output [15:0] outDM;



reg [15:0] out_DM_reg, out_DM_next,addDM_reg,addDM_next;
// Memory is an array stored at particular address

reg [15:0] mem [0 : 15];

assign outDM= out_DM_reg;

always@(posedge clk)
begin
	out_DM_reg<=out_DM_next;
end

always@(*)
begin
  
  if (we_DM == 1) begin
	mem[addDM] = dataDM;
	
	end
	
	else if (we_DM == 0) begin
	   out_DM_next= mem[addDM];
	end
end
endmodule

////////////////////////////////////////////////////////////////////////
//	Test bench for the data memory design used		///////
//////////////////////////////////////////////////////////////////////
module tb_datamem();
reg clk;
reg we_DM;
reg [15:0] dataDM;
reg [15:0] addDM;
wire [15:0] outDM;

// Instantiation of the design
datamem d1 (.clk(clk), .we_DM(we_DM), .dataDM(dataDM), .addDM(addDM), .outDM(outDM));

// Initialization of signals
initial
begin
	clk <= 0;
	we_DM <= 0;
	dataDM <= 16'h00000000;
	addDM <= 16'h000;
end

// Clock setup
always #5 clk = ~clk;

// Address setup 
always #60 addDM = addDM + 16'h001;

// Stimulus
initial 
begin
	#5 we_DM <= 1;
	#4 dataDM <= 16'h1dfe;
	#20 we_DM <= 0;

	#20 we_DM <= 1;
	#4 dataDM <= 16'h1001;
	#20 we_DM <= 0;
	
	#100;
	#20 we_DM <= 1;
	#4 dataDM <= 16'ha001;
	#20 we_DM <= 0;
	

end
endmodule