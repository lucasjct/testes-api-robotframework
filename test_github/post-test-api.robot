*** Settings ***
Library         Collections
Library         RequestsLibrary
Library         String


Resource          ./variables/autenticacao.robot

*** Variable ***
${base_url}                 https://api.github.com
${uri}                      /repos/lucasjct/selenium-python/issues
${my_user_git}              lucasjct

*** Test Case ***
Exemplo criar uma issue
    Conectar com a API do GitHub
    Criar uma Issue

*** Keywords ***
Conectar com a API do GitHub
    ${headers}          Create Dictionary  Authorization=Bearer ${MY_TOKEN} 
    Create Session      alias=gitIssue     headers=${headers}    url=${base_url}     disable_warnings=True
    
Criar uma Issue
    ${body}         Convert To String   {"owner": "lucasjct","repo": "selenium-python","title": "Issue criada via API By [Lucas Teixira]"}
    ${reponse}      Post On Session     alias=gitIssue      url=${uri}  data=${body}
    Log             ${body}