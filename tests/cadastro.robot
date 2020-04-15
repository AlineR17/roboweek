*** Settings ***
Documentation   Cadastrar de jogos

Resource        resources/keywords.robot
#BDD (Desenvolvimento guiado por comportamento)

Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao

Test Teardown   Depois do teste

*** Test Cases ***


Cadastrar novo jogo
        [tags]          smoke
        Dado que eu tenho o seguinte produto
        ...     Pitfal      Aventura na selva           19.99           10
        E acesso o portal de cadastro de jogos
        Quando eu faço o cadastro desse item
        Então vejo a mensagem de sucesso "Produto cadastrado com sucesso."
        E vejo este novo jogo na lista

Jogo não pode ser duplicado
        [tags]  dup
        Dado que eu tenho o seguinte produto
        ...     Enduro      Clássico de corrida           29.99           15
        E acesso o portal de cadastro de jogos
        Mas este produto já foi cadastrado
        E acesso o portal de cadastro de jogos
        Quando eu faço o cadastro desse item
        Então devo ver a mensagem de alerta "Nome já está em uso"

Nome deve ser obrigatorio
        [Template]      Tentar cadastrar
        ${EMPTY}        19.99           10              Nome não pode ficar em branco
        
Preço deve ser obrigatorio
        [tags]          bug
        [Template]      Tentar cadastrar
        Pitfal          ${EMPTY}        10              Preço não pode ficar em branco

Quantidade deve ser obrigatoria
        [Template]      Tentar cadastrar
        Pitfal          19.99           ${EMPTY}        Quantidade não pode ficar em branco
        

*** Keywords ***
Tentar cadastrar
        [Arguments]             ${nome}         ${preco}        ${qtd}          ${texto}

        Dado que eu tenho o seguinte produto
        ...     ${nome}      Aventura na selva           ${preco}           ${qtd}
        E acesso o portal de cadastro de jogos
        Quando eu faço o cadastro desse item
        Então devo ver a mensagem de alerta "${texto}"