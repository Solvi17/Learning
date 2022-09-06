from itertools import product
#lista =[]
#A = [1, 2]
#B = [3, 4]
#lista.append(A)
#lista.append(B)
#print(list(product(*lista)))


def calcular(a,b):
	lista = []
	lista.append(a)
	lista.append(b)
	r = " ".join(map(str,list(product(*lista))))
	return r

if __name__ == '__main__':
	dato1 = input().split()
	dato2 = input().split()
	lista1=[]
	lista2=[]
	for i in range(len(dato1)):
		a=int(dato1[i])
		#b=int(dato1[1])
		lista1.append(a)

	for j in range(len(dato2)):
		a=int(dato2[j])
		#b=int(dato2[1])
		lista2.append(a)

	result = calcular(lista1,lista2)
	print(result)