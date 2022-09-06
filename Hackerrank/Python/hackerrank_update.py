if __name__ == '__main__':
	entrada = int(input())
	abcdefjhijklmnop = input().split()
	
	a = int(abcdefjhijklmnop[0])
	b = int(abcdefjhijklmnop[1])
	c = int(abcdefjhijklmnop[2])
	d = int(abcdefjhijklmnop[3])
	e = int(abcdefjhijklmnop[4])
	f = int(abcdefjhijklmnop[5])
	g = int(abcdefjhijklmnop[6])
	h = int(abcdefjhijklmnop[7])
	i = int(abcdefjhijklmnop[8])
	j = int(abcdefjhijklmnop[9])
	k = int(abcdefjhijklmnop[10])
	l = int(abcdefjhijklmnop[11])
	m = int(abcdefjhijklmnop[12])
	n = int(abcdefjhijklmnop[13])
	o = int(abcdefjhijklmnop[14])
	p = int(abcdefjhijklmnop[15])

	listaoficial = set(abcdefjhijklmnop)
	print(listaoficial)

	mnopqrstuv = input().split()

	m = int(mnopqrstuv[0])
	n = int(mnopqrstuv[1])
	o = int(mnopqrstuv[2])
	p = int(mnopqrstuv[3])
	q = int(mnopqrstuv[4])
	r = int(mnopqrstuv[5])
	s = int(mnopqrstuv[6])
	t = int(mnopqrstuv[7])
	u = int(mnopqrstuv[8])
	v = int(mnopqrstuv[9])

	lista = set(mnopqrstuv)

	listaoficial.intersection_update(lista)
	a = list(lista)
	a.sort()
	print(a)
	
	

