import os
import json
import csv
import boto3
from datetime import datetime, timedelta
from dotenv import load_dotenv

load_dotenv()

session = boto3.Session(
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
    aws_session_token=os.getenv("AWS_SESSION_TOKEN"),
    region_name="us-east-1",
)
s3_client = session.client("s3")

resposta = s3_client.list_objects_v2(Bucket=os.getenv("NOME_BUCKET"), Prefix="01-bronze")
arquivos_no_bucket = resposta.get('Contents', [])

agora = datetime.now()

dados_ap = []
dados_firewall = []

for obj in arquivos_no_bucket:
    chave_arquivo = obj['Key']
    nome_arquivo = chave_arquivo.split('/')[-1]
    
    if nome_arquivo.endswith(".json"):
        try:
            str_data_arquivo = nome_arquivo[:16]
            data_arquivo = datetime.strptime(str_data_arquivo, '%Y-%m-%d_%H-%M')
        except ValueError:
            continue
    
        diferenca = agora - data_arquivo
    
        if timedelta(minutes=0) <= diferenca <= timedelta(minutes=3, seconds=59):
            resposta_s3 = s3_client.get_object(Bucket=os.getenv("NOME_BUCKET"), Key=chave_arquivo)
            conteudo_texto = resposta_s3['Body'].read().decode('utf-8')
            dados_json = json.loads(conteudo_texto)

            if "firewall" in nome_arquivo.lower():
                dados_firewall.extend(dados_json if isinstance(dados_json, list) else [dados_json])
            elif "ap" in nome_arquivo.lower():
                dados_ap.extend(dados_json if isinstance(dados_json, list) else [dados_json])

if not dados_ap or not dados_firewall:
    print("Nenhum arquivo válido encontrado dentro do prazo de 3m59s em dados_ap ou dados_firewall.")
    exit()

mudancas_cabecalho_access_point = {
    "Bytes_Sent": "Bytes_Sent_AP",
    "Bytes_Recv": "Bytes_Recv_AP",
    "CPU_Usage": "CPU_Usage_AP",
    "RAM_Usage": "RAM_Usage_AP"
}

mudancas_cabecalho_firewall = {
    "CPU_Usage": "CPU_Usage_Firewall",
    "RAM_Usage": "RAM_Usage_Firewall",
    "Bytes_Sent": "Bytes_Sent_Firewall",
    "Bytes_Recv": "Bytes_Recv_Firewall"
}

cabecalho = ["timestamp"]

for item in list(dados_ap[0].keys()):
    cabecalho.append(mudancas_cabecalho_access_point.get(item, item))

for item in list(dados_firewall[0].keys()):
    cabecalho.append(mudancas_cabecalho_firewall.get(item, item))

cabecalho.extend([
    "alta_densidade",
    "gargalo_processamento_ap",
    "gargalo_processamento_firewall",
    "out_of_memory_ap",
    "out_of_memory_firewall",
    "consistência_trafego"
])

dados = []

limite_linhas = min(len(dados_ap), len(dados_firewall))

for i in range(limite_linhas):
    data_hora_atual = datetime.now()
    data_hora_formatada = data_hora_atual.strftime('%Y-%m-%d %H:%M:%S')

    alta_densidade = "Sim" if dados_ap[i].get("Active_conn", 0) > 40 else "Não"
    gargalo_processamento_ap = "Sim" if dados_ap[i].get("CPU_Usage", 0) > 80 else "Não"
    gargalo_processamento_firewall = "Sim" if dados_firewall[i].get("CPU_Usage", 0) > 80 else "Não"
    out_of_memory_ap = "Sim" if dados_ap[i].get("RAM_Usage", 0) > 75 else "Não"
    out_of_memory_firewall = "Sim" if dados_firewall[i].get("RAM_Usage", 0) > 75 else "Não"

    bytes_fw = dados_firewall[i].get("Bytes_Sent", 0)
    bytes_ap = dados_ap[i].get("Bytes_Sent", 0)

    if bytes_fw > bytes_ap:
        consistencia_trafego = "Firewall Enviando mais que recebendo"
    elif bytes_fw < bytes_ap:
        consistencia_trafego = "Access Point enviando mais que firewall recebendo"
    else:
        consistencia_trafego = "Firewall e Access Point em sincrônia"

    linha = [
        data_hora_formatada,
        *dados_ap[i].values(),
        *dados_firewall[i].values(),
        alta_densidade,
        gargalo_processamento_ap,
        gargalo_processamento_firewall,
        out_of_memory_ap,
        out_of_memory_firewall,
        consistencia_trafego
    ]
    dados.append(linha)

nome_arquivo_saida = f"{datetime.now().strftime('%Y-%m-%d_%H-%M')}_bronze2silver.csv"

with open(nome_arquivo_saida, "w", newline="", encoding="utf-8") as csvFile:
    escritor = csv.writer(csvFile, delimiter=';')
    escritor.writerow(cabecalho)
    escritor.writerows(dados)

s3_client.upload_file(
    Filename=nome_arquivo_saida,
    Bucket=os.getenv("NOME_BUCKET"),
    Key=f"02-silver/{nome_arquivo_saida}"
)

print(f"Relatório enviado com sucesso: 02-silver/{nome_arquivo_saida}")