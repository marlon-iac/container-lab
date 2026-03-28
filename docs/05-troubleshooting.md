# 05 - Troubleshooting e Dicas de Performance

Este guia reúne soluções para os problemas mais comuns ao rodar este ambiente.

## O Containerlab sobe, mas não consigo acessar o console do roteador

**Possíveis Causas:**
1.  **Imagem mal construída:** Verifique o log do build no vrnetlab (`make docker-image`). Se houver erros no download do binário base do vrnetlab, a imagem Docker não funcionará.
2.  **Delay de Boot:** Roteadores reais demoram de 3 a 5 minutos para dar boot, mesmo em containers. Use `docker ps` para ver se o container está estável ou reiniciando.

## Erros de Permissão no Docker/Containerlab

Se você receber erros de `permission denied` ao rodar comandos `clab` ou `docker`, certifique-se de que o usuário `vagrant` foi adicionado aos grupos corretos:
```bash
sudo usermod -aG docker vagrant
sudo usermod -aG clab_admins vagrant
# Saia e entre na VM novamente para aplicar
exit
vagrant ssh
```

## 🔵 O comando `gemini` não funciona

**Causa:** O script de provisionamento instala via NVM. Se você não carregou o NVM na sua sessão atual, ele não encontrará o comando.
**Solução:**
```bash
source ~/.nvm/nvm.sh
# Verifique se o binário existe
which gemini
```

---
[⬅️ Voltar ao Início](../README.md)
