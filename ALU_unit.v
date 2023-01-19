module ALU_unit(
input clk,rst,
 input  [15:0] a,
 input  [15:0] b,
 input  [5:0] opcode, 
 output reg [16:0] result,
 output reg ZF,
 output reg CF,
 output reg NF, 
 output reg OF,
 input aluOp
    );

always @(a, b, posedge rst)
begin 
  if(rst) begin
    result<=17'd0;
    ZF = 1'b0;
    CF = 1'b0;
  NF = 1'b0;
  OF = 1'b0;
end
else begin
  if(aluOp) begin
    
  CF = 1'b0;
  NF = 1'b0;
  OF = 1'b0;
 case(opcode)
 6'b001001: begin
            result = a + b; // add
            CF = result[16];
            OF = (a[15] == b[15]) && (a[15] != result[15]);
            NF = 1'b0;
          end
 6'b001010: begin
            result = a - b; // sub
            CF = !result[16];
            OF = 1'b0;
            NF = result[15];
          end
 6'b001011: begin //LSR
                CF = a[b-1];
                OF = 1'b0;
                NF = 1'b0;
                result = a>>b;
            end
 6'b001100: begin //LSL
                result = a<<b;
                CF = result[16];
                OF = 1'b0;
                NF = 1'b0;
            end
 6'b001101: begin //RSR
					      CF = a[b-1];
					      OF = 1'b0;
                NF = 1'b0;
					      result = b ? (( a >> b ) | ( a << ( 16 - b ))) : a;
				    end 
 6'b001110: begin //RSL
					      result = b ? (( a << b ) | ( a >> ( 16 - b ))) : a;
					      CF = result[16];
					      OF = 1'b0;
                NF = 1'b0;
				    end
 6'b001111: result = a; // MOV
 6'b010000: begin //MUL
            result = a * b;
            if (result > 16'hFFFF)
              CF = 1'b1;
            OF = (a[15] == b[15]) && (a[15] != result[15]);
            end
 6'b010001: result = a / b; //DIV
 6'b010010: result = a % b; //MOD
 6'b010011: result = a & b; //AND
 6'b010100: result = a | b; //OR
 6'b010101: result = a ^ b; //XOR
 6'b010110: begin //NOT
            result = ~a + 1 ;
            NF = 1'b1;
            end
 6'b010111: begin if (a<b || b>a) result = 16'd1; //CMP
    else result = 16'd0;
      if(a<b) NF = 1'b1;
    end
 6'b011000: begin if (a<b) result = b; //TST
    else result = a;
    end
 6'b011001: begin //INC
            result = a + 1;
            CF = result[16];
            OF = 1'b0;
            NF = 1'b0;
          end
 6'b011010: begin //DEC
            result = a - 1;
            CF = !result[16];
            NF = result[15];
            OF = 1'b0;
          end
 default result = 16'h0000;
 endcase
 ZF = (result==16'd0) ? 1'b1: 1'b0;
 end
end
end
endmodule


/*
module ALU_unit_tb();
reg [15:0] a;
reg [15:0] b;
reg [5:0] opcode;
wire [15:0] result;
wire ZF;
wire CF;
wire NF; 
wire OF;


// Instantiation of ALU

ALU_unit d1 (.a(a), .b(b), .opcode(opcode), .result(result), .ZF(ZF), .CF(CF), .NF(NF), .OF(OF));

// Initialization
initial
begin
	a <= 16'h0000;
	b <= 16'h0000;
	opcode <= 6'b000000;
end

initial
begin
	#5 a = 16'h0011;
	#5 b = 16'h0002;

	#5 opcode = 6'b001001;
	#5 opcode = 6'b001010;
	#5 opcode = 6'b001011;
	#5 opcode = 6'b001100;
	#5 opcode = 6'b001101;
	#5 opcode = 6'b001110;
  #5 opcode = 6'b001111;
  #5 opcode = 6'b010000; 
  #5 opcode = 6'b010001;
  #5 opcode = 6'b010010;
  #5 opcode = 6'b010011;
  #5 opcode = 6'b010100;
  #5 opcode = 6'b010101;
  #5 opcode = 6'b010110;
  #5 opcode = 6'b010111;
  #5 opcode = 6'b011000;
  #5 opcode = 6'b011001;
  #5 opcode = 6'b011010;
  
end
endmodule*/
