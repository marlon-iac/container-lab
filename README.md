# Container-lab com Vagrant & Gemini CLI

Repositório pessoal para simulação e teste de topologias de rede avançadas em containers, utilizando **Containerlab** e imagens de roteadores proprietários via **vrnetlab**.

---

## 🏗️ Estrutura do Projeto

O ambiente é orquestrado em camadas para garantir que você tenha tudo o que precisa sem sujar seu sistema host:

1.  **Vagrant:** Provisiona uma VM Ubuntu 22.04 isolada.
2.  **Docker:** Motor de execução dos roteadores.
3.  **vrnetlab:** Converte imagens `.qcow2` (Cisco, Juniper, etc.) em containers Docker.
4.  **Containerlab:** Ferramenta que desenha e conecta os roteadores.
5.  **Gemini CLI:** Assistente de IA no terminal para acelerar configurações.

---

## 🚀 Quick Start (5 Minutos)

Se você já tem o **Vagrant** instalado, siga os passos abaixo para subir o ambiente completo:

1.  **Clone o projeto e entre no diretório:**
    ```bash
    git clone https://github.com/marlon-iac/container-lab.git
    cd container-lab
    ```

2.  **Suba e acesse a máquina virtual:**
    ```bash
    vagrant up    # Aguarde a instalação automática (~5 min)
    vagrant ssh
    ```

3.  **Confirme a instalação:**
    ```bash
    containerlab version
    docker --version
    ```

---

## 📚 Documentação Detalhada

Para entender a fundo como o projeto funciona ou como realizar tarefas específicas, siga o fluxo de leitura:

1.  **[Configuração do Ambiente](./docs/01-setup-ambiente.md):** Detalhes sobre a VM, Vagrant e provisionamento.
2.  **[Gerenciamento de Imagens](./docs/02-gerenciamento-imagens.md):** Como baixar (`ishare2`) e converter imagens para Docker (`vrnetlab`).
3.  **[Execução de Laboratórios](./docs/03-uso-containerlab.md):** Comandos do Containerlab e como rodar as topologias.
4.  **[Uso do Gemini CLI](./docs/04-gemini-cli.md):** Como usar a inteligência artificial para auxiliar nas configurações.
5.  **[Troubleshooting](./docs/05-troubleshooting.md):** Soluções para problemas comuns e dicas de performance.

---

## 🛠️ Tecnologias Utilizadas

*   [Containerlab](https://containerlab.dev/)
*   [Vagrant](https://www.vagrantup.com/)
*   [vrnetlab](https://github.com/vrnetlab/vrnetlab)
*   [ishare2-cli](https://github.com/ishare2-org/ishare2-cli)
*   [Google Gemini CLI](https://github.com/google/gemini-cli)