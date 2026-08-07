# Armazenando o nome e o valor da contado usuário
lista_usuario = []
lista_valor = []

# Capturando o nome do usuário
def iniciar_conta():
    nome = input('Insira o seu nome completo: ')
    lista_usuario.append(nome)
    lista_valor.append(0)

    return nome

nome_usuario = iniciar_conta()

# Mensagens de boas-vindas para o usuário
print('Bem-vindo(a), ' + nome_usuario + '!')

# Descobrindo em qual posição o usuário está
posicao_usuario = 0
for i in range(len(lista_usuario)):
    if lista_usuario[i] == nome_usuario:
        posicao_usuario = i

# Criando funções para cada função do sistema bancario
def deposito(valor, conta_usuario):
    conta_usuario += valor
    print('Deposito realizado com sucesso')

    return conta_usuario

def saque(valor, conta_usuario):
    if(conta_usuario < valor):
        print('Você não pode Sacar mais dinheiro que tem na sua conta!')
    else:
        conta_usuario -= valor
        print('Saque realizado com sucesso')

    return conta_usuario


while True:
    print('------------------------------------------------------------------')

    # Opções que o usuário pode escolher no sistema bancario
    print('Possui, atualmente, em sua conta um total de R$' + str(f"{lista_valor[posicao_usuario]:.2f}"))
    opcao_usuario = int(input('Qual opção você gostaria de fazer? \n 1. Deposito \n 2. Saque \n 3. Sair \n Insira a opção: '))

    # De acordo com a resposta do usuário, ele será direcionado para a opção correspondente
    if opcao_usuario == 1:
        valor_deposito = float(input('Insira o valor do Deposito: '))
        lista_valor[posicao_usuario] = deposito(valor_deposito, lista_valor[posicao_usuario])

    elif opcao_usuario == 2:
        valor_saque = float(input('Insira o valor do Saque: '))
        lista_valor[posicao_usuario] = saque(valor_saque, lista_valor[posicao_usuario])
    elif opcao_usuario == 3:
        print('Obrigado por utilizar o nossos serviços!')
        break
    # Caso o usuário coloque uma opção inválida
    else:
        print('Opção inválida! Tente novamente.')