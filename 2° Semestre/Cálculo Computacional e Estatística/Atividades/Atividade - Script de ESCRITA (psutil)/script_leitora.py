import csv

arquivos = [
    "dados-arthur.csv",
    "dados-emanuelly.csv",
    "dados-enzo.csv",
    "dados-gustavo.csv",
    "dados-maria.csv",
    "dados-rafael.csv"
]

# Lista de todos os usuários
lista_usuarios = [
    # Proprietário | CPU | RAM | Disco | Hora com o maior consumo de CPU | Hora com o maior consumo de RAM | Hora com o maior consumo de Disco | Maior consumo de CPU | Maior consumo de RAM | Maior consumo de disco | Quantidade de Alertas referente a CPU | Quantidade de Alertas referente a RAM | Quantidade de Alertas referente a Disco
    ["Arthur", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ["Emanuelly", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ["Enzo", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ["Gustavo", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ["Maria", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ["Rafael", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

# Leitura do CSV
for i in range(len(arquivos)):
    with open(arquivos[i], 'r') as csvfile:
        leitura_total = csv.reader(csvfile, delimiter=';')
        # Variáveis para armazenar o total de cada componente
        total_cpu = 0
        total_ram = 0
        total_disco = 0
        
        contador = 0

        # Variáveis para armazenar o maior e hora que teve o maior consumo de cada componente 
        maior_consumo_cpu = 0
        hora_maior_consumo_cpu = ''

        maior_consumo_ram = 0
        hora_maior_consumo_ram = ''

        maior_consumo_disco = 0
        hora_maior_consumo_disco = ''

        # Pulando a linha do cabeçalho
        next(leitura_total)

        for linha in leitura_total:
            # Fazendo a soma de todos os componentes
            total_cpu += float(linha[1])
            total_ram += float(linha[2])
            total_disco += float(linha[3])

            contador += 1

            # Fazendo uma estrutura de comparação para ver qual foi a maior consumo de cada componente
            if(maior_consumo_cpu < float(linha[1])):
                maior_consumo_cpu = float(linha[1])
                hora_maior_consumo_cpu = linha[0]

            if(maior_consumo_ram < float(linha[2])):
                maior_consumo_ram = float(linha[2])
                hora_maior_consumo_ram = linha[0]

            if(maior_consumo_disco < float(linha[3])):
                maior_consumo_disco = float(linha[3])
                hora_maior_consumo_disco = linha[0]

            # Verificando se o uso de CPU foi maior que 40%
            if(float(linha[1]) > 40):
                lista_usuarios[i][10] += 1

            # Verificando se o uso de CPU foi maior que 40%
            if(float(linha[2]) > 40):
                lista_usuarios[i][11] += 1

            # Verificando se o uso de CPU foi maior que 40%
            if(float(linha[3]) > 40):
                lista_usuarios[i][12] += 1


    # Armazenando a media de todos os componentes para cada proprietário
    lista_usuarios[i][1] = round((total_cpu / contador), 2)
    lista_usuarios[i][2] = round((total_ram / contador), 2)
    lista_usuarios[i][3] = round((total_disco / contador), 2)

    # Armazenando o maior consumo de cada componente em cada usuário
    lista_usuarios[i][7] = maior_consumo_cpu
    lista_usuarios[i][8] = maior_consumo_ram
    lista_usuarios[i][9] = maior_consumo_disco

    # Armazenando o horário do maior consumo de cada componente em cada usuário
    lista_usuarios[i][4] = hora_maior_consumo_cpu
    lista_usuarios[i][5] = hora_maior_consumo_ram
    lista_usuarios[i][6] = hora_maior_consumo_disco

# Variáveis para armazenar qual é o maior usuário e qual é o maior valor de consumo de cada componente
maior_media_cpu = 0
proprietario_maior_media_cpu = ''
maior_media_ram = 0
proprietario_maior_media_ram = ''
maior_media_disco = 0
proprietario_maior_media_disco = ''

# Fazendo um laço de repetição para verificar quem consumiu mais de cada componente
for i in (range(len(lista_usuarios))):
    if(maior_media_cpu < lista_usuarios[i][1]):
        maior_media_cpu = lista_usuarios[i][1]
        proprietario_maior_media_cpu = lista_usuarios[i][0]

    if(maior_media_ram < lista_usuarios[i][2]):
        maior_media_ram = lista_usuarios[i][2]
        proprietario_maior_media_ram = lista_usuarios[i][0]
        
    if(maior_media_disco < lista_usuarios[i][3]):
        maior_media_disco = lista_usuarios[i][3]
        proprietario_maior_media_disco = lista_usuarios[i][0]

print('\n')
# Imprimindo as informações calculadas
print('======== Usuários com o maior uso de componentes ========')
print(f'Usuário com maior uso de CPU: {proprietario_maior_media_cpu} - Usando: {maior_media_cpu}%')
print(f'Usuário com maior uso de Memória RAM: {proprietario_maior_media_ram} - Usando: {maior_media_ram}%')
print(f'Usuário com maior uso de Armazenamento em Disco: {proprietario_maior_media_disco} - Usando: {maior_media_disco}%')

print('\n')

#Imprimindo as quanto e quanto cada usuário usou mais CPU
print('======== Horário que cada Usuário consumiu mais CPU ========')
print(f'{lista_usuarios[0][0]} - {lista_usuarios[0][4]} - Consumiu: {lista_usuarios[0][7]}%')
print(f'{lista_usuarios[1][0]} - {lista_usuarios[1][4]} - Consumiu: {lista_usuarios[1][7]}%')
print(f'{lista_usuarios[2][0]} - {lista_usuarios[2][4]} - Consumiu: {lista_usuarios[2][7]}%')
print(f'{lista_usuarios[3][0]} - {lista_usuarios[3][4]} - Consumiu: {lista_usuarios[3][7]}%')
print(f'{lista_usuarios[4][0]} - {lista_usuarios[4][4]} - Consumiu: {lista_usuarios[4][7]}%')
print(f'{lista_usuarios[5][0]} - {lista_usuarios[5][4]} - Consumiu: {lista_usuarios[5][7]}%')

print('\n')

#Imprimindo as quanto e quanto cada usuário usou mais RAM
print('======== Horário que cada Usuário consumiu mais Memória RAM ========')
print(f'{lista_usuarios[0][0]} - {lista_usuarios[0][5]} - Consumiu: {lista_usuarios[0][8]}%')
print(f'{lista_usuarios[1][0]} - {lista_usuarios[1][5]} - Consumiu: {lista_usuarios[1][8]}%')
print(f'{lista_usuarios[2][0]} - {lista_usuarios[2][5]} - Consumiu: {lista_usuarios[2][8]}%')
print(f'{lista_usuarios[3][0]} - {lista_usuarios[3][5]} - Consumiu: {lista_usuarios[3][8]}%')
print(f'{lista_usuarios[4][0]} - {lista_usuarios[4][5]} - Consumiu: {lista_usuarios[4][8]}%')
print(f'{lista_usuarios[5][0]} - {lista_usuarios[5][5]} - Consumiu: {lista_usuarios[5][8]}%')

print('\n')

#Imprimindo as quanto e quanto cada usuário usou mais Disco
print('======== Horário que cada Usuário consumiu mais Disco ========')
print(f'{lista_usuarios[0][0]} - {lista_usuarios[0][6]} - Consumiu: {lista_usuarios[0][9]}%')
print(f'{lista_usuarios[1][0]} - {lista_usuarios[1][6]} - Consumiu: {lista_usuarios[1][9]}%')
print(f'{lista_usuarios[2][0]} - {lista_usuarios[2][6]} - Consumiu: {lista_usuarios[2][9]}%')
print(f'{lista_usuarios[3][0]} - {lista_usuarios[3][6]} - Consumiu: {lista_usuarios[3][9]}%')
print(f'{lista_usuarios[4][0]} - {lista_usuarios[4][6]} - Consumiu: {lista_usuarios[4][9]}%')
print(f'{lista_usuarios[5][0]} - {lista_usuarios[5][6]} - Consumiu: {lista_usuarios[5][9]}%')

print('\n')

#Imprimindo quantas vezes cada usuário usou mais que 40% de CPU
print('======== Quantas vezes cada Usuário usou mais que 40% de CPU ========')
print(f'{lista_usuarios[0][0]} - {lista_usuarios[0][10]}')
print(f'{lista_usuarios[1][0]} - {lista_usuarios[1][10]}')
print(f'{lista_usuarios[2][0]} - {lista_usuarios[2][10]}')
print(f'{lista_usuarios[3][0]} - {lista_usuarios[3][10]}')
print(f'{lista_usuarios[4][0]} - {lista_usuarios[4][10]}')
print(f'{lista_usuarios[5][0]} - {lista_usuarios[5][10]}')

print('\n')

#Imprimindo quantas vezes cada usuário usou mais que 40% de memória RAM
print('======== Quantas vezes cada Usuário usou mais que 40% de memória RAM ========')
print(f'{lista_usuarios[0][0]} - {lista_usuarios[0][11]}')
print(f'{lista_usuarios[1][0]} - {lista_usuarios[1][11]}')
print(f'{lista_usuarios[2][0]} - {lista_usuarios[2][11]}')
print(f'{lista_usuarios[3][0]} - {lista_usuarios[3][11]}')
print(f'{lista_usuarios[4][0]} - {lista_usuarios[4][11]}')
print(f'{lista_usuarios[5][0]} - {lista_usuarios[5][11]}')

print('\n')

#Imprimindo quantas vezes cada usuário usou mais que 40% de Disco
print('======== Quantas vezes cada Usuário usou mais que 40% de Disco ========')
print(f'{lista_usuarios[0][0]} - {lista_usuarios[0][12]}')
print(f'{lista_usuarios[1][0]} - {lista_usuarios[1][12]}')
print(f'{lista_usuarios[2][0]} - {lista_usuarios[2][12]}')
print(f'{lista_usuarios[3][0]} - {lista_usuarios[3][12]}')
print(f'{lista_usuarios[4][0]} - {lista_usuarios[4][12]}')
print(f'{lista_usuarios[5][0]} - {lista_usuarios[5][12]}')


print('\n')