import psutil

print('\n----------------------------------------------------\n')

while True:
    memoria_ram = psutil.virtual_memory()
    memoria_swap = psutil.swap_memory()
    disco = psutil.disk_usage("/")

    # Calculo para descobrir a porcentagem de uso da memória RAM
    memoria_ram_total = memoria_ram.total
    memoria_ram_disponivel = memoria_ram.available

    porcentagem_cpu = psutil.cpu_percent(interval=1)
    porcentagem_memoria_ram = (memoria_ram_total - memoria_ram_disponivel) / memoria_ram_total * 100
    porcentagem_memoria_swap = memoria_swap.percent
    porcentagem_disco = disco.percent

    print(f'Porcetagem da utilização da CPU: {round(porcentagem_cpu, 2)}%')
    print(f'Porcetagem da utilização da Memória RAM: {round(porcentagem_memoria_ram, 2)}%')
    print(f'Porcetagem da utilização da Memória SWAP: {round(porcentagem_memoria_swap, 2)}%')
    print(f'Porcetagem da utilização do Armazenamento em Disco: {round(porcentagem_disco, 2)}%')

    print('\n----------------------------------------------------\n')