#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the solve function below.
def solve(s):
    b = s.split()
    z = []
    for i in range(len(b)):
        x= b[i][0].capitalize()
        y = b[i][0:].replace(b[i][0],x,1)
        z.append(y)
    result =" ".join(z)
    return result

if __name__ == '__main__':

    s = input()

    result = solve(s)
    print(result)