
# x = int (input())
# y = int (input())
# z = int (input()) 
# n = int (input()) 
# ar = [] 
# p = 0 
# for i in range ( x + 1 ) :
# 	for j in range( y + 1): 
# 		for z in range(z + 1):
# 			if i+j+z != n:
# 				ar.append([])
# 				ar[p] = [ i , j, z ] 
# 				p+=1
# print(ar)


n = int(input())
arr = map(int, input().split())
rango=[]
lista= list(arr)
minimocambio=max(lista)
for i in range(len(lista)):
    if lista[i]<minimocambio:
        rango.append(lista[i])
print(max(rango))