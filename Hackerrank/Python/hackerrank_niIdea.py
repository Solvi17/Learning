def NoIdea(daton,a,b):
	#datos = daton.difference(a)
	#secondatos  = daton.difference(b)
	#contador1 = 0
	lista1 = [((i in a)- (i in b)) for i in daton]

	return sum(lista1)

if __name__ == '__main__':
	
	n,m = input().split()

	other = input().split()
	A = set(input().split())
	B = set(input().split())
	
	result = NoIdea(other,A,B)
	print(result)
	

#OPCIONAL NRO 1

# lista1 = [(int(other[i])) for i in range(n)]
	# listaA = [(int(other[j])) for j in range(m)]
	# listaB = [(int(other[k])) for k in range(m)]

#OPCIONAL NRO 2
# string1 = ""
	# for i in range(n):
	# 	daton = int(other[i])
	# 	string1 = string1+" "+str(daton)

	# result1 = list(string1.split())
	# v = list(map(int,result1))
	# other = input().split()
	# string2 = ""
	# for j in range(m):
	# 	A = int(other[j])
	# 	string2 = string2+" "+str(A)
	
	# result2 = list(string2.split())
	# y = list(map(int,result2))
	# other = input().split()
	# string3 = ""
	# for x in range(m):
	# 	B = int(other[x])
	# 	string3 = string3+" "+str(B)

	# result3 = list(string3.split())
	# z = list(map(int,result3))