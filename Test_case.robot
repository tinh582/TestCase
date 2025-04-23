*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           chrome
${USERNAMEVALID}     Admin
${PASSWORDVALID}     admin123
${USERNAMEUNVALID}   knsdvkn
${PASSWORDUNVALID}   ljerng8232

*** Test Cases ***
Đăng nhập thành công
    Open Browser    ${URL}    ${BROWSER} 
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${USERNAMEVALID}
    Input Text    name=password    ${PASSWORDVALID}
    Click Element    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Wait Until Page Contains Element    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Page Should Contain    Dashboard
    Log To Console   Đăng nhập thành công với tài khoản: ${USERNAMEVALID}
    Close Browser
Đăng nhập thất bại
    Open Browser    ${URL}    ${BROWSER} 
    Wait Until Element Is Visible    name=username  
    Input Text    name=username     ${USERNAMEUNVALID}
    Input Text    name=password     ${PASSWORDUNVALID}
    Click Element    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Wait Until Page Contains    Invalid credentials
    Page Should Contain    Invalid credentials
    Log To Console   Đăng nhập thất bại với tài khoản: ${USERNAMEUNVALID}
    Close Browser
