***Settings***
Resource    ../resources/wishlist.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Test Setup       Access website
Test Teardown    Close website

Documentation
...    Suite de testes destinada aos testes de cadastros de usuários. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.

***Test Cases***
Cenário 01: Validar inserção de itens na Wishlist - Tela de produtos
    Dado que sou um usuário logado no Now
    Quando clicar para adicionar itens na wishlist
    Então deve abrir uma pop-up para inserção
    E devo conseguir inserir itens diversos na minha lista carregando os campos corretamente

Cenário 02: Validar inserção de itens na Wishlist - Tela detalhes do Produto
    Dado que sou um usuário logado no Now
    Quando clicar para adicionar itens na wishlist através da tela detalhes do produto
    Então deve abrir uma pop-up para inserção conseguindo inserir itens na lista

Cenário 03: Validar criação de Wishlists - Tela de Produtos
    Dado que sou um usuário logado no Now querendo adicionar itens na wishlist
    Quando clicar para adicionar itens na wishlist criando uma nova pela tela de produtos
    Então deve abrir uma pop-up para inserção conseguindo criar outras wishlists

Cenário 04: Validar criação de Wishlists - Tela de Wishlist
    Dado que sou um usuário logado no Now querendo adicionar itens na wishlist
    Quando clicar para criar uma wishlist sem ser a padrão pela tela de Wishlist
    Então deve abrir uma pop-up para criação de Wishlists

Cenário 05: Validação de acesso Wishlist - Tela de Produtos
    Dado que sou um usuário deslogado no Now
    Quando clicar para adicionar itens na wishlist na tela de produtos
    Então deve ser aberta a pop-up de login conseguindo me logar

Cenário 06: Validação de acesso Wishlist - Tela detalhes do Produto
    Dado que sou um usuário deslogado no Now
    Quando clicar para adicionar itens na wishlist pela tela detalhes do produto
    Então deve ser aberta a pop-up de login conseguindo me logar

Cenário 07: Validar ações na página Wishlist - Troca do item de uma wishlist para outra
    Dado que sou um usuário logado no Now com itens na wishlist
    Quando acessar a página de Wishlist
    Então devo conseguir trocar um item de uma wishlist para outra

Cenário 08: Validar ações na página Wishlist - Troca do nome de uma wishlist
    Dado que sou um usuário logado no Now com itens na wishlist
    Quando acessar a página de Wishlist
    Então devo conseguir trocar o nome da wishlist personalizada

Cenário 09: Validar exclusão da Wishlist personalizada
    Dado que sou um usuário logado no Now com itens na wishlist
    Quando clicar para remover as wishlist personalizadas
    Então devo conseguir excluir com sucesso

Cenário 10: Validar exclusão de itens na Wishlist
    Dado que sou um usuário logado no Now com itens na wishlist
    Quando clicar para remover os itens da wishlist
    Então devo conseguir ver a mensagem "Esta lista está atualmente vazia"

