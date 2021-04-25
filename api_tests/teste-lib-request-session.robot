*** Settings ***
Library         Collections
Library         RequestsLibrary

Suite Setup     Create Session          jsonplaceholder   https://jsonplaceholder.typicode.com
# Com a Create Session, posso criar um contexto HTTP e passar um alias mais uma url que será reutilzada a cada requisição

*** Test Case ***

Realizar uma requisicao GET
    Create Session                      google            https://google.com.br
    ${response_google}                  Get On Session    google  /   expected_status=200
    ${response_json}                    Get On Session    jsonplaceholder    /posts/1
    Should Be Equal As Strings          ${response_google.reason}   OK
    Dictionary Should Contain Value     ${response_json.json()}     sunt aut facere repellat provident occaecati excepturi optio reprehenderit

Realizar uma requisição POST  
    &{data}         Create Dictionary           title=Robot Framework Requests          body=Test Exemple       userId=1  
    ${resp}         Post On Session     jsonplaceholder     /posts   json=${data}       expected_status=anything
    Status Should Be   201  ${resp}
    Dictionary Should Contain Key       ${resp.json()}  id