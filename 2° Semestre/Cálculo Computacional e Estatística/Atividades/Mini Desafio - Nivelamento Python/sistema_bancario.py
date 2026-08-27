lista_usuario = []
lista_senha = []
lista_valor = []

def validar_numero(mensagem):
    while True:
        try:
            valor = float(input(mensagem))
            if valor < 0:
                print('Insira um valor positivo!')
            else:
                return valor
        except ValueError:
            print('Entrada inválida! Digite apenas números.')

def cadastro():
    nome = input('Insira o seu nome de usuário: ')
    for usuario in lista_usuario:
        if usuario == nome:
            print('Usuário já cadastrado!')
            return None
    
    senha = input('Insira a sua senha: ')
    lista_usuario.append(nome)
    lista_senha.append(senha)
    lista_valor.append(0)
    print('Cadastro realizado com sucesso!')
    return nome

def login():
    nome = input('Insira o seu nome de usuário: ')
    senha = input('Insira a sua senha: ')
    
    for indice_usuario in range(len(lista_usuario)):
        if lista_usuario[indice_usuario] == nome and lista_senha[indice_usuario] == senha:
            print('Login realizado com sucesso!')
            return indice_usuario
            
    print('Usuário ou senha incorretos!')
    return -1

def deposito(valor, conta_usuario):
    conta_usuario += valor
    print('Deposito realizado com sucesso')
    return conta_usuario

def saque(valor, conta_usuario):
    if conta_usuario < valor:
        print('Você não pode Sacar mais dinheiro que tem na sua conta!')
    else:
        conta_usuario -= valor
        print('Saque realizado com sucesso')
    return conta_usuario

def transferencia(posicao_origem):
    destino = input('Insira o nome do usuário que vai receber a transferência: ')
    posicao_destino = -1
    
    for indice_usuario in range(len(lista_usuario)):
        if lista_usuario[indice_usuario] == destino:
            posicao_destino = indice_usuario

    if posicao_destino == -1:
        print('Usuário de destino não encontrado!')
    elif posicao_destino == posicao_origem:
        print('Você não pode transferir para você mesmo!')
    else:
        valor = validar_numero('Insira o valor da transferência: ')
        if lista_valor[posicao_origem] < valor:
            print('Saldo insuficiente para transferência!')
        else:
            lista_valor[posicao_origem] -= valor
            lista_valor[posicao_destino] += valor
            print('Transferência realizada com sucesso!')

posicao_usuario = -1

while True:
    print('------------------------------------------------------------------')
    if posicao_usuario == -1:
        print('1. Cadastrar \n2. Login \n3. Sair')
        opcao = input('Insira a opção: ')
        
        if opcao == '1':
            cadastro()
        elif opcao == '2':
            posicao_usuario = login()
        elif opcao == '3':
            print('Obrigado por utilizar o nossos serviços!')
            break
        else:
            print('Opção inválida! Tente novamente.')
    else:
        print('Bem-vindo(a), ' + lista_usuario[posicao_usuario] + '!')
        print('Possui, atualmente, em sua conta um total de R$' + str(f"{lista_valor[posicao_usuario]:.2f}"))
        print('1. Deposito \n2. Saque \n3. Transferência \n4. Sair da conta \n5. Sair do sistema')
        opcao_usuario = input('Insira a opção: ')

        if opcao_usuario == '1':
            valor_deposito = validar_numero('Insira o valor do Deposito: ')
            lista_valor[posicao_usuario] = deposito(valor_deposito, lista_valor[posicao_usuario])
        elif opcao_usuario == '2':
            valor_saque = validar_numero('Insira o valor do Saque: ')
            lista_valor[posicao_usuario] = saque(valor_saque, lista_valor[posicao_usuario])
        elif opcao_usuario == '3':
            transferencia(posicao_usuario)
        elif opcao_usuario == '4':
            posicao_usuario = -1
            print('Você saiu da sua conta.')
        elif opcao_usuario == '5':
            print('Obrigado por utilizar o nossos serviços!')
            break
        else:
            print('Opção inválida! Tente novamente.')