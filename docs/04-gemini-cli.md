# 04 - Auxílio com Gemini CLI (IA no Terminal)

Este projeto inclui o **Google Gemini CLI**, uma ferramenta poderosa que permite interagir com inteligência artificial diretamente do terminal da VM.

## 🤖 Por que usar IA em laboratórios de rede?

Configurar topologias complexas, debugar erros de BGP ou criar scripts Ansible pode levar tempo. O Gemini CLI ajuda a acelerar esse processo.

### Exemplos de uso dentro da VM:

1.  **Gerar arquivos `.clab.yml`:**
    ```bash
    gemini "Crie um arquivo containerlab para 2 roteadores Cisco interconectados via eth1"
    ```

2.  **Explicar comandos de rede:**
    ```bash
    gemini "Como configurar OSPF em um roteador Cisco CSR1000v?"
    ```

3.  **Debugar erros do Docker/Containerlab:**
    ```bash
    gemini "Estou com erro 'permission denied' ao rodar sudo clab deploy. Como resolver?"
    ```

## ⚙️ Configuração Inicial

O provisionamento já instala o Gemini CLI, mas você precisa configurar sua API KEY na primeira vez que acessar a VM:

1.  Obtenha sua chave em: [Google AI Studio](https://aistudio.google.com/app/apikey)
2.  No terminal da VM, execute:
    ```bash
    export GOOGLE_API_KEY="SUA_CHAVE_AQUI"
    # Adicione ao seu .bashrc para persistir
    echo 'export GOOGLE_API_KEY="SUA_CHAVE_AQUI"' >> ~/.bashrc
    ```

## 🚀 Dicas de Produtividade

Combine o Gemini com comandos do sistema para análise rápida:
```bash
sudo clab inspect -t lab.yml | gemini "Resuma o status deste laboratório para mim"
```

---
[⬅️ Voltar: Execução de Laboratórios](./03-uso-containerlab.md) | [Próximo Passo: Troubleshooting ➡️](./05-troubleshooting.md)
