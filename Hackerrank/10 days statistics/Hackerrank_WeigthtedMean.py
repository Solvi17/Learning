X = [1,2,3]
W = [1,2,3]
a = [ X[i]*W[i] for i in range(len(X)) ]

print("{0:.1f}".format(sum(a)/3))