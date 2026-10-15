# 6. Transferência de arquivos para hosts remotos

## 6.1 Comandos scp e rsync

O scp e rsync são comando responsáveis pela copia de arquivos para diferentes hosts. Ambos os comandos utilizam o protocolo SSH para realizar a comunicação, usando a porta TCP 22, em um canal seguro e realizam a autentificação e criptografia por chave pública.

### 6.1.1 Comando scp

O comando spc copia um arquivo semelhante ao comando "cp" nativo do Linux, mas aceita a sua origem e destino sendo um usuário remoto, ou seja, não estando na mesma máquina. Exemplo de código

```
# Do computador local > instância remota
scp -i chave.pem arquivo-local usuario@ip-publico:/caminho/remoto/

# Da instância remota > computador local
scp -i chave.pem usuario@ip-publico:/caminho/remoto/arquivo.txt ./destino-local/
```

## 6.1.2 Comando rsync

O comando rsync é mais indicado quando o destino precisa ficar sincronizado com a origem. Ele compara origem e destino e transfere apenas diferenças quando possível. Exemplo de código:

```
rsync -avz -e "ssh -i chave.pem" ./origem/ usuario@ip-publico:/caminho/remoto/
```

- -a: modo archive, preserva permissões, timestamps e estrutura de diretórios.
- -v: saída detalhada.
- -z: compressão durante a transferência, útil em links lentos.
- -e: define o comando remoto, neste caso SSH com chave privada.

Utilizar o --dry-run é bastante útil, pois, ele simula uma sincronização, desta forma, você consegue garantir que irá fazer uma sincronização segura e que não vai cair por erro de falta de rede e entre outros problemas. Exemplo de código:

```
rsync -avz --dry-run -e "ssh -i minha-chave.pem" ./origm/ ubuntu@ip-
publico:/destino
```

## 6.2 Diferença entre rsync, scp e sftp

A diferença entre os comandos é dá por causa das diferentes formas de comunicação e funcionalidades que cada um tem.

No rsync, criamos uma conexão em túnel da origem até o destino, além de fazer uma sincronização, ou seja, eu apenas envio os arquivos que foram modificados ou aqueles que não existem no meu destino.

Agora o scp, ele não possui a comunicação em túnel do rsync, ou seja, caso tenha alguma falha de rede, a comunicação pode cair e acabar corrompendo alguns arquivos, e o seu objeto é fazer uma cópia de tudo da sua origem até o seu destino, independente se já existem arquivos no destino que são iguais na origem.

E o stfp possui a conexão em túnel que o rsync possui, mas não é recomendado para arquivos grandes.

Por isso, para arquivos pequenos prefira utilizar o stfp ou o scp, e para arquivos grandes, prefira utilizar o rsync.