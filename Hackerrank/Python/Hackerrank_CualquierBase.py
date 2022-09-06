def print_formatted(number):
	for j in range(1,number+1):
		BaseCualsea(j,10,'')
		BaseCualsea(j,8,'')
		BaseCualsea(j,16,'')
		BaseCualsea(j,2,'')
		print("")


def BaseCualsea(N,base,salto):
	lista=[]
	while N>=base:
		resto=N%base
		N=int(N/base)
		lista.append(resto)

	lista.append(N)
	if base == 16:
		if N==10:
			print('A'.rjust(2," "),end="")
			lista.remove(10)
		elif N==11:
			N='B'
			print('B'.rjust(2," "),end="")
			lista.remove(11)
		elif N==12:
			print('C'.rjust(2," "),end="")
			lista.remove(12)
		elif N==13:
			print('D'.rjust(2," "),end="")
			lista.remove(13)
		elif N==14:
			print('E'.rjust(2," "),end="")
			lista.remove(14)
		elif N==15:
			print('F'.rjust(2," "),end="")
			lista.remove(15)
		elif N==26:
			print('1A'.rjust(2," "),end="")
			lista.remove(110)
		elif N==27:
			N='B'
			print('1B'.rjust(2," "),end="")
			lista.remove(111)
		elif N==28:
			print('1C'.rjust(2," "),end="")
			lista.remove(112)
		elif N==29:
			print('1D'.rjust(2," "),end="")
			lista.remove(113)
		elif N==30:
			print('1E'.rjust(2," "),end="")
			lista.remove(114)
		elif N==31:
			print('1F'.rjust(2," "),end="")
			lista.remove(115)

	res=lista[::-1]
	resultado="".join(map(str,res))
	resultado2 = resultado.rjust(2,' ')
	resultado3 = resultado2.rstrip()
	#if base ==2:
	#	resultado3 = resultado2.rjust(1,' ')
	print(resultado3,end =" ")

if __name__ == '__main__':
	n = int(input())
	print_formatted(n)