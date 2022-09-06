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
    
    return mlower,q,mupper

# print(quartiles([3,7,8,5,12,14,21,15,18,14]))
print(quartiles([3, 7, 8, 5, 12, 14, 21, 13,18]))