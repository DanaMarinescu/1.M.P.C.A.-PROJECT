module reg_file_tb();
reg clk, rst,rw,lse,ldm,lacc;
reg [15:0] load;
reg [15:0] acc;
reg [15:0] se;
wire [15:0] out;
reg_file rf(
  .clk(clk),
  .rst(rst),
  .rw(rw),
  .lse(lse),
  .ldm(ldm),
  .lacc(lacc),
  .load(load),
  .acc(acc),
  .se(se),
  .out(out)
);

localparam CLK_PERIOD = 100;
localparam RUNNING_CYCLES = 30;
initial begin
  clk = 0;
  rst = 1;
  load = 15'b110;
  acc = 15'b1000;
  se= 15'b1001;
  {rw, lse, ldm, lacc}=4'b000;
  #10
  rst = 0;

  repeat (RUNNING_CYCLES) begin
    #(CLK_PERIOD/2) clk=~clk;
  end
  end
initial begin
  repeat (15) begin
  #100
  {rw, lse, ldm, lacc}={rw, lse, ldm, lacc}+1;
  end
end
endmodule