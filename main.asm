.data

msg_menu_1: .asciiz "1 - Iniciar o jogo\n"
msg_menu_2: .asciiz "2 - Encerrar programa\n"
msg_ativacoes: .asciiz "Insira o número de ativações (máx 32): \n"
msg_tempo: .asciiz "Insira o tempo das notas: 250, 500 ou 1000 (ms) \n"
msg_insercao_invalida: .asciiz "inserção invalida"
msg_play_again: .asciiz "Jogar novamente?\n 1 - Sim \n2 - Não\n"
.text

main: 
menu_inicial:
	la $a0, msg_menu_1
	li $v0, 4
	syscall
	
	la $a0, msg_menu_2
	syscall
	
	li $v0, 5
	syscall
	
	
	beq $v0, 1, start_game
	beq $v0, 2, end_game
	
	j insercao_invalida
	
start_game:
#desenho do display
	j ativacoes
	
number_generator: 	
	li $v0, 41
	syscall

	rem $a0, $a0, 4
	bltz $a0, convert
	j escolha_nota
		
convert:
	mul 	$t1, $a0, -1
	move	$a0, $t1
	j escolha_nota
	
escolha_nota:
 	beq $a0, 0, vermelho
 	beq $a0, 1, azul
 	beq $a0, 2, verde
 	beq $a0, 3, amarelo
 	
 	j end_game
 	
vermelho: 	
	#brilhar cor
	li $v0, 33
	li 	$a0, 69
	move	$a1, $s1
	li	$a2, 56
	li	$a3, 50
	syscall
	
	j end_game
azul:
	li $v0, 33
	li 	$a0, 64
	move	$a1, $s1
	li	$a2, 56
	li	$a3, 50
	syscall
	j end_game
verde:
	li $v0, 33
	li 	$a0, 62
	move	$a1, $s1
	li	$a2, 56
	li	$a3, 50
	syscall
	
	j end_game
amarelo:
	li $v0, 33
	li 	$a0, 67
	move	$a1, $s1
	li	$a2, 56
	li	$a3, 50
	syscall
	j end_game
	
ativacoes:
	li $v0, 4
	la $a0, msg_ativacoes
	syscall
	
	li $v0, 5
	syscall
	
	bltz $v0, insercao_invalida
	bgt $v0, 32, insercao_invalida	
	
	move $s0, $v0
	
	j tempo_ativacoes
	
	
tempo_ativacoes:

	li $v0, 4
	la $a0, msg_tempo
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 
	
	beq $v0, 250, number_generator
	beq $v0, 500, number_generator
	beq $v0, 1000, number_generator
	
	j insercao_invalida
	
insercao_invalida:
	
	li $v0, 4
	la $a0, msg_insercao_invalida
	syscall
	
	j end_game
musica_vitoria:
	
			
musica_derrota:
#Parte 1:
#sol
	li $v0, 33
	li $a0, 79
	li $a1, 250
	li $a2, 72
	li $a3, 50
	syscall
#mi	
	li $v0, 33
	li $a0, 76
	li $a1, 250
	li $a2, 72
	li $a3, 50
	syscall
#do	
	li $v0, 33
	li $a0, 72
	li $a1, 2000
	li $a2, 72
	li $a3, 50
	syscall

#Parte 2:	
#mi
	li $v0, 33
	li $a0, 76
	li $a1, 450
	li $a2, 72
	li $a3, 50
	syscall
#sol	
	li $v0, 33
	li $a0, 79
	li $a1, 450
	li $a2, 72
	li $a3, 50
	syscall
#la	
	li $v0, 33
	li $a0, 81
	li $a1, 1000
	li $a2, 72
	li $a3, 50
	syscall
	
#mi
	li $v0, 33
	li $a0, 76
	li $a1, 2500
	li $a2, 72
	li $a3, 50
	syscall
	
#Parte 3:
#sol
	li $v0, 33
	li $a0, 79
	li $a1, 2000
	li $a2, 72
	li $a3, 50
	syscall
	
#fa#
	li $v0, 33
	li $a0, 78
	li $a1, 450
	li $a2, 72
	li $a3, 50
	syscall
	
#sol
	li $v0, 33
	li $a0, 79
	li $a1, 450
	li $a2, 72
	li $a3, 50
	syscall
	
#la	
	li $v0, 33
	li $a0, 81
	li $a1, 450
	li $a2, 72
	li $a3, 50
	syscall
	
#re	
	li $v0, 33
	li $a0, 74
	li $a1, 450
	li $a2, 72
	li $a3, 50
	syscall
	
#si	
	li $v0, 33
	li $a0, 83
	li $a1, 2000
	li $a2, 72
	li $a3, 50
	syscall
	
#la	
	li $v0, 33
	li $a0, 81
	li $a1, 2000
	li $a2, 72
	li $a3, 50
	syscall
	
	j play_again
	
play_again:
	li $v0, 4
	la $a0, msg_play_again
	syscall
	li $v0, 5
	syscall
	
	bne $v0, 1, end_game
	j main
	
end_game:

	li $v0, 10
	syscall