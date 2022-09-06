

def add_time(a,b,day_week=False):
	morning = 'AM'
	affter = 'PM'
	
	days_of_week =['Sunday','Monday','tueSday','Wednesday','Thursday','Friday','Saturday']


	time = a.split(" ")
	time_specific = time[0]
	time_termination = time[1]

	hour = time_specific.split(":")
	hour_specific = hour[0]
	minuts_specific = hour[1]
	
	#second b
	b_time = b.split(":")
	b_hour_specific = b_time[0]
	b_minuts_specific = b_time[1]


	fh_int = int(hour_specific)
	sh_int = int(b_hour_specific)
	suma_hour = fh_int+sh_int
	

	minuts_sum = ""
	day = 0
	for i in range(2):
		x = int(minuts_specific[i])
		y = int(b_minuts_specific[i])
		suma = str(x+y)
		minuts_sum += suma

	if time_termination=="PM":
		day = 1
		if int(minuts_sum)>=60:
			minuts_sum = int(minuts_sum)-60
			suma_hour += 1

		if int(minuts_sum)<10:
			minuts_sum = "0"+str(minuts_sum)

		r = suma_hour//12
		day += r

		if r%2==1:
			time_termination="AM"
			if day//2==1:
				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination+ " (next day)"

			if day_week:
				position = days_of_week.index(day_week)+day//2
				if suma_hour%12==0:
					suma_hour=12

					return str(suma_hour)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"

				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"
			else:

				return str(suma_hour%12)+":"+str(minuts_sum) +" "+time_termination + " ("+str(day//2) +" days later"+")"

		elif r%2==0:
			time_termination ="PM"
	
			if day_week:
				position = days_of_week.index(day_week)+day//2

				if suma_hour%12==0:
					suma_hour=12

					return str(suma_hour)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"

				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"

			if day//2==0:
				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination 
			else:
				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination + " ("+str(day//2) +" days later"+")"
		
	elif time_termination=="AM":
		if int(minuts_sum)>=60:
			minuts_sum = int(minuts_sum)-60
			suma_hour += 1

		if int(minuts_sum)<10:
			minuts_sum = "0"+str(minuts_sum)

		r = suma_hour//12
		day += r

		if day%2==1:
			time_termination="PM"

			if day_week:
				position = days_of_week.index(day_week)+day//2

				if day//2==0:
					return str(suma_hour%12)+":"+minuts_sum +" "+time_termination+", "+ days_of_week[position]

				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"

			else:

				if suma_hour%12==0:
					suma_hour==12
					return str(suma_hour)+":"+minuts_sum +" "+time_termination

				if day//2==0:
					return str(suma_hour%12)+":"+minuts_sum +" "+time_termination 

				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination + " ("+str(day//2) +" days later"+")"


		elif day%2==0:
			time_termination ="AM"

			if day//2==1 and day_week==False:
				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination+ " (next day)"

			if day_week:
				position = days_of_week.index(day_week)+day//2

				if suma_hour%12==0:
					suma_hour=12

					return str(suma_hour)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"

				if day//2==1:
					return str(suma_hour%12)+":"+minuts_sum +" "+time_termination+", "+ days_of_week[position]+ " (next day)"

				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"

			# if day//2==0:
			# 		return str(suma_hour%12)+":"+minuts_sum +" "+time_termination +str(day//2)
			else:
				if suma_hour%12==0:
					suma_hour==12

					return str(suma_hour)+":"+minuts_sum +" "+time_termination +", "+ days_of_week[position]+ " ("+str(day//2) +" days later"+")"
				return str(suma_hour%12)+":"+minuts_sum +" "+time_termination + " ("+str(day//2) +" days later"+")"


if __name__=='__main__':
	result = add_time("2:59 AM", "24:00", "Saturday")
	print(result)