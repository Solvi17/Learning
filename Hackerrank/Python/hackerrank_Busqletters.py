C="CDC".strip()
N= len(C)
lista= "ABCDCDC".strip()
a=0
for i in range(len(lista)):
	if C[:] == lista[i:N+i]:
		a=a+1
print(a)
