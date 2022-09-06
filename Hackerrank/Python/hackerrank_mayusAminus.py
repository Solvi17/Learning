#text ="HolaMundo"
#if __name__ =='__main__':

def Minuscula(text):
	for i in range(len(text)):
		minuscula = text[i].islower()	
		if minuscula ==True:
			return text[i]
		else:
			minuscula= text[i].lower()
			print(minuscula,end="")
	return '\n'
	#return True

def Mayuscula(text):
	for i in range(len(text)):
		mayuscula = text[i].isupper()
		if mayuscula ==True:
			return text[i]
		else:
			mayuscula= text[i].upper()
			print(mayuscula,end="")
	return '\n'
	
def swap_case(text):
	for i in range(len(text)):
		if text[i].islower() is True:
			Mayuscula(text[i])
		else:
			Minuscula(text[i])
	print()
	return ' '
#ChangueMinxMa(N)

if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)