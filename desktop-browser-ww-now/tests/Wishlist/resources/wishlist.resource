***Settings***
Resource    ../resources/wishlist.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource
Resource    ../../../tests/Login/resources/login.resource

Variables    ../../../shared/locators/wishlist_locators.py

Library    SeleniumLibrary
Library    FakerLibrary                        locale=pt_BR
Library    ../../../shared/libs/EmailLib.py


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de wishlist

*** Variable ***
${productDescription}          Descrição do produto
${firstProductDescription}     Descrição primeiro produto
${secondProductDescription}    Descrição segundo produto
${thirdProductDescription}     Descrição terceiro produto
${firstNameWishlist}           Nome da primeira Wishlist personalizada
${secondNameWishlist}          Nome da primeira Wishlist personalizada

*** Keywords ***
Dado que sou um usuário logado no Now
    Run Keyword    Login    hehasa9603@sumwan.com    1234567    

Quando clicar para adicionar itens na wishlist
    Run Keyword    click to add items    1    1    1

Então deve abrir uma pop-up para inserção
    Wait Until Element Is Visible    ${selectWishlist}      30
    Element Text Should Be           ${selectWishlist}      SELECIONAR WISHLIST
    Click Element                    ${closeAddWishlist}

E devo conseguir inserir itens diversos na minha lista carregando os campos corretamente
    Run Keyword                    Add products to wishlist        ${productName}\[1]       ${wishlistIconInactive}\[1]
    Set Global Variable            ${firstProductDescription}      ${productDescription}
    Run Keyword                    Add products to wishlist        ${productName}\[2]       ${wishlistIconInactive}\[2]
    Set Global Variable            ${secondProductDescription}     ${productDescription}
    Run Keyword                    Add products to wishlist        ${productName}\[3]       ${wishlistIconInactive}\[3]
    Set Global Variable            ${thirdProductDescription}      ${productDescription}
    Click and Scroll Item          ${wishlistButton}
    Page Should Contain            ${firstProductDescription}
    Page Should Contain            ${secondProductDescription} 
    Page Should Contain            ${thirdProductDescription}
    FOR                            ${index}                        IN RANGE                 3
    Sleep                          30s                             
    Set Local Variable             ${index}                        ${index}+1               
    Page Should Contain Image      ${imageProduct}\[${index}]
    Page Should Contain Element    ${productPrice}\[${index}] 
    Page Should Contain Element    ${productSize}\[${index}] 
    END

Quando clicar para adicionar itens na wishlist através da tela detalhes do produto
    Wait Until Element Is Visible    ${category}\[1]              30
    Click Element                    ${category}\[1] 
    Set Local Variable               ${index}                     11
    Click and Scroll Item            ${productName}\[${index}]
    Click and Scroll Item            ${addWishlistButton}

Então deve abrir uma pop-up para inserção conseguindo inserir itens na lista
    Wait Until Element Is Visible    ${selectWishlist}         30
    Element Text Should Be           ${selectWishlist}         SELECIONAR WISHLIST
    Click Element                    ${addToWishlistButton}

Dado que sou um usuário logado no Now querendo adicionar itens na wishlist
    Run Keyword    Login    hehasa9603@sumwan.com    1234567

Quando clicar para adicionar itens na wishlist criando uma nova pela tela de produtos
    Wait Until Element Is Visible    ${category}\[2]              30
    Click Element                    ${category}\[2]
    Scroll Item                      ${productName}\[1]
    ${getTextProductDescription}     Get Text                     ${productName}\[1]
    Set Suite Variable               ${textProductDescription}    ${getTextProductDescription} 
    Click and Scroll Item            ${productName}\[1]
    Click and Scroll Item            ${addWishlistButton}

