#Grafic
# def truncate(n):
# 	multiplier = 10
# 	return int(n * multiplier) / multiplier

# def getTotals(categories):
# 	total = 0
# 	breakdown = []
# 	for category in categories:
# 		total += category.get_withdrawls()
# 		breakdown.append(category.get_withdrawls())

# 	#Breakdown of spending rounded down to nearest 10th
# 	rounded = list(map(lambda x: truncate(x/total), breakdown))
# 	return rounded

# def create_spend_chart(categories):
# 	res = "Percentage spent by category\n"
# 	i = 100
# 	totals = getTotals(categories)
# 	while i >= 0:
# 		cat_spaces = " "
# 		for total in totals:
# 			if total * 100 >= i:
# 				cat_spaces += "o  "
# 				#print(categories[totals.index(total)].name)
# 			else:
# 				cat_spaces += "   "
# 		res+= str(i).rjust(3) + "|" + cat_spaces + ("\n")
# 		i-=10

# 	dashes = "-" + "---"*len(categories)
# 	names = []
# 	x_axis = ""
# 	for category in categories:
# 		names.append(category.name)

# 	maxi = max(names, key=len)

# 	for x in range(len(maxi)):
# 		nameStr = '     '
# 		for name in names:
# 			if x >= len(name):
# 				nameStr += "   "
# 			else:
# 				nameStr += name[x] + "  "
# 		nameStr += '\n'
# 		x_axis += nameStr

# 	res+= dashes.rjust(len(dashes)+4) + "\n" + x_axis
# 	return res
		
class Category:

	def __init__(self,name,ledger=[],category=[]):
		
		category.append(name)

		self.ledger = ledger
		self.category = category

		
	def deposit(self, amount, description=""):
		dictionary = {}
		dictionary.setdefault("amount",amount)
		dictionary.setdefault("description",description)

		return self.ledger.append(dictionary)
		# dictionary2.setdefault(self.category[0],dictionary)
		# return self.ledger.append({"amount":amount,"description": description})
		

	def withdraw(self,amountnegate,description=""):
		if self.check_funds(amountnegate):
			self.ledger.append({"amount":-amountnegate, "description":description})
			return True
		return False


	def check_funds(self,cantidad):
		if cantidad > self.get_balance():
			return False
		return True

	def get_balance(self):
		amount_total = 0
		for i in self.ledger:

			amount_total = amount_total+i["amount"]
		return amount_total

	def transfer(self,monto_tansfer,description_transfer):
		if self.check_funds(monto_tansfer):
			self.withdraw(monto_tansfer, "Transfer to"+ description_transfer.name)
			description_transfer.deposit(monto_tansfer, "Transfer from "+ self.name)
			return True
		return False


	def __str__(self):
		line = self.ledger.center(30,"*")
		string = ""
		total = 0
		for i in self.ledger:
			string += f"{i['description'][0:23]:23}"+ f"{i['amount']:>7.2f}" + "\n"

			total += i["amount"]

		salida = line + "Total: " + str(total)

		return str(self.ledger)


	def get_withdrawls(self):
		total = 0
		for item in self.ledger:
			if item["amount"] < 0:
				total+= item["amount"]
		return total

if __name__ =="__main__":

	categoria1 = Category("Food")
	categoria2 = Category("Entertainment")
	categoria3 = Category("Business")

	categoria1.deposit(900, "deposit")
	

	

	