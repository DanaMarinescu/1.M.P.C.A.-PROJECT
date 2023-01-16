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

