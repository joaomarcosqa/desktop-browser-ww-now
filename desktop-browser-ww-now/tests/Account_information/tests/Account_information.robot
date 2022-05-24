***Settings***
Resource                  ../../Login/tests/login.robot
Resource                  ../resources/Account_information.resource
Resource                  ../../../shared/resources/setup.resource
Resource                  ../../../shared/resources/teardown.resource

Test Setup       Access website
Test Teardown    Close website

Documentation
...    Suite de testes destinada aos testes de informações da conta

***Test Cases***
Cenário 01: Acessar as informações da conta
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então irei ver as informações da conta

Cenário 02: Alterar senha com sucesso padrao stage
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então altero a senha com sucesso padrao stage

Cenário 03: Alterar senha com sucesso padrao qa user
    Dado que eu esteja logado no westwing now padrao stage
    Quando acessar informações da conta
    Então altero a senha com sucesso padrao qa user

Cenário 04: Alterar nome com sucesso
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então altero nome com sucesso

Cenário 05: Alterar sobrenome com sucesso
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então altero sobrenome com sucesso

Cenário 06: Alterar saudação com sucesso sr
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então irei alterar a saudação como sr

Cenário 07: Alterar saudação com sucesso sra
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então irei alterar a saudação como sra

Cenário 08: Alterar nome sem sucesso nome vazio
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o nome vazio

Cenário 09: Alterar sobrenome sem sucesso sobrenome vazio
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o sobrenome vazio

Cenário 10: Alterar nome sem sucesso com caracteres especiais
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o nome com caracteres especiais

Cenário 11: Alterar sobrenome sem sucesso com caracteres especiais
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o sobrenome com caracteres especiais

Cenário 12: Alterar nome sem sucesso com numeros
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o nome com numeros

Cenário 13: Alterar sobrenome sem sucesso com numeros
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o sobrenome com numeros

Cenário 14: Alterar nome sem sucesso com espaços
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o nome com espaços

Cenário 15: Alterar sobrenome sem sucesso com espaços
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo o sobrenome com espaços

Cenário 16: Alterar senha sem sucesso mesma senha da atual
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então salvo com a mesma senha

Cenário 17: Alterar senha sem sucesso dados vazios
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então clico em salvar a senha sem preencher os dados

Cenário 18: Alterar senha sem sucesso senha vazia na atual
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo a senha vazia na atual

Cenário 19: Alterar senha sem sucesso senha vazia na nova
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo a senha vazia na nova

Cenário 20: Alterar senha sem sucesso senha vazia na confirmação
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então deixo a senha vazia na confirmação

Cenário 21: Alterar senha sem sucesso senha atual invalida
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então digito senha atual invalida

Cenário 22: Alterar senha sem sucesso senhas diferentes
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então digito senhas diferentes

Cenário 23: Alterar senha sem sucesso mais de 50 caracteres
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então digito mais de 50 caracteres

Cenário 24: Alterar senha sem sucesso menos de 06 caracteres
    Dado que eu esteja logado no westwing now
    Quando acessar informações da conta
    Então digito menos de 06 caracteres
    