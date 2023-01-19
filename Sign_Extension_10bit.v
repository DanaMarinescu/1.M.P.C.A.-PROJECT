`timescale 1ns / 1ns

module Sign_Extension_10bit(
  input clk,rst, 
  input [9:0]data_in,
  output reg [15:0] data_out
);

always @(posedge rst,posedge clk) begin
  if(rst) begin
    data_out<=16'b0;
end 
else begin
  if ( data_in[8] == 1'b1)begin
   data_out<={6'b111111,data_in};
    end else if ( data_in[8] == 1'b0) begin
      data_out<={6'b000000,data_in};
      end else begin
        data_out<=data_in;
  end
end
end
endmodule


/*****Sign_Extension_10bit_tb*****/

module Sign_Extension_10bit_tb;
reg clk;
reg rst;
reg [9:0]data_in;
wire [15:0] data_out;

Sign_Extension_10bit se10b( .clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

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
  #100
  data_in = 10'b0100000000;
  
  #100
  data_in = 10'b0000000000;
  
  #100
  data_in = 10'b0100001100;
  
  #100
  data_in = 10'b0000010100;
  
  #100
  data_in = 10'b0100010001;
  
  #100
  data_in = 10'b0000000011;
  
  #100
  data_in = 10'b0100010000;
  
  #100
  data_in = 10'b0001100010;
end
endmodule