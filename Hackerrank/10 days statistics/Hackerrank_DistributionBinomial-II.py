from decimal import Decimal
def combinatoria(n,k):
    return factorial(n)/(factorial(n-k)*factorial(k))

def factorial(n):
    f = 1
    a = []
    for i in range(1,n+1):
        f = f*i
        # a.append(n)
    
    return f

if __name__ =="__main__":
	p,n = map(int,input().split())
	p =p/100
	x = 1
	q = 1-p
	r = combinatoria(n,x) *(p**x)*(q**(n-x))
	print(r)
	# print(factorial(5))