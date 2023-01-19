module flags_register(
       input zf,
       input nf,
       input cf,
       input of,
       input clk,
       input rst,
       output [3:0] flags
    );
  

reg [3:0]flags_reg;

assign flags=flags_reg;
always @ (posedge rst, posedge clk)begin
  if(rst) begin
    flags_reg<=4'd0;
end
else begin
  flags_reg<={zf,nf,cf,of};
end
end
endmodule
