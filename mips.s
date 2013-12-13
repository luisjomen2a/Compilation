
.data

newline:
.asciiz "\n" 
.text

main:


 li $a0, 0
 li $a1, 1
sub $a0, $a0 , $a1

li $v0 1
 syscall

la $a0 , newline
li $v0 , 4
syscall

 li $a0, 0
 li $a1, 0
mul $a0, $a0, $a1

li $v0 1
 syscall

la $a0 , newline
li $v0 , 4
syscall
