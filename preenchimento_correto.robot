*** Settings ***
Library  SeleniumLibrary
Resource    setup_teardown.robot
Test Setup    Abrir o site Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}            id:form-nome
${CAMPO_CARGO}           id:form-cargo
${CAMPO_IMAGEM}          id:form-imagem
${CAMPO_TIME}            class:lista-suspensa
${BOTAO_SUBMETER}        id:form-botao
${OPCAO_PROGRAMACAO}     //option[contains(.,'Programação')]
${OPCAO_FRONT_END}       //option[contains(.,'Front-End')]
${OPCAO_DATA_SCIENCE}    //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}          //option[contains(.,'Devops')]
${OPCAO_UX}              //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}          //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}        //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***

Verificar se ao preencher o formulário corretamente um novo card é criado com os dados informados
    Quando preencho o formulário corretamente
    E submeto o formulário
    Então o card aparece na seção adequada
    E as informações estão conforme informei

*** Keywords ***
Quando preencho o formulário corretamente
    Input Text  ${CAMPO_NOME}  Taylor Swift
    Input Text  ${CAMPO_CARGO}  Artista
    Input Text  ${CAMPO_IMAGEM}  https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUBie36ySMDX2Lu3tF2ql2OLAb3mA2gHiF4g&usqp=CAU
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}

E submeto o formulário
    Click Button    ${BOTAO_SUBMETER}

Então o card aparece na seção adequada
    Element Should Be Visible    class:colaborador

E as informações estão conforme informei
    Element Should Be Visible    //h4[contains(.,'Taylor Swift')]
    Element Should Be Visible    //h5[contains(.,'Artista')]
    #Element Should Be Visible    //img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUBie36ySMDX2Lu3tF2ql2OLAb3mA2gHiF4g&usqp=CAU']