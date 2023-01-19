`timescale 1ns / 1ns

module Sign_Extension_9bit(
  input clk,rst,
  input [8:0]data_in,
  output reg [15:0] data_out
);

always @(posedge clk, posedge rst) begin
  if(rst) begin
    data_out<=16'd0;
end 
else begin
  if ( data_in[8] == 1'b1)begin
   data_out<={7'b1111111,data_in};
    end else if ( data_in[8] == 1'b0) begin
      data_out<={7'b0000000,data_in};
      end else begin
        data_out<=data_in;
  end
end
end
endmodule


/*****Sign_Extension_9bit*****/

module Sign_Extension_9bit_tb;
reg clk;
reg rst;
reg [8:0]data_in;
wire [15:0] data_out;

Sign_Extension_9bit se9b( .clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

localparam CLK_PERIOD = 100;
  localparam RUNNING_CYCLES = 10;
  initial begin
    clk = 0;
    repeat (2*RUNNING_CYCLES) #(CLK_PERIOD/2) clk = ~clk;
  end
  
localparam RST_DURATION = 25;
initial begin
  rst = 1;
  #(RST_DURATION) ;
  rst = 0;
end

initial begin
  data_in = 10'b0000000000;
end

initial begin
  data_in = 10'b0100000000;
  #(2*CLK_PERIOD);
  data_in = 10'b0000000000;
  #(1*CLK_PERIOD);
  data_in = 10'b0100001100;
  #(1*CLK_PERIOD);
  data_in = 10'b0000010100;
  #(1*CLK_PERIOD);
  data_in = 10'b0100010001;
  #(1*CLK_PERIOD);
  data_in = 10'b0000000011;
  #(1*CLK_PERIOD);
  data_in = 10'b0100010000;
  #(1*CLK_PERIOD);
  data_in = 10'b0001100010;
end
endmodule