*** Settings ***
Resource    ../resources/main.robot
Resource    ../resources/shared/setup_teardown.robot
Resource    ../resources/pages/cadastro.robot
Test Setup    Abrir o site Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verifica se ao submeter o formulário sem preencher nenhum dado, os erros de validação aparecem
    Quando submeto o formulário
    Então vejo os erros de validação nos campos Nome, Cargo e Time 