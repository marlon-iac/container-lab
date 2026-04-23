# 02 - Gerenciamento de Imagens de Rede

Para rodar roteadores (Cisco, Juniper, etc.) em containers, precisamos passar por um fluxo de conversão. Este projeto automatiza parte desse processo.

## 📥 Etapa 1: Download de Imagens

Pode baixar as imagens das seguintes referencias:

- https://drive.labhub.eu.org/

### Imagens testadas

#### Cisco

- csr1000vng-universalk9.16.04.01: funciona
- csr1000vng-universalk9.17.03.08a-serial: funciona

---

## 🏗️ Etapa 2: Conversão para Docker (`vrnetlab`)

O [vrnetlab](https://github.com/srl-labs/vrnetlab) é o "pulo do gato". Ele cria um wrapper em volta da imagem QEMU (o `.qcow2`) para que ela se comporte como um container Docker padrão.

### Exemplo: Criando imagem para o Cisco CSR1000v

1.  **Acesse o diretório do dispositivo desejado no `vrnetlab/`:**

    ```bash
    cd vrnetlab/cisco/csr1000v
    ```

2.  **Mova o arquivo `.qcow2` baixado para este diretório:**

    ```bash
    mv <caminho_do_download>/csr1000v-universalk9.17.03.04.qcow2 vrnetlab/cisco/csr1000v
    ```

3.  **Inicie o build da imagem Docker:**

    ```bash
    make docker-image
    ```

4.  **Verifique a imagem criada:**

    ```bash
    docker images
    ```

---

## Limpeza e Boas Práticas

*   **Libere espaço:** Após o comando `make docker-image` finalizar com sucesso, você pode remover o arquivo `.qcow2` original para economizar espaço em disco.
*   **Versionamento:** Sempre anote a tag da imagem gerada (ex: `vrnetlab/cisco_csr1000v:17.03.08`). Você precisará dessa tag exata no seu arquivo de topologia do Containerlab (`.clab.yml`).

---
[⬅️ Voltar: Configuração do Ambiente](./01-setup-ambiente.md) | [Próximo Passo: Execução de Laboratórios ➡️](./03-uso-containerlab.md)
