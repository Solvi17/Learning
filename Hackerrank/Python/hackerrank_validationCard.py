N=int(input())
for i in range(N):
	Number = input()# or input().split("-")
	entrada = Number.strip()
	if entrada:
		if len(entrada) <=16:
			print("Valid")
	entrada2 =Number.split("-")
	if entrada2:		
		for j in range(1):
			if len(entrada2)>=4 and len(entrada2[j])==4:
				print("valid")
			else:
				print("invalid")
	