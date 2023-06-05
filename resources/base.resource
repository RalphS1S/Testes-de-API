*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary

*** Variables ***
${URL_BASE}     https://jsonplaceholder.typicode.com
${endP}         /comments

*** Keywords ***
Criar sessao PlaceHolder
    Create Session    TesteAPI    ${URL_BASE}    verify=true