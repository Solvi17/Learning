letters = "ABCDEF"
base =16
N=47
lista=[]
while N>=base:
	resto=N%base
	N=int(N/base)
	lista.append(resto)
lista.append(N)
res=lista[::-1]
letras = ['A','B','C','D','E','F']
numbers =[10,11,12,13,14,15]

for i in range(1,5):
	for j in numbers:
		if i==res[0] and j==res[1]:
			[print(letras[k]) for k in range(len(letras)) if k==i-1]
			print(res[0],res[1])

#if res[0]==1 and (res[1]==10 or res[1]==20 or res[1]==30 or res[1]==30):
#	print('A')

#elif res[0]==2 and (res[1]==11 or res[1]==21 or res[1]==31 or res[1]==31):
#	print('B')

#elif res[0]==3 and (res[1]==12 or res[1]==22 or res[1]==32 or res[1]==32):
#	nueva  =[print(letras[j]) for j in range(len(letras)) if j ==i-1]

#elif res[0]==4 and (res[1]==13 or res[1]==23 or res[1]==33 or res[1]==33):
#	nueva  =[print(letras[j]) for j in range(len(letras)) if j ==i-1]

#elif res[0]==5 and (res[1]==14 or res[1]==24 or res[1]==34 or res[1]==34):
#	nueva  =[print(letras[j]) for j in range(len(letras)) if j ==i-1]

#else:
#	print(res)
