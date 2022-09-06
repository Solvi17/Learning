import calendar
fecha = input().split()
MM = int(fecha[0])
DD = int(fecha[1])
AA = int(fecha[2])
day = ['MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY']
a = calendar.TextCalendar(firstweekday=6).formatyear(2015)
b = calendar.weekday(AA,MM,DD)
for i in range(len(day)):
	if b==2:
		pass
print(day[b])
