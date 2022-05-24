***Settings***
Resource    ../resources/register.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/register_locators.py

Library    SeleniumLibrary
Library    FakerLibrary                        locale=pt_BR
Library    ../../../shared/libs/EmailLib.py


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de cadastro de usuário

*** Variable ***
${usuarioLogado}    nome do usuário logado

*** Keywords ***
Dado que estou acessando o site do NOW sem cadastro e clico em "Cadastre-se"
    Element Text Should Be    ${buttonRegister}    Cadastre-se
    Click Element             ${buttonRegister}    

Quando preencho todos os campos obrigatórios corretamente
    ${firstName}           FakerLibrary.First Name 
    ${lastName}            FakerLibrary.Last Name      
    ${email}               Get Random Email
    ${password}            FakerLibrary.Password
    Set Global Variable    ${usuarioLogado}            ${firstName}
    Run Keyword            Fill in registration        ${firstName}    ${lastName}    ${email}    ${password}    
    Execute Javascript     window.scrollTo(0,550)
    Run Keyword            Click on accept terms

E clicar em Cadastre-se gratuitamente
    Run Keyword    Click on sign up for free

Então visualizarei meu nome na tela
    Element Text Should Be    ${buttonRegister}    ${usuarioLogado}

Quando não preencher nenhum campo
    Run Keyword           Fill in registration      ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY} 
    Execute Javascript    window.scrollTo(0,500)

Então deverei visualizar mensagens de campos obrigatórios nos demais campos
    Element Text Should Be    ${firstNameTextFieldError}    Campo Obrigatório
    Element Text Should Be    ${lastNameTextFieldError}     Campo Obrigatório
    Element Text Should Be    ${emailTextFieldError}        Campo Obrigatório
    Element Text Should Be    ${passwordTextFieldError}     Favor digitar no mínimo 6 caracteres

Quando preencher os campos incorretamente
    Run Keyword           Fill in registration      L    B    emailErrado.com    123
    Execute Javascript    window.scrollTo(0,500)

Então deverei visualizar mensagens de preenchimento incorreto de campos
    Element Text Should Be    ${firstNameTextFieldError}    Favor digitar no mínimo 2 caracteres
    Element Text Should Be    ${lastNameTextFieldError}     Favor digitar no mínimo 2 caracteres
    Element Text Should Be    ${emailTextFieldError}        Por favor, insira um e-mail válido
    Element Text Should Be    ${passwordTextFieldError}     Favor digitar no mínimo 6 caracteres

Quando preencher os campos esquecendo de aceitar os termos
    ${firstName}          FakerLibrary.First Name 
    ${lastName}           FakerLibrary.Last Name      
    ${email}              Get Random Email
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration        ${firstName}    ${lastName}    ${email}    ${password}    
    Execute Javascript    window.scrollTo(0,550)

Então deverei visualizar mensagem "Campo Obrigatório"
    Page Should Contain    Campo Obrigatório

Quando preencher os campos colocando um e-mail já cadastrado
    ${firstName}          FakerLibrary.First Name 
    ${lastName}           FakerLibrary.Last Name      
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration        ${firstName}    ${lastName}    qa.test.user@westwing.com.br    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Então deverei visualizar mensagem "O e-mail fornecido já está cadastrado"
    Page Should Contain    O e-mail fornecido já está cadastrado

Quando preencher os campos esquecendo de preencher a senha
    ${firstName}          FakerLibrary.First Name 
    ${lastName}           FakerLibrary.Last Name      
    ${email}              Get Random Email
    Run Keyword           Fill in registration        ${firstName}    ${lastName}    ${email}    ${EMPTY}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Quando preencher os campos colocando uma senha com menos de 6 caracteres
    ${firstName}          FakerLibrary.First Name 
    ${lastName}           FakerLibrary.Last Name      
    ${email}              Get Random Email
    Run Keyword           Fill in registration        ${firstName}    ${lastName}    ${email}    12345    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Então deverei visualizar mensagem "Favor digitar no mínimo 6 caracteres"
    Element Text Should Be    ${passwordTextFieldError}    Favor digitar no mínimo 6 caracteres

Quando preencher os campos esquecendo de preencher o email
    ${firstName}          FakerLibrary.First Name 
    ${lastName}           FakerLibrary.Last Name      
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration        ${firstName}    ${lastName}    ${EMPTY}    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Quando preencher os campos passando um email inválido
    ${firstName}          FakerLibrary.First Name 
    ${lastName}           FakerLibrary.Last Name      
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration        ${firstName}    ${lastName}    emailInvalido.com.br    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Então deverei visualizar mensagem "Por favor, insira um e-mail válido"
    Element Text Should Be    ${emailTextFieldError}    Por favor, insira um e-mail válido

Quando preencher os campos esquecendo de preencher o primeiro nome
    ${lastName}           FakerLibrary.Last Name    
    ${email}              Get Random Email
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration      ${EMPTY}    ${lastName}    ${email}    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Quando preencher os campos esquecendo de preencher o sobrenome
    ${firstName}          FakerLibrary.First Name    
    ${email}              Get Random Email
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration       ${firstName}    ${EMPTY}    ${email}    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Quando preencher os campos colocando apenas um caractere no primeiro nome
    ${lastName}           FakerLibrary.Last Name    
    ${email}              Get Random Email
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration      A    ${lastName}    ${email}    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Quando preencher os campos colocando apenas um caractere no sobrenome
    ${firstName}          FakerLibrary.First Name    
    ${email}              Get Random Email
    ${password}           FakerLibrary.Password
    Run Keyword           Fill in registration       ${firstName}    B    ${email}    ${password}    
    Execute Javascript    window.scrollTo(0,550)
    Run Keyword           Click on accept terms

Então deverei visualizar mensagem "Favor digitar no mínimo 2 caracteres"
    Page Should Contain    Favor digitar no mínimo 2 caracteres


Fill in registration
    [Arguments]                      ${firstName}             ${lastName}     ${email}    ${password}    
    Wait Until Element Is Visible    ${firstNameTextField}    
    Input Text                       ${firstNameTextField}    ${firstName}
    Input Text                       ${lastNameTextField}     ${lastName} 
    Input Text                       ${emailTextField}        ${email}
    Input Text                       ${passwordTextField}     ${password} 

Click on accept terms
    Click Element    ${acceptedTerms}

Click on sign up for free
    Click Element    ${buttonRegisterForFree}
