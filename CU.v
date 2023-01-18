`timescale 1ns / 1ns

module CU
(
  input [5:0] opCode,
  input rst,
  
  output reg [7:0] control_signals); // next, br/oth, aluOp, lse, ldm, lacc, abs, spo
  
  always @(opCode or posedge rst)begin
    if(rst)begin
      control_signals <= 6'b000000;
    end
      
      case(opCode)
        
        //brz
        6'b000000:begin
          control_signals <= 8'b11000000;
        end
        
        //brn
        6'b000001:begin
          control_signals <= 8'b11000000;
        end
        
        //brc
        6'b000010:begin
          control_signals <= 8'b11000000;
        end
        
        //bro
        6'b000011:begin
          control_signals <= 8'b11000000;
        end
        
        //load
        6'b000100:begin
          control_signals <= 8'b11001000;
        end
        
        //store
        6'b000101:begin
          control_signals <= 8'b10000000;
        end
        
        //bra
        6'b000110:begin
          control_signals <= 8'b11000010;
        end
        
        //jmp
        6'b000111:begin
          control_signals <= 8'b11000011;
        end
        
        //ret
        6'b001000:begin
          control_signals <= 8'b11000011;
        end
        
        //add
        6'b001001:begin
          control_signals <= 8'b10100100;
        end
        
        //sub
        6'b001010:begin
          control_signals <= 8'b10100100;
        end
        
        //lsr
        6'b001011:begin
          control_signals <= 8'b10100100;
        end
        
        //lsl
        6'b001100:begin
          control_signals <= 8'b10100100;
        end
        
        //rsr
        6'b001101:begin
          control_signals <= 8'b10100100;
        end
        
        //rsl
        6'b001110:begin
          control_signals <= 8'b10100100;
        end
        
        //mov
        6'b001111:begin
          control_signals <= 8'b10010000;
        end
        
        //mul
        6'b010000:begin
          control_signals <= 8'b10100100;
        end
        
        //div
        6'b010001:begin
          control_signals <= 8'b10100100;
        end
        
        //mod
        6'b010010:begin
          control_signals <= 8'b10100100;
        end
        
        //and
        6'b010011:begin
          control_signals <= 8'b10100100;
        end
        
        //or
        6'b010100:begin
          control_signals <= 8'b10100100;
        end
        
        //xor
        6'b010101:begin
          control_signals <= 8'b10100100;
        end
        
        //not
        6'b010110:begin
          control_signals <= 8'b10100100;
        end
        
        //cmp
        6'b010111:begin
          control_signals <= 8'b10100100;
        end
        
        //tst
        6'b011000:begin
          control_signals <= 8'b10100100;
        end
        
        //inc
        6'b011001:begin
          control_signals <= 8'b10100100;
        end
        
        //dec
        6'b011010:begin
          control_signals <= 8'b10100100;
        end
        
        default control_signals <= 8'b11111111;
        
        
      endcase
      
  end

endmodule

