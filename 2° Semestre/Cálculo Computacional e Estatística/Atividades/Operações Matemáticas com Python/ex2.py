'''
Enunciado:

Crie um programa em Python que:
• Importe a função pow do módulo math.
• Atribua valores para duas variáveis:
o c (ex.: 4)
o d (ex.: 5)
• Calcule usando pow() e armazene em variáveis:
o c_elevado_ao_quadrado → c²
o c_elevado_ao_cubo → c³
o c_elevado_a_quarta → c⁴
o c_elevado_a_d → c elevado a d
• Exiba os resultados com mensagens no formato:
c elevado ao quadrado = <valor>
c elevado ao cubo = <valor>
c elevado a quarta = <valor>
c elevado a d = <valor>
Desafio extra: permita que o usuário digite os valores de c e d em vez de fixá-los no código.

'''

try:
    # Atribuindo valores a variáveis de acordo com as entradas do usuário
    c = int(input('Digite o primeiro número: '))
    d = int(input('Digite o segundo número: '))

    # Calculando a potência usando o pow() e armazenando em variáveis
    c_elevado_ao_quadrado = c ** 2
    c_elevado_ao_cubo = c ** 3
    c_elevado_a_quarta = c ** 4
    c_elevado_a_d = c ** d

    # Exibindo os resultados para o usuário
    print(f'c elevado ao quadrado = {c_elevado_ao_quadrado}')
    print(f'c elevado ao cubo = {c_elevado_ao_cubo}')
    print(f'c elevado a quarta = {c_elevado_a_quarta}')
    print(f'c elevado a d = {c_elevado_a_d}')

except ValueError:
    print('Entrada Inválida!')