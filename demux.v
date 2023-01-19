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
/*
module demux_tb;
  reg sel;
  reg [9:0] i;
  
  wire [9:0] y;
  wire [9:0] x;
  demux uut (
    .y(y),
    .sel(sel),
    .i(i),
    .x(x)
  
  );
  
  initial begin 
    sel=0;
    i=1;
  end 
  always #2 sel=sel+1'b1;
  
  
endmodule
*/