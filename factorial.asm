# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here
	enter: .asciiz "Enter a number:\n"
	factor1: .asciiz "Factorial of "
	factor2: .asciiz " is:\n"
	newline: .asciiz "\n"
#Text Area (i.e. instructions)
.text
main:
	la $a0, enter
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	j set
set:
	#t0: current factorial value
	li $t0, 1
	#t1: where to stop
	move $t1, $v0
	addi $t1, $t1, 1
	#t2: iterator
	li $t2, 2
	j loop
loop:
	#condition
	bge $t2, $t1, print
	#loop part
	mult $t0, $t2
	mflo $t0
	#iterate
	addi $t2, $t2, 1
	j loop 
	
print:
	#"factorial of" 
	li $v0, 4
	la $a0, factor1
	syscall
	#x
	addi $t1, $t1, -1
	move $a0, $t1
	li $v0, 1
	syscall 
	#"is: "
	li $v0, 4
	la $a0, factor2
	syscall
	#factorial value in t0
	li $v0, 1
	move $a0, $t0
	syscall
	#"\n"
	li $v0, 4
	la $a0, newline
	syscall
	j exit

exit:
	li $v0, 10
	syscall
