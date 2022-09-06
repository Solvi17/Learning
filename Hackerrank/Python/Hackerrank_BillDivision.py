n,k = map(int,input().split())
ar = list(map(int,input().split()))
bchargued = int(input())

indice = ar[k]
ar.remove(indice)
suma = sum(ar)
bactual = int(suma/2)
result = bchargued - bactual
if result !=0:
	print(result)

else :
	print("Bon Appetit")