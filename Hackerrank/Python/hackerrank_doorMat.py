N=120
base=8
lista=[]
def BaseCualsea(N,base):
	while N>=base:
		resto=N%base
		N=int(N/base)
		lista.append(resto)
	lista.append(N)
	res=lista[::-1]
	print("".join(map(str,res)))

BaseCualsea(120, 2)


#print(division)
#for i in range(N):
#print(resto)

