module demux (clk,rst,x,y,in, sel);
input clk,rst;
output reg [9:0] y;
output reg [9:0] x;
input [9:0] in;
input sel;

always @(posedge clk, posedge rst) begin 
  if(rst) begin
    x<=10'd0;
    y<=10'd0;
  end
else begin
  if(sel==1'b0)
    begin 
      y =in;
      x =10'b0;
    end
  else if(sel==1'b1)
    begin
      x =in;
      y =10'b0;
    end
  end
end
endmodule

module demux_tb;
  reg sel;
  reg [9:0] in;
  reg clk;
  reg rst;
  
  wire [9:0] y;
  wire [9:0] x;
  demux uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y),
    .in(in),
    .sel(sel)
  );
  
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
  
  
  initial begin 
    sel=0;
    in=1;
  end 
  
  initial begin 
    repeat (30) begin
      #(CLK_PERIOD/2) ;
      sel=sel+1'b1;
    end
  end
  
  
endmodule