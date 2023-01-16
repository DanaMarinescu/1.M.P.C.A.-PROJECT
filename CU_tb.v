module CU_tb();
reg [5:0] opCode;
reg rst;
wire [7:0] control_signals;

CU uut(.opCode(opCode), .rst(rst), .control_signals(control_signals));

localparam CLK_PERIOD = 100;
initial begin

  rst=0;
  opCode=6'b000000;
  #100
  rst=1;
end
initial begin
   repeat (28) begin 
     #(1*CLK_PERIOD)
     opCode=opCode+1;
   end
end 
endmodule