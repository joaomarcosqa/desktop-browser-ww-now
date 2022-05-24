***Settings***
Resource    ../../Login/resources/login.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource

Variables    ../../../shared/locators/login_locators.py
Variables    ../../../shared/locators/purchase_locators.py


Library    SeleniumLibrary
Library    FakerLibrary         locale=pt_BR

Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de compra

***Keywords***
Dado que eu esteja logado no westwing now
    Element Text Should Be      ${buttonRegister}     Cadastre-se
    Run Keyword          Login       qa.test.user@westwing.com.br       123@westwingbr

Então concluo a compra pagamento pix com sucesso
    Run Keyword                         Clicar no carrinho e comprar com pix

Clicar no carrinho
    Click Element                       ${buttonAddCart}
    Click Element                       ${buttoncart}

Clicar no carrinho e comprar com pix
    Wait Until Element Is Visible       ${buttonAddCart}
    Click and Scroll Item               ${buttonAddCart}
    Wait Until Element Is Visible       ${validaProductAtCart}
    Capture Page Screenshot
    Click Element                       ${buttoncart}
    Sleep                               1
    Click Element                       ${buttonCartComprar}
    Sleep                               1
    Click Element                       ${checkoutButtonPix}
    Click Element                       ${checkoutButtonContinuar}
    Sleep                               1
    Page Should contain                 ${textConfirmarPedido}
    Click Element                       ${checkoutButtonCompreAgora}
    Sleep                               3
    Page Should Contain                 ${textPurchaseSuccess}
    Capture Page Screenshot

Quando buscar por um produto valido1
    Input Text                          ${inputProduto}        Sofá Living em Veludo Marilyn - Verde Militar 
    Press Keys              None            ENTER
    Wait Until Element Is Visible       ${primeiroProduto}
    Capture Page Screenshot
    Click and Scroll Item               ${primeiroProduto}
    Sleep                               2

Quando buscar por um produto valido2
    Input Text                          ${inputProduto}        Luminária de Chão Marlene Preto - Bivolt 
    Press Keys              None            ENTER
    Wait Until Element Is Visible       ${primeiroProduto}
    Capture Page Screenshot
    Click and Scroll Item               ${primeiroProduto}
    Sleep                               2

Quando buscar por um produto valido3
    Input Text                          ${inputProduto}        Cadeira Acapulco Baka - Palha
    Press Keys              None            ENTER
    Wait Until Element Is Visible       ${primeiroProduto}
    Capture Page Screenshot
    Click and Scroll Item               ${primeiroProduto}
    Sleep                               2

Quando buscar por um produto valido4
    Input Text                          ${inputProduto}        Mesa de Jantar Retangular de Madeira Nouveau - Off White
    Press Keys              None            ENTER
    Wait Until Element Is Visible       ${primeiroProduto}
    Capture Page Screenshot
    Click and Scroll Item               ${primeiroProduto}
    Sleep                               2

Quando buscar por um produto valido5
    Input Text                          ${inputProduto}        Poltrona Eames com Pufe - Preto
    Press Keys              None            ENTER
    Wait Until Element Is Visible       ${primeiroProduto}
    Capture Page Screenshot
    Click and Scroll Item               ${primeiroProduto}
    Sleep                               2

Clicar no carrinho e comprar com pix com endereço diferente SR
    Run Keyword                         Quando buscar por um produto valido3
    Wait Until Element Is Visible       ${buttonAddCart}
    Click and Scroll Item               ${buttonAddCart}
    Wait Until Element Is Visible       ${validaProductAtCart}
    Click Element                       ${buttoncart}
    Click Element                       ${buttonCartComprar}
    Sleep                               1
    Click Element                       ${checkoutEndereco}
    Wait Until Element Is Visible       ${ponteiroEndCobranca}
    #clica no botão de endereço
    ${isCheckEndereco} =    Run Keyword And Return Status    Checkbox Should Be Selected   ${checkboxAlterarEndereco}
    IF          "${isCheckEndereco}"=="True"
    Sleep                               3

    #botão sr
    Wait Until Element Is Visible           ${saudacaoCampo}
    ${isCheckSr} =    Run Keyword And Return Status    Checkbox Should Be Selected   ${saudacaoSr}
    IF          "${isCheckSr}"=="True"
    ${numbers}         FakerLibrary.Random Number     digits=3
    ${name}            FakerLibrary.Name
    ${phone}           FakerLibrary.Phone Number
    Input Text                          ${pathprimeiroNome}                 ${name}      
    Input Text                          ${pathsobreNome}                    ${name}
    Press Keys                          ${pathcep}                          07950250
    Input Text                          ${pathcep}                          07950250
    Input Text                          ${pathnumero}                       ${numbers}
    Input Text                          ${pathtelefone}                     ${phone}
    Click Element                       ${enderecoContinuar}
    
    ELSE
    Click Element                       ${saudacaoSr}
    ${numbers}         FakerLibrary.Random Number     digits=3
    ${name}            FakerLibrary.Name
    ${phone}           FakerLibrary.Phone Number
    Input Text                          ${pathprimeiroNome}                 ${name}      
    Input Text                          ${pathsobreNome}                    ${name}
    Press Keys                          ${pathcep}                          07950250
    Input Text                          ${pathcep}                          07950250
    Input Text                          ${pathnumero}                       ${numbers}
    Input Text                          ${pathtelefone}                     ${phone}
    Click Element                       ${enderecoContinuar}

    END

    ELSE
    Click Element                       ${checkboxAlterarEndereco}
    Sleep                               2
    #botão sr
    ${numbers}         FakerLibrary.Random Number     digits=3
    ${name}            FakerLibrary.Name
    ${phone}           FakerLibrary.Phone Number
    Input Text                          ${pathprimeiroNome}                 ${name}      
    Input Text                          ${pathsobreNome}                    ${name}
    Press Keys                          ${pathcep}                          07950250
    Input Text                          ${pathcep}                          07950250
    Input Text                          ${pathnumero}                       ${numbers}
    Input Text                          ${pathtelefone}                     ${phone}
    Click Element                       ${enderecoContinuar}
    END

