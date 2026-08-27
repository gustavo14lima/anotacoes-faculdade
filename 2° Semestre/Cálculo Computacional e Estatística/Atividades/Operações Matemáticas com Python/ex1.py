'''
Enunciado:

Crie um programa em Python que:
• Atribua o valor 2 a uma variável chamada a.
• Calcule:
o potencia_ao_quadrado como a elevado ao quadrado.
o potencia_ao_cubo como a elevado ao cubo.
o potencia_a_quarta como a elevado à quarta potência.
• Imprima os resultados no seguinte formato:
Potência ao quadrado: <valor>
Potência ao cubo: <valor>
Potência à quarta: <valor>
Desafio extra: Faça uma versão do programa utilizando f-strings para calcular e exibir os
valores diretamente.
'''

a = 2

potencia_ao_quadrado = a ** 2
potencia_ao_cubo = a ** 3
potencia_a_quarta = a ** 4

print(f'Potência ao quadrado: {potencia_ao_quadrado}')
print(f'Potência ao cubo: {potencia_ao_cubo}')
print(f'Potência ao quarta: {potencia_a_quarta}')