//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Nathan Herrera
// Email: nherr044@ucr.edu
// 
// Assignment name: Lab 02 ALU
// Lab section: 
// TA: Allan Knight
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

`timescale 1ns / 1ps

// --------------------------------------
// MIPS ALU Control & Funct constants
// --------------------------------------

`define ALU_AND         4'b0000
`define ALU_OR          4'b0001
`define ALU_ADD         4'b0010
`define ALU_SUBTRACT    4'b0110
`define ALU_LESS_THAN   4'b0111
`define ALU_NOR         4'b1100
  
`define FUNCT_AND       6'b100100
`define FUNCT_OR        6'b100101
`define FUNCT_ADD       6'b100000
`define FUNCT_SUBTRACT 	6'b100010
`define FUNCT_LESS_THAN 6'b101010
`define FUNCT_NOR 		6'b100111


`define WORD_SIZE 32 

module alu (
    input wire [3:0] alu_control,  
    input wire [`WORD_SIZE-1:0] A,
    input wire [`WORD_SIZE-1:0] B, 
    output reg zero, 
    output reg [`WORD_SIZE-1:0] result
);
        //use $signed for less than
        //if working then should get a 0
// ---------------------------------------------------------
// Implementation of MIPS ALU 
// --------------------------------------------------------- 


always @(alu_control or A or B) begin
    // Put our code here

   result <= 32'b0;     //setting our defualt result and the zero flag to 1 since it is 0 right now
    zero   <= 1'b1;

    case(alu_control)
    `ALU_AND: begin
        result <= (A & B);  //simple and operation into the result
        zero   <= ((A & B) == 32'b0);   //now if the result is 0 the zero flag will be turned to 1
    end

    `ALU_OR: begin
        result <= (A | B);  //simple or operation
        zero   <= ((A | B) == 32'b0);   //if result is 0 the turn on flag
    end

    `ALU_ADD: begin
        result <= (A + B);  //simple adding operation
         zero   <= ((A + B) == 32'b0);  //check si result is 0
    end

    `ALU_SUBTRACT: begin
        result <= (A - B);  //simple subtract operation 
        zero   <= ((A - B) == 32'b0);   //check if the result is 0
    end

    `ALU_NOR: begin
        result <= ~(A | B); //taking the result and making it not (or)
        zero   <= ((~(A | B)) == 32'b0);    //check is result is 0
    end

    `ALU_LESS_THAN: begin
    if ($signed(A) < $signed(B)) begin  //if A<B using the signed ints then the result should be 1 if not then 0
            result <= 32'd1;
            zero   <= 1'b0;
    end 
    else begin
            result <= 32'd0;    //if result is 1 then zero is zero 
            zero   <= 1'b1;     //if result is 0 then zero is 1
        end
    end

        default: begin          //default case will come here and give 0 and set zero -1
            result <= 32'b0;
            zero   <= 1'b1;
        end

    endcase
      
end 

endmodule
