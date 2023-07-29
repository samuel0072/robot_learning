*** Settings ***
Library  SeleniumLibrary
Resource    setup_teardown.robot
Test Setup    Abrir o site Organo
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_SUBMETER}        id:form-botao

*** Test Cases ***
Verifica se ao submeter o formulário sem preencher nenhum dado, os erros de validação aparecem
    Quando submeto o formulário
    Então vejo os erros de validação nos campos Nome, Cargo e Time 

*** Keywords ***
Quando submeto o formulário
    Click Button    ${BOTAO_SUBMETER}

Então vejo os erros de validação nos campos Nome, Cargo e Time 
    Element Should Be Visible    //p[@id='form-nome-erro']
    Element Should Be Visible    //p[@id='form-cargo-erro']
    Element Should Be Visible    //p[@id='form-times-erro']