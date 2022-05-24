***Settings***
Resource    ../resources/login.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/login_locators.py


Library    SeleniumLibrary


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de login

***Keywords***

Dado que eu sou um cliente já existente
    Element Text Should Be      ${buttonRegister}     Cadastre-se

Quando for realizar login com email e senha válidos
    Run Keyword          Login       hehasa9603@sumwan.com       1234567

Então devo ver meu nome na tela
    Page Should Not Contain Textfield      ${buttonRegister}      Cadastre-se 
    Element Text Should Be                 ${buttonRegister}      hehasa9603

Dado que para logar no NOW devo preencher os campos corretamente
    Element Text Should Be      ${buttonRegister}     Cadastre-se

Quando clicar para logar e não houver caracteres preenchidos no campo de e-mail ou CPF
    Run Keyword          Login        ${EMPTY}           1234567

Quando inserir números e letras no campo de e-mail ou CPF e este não seja válido
    Run Keyword          Login        11111111113a       1234567

Quando inserir um e-mail com formado inválido
    Run Keyword          Login        email_formato_invalido.com.br        1234567

Quando não inserir nada nos campos 'e-mail ou CPF' e 'senha', deixambos ambos vazios
    Run Keyword          Login        ${EMPTY}        ${EMPTY}

Então deverá exibir a mensagem “Por favor, insira um e-mail ou CPF válido”
    Wait Until Element Is Visible           ${identifierTextField}  
    Page Should Contain                     Por favor, insira um e-mail ou CPF válido   

E deve ser exibido a mensagem “Favor digitar no mínimo 6 caracteres”   
    Page Should Contain                     Favor digitar no mínimo 6 caracteres  

Quando clicar para logar e não houver caracteres preenchidos no campo de senha
    Run Keyword          Login      hehasa9603@sumwan.com          ${EMPTY} 

Quando preencher o campo de senha com menos de seis caracteres
    Run Keyword          Login      hehasa9603@sumwan.com          1234 

Então deve ser exibido a mensagem “Favor digitar no mínimo 6 caracteres” 
    Wait Until Element Is Visible           ${identifierTextField}  
    Page Should Contain                     Favor digitar no mínimo 6 caracteres  

Quando inserir apenas números no campo de e-mail ou CPF e este não seja válido
    Run Keyword          Login              11111111113                    1234567

Então deverá realizar validação de CPF exibindo “Por favor, insira um CPF válido” 
    Wait Until Element Is Visible           ${identifierTextField}  
    Page Should Contain                     Por favor, insira um CPF válido   

Quando inserir um CPF válido e digitar uma senha inválida a partir de seis caracteres
    Run Keyword          Login              14993454023                   123456

Então o sistema deverá validar se a senha digitada corresponde ao respectivo CPF
    Page Should Contain                     Cadastre-se

E deverá exibir a mensagem “Senha ou CPF incorreto”
    Page Should Contain                     Senha ou CPF incorreto

Quando preencher um e-mail válido e uma senha incorreta a partir de seis caracteres
    Run Keyword          Login              hehasa9603@sumwan.com           123457

Então deverá exibir a mensagem “E-mail ou senha incorretos”
    Page Should Contain                     E-mail ou senha incorretos

Quando preencher um CPF e senha válidos
    Run Keyword          Login              14993454023                   1234567

Então o sistema deverá realizar login normalmente e devo visualizar meu nome em tela
    Element Text Should Be                 ${buttonRegister}      hehasa9603

Quando inserir um e-mail não cadastrado na base de dados junto a senha válida
    Run Keyword          Login              hehasa9603@emailnaocadastrado.com           123457

Então deverá exibir a mensagem “Por favor, insira um e-mail válido”
    Page Should Contain                     Por favor, insira um e-mail válido

Login 
    [Arguments]                         ${identifier}               ${password} 
    Click Element                       ${buttonRegister}                  
    Wait Until Element Is Visible       ${identifierTextField}      
    Input Text                          ${identifierTextField}      ${identifier}
    Input Text                          ${passwordTextField}        ${password} 
    Click Element                       ${buttonLogin}
    

