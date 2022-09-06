from decimal import Decimal
# def combinatoria(n,k):
#     return factorial(n)/(factorial(n-k)*factorial(k))

# def factorial(n):
#     n = 1
#     for i in range(n):
#         n = n*i
#     return n

# if __name__ =="__main__":
#     n,x = map(float,input().split())
#     # n = float(n)
#     # x = int(x)
#     p = 1.09
#     q = 0.9
#     p = combinatoria(n,x)* (p**x)*(q**(n-x))
#     print(p)

if __name__ =="__main__":
    n,x = map(float,input().split())
    x = int(x)
    t = 6
    v = n + x
    k = v/t
    a = "{0:.4f}".format(k*2)
    print(a.split('7')[0])