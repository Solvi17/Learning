a = int(input())
for i in range(a):
    n,m =input().split()
    try:
        res = int(n)/int(m)
        print(int(res))
    
    except ZeroDivisionError as i:
    	print("Error Code:",i)
    except ValueError as e:
        print("Error Code:",e)