*** Settings ***
Resource    ../main.robot

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

Quando crio vários colaboradores
    [Arguments]  ${nomes}    ${cargos}    ${times}

    FOR    ${nome}    ${cargo}    ${time}    IN ZIP    ${nomes}    ${cargos}    ${times}
        Input Text  ${CAMPO_NOME}  ${nome}
        Input Text  ${CAMPO_CARGO}  ${cargo}
        Input Text  ${CAMPO_IMAGEM}  https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUBie36ySMDX2Lu3tF2ql2OLAb3mA2gHiF4g&usqp=CAU
        Click Element    ${CAMPO_TIME}
        Click Element    ${time}
        E submeto o formulário
    END

Então as informações de cada um estão conforme informei
    [Arguments]  ${nomes}    ${cargos}    ${times}

    FOR    ${nome}    ${cargo}    IN ZIP    ${nomes}    ${cargos}
        Element Should Be Visible    //h4[contains(.,'${nome}')]
        Element Should Be Visible    //h5[contains(.,'${cargo}')]
    END

Então vejo os erros de validação nos campos Nome, Cargo e Time 
    Element Should Be Visible    //p[@id='form-nome-erro']
    Element Should Be Visible    //p[@id='form-cargo-erro']
    Element Should Be Visible    //p[@id='form-times-erro']

Quando submeto o formulário
    Click Button    ${BOTAO_SUBMETER}
