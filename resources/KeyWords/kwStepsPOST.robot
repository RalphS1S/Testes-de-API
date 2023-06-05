*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Resource    ../base.resource


*** Keywords ***
Valido resquisicao POST statuscode=201 e id
    Criar sessao PlaceHolder

    #Criados header e body para o POST através de dicionário
    #Feita a requisição informando os parâmentros criados no dicionário
    #e armazenados nas variáveis 
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary
    ...    name=Ralph Souza
    ...    username=Ralph
    ...    email=eu@test.io
    ${response}=    POST On Session    TesteAPI    /users    headers=${headers}    json=${data}

    #Log apresentando no terminal e reportHTML com o status code solicitado.
    Log    \nStatuscode: ${response.status_code}    console=${True}

    #Variável com serealização do json e log com o content 
    ${json}=    To Json    ${response.content}    pretty_print=True
    Log    \n${json}    console=yes

    #Content convertido em JSON para captura de posição no objeto
    #Em seguido log aprensenta resultado
    ${resp_body}=    Convert String To Json    ${response.content}
    ${num_id}=    Get Value From JSON    ${resp_body}    $.id
    Log    \nNúmero do ID: ${num_id}    console=${True}

    #Convercão para string para facilitar a validação do id já capturado
    #anteriormente
    ${num_id}=    Convert Json To String    ${num_id}
    Should Be Equal    ${num_id}    [11]
