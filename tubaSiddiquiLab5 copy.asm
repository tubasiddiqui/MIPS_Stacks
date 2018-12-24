# Tuba Siddiqui
# Lab 5 CS10  
# Program to calculate the average of two values passed as 
# parameters on stack
# Development Environment: MARS MIPS Simulator
# Solution File: tubaSiddiquiLab5.asm
# Date: 11/04/18
# MAC OSX
# Registers Used:
# $a0 : holds address 
# $v0 : holds addr sycalls
# $s0, $s1 : loads immediate values for 9 and 3
# $t0 : holds average value of $s0 and $s1
# $v0 and $a0 : loads values to print for display
# $ra : return address back to caller 
# $sp : stack pointer 


.data

name:         .asciiz "My family name is Siddiqui\n"
id:           .asciiz "My student ID is 20262796\n"
average:      .asciiz "The average value of 9 and 3 is "
           
           .text
main:

li $v0, 4                     #4 is the print_string syscall
la $a0, name                  #load addr of name into $a0
syscall                       #do the syscall

li $v0, 4                     #4 is the print_string syscall
la $a0, id                    #load addr of id into $a0
syscall                       #do the syscall

li $s0, 9                     #load value for num1 in $s0
li $s1, 3                     #load value for num2 in $s1

li $v0, 4                     #4 is the print_string syscall
la $a0, average               #load addr of average into $a0
syscall                       #do the syscall

addi $sp, $sp, -8             #allocate and store in stack pointing down  
jal function                  #jump to procedure 

li $v0, 1                     #store and print value of 
move $a0, $t0                 #$t0 after compute average to print stmnt
syscall                       #do the syscall

li $v0, 10                    #10 is the exit syscall
syscall                       #do the syscall 

function:                     #the callee procedure

addi $sp, $sp, -8             #allocate fram size for 8 bytes growing downwards
sw $ra, 4($sp)                #return address
sw $t0, 0($sp)                #save value in $t0 to first location in stack pointer                       

add $t0, $s0, $s1             #add $s0 and $s1 and store in $t0
div $t0, $t0, 2               #divide $t0 by 2 for avg

#return
lw $ra, 4($sp)                #restore return address from stack
addu $sp, $sp, 8              #destroy frame 
jr $ra                        #return 





 
