'''
Cálculos realizados a partir do gráfico de classificação de IMC da www.mdsaude.com:

    Baixo Peso Muito Grave: 15,916955017 - 15,873015873 (Menor que 16)
    Baixo Peso Grave: 16,693279141 - 16,780045351 (Maior que 16 e Menor que 17.5)
    Baixo Peso: 18,426534209 - 17,68707483 (Maior que 17.5 e Menor que 18.5)
    Peso Ideal: 21,580033777 - 29,086132483 (Maior que 18.5 Menor que 25)
    Sobrepeso: 25,425295858 - 25,33308313 (Maior que 25 e Menor que 30)
    Obesidade grau I: 34,715706512 - 30,470914127 (Maior que 30 e Menor que 35)
    Obesidade grau II: 39,407018202 - 36,332408508 (Maior que 35 e Menor que 40)
    Obesidade mórbida: 40,898274836 - 40,34528054 (Maior que 40)
'''

lista_usuarios = []
lista_imc = []
lista_classificacao = []

def classificacao_imc(imc):
    if (imc < 16):
        lista_classificacao.append('Baixo Peso Muito Grave')
        return 'Baixo Peso Muito Grave'
    elif (imc < 17.5):
        lista_classificacao.append('Baxio Peso Grave')
        return 'Baxio Peso Grave'
    elif (imc < 18.5):
        lista_classificacao.append('Baixo Peso')
        return 'Baixo Peso'
    elif (imc < 25):
        lista_classificacao.append('Peso Ideal')
        return 'Peso Ideal'
    elif (imc < 30):
        lista_classificacao.append('Sobrepeso')
        return 'Sobrepeso'
    elif (imc < 35):
        lista_classificacao.append('Obesidade grau I')
        return 'Obesidade grau I'
    elif (imc < 40):
        lista_classificacao.append('Obesidade grau II')
        return 'Obesidade grau II'
    else:
        lista_classificacao.append('Obesidade mórbida')
        return 'Obesidade mórbida'

def calculo_imc(nome, altura, peso):
    lista_usuarios.append(nome)
    imc = round(peso / (altura ** 2), 2)
    lista_imc.append(imc)

    return imc

print('\n------------------------------------------\nBem vindo ao Cálculo de IMC!')
while True:
    try:
        primeira_interacao = int(input('Gostaria de realizar algum cálculo? \n1. Sim \n2. Ver Cálculos \n3. Não \nInsira sua opção: '))

        match primeira_interacao:
            case 1:
                print(' \n------------------------------------------\nÓtimo! Vamos realizar o cálculo... Antes, responda algumas perguntas!')

                nome_usuario = input('Insira o nome da pessoa: ')
                altura_usuario = float(input('Insira a sua altura EM METROS (Ex: 1.7): '))
                peso_usuario = float(input('Insira o seu peso EM QUILOGRAMAS (Ex: 61): '))

                if(altura_usuario > 3 or altura_usuario < 0 or peso_usuario > 200 or peso_usuario < 0):
                    print('Você inseriu dados inválidos! Tente novamente... \n------------------------------------------')
                else:
                    imc = calculo_imc(nome_usuario, altura_usuario, peso_usuario)
                    classificacao = classificacao_imc(imc)

                    print(f'O IMC do {nome_usuario} é {imc} - {classificacao} \n------------------------------------------')
            case 2:
                if(len(lista_usuarios) <= 0):
                    print('Você não possue nenhum cálculo... Faça um antes!\n------------------------------------------\n')
                else:
                    print('\n------------------------------------------\nAtualmente você fez estes cálculos: ')
                    for i in range(len(lista_usuarios)):
                        print(f'{i + 1}° Cálculo - Nome: {lista_usuarios[i]} / IMC: {lista_imc[i]} - {lista_classificacao[i]}')
                    print('\n------------------------------------------')
            case 3:
                if(len(lista_usuarios) > 0):
                    print('\n------------------------------------------\nVocê realizou todos esses cálculos!\n------------------------------------------\n')

                    for i in range(len(lista_usuarios)):
                        print(f'{i + 1}° Cálculo - Nome: {lista_usuarios[i]} / IMC: {lista_imc[i]} - {lista_classificacao[i]}')

                print('\n------------------------------------------\nObrigado por utilizar o nosso sistema!')
                break
            case _:
                print('Por favor, utilize uma opção válida \n------------------------------------------\n')  
    except ValueError:
        print('Por favor, utilize uma operação válida \n------------------------------------------\n')