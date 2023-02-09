# minimum.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	enter: .asciiz "Enter the next number:\n"
	output: .asciiz "Minimum: "
    	newl: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
	#first number
	la $a0, enter
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	#second number
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#third number
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	slt $t3, $t0, $t1
	#t7 holds 1
	li $t7, 1
	#t0 < t1 in t3	
	beq $t3, $t7, firstLess
	move $t6, $t1 	
	j secondCompare

firstLess:
	move $t6, $t0
	#t6 is the minimum

secondCompare:
	slt $t3, $t6, $t2
	#t6 less than t2 in t3
	beq $t3, $t7, secondLess
	#t6 greater than t2
	move $t6, $t2
	j printMinimum

secondLess:
	j printMinimum

printMinimum:
	la $a0, output
	li $v0, 4
	syscall
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, newl
	li $v0, 4
	syscall
	j exit

exit:
	li $v0, 10
	syscall
