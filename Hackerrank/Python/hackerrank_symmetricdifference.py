def symetrica(a,b):
	c = a.difference(b)
	d = b.difference(a)
	resultado = list(c.union(d))
	resultado.sort()

	return "\n".join(map(str,resultado))

if __name__ == '__main__':
	valor1 = int(input())
	datos1 =input().split()
	lista1=[]
	lista2=[]
	for i in range(valor1):
		a = int(datos1[i])
		lista1.append(a)
	
	valor2 = int(input())
	datos2 =input().split()
	for j in range(valor2):
		b = int(datos2[j])
		lista2.append(b)

	result = symetrica(set(lista1),set(lista2))
	print(result)