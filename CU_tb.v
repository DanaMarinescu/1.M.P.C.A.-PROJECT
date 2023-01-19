module CU_tb();
reg [5:0] opCode;
reg rst, clk;
wire [7:0] control_signals;

CU uut(.opCode(opCode), .rst(rst), .clk(clk), .control_signals(control_signals));

localparam CLK_PERIOD = 100;
  localparam RUNNING_CYCLES = 10;
  initial begin
    clk = 0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk = ~clk;
  end
  
initial begin

  rst=1;
  opCode=6'b000000;
  #100
  rst=0;
end
initial begin
   repeat (28) begin 
     opCode=opCode+1;
     #(1*CLK_PERIOD);
   end
end 
endmodule