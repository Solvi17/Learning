size=3
ancho=(size*2)-1
largo=(ancho*2)-1
lista =[]
for x in range(1,ancho+1):
	lista.append(str(x))
	convert = "-".join(lista)
	b= convert.center(largo,"-")
	if x%2==0:
		pass
	else:
		print(b)

for j in range(1,ancho):
	r = ancho+1-j
	lista.remove(str(r))
	convert2 = "-".join(lista)
	c=convert2.center(largo,"-")
	if j%2==1:
		pass
	else:
		print(c)