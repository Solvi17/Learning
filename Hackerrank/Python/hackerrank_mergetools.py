
def encontrar(elemento,cadena):
	for i in range(len(cadena)):
		a = list(cadena)
		return elemento,a.index(elemento)


# print(encontrar("A","ADA"))

def main():
	string = "AABCAAADA"
	k = 2
	
	for i in range(0,len(string),k):
		caracteres = string[i:k+i]
		conjunto =list(caracteres)
		lista = []
		listanueva = [(lista.append(j)) for j in conjunto if j not in lista]
		# for j in conjunto:
		# 	if j not in listanueva:
		# 		listanueva.append(j)
		# print(conjunto.count('A'))
		# for j in range(len(conjunto)):

		print("".join(lista))
		
main()

				

