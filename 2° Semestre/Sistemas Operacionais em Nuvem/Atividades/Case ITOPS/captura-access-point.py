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

try:
    id_antena = int(input('Digite o identificador da antena: '))
    contador = 0

    acess_point_json = {
        "ID_antena":0,
        "Bytes_Sent":0,
        "Bytes_Recv":0,
        "Active_conn":0,
        "CPU_Usage":0,
        "RAM_Usage":0
    }
    
    while True:
            json_ap = acess_point_json.copy()

            numero_medio_dispositivos = 100

            variacao_dispositivos = random.randint(1, 20) 
            chance_variar = random.randint(1, 2) 

            json_ap["ID_antena"] = id_antena
            json_ap["Bytes_Sent"] = psutil.net_io_counters().bytes_sent
            json_ap["Bytes_Recv"] = psutil.net_io_counters().bytes_recv

            if(chance_variar == 2):
                json_ap["Active_conn"] = numero_medio_dispositivos - variacao_dispositivos
            else:
                json_ap["Active_conn"] = numero_medio_dispositivos

            json_ap["CPU_Usage"] = psutil.cpu_percent(interval=1)

            memoria_ram = psutil.virtual_memory()

            memoria_ram_total = memoria_ram.total
            memoria_ram_disponivel = memoria_ram.available

            porcentagem_ram = ((memoria_ram_total - memoria_ram_disponivel) / memoria_ram_total * 100)

            json_ap["RAM_Usage"] = porcentagem_ram

            print(f"Capturando dados...\nID_antena: {id_antena}\nBytes_Sent: {json_ap["Bytes_Sent"]}\nBytes_Recv: {json_ap["Bytes_Recv"]}\nCPU_Usage: {json_ap["CPU_Usage"]}\nRAM_Usage: {json_ap["RAM_Usage"]}\n\n")

            dados.append(json_ap.copy())

            contador += 1

            if(contador == 60):     
                print("Dados capturados!\n\n")
                contador = 0

                nome_arquivo = f"{datetime.now().strftime('%Y-%m-%d_%H-%M')}_ap{id_antena}.json"

                s3_client.put_object(
                    Bucket=os.getenv("NOME_BUCKET"),
                    Key=f"01-bronze/{nome_arquivo}",
                    Body=json.dumps(dados, ensure_ascii=False, indent=4).encode('utf-8')
                )

except ValueError:
    print("Insira um número válido!")