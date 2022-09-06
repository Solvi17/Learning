

if __name__ == '__main__':
	arr_count = int(input().strip())
	ar = list(map(int, input().rstrip().split()))
	result = [(ar.count(ar[i]),ar[i]) for i in range(len(ar))]
	new = list(set(result))
	
	for i in range(len(new)):
		for j in range(i,len(new)):
			if new[i][0]>new[j][0]:
				resultado = new[i][1]
				
		print(resultado)
				
	