module ALU_unit(
 input  [15:0] a,
 input  [15:0] b,
 input  [5:0] opcode, 
 
 output reg [15:0] result,
 output ZF,
 output reg CF,
 output reg NF, 
 output reg OF
    );

always @(*)
begin 
 case(opcode)
 6'b001001: result = a + b; // add
 6'b001010: result = a - b; // sub
 6'b001011: begin
                CF = 0;
                result = a>>b;
            end
 6'b001100: begin
                CF = 0;
                result = a<<b;
            end
 6'b001101: begin
					      CF = 0;
					      result = b ? (( a >> b ) | ( a << ( 16 - b ))) : a;
				    end 
 6'b001110: begin
					      CF = 0;
					      result = b ? (( a << b ) | ( a >> ( 16 - b ))) : a;
				    end
 6'b001111: result = a; // ?move
 6'b010000: result = a * b; 
 6'b010001: result = a / b;
 6'b010010: result = a % b;
 6'b010011: result = a & b;
 6'b010100: result = a | b;
 6'b010101: result = a ^ b;
 6'b010110: result = ~a ;
 6'b010111: begin if (a<b || b>a) result = 16'd1; //CMP
    else result = 16'd0;

    end
 6'b011000: begin if (a<b) result = b; //TST
    else result = a;
    end
 6'b011001: result = a + 1;
 6'b011010: result = a - 1;
 default result = 16'h0000;
 endcase
end
assign ZF = (result==16'd0) ? 1'b1: 1'b0;
initial begin if ((result<0 && a>0 && b>0) || (result>0 && a<0 && b<0 ) ) OF=2'b01;
    else OF= 2'b00;
    end
initial begin if (result==16'd0 || (result==16'd1 && a<0 && b>0)) NF=1; CF=1;
end
initial begin if(result==16'd1 && a<b) NF=1;
end
initial begin if(result==16'd1 && a>b) CF=1;
    else NF=0; CF=0;
    end
//NF = result[15];
endmodule



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
endmodule
