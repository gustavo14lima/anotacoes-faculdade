'''
Enunciado:

Exercício 7)
Voltando ao caso do floor e ceil, por padrão estas funções retornam valores inteiros. Podemos
determinar que os valores resultantes possuam ponto flutuante (float):
Faça o teste a seguir:
print('\n'*50)
resultado = floor(1.456)
print(resultado)
print(type(resultado))
resultado_float = float(floor(1.456))
print(resultado_float)
print(type(resultado_float))
'''

import math

print('\n'*50)

resultado = math.floor(1.456)
print(resultado)
print(type(resultado))

resultado_float = float(math.floor(1.456))
print(resultado_float)
print(type(resultado_float))