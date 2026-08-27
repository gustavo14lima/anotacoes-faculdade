'''
Enunciado:

Exercício 5)
• Teste a função round usando casas decimais, inclusive 0 casas
• Por que não importamos o round?
'''

try:
    numero = float(input('Digite um número, de preferencia, com casas decimais: '))

    print(f'Seu número arredondado é: {round(numero)}')
except ValueError:
    print('Entrada inválida')

'''
Resposta para o enunciado:
    A função round() é uma função nativda do python, assim como o print(), é uma função que já existe dentro da linguagem. Sua função é realizar um arredondamento dos números, além disso, é possível adicioanr uma quantidade de casas decimais para o arredondamento. Percebi que o arredondamento do round() funciona da seguinte maneira: caso o número ter uma casa decimal menor que 0.5, ele arredonda para baixo (assim como a função floor()) e caso seja maior 0.5, arredonda para cima, (igual ao ceil())

'''    