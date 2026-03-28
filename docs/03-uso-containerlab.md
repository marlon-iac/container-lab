# 03 - Execução de Laboratórios (Containerlab)

O Containerlab é a ferramenta de orquestração que permite conectar roteadores, servidores e outros dispositivos em uma topologia virtual completa.

## 📂 Organização dos Laboratórios

Os laboratórios estão organizados na pasta `labs/`. Cada laboratório deve ter seu próprio arquivo `.clab.yml`.

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

## 🚀 Ciclo de Vida do Laboratório

Acesse a pasta do laboratório desejado e use os comandos abaixo (dentro da VM do Vagrant):

### 1. Iniciar o laboratório
```bash
sudo clab deploy -t <arquivo-de-topologia>.clab.yml
```

### 2. Inspecionar o laboratório (Ver endereços IP e status)
```bash
sudo clab inspect -t <arquivo-de-topologia>.clab.yml
```

### 3. Acessar um dispositivo
Você pode acessar o console via SSH ou pelo comando:
```bash
docker exec -it clab-<nome-do-lab>-<nome-do-node> ssh admin@localhost
```
*Geralmente, o Containerlab mapeia as portas de console automaticamente.*

### 4. Parar e destruir o laboratório
```bash
sudo clab destroy -t <arquivo-de-topologia>.clab.yml
```

## 💡 Dicas Úteis

*   **Gráfico da Topologia:** O Containerlab gera automaticamente um gráfico visual. Use `sudo clab graph -t <lab>.yml` para gerar um link local onde você pode visualizar a topologia.

---
[⬅️ Voltar: Gerenciamento de Imagens](./02-gerenciamento-imagens.md) | [Próximo Passo: Uso do Gemini CLI ➡️](./04-gemini-cli.md)
