from itertools import permutations
def function(string,number):    
    abecedario = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    abecedariomayuscula=[(abecedario[i].capitalize()) for i in range(len(abecedario))]

    oficial = [(j)for j in abecedariomayuscula if j in string]
    permutar = oficial
    a = list(permutations(permutar,number))
    for i in range(len(a)):
        b = "".join(list(a[i]))
        print(b)

if __name__ == '__main__':
    entrada,number = input().split()
    resultado = function(entrada,int(number))
#resultado = ["".join(list(a[x])) for x in range(len(a))]

