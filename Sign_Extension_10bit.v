`timescale 1ns / 1ns

module Sign_Extension_10bit(
  input clk,
  input [9:0]data_in,
  output reg [15:0] data_out
);

always @(posedge clk) begin
  if ( data_in[8] == 1'b1)begin
   data_out<={6'b111111,data_in};
    end else if ( data_in[8] == 1'b0) begin
      data_out<={6'b000000,data_in};
      end else begin
        data_out<=data_in;
  end
end
endmodule
