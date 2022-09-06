import re
def aritmetic_arranger(arr, booleano):
	# if booleano:
	# 	if len(arr)<5:
	# 		for i in arr:

	# 			if "+" in i:
	# 				a = i.split(" + ")
	# 				suma = 0
	# 				for k in a:
	# 					try:
	# 						s = int(k)
	# 						suma = suma + s
	# 					except Exception as e:
	# 						print("Error: Numbers must only contain digits.")

					
	# 				print(suma)



	# 			elif "-" in i:
	# 				b = i.split(" - ")
	# 				resta = 0
	# 				for k in b:
	# 					try:	
	# 						r = int(k)
	# 						resta = (r - resta)
	# 					except Exception as e:
	# 						print("Error: Numbers must only contain digits.")
	# 						break
	# 				print(resta*-1)

		# else:
		# 	return "Error: Too many problems."


	primero =""
	segundo =""
	lineas =""
	sumT = ""

	if len(arr)>5:
		return "Error: Too many problems."

	for arreglo in arr:
		if re.search("[^\s.0-9.+-]", arreglo):
			if (re.search("[/]",arreglo)) or (re.search("[*]",arreglo)):
				return "Error: Operator must be '+' or '-'."
			return "Error: Numbers must only contain digits."

		first = arreglo.split(" ")[0]
		operator = arreglo.split(" ")[1]
		if operator =='/' or operator =="*":
			return "Error: Operator must be '+' or '-'."

		last = arreglo.split(" ")[2]
		# print(first)
		suma = ""
		if operator=='+':
			suma = str(int(first) + int(last))
			
		elif operator=='-':
			suma = str(int(first) - int(last))

		
		longitud = max(len(first),len(last))+2
		
		if len(first)>=5 or len(last)>=5:
			return 'Error: Numbers cannot be more than four digits.'

		top = str(first).rjust(longitud)
		bottom = operator + str(last).rjust(longitud-1)
		L = ""
		res = str(suma).rjust(longitud)
		for i in range(longitud):
			L += "-"


		# print("  32      3801      1      123         1\n+  4    - 2999    + 2    +  49    - 9380\n----    ------    ---    -----    ------")
	if arreglo !=arreglo[-1]:	
		primero += top + "    "
		segundo += bottom + "    "
		lineas += L + "    "
		sumT += res + "    " 
	else:
		primero += top 
		segundo += bottom 
		lineas += L 
		sumT += res

	string = ""
	if booleano:

		string =primero +'\n'+ segundo + '\n' + lineas + '\n' + sumT
		return string

	else:
		string = primero +'\n'+ segundo + '\n' + lineas
		return string

if __name__ == '__main__':
	
	a = aritmetic_arranger(["3122 + 678", "3801 - 2", "45 + 43", "123 + 49"],True)
	print(a)
	