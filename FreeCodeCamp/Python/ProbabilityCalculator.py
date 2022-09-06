import random
import copy

class Hat:

	def __init__(self,**kwargs):
		contents = []
		for i in kwargs:
			for j in range(kwargs[i]):
				contents.append(i)
		self.contents = contents

	def __str__(self):
		return str(self.contents)

	def draw(self,borrar):
		contents = self.contents

		list_remove = []
		if borrar >=len(contents):
			return contents

		for b in range(borrar):
			
			valor = random.randint(0,len(contents)-1)

			value = contents[valor]
			list_remove.append(value)
			contents = contents[0:valor] + contents[valor + 1:]
			
		self.contents = contents
		# for elemento in list_remove:
		# 		self.contents.remove(elemento)

		return list_remove
			
def experiment(hat,expected_balls, num_balls_drawn, num_experiments):
	#num_balls_Drawn = numero de bolas que se sacarán del sombrero
	#num_experiments = numero de experimentos
	count = 0
	for n in range(num_experiments):

		copia = copy.copy(hat)
		eliminando = copia.draw(num_balls_drawn)
		terminado = True
		for j in expected_balls.keys():
			if eliminando.count(j)< expected_balls[j]:
				terminado = False
				break

		if terminado:
			count +=1

	return count/num_experiments


	#devolver probabilidad

if __name__=="__main__":
	hat = Hat(black=6, red=4, green=3)
	probability = experiment(hat=hat, 
                  expected_balls={"red":2,"green":1},
                  num_balls_drawn=5,
                  num_experiments=2000)

	print(probability)
	# print(hat.draw(5))
	# print(hat.contents)
	# print(len(hat.contents))
	
	# hat1 = Hat(red=3,blue=2)

	# print(hat1.contents)
	# print(hat1.draw(2))
	# print(hat1.contents)
	# print(len(hat1.contents))

# (5,2)x(5,1)
# -----------
#    (13,5)