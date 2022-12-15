module reg_file(
            input rst,
            input clk,
            input rw,
            input lsc,
            input ldm,
            input lacc,
            input [15:0] load,
            input [15:0] acc,
            output reg [15:0] out
);
    always @(posedge clk or negedge rst)
    begin
        if (lacc) begin
            out <= acc;
        end
        else if (ldm) begin
            out <= load;
        end
    end
endmodule