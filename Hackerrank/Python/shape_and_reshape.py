import numpy
def fun(arr):
    my_arr = numpy.array(arr)
    return numpy.reshape(my_arr,(3,3))

if __name__ == '__main__':
    datos = input().split()
    lista = [(int(datos[i])) for i in range(9)]
    result = fun(lista)
    print(result)
