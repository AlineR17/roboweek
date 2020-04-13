*** Settings ***
Library     SeleniumLibrary

Resource        elements.robot

*** Variables ***
${BASE_URL}     http://localhost:3000

*** Keywords ***
### Ganchos
Inicia Sessao
        Open Browser                    ${BASE_URL}       chrome
        Set Window Size                 1200              800
        Set Selenium Implicit Wait      5

Encerra Sessao
        Close Browser

Depois do teste
        Capture Page Screenshot

Dado que acesso o portal de cadastro de jogos
        Go To                      ${BASE_URL}/produtos/new

Quando eu faço o cadastro de um novo jogo
        [Arguments]             ${nome}         ${desc}         ${preco}        ${qtd}

        Input Text          ${CAMPO_NOME}        ${nome}
        Input Text          ${CAMPO_DESC}        ${desc}
        Input Text          ${CAMPO_PRECO}       ${preco}
        Input Text          ${CAMPO_QTD}         ${qtd}

        Set Test Variable   ${nome}

        Click Element       ${BT_CRIAR_PRODUTO}

Então vejo a mensagem de sucesso "${mensagem_esperada}"
        Element Should Contain          ${ALERTA_SUCESSO}      ${mensagem_esperada}

Então devo ver a mensagem de alerta "${mensagem_esperada}"
        Element Should Contain          ${ALERTA_ERRO}      ${mensagem_esperada}

E vejo este novo jogo na lista
        Element Should Contain          ${LISTA_JOGOS}          ${nome} 