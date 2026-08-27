'''
Enunciado:

Exercício 4)
Dado o valor de w anteriormente, import as funções floor, ceil da biblioteca math e determine o
piso, o teto e o arredondamento.
'''

import math

w = 3345.61

piso = math.floor(w)
teto = math.ceil(w)
arredondamento = round(w)

print(f'Piso: {piso}')
print(f'Teto: {teto}')
print(f'Arredondamento: {arredondamento}')