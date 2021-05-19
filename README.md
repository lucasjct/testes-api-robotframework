# Teste de APIs com Robotframework

Os testes verificam conteúdo e status de chamadas para a [API do GitHub](https://docs.github.com/pt/rest)

***
## Para executar o projeto 
* Crie uma conta no GitHub
* Clone o projeto
* Gere um [token](https://github.com/settings/tokens), copie e cole na variável `${MY_TOKEN}` dentro do arquivo `autenticacao.robot` na pasta `variables`

##  Instalar os pré-requisitos com:
* `- pip install -r requirements.txt`

## Rodar os testes:
* `robot -d resultados test_github/<arquivo_do_test.robot>`  

***

Para mais detalhes, consulte a documentação da RequestLibrary em: 

https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html