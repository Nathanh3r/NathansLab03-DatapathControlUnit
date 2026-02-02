#lab 03 Report - Datapath Control Unit 

name: Nathan Herrera
email: nherr044@ucr.edu


## 1) test case descriptions:

1. R type AND
   this test checks for an R format instructions where the ALU needs to do an and between A and B. It checks that the control unit is showing the R type code such as
   regdst = 1 regwrite = 1 alusrc= 0 aluop = 10 these are things the r type and should have.

2. Rtype OR
  this test will check again for the r format. Along with this it checks that the alu output is correct and check ALuop
  aluop= 10.

3. R-type ADD  
   This test checks the R-format ADD operation. With the input values, the result should become 0 which also makes the zero flag = 1.
   This confirms both the ALU operation and zero flag output work.

4. R-type SUB   
   This test checks subtraction for an R-type instruction. It confirms the ALU correctly subtracts B from A and that the r type controls are still correct for R-type instructions.

5. R-type SLT  
   This test checks set on less than using signed.
   It looks at the ALU and makes sure it outputs 1 when A < B, and also checks the R-type control signals.

6. R-type NOR  
   This test checks the NOR instruction. It checks if  the ALU output is correct and also checks the zero flag behavior when dealing with a result of 0.

7. addi  
   This test checks the immediate add instruction. It needs to make sure that ALUSrc=1 so the immediate value is used and that RegDst=0 since addi writes to rt. It also makes sure that ALUop=00 which forces the alu control to select the add. 

8. lw
   This test checks the load word. It makes sure MemRead=1,MemtoReg=1, and RegWrite=1 because lw loads data into a register. It also checks that ALUSrc=1 and ALUOp=00 so the address calculation can use addition.

9. sw  
   This test checks store word. It makes sure MemWrite=1 and RegWrite=0 since sw stores data to memory and does not write back into a register. It also checks ALUSrc=1 and ALUOp=00 for address calculation.

10. beq  
   This test checks the branch equal. It verifies Branch=1 and ALUOp=01 so the ALU performs subtraction to compare the registers. It also checks RegWrite=0 because branch should not write to registers.

## 2)  Difference between ADD addi instruction:

The main difference between add and addi has to be the fact that one is immediate. Meaning that addi must use an immediate constance to add whereas add just needs two registers. 
for examples add = rd= rs+rt and addi rt=rs+imm. We already see how different they look and as we follow their path we see that the addi instruction must feed into the alu meaning alu src =1 and then we can finally write the answer into the rt which gives 
regdst = 0. Along with this they also have different ALUop  since add is rtype we have aluop=10 and aluop = 00 since addi will always do addition so we must force this hence the 00. 
Overall the main difference between the two is that one uses immediate constant and the other one doesnt.
