lista =[]
class operacion :
	def __init__(self):
		N = int(input())

		for i in range(N):
			Tab= input().split()
			T = str(Tab[0])
			if T == "insert":
				a= int(Tab[1])
				b= int(Tab[2])
				lista.insert(a,b)
				#print(lista)
			elif T == "remove":
				a= int(Tab[1])
				lista.remove(a)
			elif T == "append":
				a= int(Tab[1])
				lista.append(a)
			elif T == "sort":
				lista.sort()
			elif T == "pop":
				lista.pop()
			elif T == "reverse":
				lista = lista[::-1]
			elif T == "print":
				print(lista)

operacion = operacion()