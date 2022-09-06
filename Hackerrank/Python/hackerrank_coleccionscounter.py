from collections import Counter

entrada =int(input())
datos = input().split()
listaC = [(int(datos[i])) for i in range(entrada)]

entrada2 = int(input())

lista2=[list(map(int,input().split())) for j in range(entrada2)]

for i in range(len(lista2)):
	print(lista2[i][0])

for j in range(len(Counter(listaC).keys())):
	print(listaC[j])	

print(listaC)
print(Counter(listaC))
print(Counter(listaC).items())
print(Counter(listaC).keys())

