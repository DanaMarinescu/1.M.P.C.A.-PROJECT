`timescale 1 ns/1 ps
module mux2to1
    (
    input clk,rst,
    input [15:0]br, sp,
    input sel,
    output reg [15:0] out);


    always @(posedge rst, posedge clk)
    begin
      if(rst) begin
        out<=16'd0;
    end
  else begin
        if (sel)//sp signal high
            out=sp;
        else //branch
            out=br;
    end
end
endmodule