Então deve abrir uma pop-up para inserção conseguindo criar outras wishlists
    Wait Until Element Is Visible    ${selectWishlist}                                              30
    Element Text Should Be           ${selectWishlist}                                              SELECIONAR WISHLIST
    ${randomWord}                    FakerLibrary.city
    Set Global Variable              ${firstNameWishlist}                                           ${randomWord}
    Run Keyword                      Create new wishlist                                            ${newWishlist}         ${newWishlistName}    ${firstNameWishlist}    ${addToWishlistButton}    
    Sleep                            5
    Click and Scroll Item            ${wishlistButton}
    Click and Scroll Item            xpath=(.//*[@class='blockWishlistNavigation__listName'])[2]
    Sleep                            5
    Page Should Contain              ${textProductDescription}

Quando clicar para criar uma wishlist sem ser a padrão pela tela de Wishlist
    Click and Scroll Item    ${wishlistButton}
    Click and Scroll Item    ${addListButton}

Então deve abrir uma pop-up para criação de Wishlists
    ${randomWord}          FakerLibrary.city
    Set Global Variable    ${secondNameWishlist}    ${randomWord}
    Run Keyword            Create new wishlist      ${inputAddListButtonName}    ${inputAddListButtonName}    ${secondNameWishlist}    ${addButton}

Dado que sou um usuário deslogado no Now
    Page Should Contain    Cadastre-se

Quando clicar para adicionar itens na wishlist na tela de produtos
    Run Keyword    click to add items    3    1    1

Então deve ser aberta a pop-up de login conseguindo me logar
    Page Should Contain      Novo no Westwing?
    Click Element            ${cookiePolicyOverlay}
    Click and Scroll Item    ${loginNow}
    Run Keyword              Login wishlist            hehasa9603@sumwan.com    1234567 

Quando clicar para adicionar itens na wishlist pela tela detalhes do produto
    Wait Until Element Is Visible    ${category}\[4]              30
    Click Element                    ${category}\[1] 
    Set Local Variable               ${index}                     11
    Click and Scroll Item            ${productName}\[${index}]
    Click and Scroll Item            ${addWishlistButton}

Quando acessar a página de Wishlist
    Click and Scroll Item    ${wishlistButton}

Então devo conseguir trocar um item de uma wishlist para outra
    Wait Until Element Is Visible       //*[contains(text(),'${firstNameWishlist}')]
    Click and Scroll Item               //*[contains(text(),'${firstNameWishlist}')]
    Scroll Item                         xpath=(.//*[@class='blockWishlistNavigation__listName'])[1]
    Wait Until Element Is Visible       ${productNameWishlist}                                         30
    ${getProductDescriptionWishlist}    Get Text                                                       ${productNameWishlist}    
    Click and Scroll Item               ${changeWishlist}
    Click and Scroll Item               ${myWishlist}
    Click and Scroll Item               ${addToWishlistButton}
    Mouse Up                            ${wishlistButton}
    Wait Until Element Is Visible       xpath=(.//*[@class='blockWishlistNavigation__listName'])[1]
    Click and Scroll Item               xpath=(.//*[@class='blockWishlistNavigation__listName'])[1]
    Wait Until Element Is Visible       ${productNameWishlist}                                         30
    Page Should Contain                 ${getProductDescriptionWishlist} 

Então devo conseguir trocar o nome da wishlist personalizada
    Click and Scroll Item            //*[contains(text(),'${firstNameWishlist}')]
    Click and Scroll Item            ${editWishlist}
    Click and Scroll Item            ${inputListName}
    Clear Element Text               ${inputListName}
    ${randomWord}                    FakerLibrary.city                                              
    Set Global Variable              ${firstNameWishlist}                                           ${randomWord}
    Input Text                       ${inputListName}                                               ${firstNameWishlist} 
    Click and Scroll Item            ${renameList}
    Wait Until Element Is Visible    ${wishlistButton}
    Scroll Item                      ${wishlistButton}
    Wait Until Element Is Visible    xpath=(.//*[@class='blockWishlistNavigation__listName'])[2]
    Element Text Should Be           xpath=(.//*[@class='blockWishlistNavigation__listName'])[2]    ${firstNameWishlist}

Quando clicar para remover as wishlist personalizadas
    Click and Scroll Item            ${wishlistButton}
    Wait Until Element Is Visible    //*[contains(text(),'${firstNameWishlist}')]     50s
    Click and Scroll Item            //*[contains(text(),'${firstNameWishlist}')]
    Click and Scroll Item            ${editWishlist}
    Click and Scroll Item            ${deleteList}
    Click and Scroll Item            ${confirmButton}
    Click and Scroll Item            ${wishlistButton}
    Wait Until Element Is Visible    //*[contains(text(),'${secondNameWishlist}')]    50s
    Click and Scroll Item            //*[contains(text(),'${secondNameWishlist}')]
    Click and Scroll Item            ${editWishlist}
    Click and Scroll Item            ${deleteList}
    Click and Scroll Item            ${confirmButton}

Então devo conseguir excluir com sucesso
    Wait Until Page Does Not Contain     ${firstNameWishlist}
    Page Should Not Contain Textfield    ${firstNameWishlist}
    Page Should Not Contain Textfield    ${secondNameWishlist}    

Dado que sou um usuário logado no Now com itens na wishlist
    Run Keyword              Login                hehasa9603@sumwan.com    1234567    
    Click and Scroll Item    ${wishlistButton}

Quando clicar para remover os itens da wishlist
    Run Keyword    Remove all wishlist items    


Então devo conseguir ver a mensagem "Esta lista está atualmente vazia"
    Wait Until Element Is Visible    ${wishlistNoProductsInfo}
    Page Should Contain              Esta lista está
    Page Should Contain              atualmente vazia.


click to add items
    [Arguments]                      ${indexCategory}                                          ${indexProductName}    ${indexWishlistIconInactive} 
    Wait Until Element Is Visible    ${category}\[${indexCategory}]                            30
    Click Element                    ${category}\[${indexCategory}]
    Scroll Item                      ${productName}\[${indexProductName}]
    Mouse Up                         ${productName}\[${indexProductName}]
    Mouse Up                         ${wishlistIconInactive}\[${indexWishlistIconInactive}]
    Click Element                    ${wishlistIconInactive}\[${indexWishlistIconInactive}]

Add products to wishlist
    [Arguments]                      ${productName}            ${wishlistIcon}
    Scroll Item                      ${productName}
    Mouse Up                         ${productName}
    ${getProductDescription}         Get Text                  ${productName}              
    Set Global Variable              ${productDescription}     ${getProductDescription}    
    Mouse Up                         ${wishlistIcon}
    Click Element                    ${wishlistIcon}
    Wait Until Element Is Visible    ${addToWishlistButton}    30                          
    Click Element                    ${addToWishlistButton}

Create new wishlist
    [Arguments]              ${firstButtonClick}     ${inputText}       ${wishlistName}    ${secondButtonClick} 
    Click Element            ${firstButtonClick}
    Click Element            ${inputText}
    Input Text               ${inputText}            ${wishlistName}    
    Sleep                    10
    Click and Scroll Item    ${secondButtonClick}

Login wishlist
    [Arguments]                      ${identifier}                     ${password}      
    Wait Until Element Is Visible    ${identifierTextFieldWishlist}    
    Input Text                       ${identifierTextFieldWishlist}    ${identifier}
    Input Text                       ${passwordTextFieldWishlist}      ${password} 
    Click Element                    ${buttonLoginWishlist}

Remove all wishlist items
    Wait Until Element Is Visible    ${wishlistButton}
    ${quantityItemsText}             Get Text                       ${wishlistButton}
    ${quantityItems}                 Convert To Integer             ${quantityItemsText} 
    FOR                              ${index}                       IN RANGE                 ${quantityItems}
    Sleep                            30s                            
    Click Element                    ${buttonDeleteFromWishlist}
    END
