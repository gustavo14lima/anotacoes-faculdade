import os
import csv
from datetime import datetime
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

resposta = s3_client.list_objects_v2(Bucket=os.getenv("NOME_BUCKET"), Prefix="02-silver")
arquivos_no_bucket = resposta.get('Contents', [])

agora = datetime.now()
linhas_silver = []

for obj in arquivos_no_bucket:
    chave_arquivo = obj['Key']
    nome_arquivo = chave_arquivo.split('/')[-1]
    
    if ".csv" in nome_arquivo and "bronze2silver" in nome_arquivo:
        
        str_data_arquivo = nome_arquivo[:16]
        
    
        data_arquivo = datetime.strptime(str_data_arquivo, '%Y-%m-%d_%H-%M')
        diferenca = agora - data_arquivo
        
        if timedelta(minutes=0) <= diferenca <= timedelta(minutes=3, seconds=59):
            print(f"Lendo CSV válido dentro do prazo: {nome_arquivo}")
            
            resposta_s3 = s3_client.get_object(Bucket=os.getenv("NOME_BUCKET"), Key=chave_arquivo)

            conteudo_texto = resposta_s3['Body'].read().decode('utf-8')
            
            linhas = conteudo_texto.splitlines()
            
            if len(linhas) > 0:
                cabecalho_original = linhas[0].split(';')
                
                for linha_texto in linhas[1:]:
                    if linha_texto.strip():
                        linha = linha_texto.split(';')
                        linhas_silver.append(linha)

agrupado_antenas = {}

for linha in linhas_silver:
    id_antena = linha[1]
    bytes_sent_ap = float(linha[2])
    bytes_recv_ap = float(linha[3])
    active_conn = float(linha[4])
    cpu_ap = float(linha[5])
    ram_ap = float(linha[6])
    
    dropped_packets = float(linha[8])
    cpu_firewall = float(linha[10])
    bytes_sent_fw = float(linha[12])
    bytes_recv_fw = float(linha[13])

    if id_antena not in agrupado_antenas:
        agrupado_antenas[id_antena] = {
            "total_registros": 0,
            "soma_bytes_sent_ap": 0.0,
            "soma_bytes_recv_ap": 0.0,
            "soma_active_conn": 0.0,
            "soma_cpu_ap": 0.0,
            "soma_ram_ap": 0.0,
            "soma_dropped_packets": 0.0,
            "soma_cpu_firewall": 0.0,
            "soma_bytes_sent_fw": 0.0,
            "soma_bytes_recv_fw": 0.0,
            "ultimas_conexoes": []
        }

    agrupado_antenas[id_antena]["total_registros"] += 1
    agrupado_antenas[id_antena]["soma_bytes_sent_ap"] += bytes_sent_ap
    agrupado_antenas[id_antena]["soma_bytes_recv_ap"] += bytes_recv_ap
    agrupado_antenas[id_antena]["soma_active_conn"] += active_conn
    agrupado_antenas[id_antena]["soma_cpu_ap"] += cpu_ap
    agrupado_antenas[id_antena]["soma_ram_ap"] += ram_ap
    agrupado_antenas[id_antena]["soma_dropped_packets"] += dropped_packets
    agrupado_antenas[id_antena]["soma_cpu_firewall"] += cpu_firewall
    agrupado_antenas[id_antena]["soma_bytes_sent_fw"] += bytes_sent_fw
    agrupado_antenas[id_antena]["soma_bytes_recv_fw"] += bytes_recv_fw
    agrupado_antenas[id_antena]["ultimas_conexoes"].append(active_conn)

trafego_total_predio = 0.0
for id_antena in agrupado_antenas:
    trafego_total_predio += agrupado_antenas[id_antena]["soma_bytes_sent_ap"] + agrupado_antenas[id_antena]["soma_bytes_recv_ap"]

cabecalho = [
    "ID_antena",
    "total_trafego_ap_bytes",
    "media_conexoes_ativas",
    "media_cpu_ap",
    "eficiencia_hardware_ratio",
    "percentual_consumo_predio",
    "zona_subutilizada",
    "predicao_sobrecarga_risco",
    "analise_expurgo_seguranca",
    "gargalo_saida_firewall"
]

