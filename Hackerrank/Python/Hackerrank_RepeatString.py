s = "a"
n = 100
i = 0
count =0
while len(s)<n and i <=len(s):
	a = s[i]
	s = s + str(a)
	i = i+1

for i,k in enumerate(s):
	if k =="a":
		count = count + 1
print(count)