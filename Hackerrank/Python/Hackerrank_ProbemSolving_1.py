def findSubstring(s,k):
	# a = list(s)
	
	# vocales = ['a','e','i','o','u']
	voc =0
	
	dic = {}
	lista = []
	for i in range(len(s)):
		cad = s[i:k+i]

		if len(cad)!=k:
			break

		conteo = contar_vocales(cad)
		if conteo==0:
			return "Not found!"
		else:
			
			dic.setdefault(cad,conteo)
			lista.append(conteo	)
			maximo = max(lista)
			return cad
		

def contar_vocales(cad):
    voc = 0
    for c in cad:
        if c in "aeiou":
            voc = voc + 1
    return voc

if __name__ == '__main__':	
	s = input()
	k = int(input().strip())
	result = findSubstring(s, k)
	print(result)