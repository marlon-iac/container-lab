# 02 - Gerenciamento de Imagens de Rede

Para rodar roteadores (Cisco, Juniper, etc.) em containers, precisamos passar por um fluxo de conversão. Este projeto automatiza parte desse processo.

## 📥 Etapa 1: Download de Imagens (`ishare2-cli`)

O `ishare2-cli` é uma ferramenta essencial para buscar e baixar imagens `.qcow2` de roteadores proprietários diretamente do **LabHub**.

### Como usar o `ishare2`:

1.  **Buscar uma imagem:**
    ```bash
    ishare2 search csr1000v
    ```

2.  **Baixar a imagem desejada:**
    ```bash
    ishare2 pull <tipo_imagem> <id_da_imagem>
    ```

*As imagens baixadas geralmente são arquivos `.qcow2`. Elas não rodam nativamente no Docker sem conversão.*

---

## 🏗️ Etapa 2: Conversão para Docker (`vrnetlab`)

O [vrnetlab](https://github.com/vrnetlab/vrnetlab) é o "pulo do gato". Ele cria um wrapper em volta da imagem QEMU (o `.qcow2`) para que ela se comporte como um container Docker padrão.

### Exemplo: Criando imagem para o Cisco CSR1000v

1.  **Acesse o diretório do dispositivo desejado no `vrnetlab/`:**
    ```bash
    cd vrnetlab/csr/
    ```

2.  **Mova o arquivo `.qcow2` baixado para este diretório:**
    ```bash
    mv ~/downloads/csr1000v-universalk9.17.03.04.qcow2 .
    ```

3.  **Inicie o build da imagem Docker:**
    ```bash
    make docker-image
    ```

4.  **Verifique a imagem criada:**
    ```bash
    docker images | grep vr-csr
    ```

---

## Limpeza e Boas Práticas

*   **Libere espaço:** Após o comando `make docker-image` finalizar com sucesso, você pode remover o arquivo `.qcow2` original para economizar espaço em disco na VM.
*   **Versionamento:** Sempre anote a tag da imagem gerada (ex: `vr-csr:17.03.04`). Você precisará dessa tag exata no seu arquivo de topologia do Containerlab (`.clab.yml`).

---
[⬅️ Voltar: Configuração do Ambiente](./01-setup-ambiente.md) | [Próximo Passo: Execução de Laboratórios ➡️](./03-uso-containerlab.md)
