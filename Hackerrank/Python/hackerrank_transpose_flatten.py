import numpy
n,m = input().split()
arr = numpy.array([input().strip().split(' ') for i in range(int(n))],int)
print(arr.transpose())
print(arr.flatten())