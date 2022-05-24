***Settings***
Resource                  ../../Login/tests/login.robot
Resource                  ../resources/purchase.resource
Resource                  ../../../shared/resources/setup.resource
Resource                  ../../../shared/resources/teardown.resource

Test Setup       Access website
Test Teardown    Close website

Documentation

...    Suite de testes destinada aos testes de compra
***Test Cases***
    
Cenário 01: Compra com Endereço Cadastrado buscando produto
    Dado que eu esteja logado no westwing now
    Quando buscar por um produto valido1
    Então concluo a compra pagamento pix com sucesso
    
Cenário 02: Compra com Endereço Cadastrado buscando produto
    Dado que eu esteja logado no westwing now
    Quando buscar por um produto valido2
    Então concluo a compra pagamento pix com sucesso
    
Cenário 03: Compra com Endereço Cadastrado buscando produto
    Dado que eu esteja logado no westwing now
    Quando buscar por um produto valido3
    Então concluo a compra pagamento pix com sucesso
    
Cenário 04: Compra com Endereço Cadastrado buscando produto
    Dado que eu esteja logado no westwing now
    Quando buscar por um produto valido4
    Então concluo a compra pagamento pix com sucesso
    
Cenário 05: Compra com Endereço Cadastrado buscando produto
    Dado que eu esteja logado no westwing now
    Quando buscar por um produto valido5
    Então concluo a compra pagamento pix com sucesso

Cenário 06: Compra com pix Endereço Novo
    Dado que eu esteja logado no westwing now
    Quando mudar o endereço de entrega de um pedido SR
    Então concluo meu pedido com pix checkout

Cenário 07: Compra com pix Endereço Novo
    Dado que eu esteja logado no westwing now
    Quando mudar o endereço de entrega de um pedido SRA
    Então concluo meu pedido com pix checkout
