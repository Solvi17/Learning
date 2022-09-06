import numpy
N,M,P = input().split()
array1 = numpy.array([input().strip().split() for i in range(int(N))],int)
array2 = numpy.array([input().strip().split() for i in range(int(M))],int)
print(numpy.concatenate((array1,array2)))