dados = []

limite_conexoes_ap = 50.0  

for id_antena in agrupado_antenas:
    total_reg = agrupado_antenas[id_antena]["total_registros"]
    
    media_conn = agrupado_antenas[id_antena]["soma_active_conn"] / total_reg
    media_cpu_ap = agrupado_antenas[id_antena]["soma_cpu_ap"] / total_reg
    media_cpu_fw = agrupado_antenas[id_antena]["soma_cpu_firewall"] / total_reg
    
    total_bytes_ap = agrupado_antenas[id_antena]["soma_bytes_sent_ap"] + agrupado_antenas[id_antena]["soma_bytes_recv_ap"]

    soma_todas_conexoes = 0.0
    quantidade_antenas = len(agrupado_antenas)

    for info in agrupado_antenas.values():
        soma_todas_conexoes += (info["soma_active_conn"] / info["total_registros"])

    media_global_conexoes = soma_todas_conexoes / quantidade_antenas
    media_global_trafego = trafego_total_predio / quantidade_antenas

    limite_conexoes_predio = media_global_conexoes 
    limite_trafego_predio = media_global_trafego
    
    if (media_conn < limite_conexoes_predio and total_bytes_ap < limite_trafego_predio):
        zona_subutilizada = "Sim - Antena com uso muito abaixo da média do prédio (Sugerido Redimensionar)"
    else:
        zona_subutilizada = "Não - Uso normal ou elevado"

    if media_cpu_ap > 0:
        eficiencia_hardware = total_bytes_ap / media_cpu_ap
    else:
        eficiencia_hardware = total_bytes_ap

    conexoes = agrupado_antenas[id_antena]["ultimas_conexoes"]
    if len(conexoes) >= 2:
        tendencia_crescimento = conexoes[-1] - conexoes[0]
    else:
        tendencia_crescimento = 0

    if media_conn >= limite_conexoes_ap * 0.8:
        predicao_sobrecarga_risco = "ALTO - AP perto do limite de conexões simultâneas"
    elif tendencia_crescimento > 10:
        predicao_sobrecarga_risco = "MÉDIO - Tendência de alta no número de conexões"
    else:
        predicao_sobrecarga_risco = "BAIXO - Operação estável"

    if trafego_total_predio > 0:
        percentual_consumo = round((total_bytes_ap / trafego_total_predio) * 100, 2)
    else:
        percentual_consumo = 0.0

    total_pacotes_bloqueados = agrupado_antenas[id_antena]["soma_dropped_packets"]
    if total_pacotes_bloqueados > 500 and media_cpu_fw > 75:
        analise_expurgo_seguranca = "CRÍTICO - Alto volume de descartes e CPU do Firewall saturada (Possível DDoS)"
    elif total_pacotes_bloqueados > 200:
        analise_expurgo_seguranca = "ALERTA - Volume elevado de pacotes bloqueados"
    else:
        analise_expurgo_seguranca = "NORMAL - Descarte de pacotes sob controle"

    if media_cpu_fw > 80:
        gargalo_saida_firewall = "Gargalo no Hardware do Firewall (Processamento de Regras esgotado)"
    else:
        gargalo_saida_firewall = "Firewall operando dentro da margem de segurança"

    dados.append([id_antena, total_bytes_ap, round(media_conn, 2), round(media_cpu_ap, 2), round(eficiencia_hardware, 2), {percentual_consumo}, zona_subutilizada, predicao_sobrecarga_risco, analise_expurgo_seguranca, gargalo_saida_firewall])

nome_arquivo_saida = f"{datetime.now().strftime('%Y-%m-%d_%H-%M')}_silver2gold.csv"

with open(nome_arquivo_saida, "w", newline="", encoding="utf-8") as csvFile:
    csv.writer(csvFile, delimiter=';').writerow(cabecalho)

    for i in dados:
        csv.writer(csvFile, delimiter=';').writerow(i)

s3_client.upload_file(
    Filename=nome_arquivo_saida,
    Bucket=os.getenv("NOME_BUCKET"),
    Key=f"03-gold/{nome_arquivo_saida}"
)

print(f"Relatório de negócio gerado com sucesso: {nome_arquivo_saida}")