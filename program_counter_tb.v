module program_counter_tb();
  reg clk;
  reg rst;
  reg abs;
  reg jmp;
  reg [15:0] pc_nxt;
  reg [15:0] pc_write;
  wire[15:0] pc_out;
  
program_counter uut( .clk(clk), .rst(rst), .abs(abs), .jmp(jmp), .pc_nxt(pc_nxt), .pc_write(pc_write), .pc_out(pc_out));

  localparam CLK_PERIOD = 100;
  localparam RUNNING_CYCLES = 30;
initial begin
  clk=0;
  {rst, abs, jmp} =3'b000;
  pc_nxt=   16'b110;
  pc_write= 16'b1000;
  repeat (RUNNING_CYCLES) begin
    #(CLK_PERIOD/2) clk=~clk;
end
end
initial begin
   repeat (8) begin 
     #(1*CLK_PERIOD)
     {rst, abs, jmp}={rst, abs, jmp}+1;
   end
end 
endmodule
  