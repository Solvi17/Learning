import cmath
z=input()
modulo = abs(complex(z))
argumento = cmath.phase(complex(z))
print(modulo)
print(argumento)