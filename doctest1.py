def cuadrados(lista):    
	"""Calcula el cuadrado de los numeros de una lista    	
	>>> l = [0, 1, 2, 3]
	>>> cuadrados(l)
	[0, 1, 4, 9]"""

	return [n ** 2 for n in lista]

def _test():
	import doctest
	doctest.testmod(verbose=True)

if __name__ == "__main__":
    _test()
