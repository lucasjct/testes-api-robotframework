*** Settings ***
Library         RequestsLibrary
Library         Collections

*** Variable ***
${base_url}             https://api.github.com      
${path}                 repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues
${endpoint}             comments
${param}                direction=asc

*** Test Case ***
Cenario 1 - Listar comentários da issue
    Conectar com a API do GitHub
    Listar todos comentarios da issue "12"

*** Keywords ***
Conectar com a API do GitHub
    Create Session      alias=github_comments   url=${base_url}      disable_warnings=True
    ${headers}          Create Dictionary       Accept=application/vnd.github.v3+json

Listar todos comentarios da issue "${issue}"
    ${response}     Get On Session      alias=github_comments   url=${base_url}/${path}/${issue}/${endpoint}?${param}
    Log             ${response.json()}   
    Status Should Be    200     ${response}
