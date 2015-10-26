import unittest
def cuadrado(num):
	"""Calcula el cuadrado de un numero."""
	return num ** 2
class EjemploPruebas(unittest.TestCase):
	def test(self):
		l = [0, 1, 2, 3]
		r = [cuadrado(n) for n in l]
		self.assertEqual(r, [0, 1, 2, 9])
if __name__ == "__main__":
	unittest.main()