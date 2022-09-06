def interQuartile(values, freqs):
    # Print your answer to 1 decimal place within this function
    lis = []
    for i in range(len(values)):
        for j in range(freqs[i]):
            lis.append(values[i])
            s = sorted(lis)
            # print(values[i],freqs[i])

    # print(s)
    print(quartiles(s))

def quartiles(arr):
    # Write your code here
    ordenar = sorted(arr)
    
    if len(ordenar) %2==0:
        fo = int(len(ordenar)/2)-1
        lo = int(len(ordenar)/2)
        q = int((ordenar[fo]+ordenar[lo])/2)
        lower = ordenar[0:fo+1]
        upper = ordenar[lo:]
    else:
        fo = int(len(ordenar)/2)
        lo = int(len(ordenar)/2)
        q = int(ordenar[fo])
        lower = ordenar[0:fo]
        upper = ordenar[lo+1:]
        
    
    # lower = ordenar[0:fo]
    if len(lower)%2==0:
        a = int(len(lower)/2) - 1
        b = int(len(lower)/2)
        mlower = int((lower[a] + lower[b])/2)
    else:
        a = int(len(lower)/2)
        mlower = int(lower[a])
        
    # upper = ordenar[lo+1:]
    if len(upper)%2==0:
        x = int(len(upper)/2) - 1
        y = int(len(upper)/2)
        mupper = int((upper[x] + upper[y])/2)
    else:
        x = int(len(upper)/2)
        mupper = int(upper[x])
    
    return "{0:.1f}".format(mupper-mlower)

interQuartile([6, 12, 8, 10, 20, 16], [5, 4, 3, 2, 1, 5])