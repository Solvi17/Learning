def numbe(number):
	for i in range(1,number+1):
		decimal = i
		#print("",decimal,end=" ")
		octal = oct(i)
		#print("",octal[2:],end=" ")
		hexadecimal = hex(i)
		#print("",hexadecimal[2:].upper(),end=" ")
		binario = bin(i)
		#print(binario[2:],end="\n")
		valor = 2
		if number>3 and number<=7:
			valor =3
		if number>7 and number<=15:
			valor =4
		if number>15 and number<=31:
			valor =5
		if number>31 and number<=63:
			valor =6
		if number>63:
			valor =7
		print(str(decimal).rjust(valor," "), octal[2:].rjust(valor," "), hexadecimal[2:].upper().rjust(valor," "),binario[2:].rjust(valor," "))

numbe(63)
