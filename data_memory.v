`timescale 1ns / 1ns
module data_memory(
input clk,
input we_DM,
  input [15:0] dataDM,
  input [15:0] addrDM,
  output reg[15:0] outDM);
  
  reg [15:0] mem [0 : 1023];

  always@(posedge dataDM, posedge addrDM,posedge we_DM,negedge we_DM, posedge clk)
begin
  
  if (we_DM == 1) begin
    mem[addrDM] <= dataDM;
	end
	 else if (we_DM == 0) begin
      outDM <= mem[addrDM];
	end
end
endmodule

module tb_data_memory();
reg clk;
reg we_DM;
reg [15:0] dataDM;
reg [15:0] addrDM;
wire [15:0] outDM;


data_memory d1 (.clk(clk), .we_DM(we_DM), .dataDM(dataDM), .addrDM(addrDM), .outDM(outDM));

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 100;
initial begin
  clk = 0;
  repeat (2*RUNNING_CYCLES) begin
    #(CLK_PERIOD/2) ;
    clk = ~clk;
  end
end

initial
begin
	we_DM <= 1;
	dataDM <= 16'h00000000;
	addrDM <= 16'h000;
end

initial 
begin
   #(1*CLK_PERIOD) ;
	 we_DM <= 0;
	 addrDM = addrDM + 16'h001;
	 dataDM <= 16'h1dfe;
	 #(1*CLK_PERIOD) ;
	 we_DM <= 1;

   #(1*CLK_PERIOD) ;
	 we_DM <= 0;
	 addrDM = addrDM + 16'h001;
	 dataDM <= 16'h1001;
	 #(1*CLK_PERIOD) ;
	 we_DM <= 1;
	 
	 #(1*CLK_PERIOD) ;
	 we_DM <= 0;
	 addrDM = addrDM + 16'h001;
	 dataDM <= 16'ha001;
	 #(1*CLK_PERIOD) ;
	 we_DM <= 1;
end


endmodule