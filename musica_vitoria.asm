.text

#Parte 1:

#fa#
	li $v0, 33
	li $a0, 66
	li $a1,450
	li $a2, 72
	li $a3, 50
	syscall
#la
	li $v0, 33
	li $a0, 69
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall
	
#dó
	li $v0, 33
	li $a0, 73
	li $a1, 250
	li $a2, 72
	li $a3, 50
	syscall
	
#la
	li $v0, 33
	li $a0, 69
	li $a1, 250
	li $a2, 72
	li $a3, 50
	syscall
	
#fa
	li $v0, 33
	li $a0, 66
	li $a1, 250
	li $a2, 72
	li $a3, 50
	syscall

#re
	li $v0, 33
	li $a0, 62
	li $a1, 100
	li $a2, 72
	li $a3, 50
	syscall
#re
	li $v0, 33
	li $a0, 62
	li $a1, 100
	li $a2, 72
	li $a3, 50
	syscall

#re
	li $v0, 33
	li $a0, 62
	li $a1, 100
	li $a2, 72
	li $a3, 50
	syscall	
	j exit
#parte 2:
#dó
	li $v0, 33
	li $a0, 73
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall
	
#re
	li $v0, 33
	li $a0, 62
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall

#fa#
	li $v0, 33
	li $a0, 66
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall
	
#la
	li $v0, 33
	li $a0, 69
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall
	
#dó
	li $v0, 33
	li $a0, 73
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall
	
#la
	li $v0, 33
	li $a0, 69
	li $a1, 1000
	li $a2, 72
	li $a3, 50
	syscall
	
#fa#
	li $v0, 33
	li $a0, 66
	li $a1, 300
	li $a2, 72
	li $a3, 50
	syscall
	
exit:
	li $v0, 10
	syscall
