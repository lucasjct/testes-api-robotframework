*** Settings ***
Library             Collections
Library             RequestsLibrary

Resource            ./variables/autenticacao.robot

*** Variable ***
${base_url}         https://api.github.com
${path}             repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues
${payload}          {"body":"Cadastrado via Robot Framework!"}

*** Test Case ***
Cenario 1 - Gerar um comentário via API
    [tags]   gerar-comentario
    Conectar na API do GitHub
    Gerar um comentário na "12"

*** Keywords ***
Conectar na API do GitHub
    ${headers}      Create Dictionary        Accept=application/vnd.github.v3+json    Authorization=Bearer ${MY_TOKEN}
    Create Session  alias=git_coments        headers=${headers}     url=${base_url}   disable_warnings=True

Gerar um comentário na "${issue}"
    ${body}         Convert To String        ${payload} 
    ${response}     Post On Session          alias=git_coments     data=${body}       url=${path}/${issue}/comments 
    Status Should Be   201  ${response}
