*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Resource    ../base.resource


*** Keywords ***
Valido requisicao GET statuscode=200 e email
    Criar sessao PlaceHolder

    #Criado dicionário com parâmetro para name e solicitado o endereço a partir do endpoint
    #passando o parâmetro criado
    ${params}    Create Dictionary    name=alias odio sit
    ${response}    GET On Session    TesteAPI    ${endP}    params=${params}

    #Resultado aprensendo em Log no terminal e no report por HTML
    Log    \nStatuscode: ${response.status_code}    console=${True}
    Log    ${response.content}
    ${status_code}    Convert To String    ${response.status_code}

    #Validação do status code = 200
    Should be equal    ${status_code}    200

    #Serealizado o contente para a variável de nome json
    ${json}    To JSON    ${response.content}    pretty_print=True
    Log    \n${json}    console=yes

    #Convertida a variável content para json, permitindo a captura da posição email
    #Log gerando em seguida validando a posição
    ${content}    Convert String To Json    ${response.content}
    ${email}    Get Value From JSON    ${content}    [0].email
    Log    \nEmail cadastrado é: ${email}    console=${True}
