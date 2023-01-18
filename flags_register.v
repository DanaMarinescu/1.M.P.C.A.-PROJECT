module flags_register(
       input zf,
       input nf,
       input cf,
       input of,
       output [3:0] flags
    );
  

reg [3:0]flags_reg;

assign flags=flags_reg;
always @ (*)begin
  flags_reg<={zf,nf,cf,of};
end
endmodule
