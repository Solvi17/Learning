import os
import sys

#
# Complete the primeCount function below.
#
def primeCount(n):

    listaprimos=[]
    for num in range(2,n):
        prime = True
        for i in range(2,num):
            if (num%i==0):
                prime = False
        if prime:
            listaprimos.append(num)
            # print(listaprimos)
    a= 1
    listannumeroprimo=[]
    for i in range(len(listaprimos)):
        a=listaprimos[i]*a
        if a <n:
            listannumeroprimo.append(a)

    return 'primos generados menores al numero',listaprimos #len(listannumeroprimo)

if __name__ == '__main__':
    

    q = int(input())

    for q_itr in range(q):
        n = int(input())

        result = primeCount(n)

        print(result)


# cont = 0

#

# for n in range(1, numero + 1):
#     for d in range(1, n + 1):
#         if n % d == 0:
#             cont += 1
#     if cont == 2:
#         lista = "{}".format(n)
#         resultado = "".join(lista)
#         print(resultado)
#     cont = 0
