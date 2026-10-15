import psutil
import json
from datetime import datetime
import random
import io, boto3 
import os
from dotenv import load_dotenv

dados = []
load_dotenv()

session = boto3.Session(
aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
aws_session_token=os.getenv("AWS_SESSION_TOKEN"),
region_name="us-east-1",
)
s3_client = session.client("s3")

contador = 0

firewall_json = {
    "Active_sessions":0,
    "Dropped_packets":0,
    "top_blocked_ip":0,
    "CPU_Usage":0,
    "RAM_Usage":0,
    "Bytes_Sent":0,
    "Bytes_Recv":0,
}

while True:
        json_ap = firewall_json.copy()

        numero_medio_sessoes = 100
        
        variacao_dispositivos = random.randint(1, 20) 
        chance_variar = random.randint(1, 2) 

        numero_pacote_perdidos = 0

        pacotes_perdidos = random.randint(0, 100)
        chance_perder = random.randint(1, 5)

        if (chance_variar == 2):
            json_ap["Active_sessions"] = numero_medio_sessoes - variacao_dispositivos
        else:
            json_ap["Active_sessions"] = numero_medio_sessoes 

        if (chance_perder == 5):
            json_ap["Dropped_packets"] = numero_pacote_perdidos 
        else:
            json_ap["Dropped_packets"] = numero_pacote_perdidos + pacotes_perdidos

        ip = ""

        for i in range(4):
            ip_random = random.randint(0, 255)

            if(i == 3):
                ip += f'{ip_random}'
            else:
                ip += f'{ip_random}.'

        json_ap["top_blocked_ip"] = ip

        json_ap["CPU_Usage"] = psutil.cpu_percent(interval=1)

        memoria_ram = psutil.virtual_memory()

        memoria_ram_total = memoria_ram.total
        memoria_ram_disponivel = memoria_ram.available

        porcentagem_ram = ((memoria_ram_total - memoria_ram_disponivel) / memoria_ram_total * 100)

        json_ap["RAM_Usage"] = porcentagem_ram

        aleatorizando_rede_sent = random.randint(0, 30)
        aleatorizando_rede_recv = random.randint(0, 50)

        json_ap["Bytes_Sent"] = (psutil.net_io_counters().bytes_sent) * aleatorizando_rede_sent
        json_ap["Bytes_Recv"] = (psutil.net_io_counters().bytes_recv) * aleatorizando_rede_recv

        print(f"Capturando dados...\nActive_sessions: {json_ap["Active_sessions"]}\nDropped_packets: {json_ap["Dropped_packets"]}\ntop_blocked_ip: {ip}\nCPU_Usage: {json_ap["CPU_Usage"]}\nRAM_Usage: {json_ap["RAM_Usage"]}\nBytes_Sent: {json_ap["Bytes_Sent"]}\nBytes_Recv: {json_ap["Bytes_Recv"]}\n\n")

        dados.append(json_ap.copy())

        contador += 1

        if(contador == 60):     
            print("Dados capturados!\n\n")
            contador = 0

            nome_arquivo = f"{datetime.now().strftime('%Y-%m-%d_%H-%M')}_firewall.json"

            s3_client.put_object(
                Bucket=os.getenv("NOME_BUCKET"),
                Key=f"01-bronze/{nome_arquivo}",
                Body=json.dumps(dados, ensure_ascii=False, indent=4).encode('utf-8')
            )