import csv
import psutil
from datetime import datetime
import os

lista_csv = []
contador = 0

while True:
    try:
        opcao_usuario = int(input("Escolha uma opção que gostaria de realizar: \n1. Adicionar elementos ou Criar um CSV \n2. Sair \nInsira sua opção: "))

        match opcao_usuario:
            case 1:
                quantidade_linhas = int(input("Insira a quantidade de linhas que gostaria de caputrar: "))

                if(quantidade_linhas <= 0):
                    print("Utilize números maior que 0 (zero)\n")
                else:
                    if not os.path.exists("teste.csv"):
                        with open("./dados-gustavo.csv", 'w') as csvfile:
                            # Escrevendo o cabeçalho
                            csv.writer(csvfile, delimiter=';').writerow(['timestamp', 'cpu', 'ram', 'disco'])

                    for i in range(quantidade_linhas):
                        # Descobrindo a data e hora atual
                        data_hora_atual = datetime.now()
                        data_hora_formatada = data_hora_atual.strftime('%Y-%m-%d %H:%M:%S')

                        # Capturando a memória RAM e memória Disco geral
                        memoria_ram = psutil.virtual_memory()
                        disco = psutil.disk_usage("/")

                        # Calculo para descobrir a porcentagem de uso da memória RAM
                        memoria_ram_total = memoria_ram.total
                        memoria_ram_disponivel = memoria_ram.available

                        # Pegando todas as porcentagens: Memória RAM, Memória em Disco e CPU
                        porcentagem_cpu = round(psutil.cpu_percent(interval=1), 2)
                        porcentagem_memoria_ram = round((memoria_ram_total - memoria_ram_disponivel) / memoria_ram_total * 100, 2)
                        porcentagem_disco = round(disco.percent, 2)

                        lista_csv.append([data_hora_formatada, porcentagem_cpu, porcentagem_memoria_ram, porcentagem_disco])

                        print(f'\n{i + 1}° dado capturado: {data_hora_formatada}, {porcentagem_cpu}, {porcentagem_memoria_ram}, {porcentagem_disco}\n')

                        with open("./dados-gustavo.csv", 'a') as csvfile:
                                csv.writer(csvfile, delimiter=';').writerow([data_hora_formatada, porcentagem_cpu, porcentagem_memoria_ram, porcentagem_disco])

                    print("--------------------")
                    print("Dados Capturados!!!")
                    print("--------------------")
            case 2:
                break
            case _:
                print("Escolha uma opçã válida!")
    except ValueError:
        print("Por favor, utilize apenas número inteiros!\n")