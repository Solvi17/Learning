import builtins
n = int(input())
lista = []
integer_list = input().split()
for i in range(n):
	lista.append(int(integer_list[i]))

print(tuple(lista))
print(hash(tuple(lista)))