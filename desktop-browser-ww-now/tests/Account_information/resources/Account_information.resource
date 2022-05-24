*** Settings ***
Resource    ../../../shared/resources/common.resource
Resource    ../../Login/resources/login.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/login_locators.py
Variables    ../../../shared/locators/account_information.py


Library    SeleniumLibrary
Library    FakerLibrary         locale=pt_BR


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de informações da conta

***Keywords***
Dado que eu esteja logado no westwing now
    Element Text Should Be      ${buttonRegister}     Cadastre-se
    Run Keyword          Login       qa.test.user@westwing.com.br       123@westwingbr

Dado que eu esteja logado no westwing now padrao stage
    Element Text Should Be      ${buttonRegister}     Cadastre-se
    Run Keyword          Login       qa.test.user@westwing.com.br       123456

Quando acessar informações da conta
    Click and Scroll Item       ${buttonInfoAcount}
    Click Element               ${acountInfo}
    Should Contain              ${pathLocatorInfoConta}     Informações da conta

Então irei ver as informações da conta
    Should Contain              ${pathLocatorInfoConta}     Informações da conta
    Capture Page Screenshot

Então altero a senha com sucesso padrao stage
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}              123@westwingbr
    Input Text                                  ${newPasswordPath}                  123456
    Input Text                                  ${confirmNewPasswordPath}           123456
    Click Element                               ${buttonConfirmPasswordChange}   

Então altero a senha com sucesso padrao qa user
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}            123456
    Input Text                                  ${newPasswordPath}                123@westwingbr
    Input Text                                  ${confirmNewPasswordPath}         123@westwingbr
    Click Element                               ${buttonConfirmPasswordChange}
    
Então salvo com a mesma senha
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}            123@westwingbr
    Input Text                                  ${newPasswordPath}                123@westwingbr
    Input Text                                  ${confirmNewPasswordPath}         123@westwingbr
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               A nova senha não pode ser igual a antiga
    

Então clico em salvar a senha sem preencher os dados
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${pathMsgPasswordErrorAtual}
    Wait Until Element Is Visible               ${pathMsgPasswordErrorNova}
    Wait Until Element Is Visible               ${pathMsgPasswordErrorConfirme}  

Então deixo a senha vazia na atual
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${newPasswordPath}                  123@westwingbr
    Input Text                                  ${confirmNewPasswordPath}           123@westwingbr
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${pathMsgPasswordErrorAtual}

Então deixo a senha vazia na nova
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}            123@westwingbr
    Input Text                                  ${newPasswordPath}                123@westwingbr
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${msgSenhasNaoIguais}

Então deixo a senha vazia na confirmação
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}            123@westwingbr
    Input Text                                  ${confirmNewPasswordPath}         123@westwingbr
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${pathMsgPasswordErrorNova}

Então digito senha atual invalida
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}            $12345877
    Input Text                                  ${newPasswordPath}                123@westwingbr
    Input Text                                  ${confirmNewPasswordPath}         123@westwingbr
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${wrongPasswordMsg}

Então digito senhas diferentes
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}            123@westwingbr
    Input Text                                  ${newPasswordPath}                123@westwingbr
    Input Text                                  ${confirmNewPasswordPath}         $12345877
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${msgSenhasNaoIguais}

Então digito mais de 50 caracteres
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}    123@westwingbr
    ${bigPassword}    FakerLibrary.Random Number     digits=55
    Input Text                                  ${newPasswordPath}        ${bigPassword}
    Input Text                                  ${confirmNewPasswordPath}     ${bigPassword}
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${moreThan50CaracteresMsg}
    
Então digito menos de 06 caracteres
    Click Element                               ${buttonPassword}
    Sleep                                       2
    Input Text                                  ${confirmPasswordPath}    123@westwingbr
    ${littlePassword}  FakerLibrary.Random Number     digits=3
    Input Text                                  ${newPasswordPath}       ${littlePassword}
    Input Text                                  ${confirmNewPasswordPath}     ${littlePassword}
    Click Element                               ${buttonConfirmPasswordChange}
    Wait Until Element Is Visible               ${lessThan06CaracteresMsg}

Então altero nome com sucesso
    ${name}         FakerLibrary.Name
    Input Text                                  ${pathName}        ${name}
    Run Keyword   Clicar em salvar e validar que esta salvo

Então altero sobrenome com sucesso
    ${lastname}    FakerLibrary.Name
    Input Text                                  ${lastNamePath}   ${lastName}
    Run Keyword   Clicar em salvar e validar que esta salvo

Então irei alterar a saudação como sr
    Click Element                               ${saudacaoSr}
    Run Keyword   Clicar em salvar e validar que esta salvo
   

Então irei alterar a saudação como sra
    Click Element                               ${saudacaoSra}
    Run Keyword   Clicar em salvar e validar que esta salvo

Clicar em salvar e validar que esta salvo
    Click Element                               ${buttonSalvar}
    Wait Until Element Is Visible               ${msgSuccessPath}

Então deixo o nome vazio
    Input Text                                  ${pathName}        ${empty}
    Run Keyword   Clicar em salvar e validar erro

Então deixo o sobrenome vazio
    Input Text                                  ${lastNamePath}        ${empty}
    Run Keyword   Clicar em salvar e validar erro

Então deixo o nome com caracteres especiais
    Input Text                                  ${pathName}              !@#$%#@1!
    Run Keyword   Clicar em salvar e validar erro

Então deixo o sobrenome com caracteres especiais
    Input Text                                  ${lastNamePath}         !@#$%#@1!     
    Run Keyword   Clicar em salvar e validar erro

Então deixo o nome com numeros
    ${numbers}         FakerLibrary.Random Number
    Input Text                                  ${pathName}         ${numbers}
    Run Keyword   Clicar em salvar e validar erro

Então deixo o sobrenome com numeros
    ${numbers}         FakerLibrary.Random Number
    Input Text                                  ${lastNamePath}         ${numbers}
    Run Keyword   Clicar em salvar e validar erro

Então deixo o nome com espaços
    Input Text                                  ${lastNamePath}        ${spaces}  
    Run Keyword   Clicar em salvar e validar erro

Então deixo o sobrenome com espaços
    Input Text                                  ${pathName}        ${spaces}  
    Run Keyword   Clicar em salvar e validar erro

Clicar em salvar e validar erro
    Click Element                               ${buttonSalvar}
    Wait Until Element Is Visible               ${msgErrorPath}