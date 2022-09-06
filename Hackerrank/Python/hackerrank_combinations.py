from itertools import combinations
def function(string,number):    
    abecedario = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    abecedariomayuscula=[(abecedario[i].capitalize()) for i in range(len(abecedario))]

    oficial = [(j)for j in abecedariomayuscula if j in string]
    combinacion = oficial

    for y in range(len(combinacion)):
        number = number +y
        a = list(combinations(combinacion,number))
        for x in range(len(a)):
            result = "".join(list(a[x]))
            print(result)

if __name__ == '__main__':
    entrada,number = input().split()
    resultado = function(entrada,int(number))