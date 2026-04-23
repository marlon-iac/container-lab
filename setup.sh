#!/bin/bash
#
# Script de provisionamento para a VM do container-lab
# Instala containerlab

# --- Configurações Iniciais ---
export DEBIAN_FRONTEND=noninteractive # Evita prompts interativos do apt

# --- Instalação do Containerlab e Docker ---
echo "Instalando containerlab e Docker..."
# Impede que o script do containerlab modifique a configuração do SSH
export SETUP_SSHD="false"
# Inclui "docker" para garantir que o Docker CE seja instalado se não estiver lá
curl -sL https://containerlab.dev/setup | sudo -E bash -s "all"

# Adiciona o usuário 'vagrant' aos grupos necessários
# A associação aos grupos será efetivada no próximo login
echo "Adicionando usuário 'vagrant' aos grupos 'clab_admins' e 'docker'..."
sudo usermod -aG clab_admins vagrant
sudo usermod -aG docker vagrant

# clona repositório git vrnetlab
git clone https://github.com/srl-labs/vrnetlab.git

echo "Provisionamento concluído com sucesso."