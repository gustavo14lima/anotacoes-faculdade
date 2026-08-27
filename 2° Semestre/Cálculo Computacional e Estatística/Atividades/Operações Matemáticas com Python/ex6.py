'''
Enunciado:

Exercício 6)
Arredonde os números a seguir, exibindo sem casas decimais:
x1=1.456
x2=3.678
x3=7.5
'''

x1=1.456
x2=3.678
x3=7.5

variaveis = [x1, x2, x3]

for i in range(len(variaveis)):
    print(f'Arredondando o número {variaveis[i]}: {int(round(variaveis[i]))}')