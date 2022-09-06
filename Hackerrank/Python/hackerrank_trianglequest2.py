# lista1 = [i for i in range(1,5+1)] 
# for i in range(len(lista1)):
# 	a = lista1[:i]
# 	c = lista1[i::-1]
# 	result = "".join(list(map(str,a)))
# 	result2 = "".join(list(map(str,c)))
#	print(result,end="")
#	print(result2)

# lista2 =[(lista1[:i]+lista1[i::-1]) for i in range(len(lista1))]
# for x in range(len(lista2)):
#     # a = repr(lista2[x]).strip(']').strip(",").strip('[').split()
#     # print("".join(a).replace(',',''))
    
for i in range(1,int(input())+1): #More than 2 lines will result in 0 score. Do not leave a blank line also
    print(tuple(i))
