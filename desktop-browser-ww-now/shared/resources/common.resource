***Settings***
Library    SeleniumLibrary


***Keywords***
Click and Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                                  30
    ${position}                      Get Vertical Position                          ${identifier}
    Execute Javascript               window.scrollTo(0, window.scrollY + ${position})
    Click Element                    ${identifier}                                  

Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                     30
    ${position}                      Get Vertical Position             ${identifier}
    Execute Javascript               window.scrollTo(${position},0)    

