# if __name__ == '__main__':
# 	a, k = input().split()
# 	datos = input().split()
# 	lista = []
# 	for i in range(int(a)):
# 		lista.append(int(datos[i]))
	
# 	j = 0
# 	for x in range(len(lista)):
# 		for y in range(len(lista)):
# 			if x < y :
# 				suma = lista[x] + lista [y]
# 				if suma % int(k) == 0:
# 					j = j +1
# 	print(j)
			
if __name__ == '__main__':
	nk = input().split()
	n = int(nk[0])
	k = int(nk[1])
	ar = list(map(int, input().rstrip().split()))
	print(ar)