module PC_adder_tb();
  reg addr_in;
  wire addr_out;
PC_adder uut( .addr_in(addr_in), .addr_out(addr_out));

initial begin
  addr_in=0;
  #50
  addr_in=1;
  #50
  addr_in=0;
end
endmodule