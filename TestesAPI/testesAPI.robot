*** Settings ***
Library     RequestsLibrary
Resource    ../resources/KeyWords/kwStepsGET.robot
Resource    ../resources/KeyWords/kwStepsPOST.robot
Resource    ../resources/KeyWords/kwStepsPUT.robot


*** Test Cases ***
GET status statuscode=200 e email
    [Tags]  GET
    Valido requisicao GET statuscode=200 e email

POST statuscode=201 e id
    [Tags]  POST
    Valido resquisicao POST statuscode=201 e id

PUT statuscode=201 alteracao de dados
    [Tags]  PUT
    Valido requisicao PUT statuscode=200 e alteracao de dados