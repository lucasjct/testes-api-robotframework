*** Settings ***

Library         RequestsLibrary

*** Test Case ***

Realizar um requisicao simples
    ${response_get}             Get             https://www.google.com

Realizar uma requisição com parametros
    ${response_parametros}      Get             https://www.google.com     params=query=robot    expected_status=200

Realizar uma requisicao GET e obter o JSON
    ${response_get_json_body}   Get             https://jsonplaceholder.typicode.com/posts/2     expected_status=200
    Should Be Equal As Strings  2               ${response_get_json_body.json()}[id]
