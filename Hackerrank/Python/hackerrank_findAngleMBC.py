import math
a = int(input())
b = int(input())
x = int(a/b)
hipotenusa = (a**2 +b**2)**(1/2)
am = hipotenusa/2
mc = hipotenusa/2

#ley de cosenos
resultado=math.acos((b**2 + am**2 - mc**2 )/(2*am*b))
result = math.degrees(resultado)
print(str(round(result))+str('°'))