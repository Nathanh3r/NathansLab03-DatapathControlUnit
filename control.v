//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Nathan Herrera
// Email: nherr044@ucr.edu
// 
// Assignment name: Lab03 datapath control unit
// Lab section: 
// TA: 
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

// --------------------------------------
// Opcodes 
// --------------------------------------

//make sure to take the alu control and the alu.v from last lab before starting

`define OPCODE_R_TYPE       6'b000000
`define OPCODE_LOAD_WORD    6'b100011
`define OPCODE_STORE_WORD   6'b101011
`define OPCODE_BRANCH_EQ    6'b000100
`define OPCODE_ADDI         6'b001000

module control  (
    input  wire [5:0] instr_op, 
    output wire       reg_dst,   
    output wire       branch,     
    output wire       mem_read,  
    output wire       mem_to_reg,
    output wire [1:0] alu_op,        
    output wire       mem_write, 
    output wire       alu_src,    
    output wire       reg_write
    );

    reg [8:0] control_vals;
        //allan knight you can use wires and then make a reg[9:0] control_vals
        //then you can store in the values for the instructions
        //can use the assign func to assign the wires together so the data goes out rihgt
// ------------------------------
// Insert your solution below
// ------------------------------ 

assign{reg_dst, alu_src, mem_to_reg, reg_write, mem_read,mem_write,branch,alu_op} = control_vals;

always @(instr_op)
begin 
   // Put your solution here

   //always start with all 0s
   //x will be dont care

   control_vals = 9'b0_0_0_0_0_0_0_00;

   case (instr_op)  
     //opcode R type:000000
     //reg_dst=1 
     //alu_src=0
     //mem_to_reg = 0
     //reg_write = 1 
     //mem_read = 0
     //mem_write = 0
     //branch = 0
     //alu_op = 10

     6'b000000: begin
    control_vals= 9'b1_0_0_1_0_0_0_10;
    end

    //opcode load word 100011
    //reg_dst = 0
    //alu_src = 1 
    //mem_to_reg = 1 
   //reg_write = 1 
   //mem_read = 1
   //mem_write = 0
   //branch = 0 
   //alu_op = 00

    6'b100011: begin
    control_vals = 9'b0_1_1_1_1_0_0_00;
    end

    //store word 101011
    //reg_dst = X 
    //alu_src = 1 
    //mem_to_reg = X 
    //reg_write = 0
    //mem_read = 0
    //mem_write = 1 
    //branch = 0
    //alu_op = 00

    6'b101011: begin
    control_vals = 9'b0_1_0_0_0_1_0_00;
    end

    //beq 000100
    //reg_dst = X
    //alu_src = 0
    //mem_to_reg = X 
    //reg_write = 0
    //mem_read = 0
    //mem_write = 0
    //branch = 1 
    //alu_op = 01

    6'b000100: begin
    control_vals = 9'b0_0_0_0_0_0_1_01;
    end

    //addi 001000
    //reg_dst = 0 
    //alu_src = 1 
    //mem_to_reg =0
    //reg_write =1
    //mem_read = 0
    //mem_write = 0
    //branch = 0
    //alu_op = 00
    6'b001000: begin
    control_vals = 9'b0_1_0_1_0_0_0_00;
    end 

    default: begin 

    control_vals = 9'b0_0_0_0_0_0_0_00;
    end 

    endcase




end 
endmodule