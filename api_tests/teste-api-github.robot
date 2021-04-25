*** Settings ***
Library      RequestsLibrary
Library      Collections
Library      String

Resource                    ../variables/autenticacao.robot


*** Variable ***

${base_url}                 https://api.github.com
${path_issue}               /repos/lucasjct/selenium-python/issues?state=open&label=documentation
${path_reactions}           /repos/lucasjct/selenium-python/issues


*** Test Case ***
Exemplo GET - Receber informacoes básicas
    Conectar com a API do GitHub
    Solicitar informacoes sobre o repositorio

Exemplo Parametros - Receber informacoes com parametros
    Receber informaçoes das issues  # Este caso não precisa de autenticação
    Verificar state "open" e label "documentation"

Exemplo de requisicao com Headers       
    Enviar uma reação "rocket" para a issue "1"
    

*** Keywords ***
Conectar com a API do GitHub
    ${auth}  Create List                   ${LOGIN}             ${PASSWD} 
    Create Session      alias=githubAuth   url=${base_url}      auth=${auth}    disable_warnings=True
    
Solicitar informacoes sobre o repositorio
    ${response}     Get On Session             githubAuth       /users/lucasjct
    Status Should Be        200      ${response}
    Dictionary Should Contain Key    ${response.json()}         id


Receber informaçoes das issues
    Create Session      github              url=${base_url}     disable_warnings=True  # para esta requisição não é necessário autorização
    ${params}       Create Dictionary       ${state}        ${label}
Verificar state "${state}" e label "${label}"

    ${myissues}     GET On Session          alias=github    url=${path_issue}    params=${params}
    Log To Console      ${myissues.json()} 


Enviar uma reação "${reaction}" para a issue "${issue}"

    Create Session  alias=githubReaction         url=${base_url}     disable_warnings=True
    ${headers}      Create Dictionary            Accept=application/vnd.github.squirrel-girl-preview+json     Authorization=Bearer ${MY_TOKEN} 


    ${my_reactions}  Post On Session             alias=githubReaction  url=${path_reactions}/${issue}/reactions
    ...              data={"content":"${reaction}"}      headers=${headers}
    
    Log              ${my_reactions.json()}
    Status Should Be      201      ${my_reactions}