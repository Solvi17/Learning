# def Game(entrada):
entrada = input()
abecedario = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']
abecedariomayuscula=[(abecedario[i].capitalize()) for i in range(len(abecedario))]
vocales = ['A','E','I','O','U']

for i in range(len(entrada)):
    a = len(entrada)-i
    print(entrada[:a])
    if entrada[i] in abecedariomayuscula:
        print(entrada[i:])


# for j in range(len(entrada)):
#     if entrada[j] in vocales:
#         print(entrada[j:], "AAS")



# if __name__ == '__main__':
#     re = input()
#     result = Game(re)
#     print(result)