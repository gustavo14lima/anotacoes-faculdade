#!/bin/bash
# monitor_recursos.sh - Monitora CPU, RAM e armazenamento e gera um log

LOG="registro_recursos.log"
INTERVALO=5   # segundos entre cada amostragem
AMOSTRAS=3    # número de coletas
PORCENTAGEM_DISCO=$(df -h / | awk 'NR == 2 {print $5}' | tr -d '%')	# Variável para armazenar apenas os números inteiros da porcentagem de uso de disco
SOMA_USO_CPU=$(top -b -n 1 | tail -n +8 | awk '{soma+=$9} END {print soma}')

echo "Iniciando monitoramento em $(date)" | tee "$LOG"

for ((i = 1; i <= AMOSTRAS; i++)); do
  echo "==========================================="
  echo "Amostra $i em $(date '+%d/%m/%Y %H:%M:%S')"
  echo "-------------------------------------------"

  # 1) CPU: processo que mais está usando a CPU no momento
  echo "-- TOP 3 PROCESSOS POR CPU --"
  ps aux --sort=-%cpu | awk 'NR <= 4 {printf "%-8s %5s %s\n", $3"%", $2, $11}'

  # Capturando a carga de CPU da máquina inteira, não só de um processo.
  echo "Quantidade de CPU utilizada pela máquina inteira: ${SOMA_USO_CPU}%"

  # 2) RAM: total, usada e disponível
  echo "-- MEMÓRIA RAM --"
  free -h | awk '/^Mem:/ {print "Total:", $2, "| Usada:", $3, "| Livre:", $4}'
  echo "Memória em swap usada: $(free -m | awk '/Swap:/ {print $3}') MiB"

  # 3) Armazenamento: uso da partição raiz /
  echo "-- ARMAZENAMENTO (partição /) --"
  df -h / | awk 'NR == 2 {print "Disponível:", $4, "| Uso:", $5}'
  # 1. Imprimindo um alerta para quando o use de disco passar de 80%
  if [ "$PORCENTAGEM_DISCO" -ge 80 ]; then
    echo "ALERTA!!! O armazenamento passou de 80%!!!"
 fi

  # Adicionando o comando uptime, e a métrica load average no relátorio
  echo "-- LOAD AVERAGE (UPTIME) --"
  uptime | awk '{print $8, $9, $10}'


  echo "-------------------------------------------"
  echo "Registrado no arquivo: $LOG"
  sleep "$INTERVALO"

if [ "$i" -lt "$AMOSTRAS" ]; then
    sleep "$INTERVALO"
  fi
done | tee -a "$LOG"

echo "Monitoramento concluído em $(date)" | tee -a "$LOG"
