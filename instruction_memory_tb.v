`timescale 1ns / 1ns

module instruction_memory_tb;


reg clock, reset;
reg [15:0] addr;
wire [15:0] instruction;


instruction_memory UUT (
  .clock(clock),
  .reset(reset),
  .addr(addr),
  .instruction(instruction)
);


initial begin
  clock = 0;
  reset = 1;
  addr = 16'h0000;


#10
  reset = 0;
    forever #30  clock = ~clock;
  end
initial begin
#100 addr = 16'h0000;
#100 addr = 16'h0001;
#100 addr = 16'h0002;
#100 addr = 16'h0003;
#100 addr = 16'h0004;
#100 addr = 16'h0005;
#100 addr = 16'h0006;
#100 addr = 16'h0007;
#100 addr = 16'h0003;
#100 addr = 16'h0001;
#100 addr = 16'h0000;
#100 addr = 16'h0007;
#100 addr = 16'h0004;

#300
  $finish();
end
endmodule