`timescale 1ns / 1ns
module reg_file_tb;
reg clk, rst,rw,lsc,ldm,lacc;
reg [15:0] load;
reg [15:0] acc;
wire [15:0] out;
reg_file rf(
  .clk(clk),
  .rst(rst),
  .rw(rw),
  .lsc(lsc),
  .ldm(ldm),
  .lacc(lacc),
  .load(load),
  .acc(acc),
  .out(out)
);


initial begin
  clk = 0;
  rst = 1;
  load = 15'b110;
  acc = 15'b1000;
  rw=0;
  lsc=0;
  ldm=0;
  lacc=0;
  
#10

  rst = 0;


    forever #30  clk = ~clk;
  end
initial begin
#100
  lacc=1;

#100
  lacc=0;
  ldm=1;
#300
  ldm=0;
  $finish();
end
endmodule