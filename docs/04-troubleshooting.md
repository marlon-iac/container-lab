# 04 - Troubleshooting e Dicas de Performance

Este guia reúne soluções para os problemas mais comuns ao rodar este ambiente.

## O Containerlab sobe, mas não consigo acessar o console do roteador

**Possíveis Causas:**

1.  **Imagem mal construída:** Verifique o log do build no vrnetlab (`make docker-image`). Se houver erros no download do binário base do vrnetlab, a imagem Docker não funcionará.

- Verifique logs do device com o comando `docker logs -f clab-cisco_csr1000v-csr1` <-- nome do device que pode ser obtido com o comando `docker ps` ou `clab inspect`


2.  **Delay de Boot:** Roteadores reais demoram de 5 a 10 minutos para dar boot, mesmo em containers. Use `docker ps` para ver se o container está estável ou reiniciando.


---
[⬅️ Voltar ao Início](../README.md)
