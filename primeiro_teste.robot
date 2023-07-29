*** Settings ***

Library  SeleniumLibrary

*** Test Cases ***

Abrir o navegador e acessar o site do organo
    Open Browser    url=http://localhost:3000    browser=Chrome

Preencher os campos do formulário
    Input Text  id:form-nome  Taylor Swift
    Input Text  id:form-cargo  Artista
    Input Text  id:form-imagem  https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUBie36ySMDX2Lu3tF2ql2OLAb3mA2gHiF4g&usqp=CAU
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Click Button    id:form-botao
    Element Should Be Visible    class:colaborador
    Element Should Be Visible    //h4[contains(.,'Taylor Swift')]
    Element Should Be Visible    //h5[contains(.,'Artista')]
    #Element Should Be Visible    //img[src=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUBie36ySMDX2Lu3tF2ql2OLAb3mA2gHiF4g&usqp=CAU]
    #Sleep    10