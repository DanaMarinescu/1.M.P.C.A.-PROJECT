module demux (x,y,in, sel);
output reg [9:0] y;
output reg [9:0] x;
input [9:0] in;
input sel;

always @(*) begin 
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