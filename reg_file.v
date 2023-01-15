module reg_file(
            input rst,
            input clk,
            input rw,
            input lse,
            input ldm,
            input lacc,
            input [15:0] load,
            input [15:0] acc,
            input [15:0] se,
            output reg [15:0] out
);
reg [15:0] x;
reg [15:0] y;
    always @(posedge clk or negedge rst)
    begin
        if (lacc) begin
          if(!rw) begin
            x<= acc;
          end 
          else begin
            y<=acc;
          end
        end
        else if (ldm) begin
          if(!rw) begin
            x<= load;
          end 
          else begin
            y<=load;
          end
        end
        else if(lse) begin
          if(!rw) begin
            x<= se;
          end 
          else begin
            y<=se;
          end
        end
        if(!rw) begin
          out<=x;
        end 
        else begin
         out<=y;
        end
    end
endmodule

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


initial begin
  clk = 0;
  rst = 1;
  load = 15'b110;
  acc = 15'b1000;
  se= 15'b1001;
  {rw, lse, ldm, lacc}=4'b000;
#10
  rst = 0;


    forever #30  clk = ~clk;
  end
initial begin
  repeat (15) begin
  #100
  {rw, lse, ldm, lacc}={rw, lse, ldm, lacc}+1;
  end
end
endmodule