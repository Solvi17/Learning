def nearlySimilarRectangles(matriz):
	count =0
	i = 0
	D= []
	# for i in range(len(matriz)):
	# 	for j in range(len(matriz)):
	# 		if j>i:
	# 			first = matriz[i][0]/matriz[j][0]
	# 			second = matriz[i][1]/matriz[j][1]
	# 			if first == second:
	# 				count = count +1 
	# return count
	while len(matriz)>0 :
		x1,x2 = matriz[i][0],matriz[i+1:len(matriz)][0]
		y1,y2 = matriz[i][1],matriz[i+1:len(matriz)][1]
		if x1 <= x2:
			D.append(x1)
			del matriz[i][0]
		else:
			D.append(x2)
			del matriz[i+1:len(matriz)][1]

if __name__ == '__main__':
	
	sides_rows = int(input().strip())
	sides_columns = int(input().strip())

	sides = []

	for _ in range(sides_rows):
	    sides.append(list(map(int, input().rstrip().split())))

	result = nearlySimilarRectangles(sides)
	print(result)