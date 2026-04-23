# 01 - Configuração do Ambiente

Este guia detalha como preparar o ecossistema necessário para rodar laboratórios de rede complexos em containers.

## 🏗️ Arquitetura do Projeto

Para garantir isolamento e reprodutibilidade, o projeto utiliza uma estrutura em camadas:

1.  **Host (Seu PC):** Onde você executa o Vagrant.
2.  **VM (Ubuntu 22.04):** Provisionada pelo Vagrant com recursos específicos de hardware e virtualização aninhada (Nested Virtualization).
3.  **Docker:** Motor que roda dentro da VM para gerenciar as imagens dos roteadores.
4.  **Containerlab:** Ferramenta que orquestra os containers Docker para criar as topologias de rede.

## 📋 Pré-requisitos (Host)

*   **Vagrant:** [Download aqui](https://www.vagrantup.com/downloads)
*   **Provedor de Virtualização:** VMware Desktop (Recomendado) ou VirtualBox.
*   **Recursos Livres:** No mínimo **16GB de RAM** (O padrão do projeto é 32GB para suportar múltiplos roteadores CSR1000v).

## 🚀 Subindo o Ambiente

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/marlon-iac/container-lab.git
    cd container-lab
    ```

2.  **Inicie a VM:**
    ```bash
    vagrant up
    ```
    *O comando acima executa o script `setup.sh`, que instala automaticamente o Docker, Containerlab e ishare2.*

3.  **Acesse a VM:**
    ```bash
    vagrant ssh
    ```

## 🛠️ O Script de Provisionamento (`setup.sh`)

O arquivo `setup.sh` automatiza tarefas de instalação no projeto:

*   **Instalação do Containerlab & Docker:** Usa o instalador oficial.
*   **Permissões de Usuário:** Adiciona o usuário `vagrant` aos grupos `docker` e `clab_admins`.
*   **Ferramentas Auxiliares:** Baixa e configura o `ishare2-cli` para download simplificado de imagens.

---
[Próximo Passo: Gerenciamento de Imagens ➡️](./02-gerenciamento-imagens.md)
