def Capitalize(string):

	for i in range(len(string)):
		a = string[i].capitalize()
		print(a,end=" ")

	return " "
if __name__ == '__main__':
		users =int(input())
		string = input().split()
		for j in range(users):
				cadena1 = str(string[j])

		result = Capitalize(string)
		print(result)