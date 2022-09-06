from collections import Counter

def Calculate(n):
    mean = sum(n)/len(n)
    ordenar = sorted(n)
    if len(n) %2 ==0:
        a = int(len(ordenar)/2) - 1
        b = int(len(ordenar)/2)
        median = (ordenar[a]+ordenar[b])/2
    else:
        e = len(ordenar)/2
        median = ordenar[e]/2

    
    mode = sorted(sorted(Counter(ordenar).items()),key = lambda x : x[1],reverse = True)[0][0]
    
    print(mean)
    print(median)
    print(mode)
    

if __name__ =="__main__":
    n = int(input())
    ar = list(map(int, input().split()))
    r = Calculate(ar)