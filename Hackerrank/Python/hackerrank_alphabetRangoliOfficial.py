size=5
ancho=(size*2)-1
ancho2=(size*2)-3
lista =[]
abecedario = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
for x in range(1,size+1):
	if size==1:
		print("a")
		break
	r = size-x
	lista.append(str(abecedario[r]))
	convert = "-".join(lista)
	nueva = lista[::-1]
	convert2 = "-".join(nueva[1:size])
	b= convert.rjust(ancho,"-")
	c= convert2.ljust(ancho2,"-")
	print(b+"-"+c)

for j in range(1,size):
	r=size-j
	lista.pop()
	convert = "-".join(lista)
	nueva = lista[::-1]
	convert2 = "-".join(nueva[1:size])
	b= convert.rjust(ancho,"-")
	c= convert2.ljust(ancho2,"-")
	print(b+"-"+c)