*** Settings ***
Resource    ../resources/main.robot
Resource    ../resources/shared/setup_teardown.robot
Resource    ../resources/pages/cadastro.robot

Test Setup    Abrir o site Organo
Test Teardown    Fechar o navegador

*** Test Cases ***

Verificar se ao preencher o formulário corretamente um novo card é criado com os dados informados
    Quando preencho o formulário corretamente
    E submeto o formulário
    Então o card aparece na seção adequada
    E as informações estão conforme informei

Verificar se é possível criar mais de um colaborador no time
    @{nomes}=    Create List    Samuel    Taylor    Selena
    @{cargos}=    Create List    Analista de QA    Cantora    Cantora
    @{times}=     Create List    ${OPCAO_PROGRAMACAO}    ${OPCAO_INOVACAO}    ${OPCAO_UX}

    Quando crio vários colaboradores    ${nomes}    ${cargos}    ${times}
    Então as informações de cada um estão conforme informei    ${nomes}    ${cargos}     ${times}