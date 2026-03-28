#!/bin/bash
#
# Script de provisionamento para a VM do container-lab
# Instala containerlab, Docker, nvm, Node.js e o Gemini CLI.

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


# --- Instalação do NVM, Node.js e Gemini CLI ---
echo "Preparando para instalar NVM, Node.js e Gemini CLI..."

# Instalação de dependências essenciais para o Node.js/NVM
echo "Instalando dependências essenciais (build-essential, curl)..."
sudo apt update
sudo apt install -y build-essential curl

# Define a versão do NVM
# Recomendo fixar a versão para garantir reprodutibilidade.
# Você pode verificar a última versão estável em https://github.com/nvm-sh/nvm/releases
export NVM_VERSION="v0.40.4"

# Baixa e executa o script de instalação do NVM
echo "Instalando NVM ($NVM_VERSION)."
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash

# Carrega o NVM NA SESSÃO ATUAL DO SCRIPT
# Isso é CRUCIAL para que os comandos 'nvm' funcionem imediatamente
echo "Carregando NVM na sessão atual do script..."
export NVM_DIR="$HOME/.nvm" # Garante que NVM_DIR está configurado
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Instala a versão mais recente do Node.js LTS (Long Term Support)
echo "Instalando a versão mais recente do Node.js LTS via NVM..."
nvm install --lts

# Define a versão recém-instalada do Node.js como padrão para futuras sessões
echo "Definindo a versão do Node.js instalada como padrão..."
nvm alias default node

# Verifica as versões do Node.js e npm (para fins de debug no log de provisionamento)
echo "Verificando as versões instaladas de Node.js e npm..."
node -v
npm -v

# Instala o Gemini CLI globalmente
echo "Instalando o Google Gemini CLI globalmente..."
npm install -g @google/gemini-cli

# Instala o ishare2-cli
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/ishare2-org/ishare2-cli/main/ishare2
sudo chmod +x /usr/sbin/ishare2
# 1. Libera sudo sem senha só pro ishare2
echo "vagrant ALL=(ALL) NOPASSWD: /usr/sbin/ishare2" | sudo tee /etc/sudoers.d/ishare2 > /dev/null
# 2. Cria o alias pra você nunca mais precisar digitar "sudo"
echo 'alias ishare2="sudo ishare2"' >> ~/.bashrc
# 3. Aplica o alias agora
source ~/.bashrc

echo "Provisionamento concluído com sucesso."
echo "IMPORTANTE: Para que todas as mudanças (grupos de usuário e NVM) funcionem, você DEVE fazer logout e login novamente na VM."
echo "Após o login, você poderá usar 'gemini' no terminal."
