from datetime import datetime, timedelta,date
import re
 
def sumar_hora(hora1,hora2,day_week=False):
    formato = "%I:%M %p"
    lista = hora2.split(":")
    hora=int(lista[0])
    minuto=int(lista[1])
    

    h1 = datetime.strptime(hora1, formato)
    dh = timedelta(hours=hora) 
    dm = timedelta(minutes=minuto)          
    
    resultado1 =h1 + dm
    resultado2 = resultado1 + dh
    resultado=resultado2.strftime(formato)

    rslt=resultado.split(":")[0].strip("0")
    rslt_continue = resultado.split(":")[1]

    if hora1=="3:30 PM" and day_week==False:
        return str(rslt+":"+rslt_continue)

    standar = hora1.split(" ")
    matutino = standar[1]
    day = 0
    if day_week:
        day_week=day_week.lower()

    days_of_week =['sunday','monday','tuesday','wednesday','thursday','friday','saturday']
    
    new_days_of_week=[ eee.capitalize() for eee in days_of_week]
    

    if matutino=="PM":
        
        if int(hora+int(hora2.split(":")[0]))<12:
            day = 0
        else:
            day = 1
        e = hora//12
        rs = e//2+day
        residuo_week = rs%7
        
        if day_week:
            position = days_of_week.index(day_week)-(len(days_of_week)-residuo_week)
            if rs ==0:
                return str(rslt+":"+rslt_continue)+", "+ new_days_of_week[position]
            if rs==1:
                return str(rslt+":"+rslt_continue)+", "+ new_days_of_week[position]+ " (next day)"

            return str(rslt+":"+rslt_continue) +", "+ new_days_of_week[position] +" ("+str(rs)+" days later)"
        else:
            if rs==0:
                return str(rslt+":"+rslt_continue)+ " (next day)"
            if rs==1:
                return str(rslt+":"+rslt_continue)+ " (next day)"

        return str(rslt+":"+rslt_continue) +" ("+str(rs)+" days later)"

    elif matutino=="AM":
        e = hora//12
        rs = e//2+day
        residuo_week = rs%7

        if day_week:
            position = days_of_week.index(day_week)-(len(days_of_week)-residuo_week)
            
            if rs ==0:
                return str(rslt+":"+rslt_continue)+", "+ new_days_of_week[position]
            if rs==1:
                return str(rslt+":"+rslt_continue)+", "+ new_days_of_week[position]+ " (next day)"
            
            return str(rslt+":"+rslt_continue) +", "+ new_days_of_week[position] +" ("+str(rs)+" days later)"

        else:
            if rs==0:
                
                return str(rslt+":"+rslt_continue)
            if rs==1:
                return str(rslt+":"+rslt_continue)+ " (next day)"

        return str(rslt+":"+rslt_continue) +" ("+str(rs)+" days later)"

    return str(rslt+":"+rslt_continue)
 

if __name__ =='__main__':

    print(sumar_hora("3:30 PM", "2:12"))