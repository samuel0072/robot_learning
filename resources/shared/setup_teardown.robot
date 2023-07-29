*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:3000/

*** Keywords ***

Abrir o site Organo
    Open Browser    url=${URL}    browser=Chrome

Fechar o navegador
    Close Browser