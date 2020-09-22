*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    about:blank    chrome


*** Variable ***
${url_facebook}    http://www.facebook.com
${input_user}      //*[@id="email"]
${input_pass}      //*[@id="pass"]
${btn_login}       name=login
${username_success}            p_nan29@hotmail.com
${password_success}            phattharaphon_28244
${btn_watch}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[3]/div/div[1]/div[1]/ul/li[2]/span/div/a
${btn_noti}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/span/div/div[1]
${btn_group}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[3]/div/div[1]/div[1]/ul/li[4]/span/div
${btn_setting}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[4]/div[1]/span/div/div[1]

*** Test Case ***

Login Facebook - success
    [tags]    Login Facebook success
    Go To    ${url_facebook}
    Input Username and Password    ${input_user}     ${input_pass}       ${username_success}      ${password_success}
    Click Button Login    ${btn_login}


Watch Button in Facebook 
    [tags]    Click watch success
    Click Button Watch    ${btn_watch}

Show Notofication
    [tags]    Click Notification
    Click Button Notification    ${btn_noti}

Show Group
    [tags]    Show more group
    Click Button Group    ${btn_group}

Show Setting 
    [tags]    Show more Setting
    Click Button Setting    ${btn_setting}

*** Keywords ***
Input Username and Password
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}

Click Button Login
    [Arguments]    ${login_btn}
    Element Should Be Visible    ${login_btn}
    Click Element    ${login_btn}   

Click Button Watch 
    [Arguments]    ${watch_btn}
    Wait Until Element Is Visible    ${watch_btn}
    Click Element    ${watch_btn}   

Click Button Notification
    [Arguments]    ${noti_btn}
    Wait Until Element Is Visible    ${noti_btn}
    Click Element    ${noti_btn}

Click Button Group
    [Arguments]    ${group_btn}
    Wait Until Element Is Visible    ${group_btn}
    Click Element    ${group_btn}

Click Button Setting
    [Arguments]    ${set_btn}
    Wait Until Element Is Visible    ${set_btn}
    Click Element    ${set_btn}