Então concluo meu pedido com pix checkout
    Wait Until Element Is Visible       ${checkoutButtonPix}
    ${isCheckPix} =    Run Keyword And Return Status    Checkbox Should Be Selected   ${checkoutButtonPix}
    IF          "${isCheckPix}"=="True"

    Click Element                       ${checkoutButtonContinuar}
    Sleep                               2
    Page Should contain                 ${textConfirmarPedido}
    Click Element                       ${checkoutButtonCompreAgora}
    Sleep                               4
    Page Should Contain                 ${textPurchaseSuccess}
    Capture Page Screenshot
    ELSE

    Click Element                       ${checkoutButtonPix}
    Click Element                       ${checkoutButtonContinuar}
    Sleep                               2
    Page Should contain                 ${textConfirmarPedido}
    Click Element                       ${checkoutButtonCompreAgora}
    Sleep                               4
    Page Should Contain                 ${textPurchaseSuccess}
    Capture Page Screenshot
    END

Quando mudar o endereço de entrega de um pedido SR
    Run Keyword         Clicar no carrinho e comprar com pix com endereço diferente SR

Quando mudar o endereço de entrega de um pedido SRA
    Run Keyword                         Quando buscar por um produto valido3
    Wait Until Element Is Visible       ${buttonAddCart}
    Click and Scroll Item               ${buttonAddCart}
    Wait Until Element Is Visible       ${validaProductAtCart}
    Capture Page Screenshot
    Click Element                       ${buttoncart}
    Click Element                       ${buttonCartComprar}
    Sleep                               1
    Click Element                       ${checkoutEndereco}
    Wait Until Element Is Visible       ${ponteiroEndCobranca}
    #clica no botão de endereço
    ${isCheckEndereco} =    Run Keyword And Return Status    Checkbox Should Be Selected   ${checkboxAlterarEndereco}
    IF          "${isCheckEndereco}"=="True"
    Sleep                               3

    #botão sr
    Wait Until Element Is Visible           ${saudacaoCampo}
    ${isCheckSra} =    Run Keyword And Return Status    Checkbox Should Be Selected   ${saudacaoSra}
    IF          "${isCheckSra}"=="True"
    ${numbers}         FakerLibrary.Random Number     digits=3
    ${name}            FakerLibrary.Name
    ${phone}           FakerLibrary.Phone Number
    Input Text                          ${pathprimeiroNome}                 ${name}      
    Input Text                          ${pathsobreNome}                    ${name}
    Press Keys                          ${pathcep}                          07950250
    Input Text                          ${pathcep}                          07950250
    Input Text                          ${pathnumero}                       ${numbers}
    Input Text                          ${pathtelefone}                     ${phone}
    Click Element                       ${enderecoContinuar}
    
    ELSE
    Click Element                       ${saudacaoSra}
    ${numbers}         FakerLibrary.Random Number     digits=3
    ${name}            FakerLibrary.Name
    ${phone}           FakerLibrary.Phone Number
    Input Text                          ${pathprimeiroNome}                 ${name}      
    Input Text                          ${pathsobreNome}                    ${name}
    Press Keys                          ${pathcep}                          07950250
    Input Text                          ${pathcep}                          07950250
    Input Text                          ${pathnumero}                       ${numbers}
    Input Text                          ${pathtelefone}                     ${phone}
    Click Element                       ${enderecoContinuar}

    END

    ELSE
    Click Element                       ${checkboxAlterarEndereco}
    Sleep                               2
    #botão sr
    Click Element                       ${saudacaoSr}
    ${numbers}         FakerLibrary.Random Number     digits=3
    ${name}            FakerLibrary.Name
    ${phone}           FakerLibrary.Phone Number
    Input Text                          ${pathprimeiroNome}                 ${name}      
    Input Text                          ${pathsobreNome}                    ${name}
    Press Keys                          ${pathcep}                          07950250
    Input Text                          ${pathcep}                          07950250
    Input Text                          ${pathnumero}                       ${numbers}
    Input Text                          ${pathtelefone}                     ${phone}
    Click Element                       ${enderecoContinuar}
    END    