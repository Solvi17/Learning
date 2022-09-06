def kangaroo(x1, v1, x2, v2):
    bool=True
    while x2> x1:
        x1 = x1+v1
        x2 = x2+v2
        if x2 > x1 and v2 >= v1:
            return  "NO"
    if x2 ==x1:
        return "YES"
        #break
    else :
        return "NO"




if __name__ == '__main__':

    x1V1X2V2 = input().split()

    x1 = int(x1V1X2V2[0])

    v1 = int(x1V1X2V2[1])

    x2 = int(x1V1X2V2[2])

    v2 = int(x1V1X2V2[3])

    result = kangaroo(x1, v1, x2, v2)
    print(result)
