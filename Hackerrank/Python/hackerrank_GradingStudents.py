def grading(grades):
			
	if ((int(grades) + 2) %5) ==0 and int(grades) >=38:
		print(int(grades) + 2)

	elif (int(grades)+1) %5==0 and int(grades) >=38 :
		print(int(grades) + 1)

	elif int(grades)<38 :
		print(grades)
	else:
		print(grades)



if __name__ == '__main__':
	n = int(input())

	for _ in range(n):
		a = input()

		result = grading(a)
