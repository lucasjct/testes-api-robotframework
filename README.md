# Teste de APIs com Robotframework

Os testes verificam conteúdo e status de chamadas para a [API do GitHub](https://docs.github.com/pt/rest)
***
## Para executar o projeto 
* Crie uma conta no GitHub;
* Clone o projeto;
* Gere um token, copie e cole na variável `${MY_TOKEN}` no arquivo `autenticacao.robot` na pasta `variables`

##  Instalar os pré-requisitos com:
* `- pip install -r requirements.txt`

## Rodar os testes:
* `robot -d resultados test_github/<arquivo_do_test.robot>`