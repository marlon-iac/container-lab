# 03 - Execução de Laboratórios (Containerlab)

O Containerlab é a ferramenta de orquestração que permite conectar roteadores, servidores e outros dispositivos em uma topologia virtual completa.

## 📂 Organização dos Laboratórios

Os laboratórios estão organizados na pasta [`labs/`](../labs/). Cada laboratório deve ter seu próprio arquivo `.clab.yml`.

Exemplo de estrutura de um laboratório simples:

```yaml
name: my-lab
topology:
  nodes:
    r1:
      kind: vr-csr
      image: vr-csr:17.03.04 # Imagem gerada pelo vrnetlab
    r2:
      kind: vr-csr
      image: vr-csr:17.03.04
  links:
    - endpoints: ["r1:eth1", "r2:eth1"]
```

Exemplo usando port forwarding para acesso de outras redes:

```yaml
name: cisco_csr1000v
topology:
  nodes:
    csr1:
      startup-config: ./clab-cisco_csr1000v/csr1/config/startup-config.cfg
      kind: cisco_csr1000v
      image: vrnetlab/cisco_csr1000v:17.03.08
      ports:
        - "2222:22"
    csr2:
      # startup-config: ./clab-cisco_csr1000v/csr2/config/startup-config.cfg
      kind: cisco_csr1000v
      image: vrnetlab/cisco_csr1000v:17.03.08
      ports:
        - "2223:22"
  links:
    - endpoints: ["csr1:eth3", "csr2:eth3"]
```

Agora você acessa de outras redes usando o comando `ssh -p 2222 admin@192.168.249.180` onde `admin`é o usuário do device cisco e `192.168.249.180` é o ip do servidor onde está o containerlab e `2222` é o port-forwarding definido no arquivo `.clab.yml` do exemplo acima.


## 🚀 Ciclo de Vida do Laboratório

Acesse o diretório do laboratório desejado onde está o arquivo `*.clab.yml` e use os comandos abaixo:

### 1. Iniciar o laboratório

```bash
clab deploy -t <arquivo-de-topologia>.clab.yml
```

### 2. Inspecionar o laboratório (Ver endereços IP e status)

```bash
clab inspect -t <arquivo-de-topologia>.clab.yml
```

### 3. Acessar um dispositivo

Você pode acessar o console via SSH ou pelo comando:

```bash
docker exec -it clab-<nome-do-lab>-<nome-do-node> ssh admin@localhost
```

ou simplesmente:

```bash
ssh admin@clab-cisco_csr1000v-csr1
```

*Geralmente, o Containerlab mapeia as portas de console automaticamente.*

### 4. Parar e destruir o laboratório

```bash
clab destroy -t <arquivo-de-topologia>.clab.yml
```

## 💡 Dicas Úteis

*   **Gráfico da Topologia:** O Containerlab gera automaticamente um gráfico visual. Use `clab graph -t <lab>.yml` para gerar um link local onde você pode visualizar a topologia.

---
[⬅️ Voltar: Gerenciamento de Imagens](./02-gerenciamento-imagens.md) | [Próximo Passo: Troubleshooting ➡️](./04-troubleshooting.md)
