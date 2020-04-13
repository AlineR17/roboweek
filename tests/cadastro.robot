*** Settings ***
Documentation   Cadastrar de jogos

Resource        resources/keywords.robot
#BDD (Desenvolvimento guiado por comportamento)

Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao

Test Teardown   Depois do teste

*** Test Cases ***


Cadastrar novo jogo
        [tags]  smoke
        Dado que acesso o portal de cadastro de jogos
        Quando eu faço o cadastro de um novo jogo
        ...     Pitfal      Aventura na selva           19.99           10
        Então vejo a mensagem de sucesso "Produto cadastrado com sucesso."
        E vejo este novo jogo na lista

Nome deve ser obrigatorio
        Dado que acesso o portal de cadastro de jogos
        Quando eu faço o cadastro de um novo jogo
        ...     ${EMPTY}      Aventura na selva           19.99           10
        Então devo ver a mensagem de alerta "Nome não pode ficar em branco"

Preço deve ser obrigatorio
        Dado que acesso o portal de cadastro de jogos
        Quando eu faço o cadastro de um novo jogo
        ...     Pitfal      Aventura na selva           ${EMPTY}           10
        Então devo ver a mensagem de alerta "Preco não pode ficar em branco"

Quantidade deve ser obrigatoria
        Dado que acesso o portal de cadastro de jogos
        Quando eu faço o cadastro de um novo jogo
        ...     Pitfal      Aventura na selva           19.99           ${EMPTY}
        Então devo ver a mensagem de alerta "Quantidade não pode ficar em branco"