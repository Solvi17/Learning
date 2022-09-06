#matriz =[]
#for i in range(2):
#	matriz.append([0]*2)

#print(*matriz)


#for i in range(2):
#	for j in range(2):
#		matriz[i][j]=input()
#print(matriz)

#names = ["Sam", "Peter", "James", "Julian", "Ann"]
#print(*names)

def DesignerDoor(valorx1,valorx2):
	a = ".|."
	for j in range(1):
		for x in range(1,valorx1,2):
			valor = a*x
			linea=str(valor).center(valorx2,"-")
			print(linea)
		lineamedio = "WELCOME".center(valorx2,"-")
		print(lineamedio)
		for z in range(2,valorx1,2):
			valor =a*(valorx1-z)
			linea=str(valor).center(valorx2,"-")
			print(linea)
	return ""

if __name__ == '__main__':
	a = input().split()
	valorx1 = int(a[0])
	valorx2 = int(a[1])
	result = DesignerDoor(valorx1,valorx2)
	print(result)