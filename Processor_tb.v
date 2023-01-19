`timescale 1ns / 1ns
module Processor_tb();
  reg clk;
  reg rst;
  wire [7:0] control_signals; // next, br/oth, aluOp, lse, ldm, lacc, abs, sp
  wire [15:0] pc_addr_out, pc_branch_in, pc_next, instruction_out;
  wire [15:0] sgn_ext_br_out,sgn_ext_other_out,data_mem_out,acc_out;
  wire [15:0] reg_file_out,mux_to_pc_write,sp_to_mux;
  wire [16:0] alu_out;
  wire [5:0] ir_out;
  wire [9:0] ar_out,ar_demux_br_out,ar_demux_other_out;
  wire [3:0] flags_reg;
  wire ZF,NF,CF,OF,jmp;
  
  program_counter pc_unit(.clk(clk),
                          .rst(rst),
                          .abs(control_signals[1]),
                          .jmp(jmp),
                          .pc_nxt(pc_next),
                          .pc_write(mux_to_pc_write),
                          .pc_out(pc_addr_out)
                          );
                          
  PC_adder pc_adder_unit( .clk(clk),
                          .rst(rst),
                          .next(control_signals[7]),
                          .addr_in(pc_addr_out),
                          .addr_out(pc_next)
                          );
                          
  instruction_memory instr_memory_unit( .clk(clk),
                                        .rst(rst),
                                        .addr(pc_addr_out),
                                        .instruction(instruction_out)
                                        );
                                        
  IR ir_reg(.clk(clk),
            .rst(rst),
            .inop(instruction_out[15:10]),
            .opcode(ir_out)
            );
            
  AR ar_reg(.clk(clk),
            .rst(rst),
            .inop(instruction_out[9:0]),
            .opcode(ar_out)
            );

  demux demux_br_other( .clk(clk),
                        .rst(rst),
                        .x(ar_demux_br_out),
                        .y(ar_demux_other_out),
                        .in(ar_out),
                        .sel(control_signals[6])
                        );
            
  Sign_Extension_10bit sgn_ext_10bit_unit( .clk(clk),
                                           .rst(rst),
                                           .data_in(ar_demux_br_out),
                                           .data_out(sgn_ext_br_out)          
                                        );
                                        
  CU control_unit( .opCode(ir_out),
                   .rst(rst),
                   .clk(clk),
                   .control_signals(control_signals)
                   );
  
  reg_file register_file_unit( .rst(rst),
                               .clk(clk),
                               .rw(ar_demux_other_out[9]),
                               .lse(control_signals[4]),
                               .ldm(control_signals[3]),
                               .lacc(control_signals[2]),
                               .load(data_mem_out),
                               .acc(acc_out),
                               .se(sgn_ext_other_out),
                               .out(reg_file_out)
                               );
                                
  Sign_Extension_9bit sgn_ext_9bit_unit(   .clk(clk),
                                            .rst(rst),
                                           .data_in(ar_demux_other_out[8:0]),
                                           .data_out(sgn_ext_other_out)          
                                        ); 
                                        
  ALU_unit ALU_unit(.clk(clk),
                    .rst(rst),
                    .a(reg_file_out),
                    .b(sgn_ext_other_out),
                    .opcode(ir_out), 
                    .result(alu_out),
                    .ZF(ZF),
                    .CF(CF),
                    .NF(NF), 
                    .OF(OF),
                    .aluOp(control_signals[5])
                    );
                    
  flags_register flags_register( .zf(ZF),
                                 .nf(NF),
                                 .cf(CF),
                                 .of(OF),
                                 .clk(clk),
                                 .rst(rst),
                                 .flags(flags_reg)
                                );
  
  mux mux_flags_reg( .zf(flags_reg[3]),
                     .nf(flags_reg[2]),
                     .cf(flags_reg[1]),
                     .of(flags_reg[0]),
                     .clk(clk),
                     .sel(ir_out[1:0]),
                     .jmp(jmp),
                     .enable(control_signals[6])
                     );                                                                   
                           
  acc ACC_reg(  .clk(clk),
                .rst(rst),
                .in(alu_out[15:0]),
                .acc(acc_out)
                );   
               
  data_memory data_memory_unit( .clk(clk),
                                .we_DM((ir_out&&6'b000101)||(!(ir_out&&6'b000100))),
                                .dataDM(reg_file_out),
                                .addrDM(sgn_ext_other_out),
                                .outDM(data_mem_out)
                                );
                                
  mux2to1 sp_or_br_mux_unit( .clk(clk),
                              .rst(rst),
                	            .br(sgn_ext_br_out),
                             .sp(sp_to_mux),
                             .sel(control_signals[0]),
                             .out(mux_to_pc_write)
                             );                              
  
  Stack_pointer sp_unit( .clk(clk),
                          .rst(rst),
        	     	 	 	      .enable(control_signals[0]),
                         .opcode(ir_out),
                         .pc(pc_addr_out),
                         .sp_out(sp_to_mux)
                         );                             
                                
   //  testing
    initial begin
    clk = 1'b0;
    repeat (500) begin
      #100 clk=!clk;
  end
  end 
  initial begin
        rst = 1'b1;
	 #120 rst=1'b0;
	 #8000;
   end                                                        
  endmodule