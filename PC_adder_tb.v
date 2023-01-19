module PC_adder_tb();
  reg clk;
  reg rst;
  reg next;
  reg [15:0] addr_in;
  wire [15:0] addr_out;
  
PC_adder uut( .clk(clk), .rst(rst), .next(next), .addr_in(addr_in), .addr_out(addr_out));

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 100;
initial begin
  clk = 0;
  repeat (2*RUNNING_CYCLES) begin
    #(CLK_PERIOD/2) ;
    clk = ~clk;
  end
end
  
localparam RST_DURATION = 25;
initial begin
  rst = 1;
  #(RST_DURATION) ;
  rst = 0;
end

initial
begin
  addr_in=16'h0000;
  next = 0;
end


initial begin
  #(1*CLK_PERIOD) ;
  addr_in=16'h0001;
  #(1*CLK_PERIOD) ;
  addr_in=16'h0002;
  #(1*CLK_PERIOD) ;
  addr_in=16'h0003;
end
endmodule