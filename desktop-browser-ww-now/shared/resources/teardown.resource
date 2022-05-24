***Settings***
Library    SeleniumLibrary
Library    ../libs/UtilsLib.py

Variables    ../../config.py

***Keywords***
Close website
    ${datacurrent}             Get Current Date
    Capture Page Screenshot    ${datacurrent}-test-evidence-.png
    Delete All Cookies
    Close window

Close website and clear cart
    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${clear_cart}
    LOG     ${check_element}
    IF      ${check_element} == True
    Click Element                       ${clear_cart}
    Wait Until Element Is Visible       ${pop_up_clear_cart}
    Click Element                       ${button_confirm_remove_from_cart}
    Wait Until Element Is Visible       ${remove_from_cart_msg}
    Wait Until Element Is Visible       ${validate_cart}
    Wait Until Element Is Visible       ${validate_cart_empty}
    ELSE
    Wait Until Element Is Visible       ${validate_cart}
    Wait Until Element Is Visible       ${validate_cart_empty}
    END
    ${datacurrent}             Get Current Date
    Capture Page Screenshot    ${datacurrent}-test-evidence-.png
    Delete All Cookies
    Close window