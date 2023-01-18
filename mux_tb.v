module mux_tb();
  reg [3:0] zf;
  reg [3:0] nf; 
  reg [3:0] cf;           
  reg [3:0] of;
  reg [1:0] sel;        
  wire [3:0] out;

localparam CLK_PERIOD = 100;  
initial begin
  zf=4'b0001;
  nf=4'b0010;
  cf=4'b0011;
  of=4'b0100;
  sel=2'b00;

end
initial begin
  repeat (5) begin
    #(1*CLK_PERIOD)
    sel=sel+1;
  end
end
endmodule

    

  
  