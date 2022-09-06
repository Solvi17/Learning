import numpy

if __name__ == '__main__':
	a, b = input().split()
	datos = input().split()
	datos2 = input().split()
	lista = []
	lista2 = []
	listacomparativa =[]
	for i in range(int(a)):	
		lista.append(int(datos[i]))
		# lista = lista+list(map(int,datos[i]))

	for j in range(int(b)):
		lista2.append(int(datos2[j]))
		# lista2 = lista2*int(datos2[j])

	# i= 1
	# while lista[-1]*i<= lista2[0]:
	# 	print(lista[-1]*i)
	# 	i=i+1
	for k in range(1,int(lista2[0]/lista[-1])+1):
		listacomparativa.append(lista[-1]*k)
	
	# print(listacomparativa)
	print(lista2)
	print(lista)
	

	
