`timescale 1 ns/1 ps
module mux2to1
    (
    input [15:0]br, sp,
    input sel,
    output reg [15:0] out);


    always @(br,sp,sel)
    begin
        if (sel)//sp signal high
            out=sp;
        else //branch
            out=br;
    end

endmodule
