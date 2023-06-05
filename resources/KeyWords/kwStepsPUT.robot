*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Resource    ../base.resource


*** Keywords ***
Valido requisicao PUT statuscode=200 e alteracao de dados
    Criar sessao PlaceHolder

    #Criados header e body para o PUT através de dicionário
    #Feita a requisição informando os parâmentros criados no dicionário
    #e armazenados nas variáveis, variável geo armazena os informações
    # que serão enviadas no método   
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${geo}=    Evaluate    {"lat": "10.1234", "lng": "20.5678"}
    ${data}=    Create Dictionary
    ...    address="geo": ${geo}

    #Log apresentando no terminal e reportHTML com o status code solicitado.
    ${response}=    PUT On Session    TesteAPI    /users/5    headers=${headers}    json=${data}

    #Comparação da informação armazenada no status_code com o strig selecionada (200)
    #Logs com as informações de status e objeto e boleano entre os valores 
    Should Be Equal As Strings    ${response.status_code}    200
    Log    \nStatuscode: ${response.status_code}
    Log    \nGeolocalização de data contida: ${geo}    console=${True}
    Should Be True    ${geo}    ${data}
