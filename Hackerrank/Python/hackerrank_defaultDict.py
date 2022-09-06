lista1=[]
lista2=[]
n,m = input().split()
for i in range(int(n)):
	a = input()
	lista1.append(a)

for j in range(int(m)):
	b = input()
	lista2.append(b)

a=0
for x in range(len(lista2)):
	for z in range(len(lista1)):
		print(lista1[z])
		# if x[0]==z:
		# 	a = lista1.index(x[0])
		# 	print(a)
		# elif x[1]==z:
		# 	b = lista1.index(x[1])
		# 	print(b)