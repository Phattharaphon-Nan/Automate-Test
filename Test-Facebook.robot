*** Settings ***
Library    SeleniumLibrary
Library    Timer    


*** Variable ***
${url_facebook}    http://www.facebook.com
${input_user}      //*[@id="email"]
${input_pass}      //*[@id="pass"]
${btn_login}       name=login
${username_success}            your Usename
${password_success}            your Password
${btn_watch}    //a[@href='/watch/']
${btn_noti}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/span/div/div[1]
${btn_group}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[3]/div/div[1]/div[1]/ul/li[4]/span/div
${btn_setting}    //*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[4]/div[1]/span/div/div[1]
${btn_logout}    //span[contains(text(), 'Log Out')]

*** Test Case ***

Login Facebook - success
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument   --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    #Clear Popup allow and Block 
    [tags]    Login Facebook success
    Go To    ${url_facebook}
    maximize Browser window
    Input Username and Password    ${input_user}     ${input_pass}       ${username_success}      ${password_success}
    Click Button Login    ${btn_login}


Watch Button in Facebook 
    [tags]    Click watch success
    Click Button Watch    ${btn_watch} 
    Wait Until Page Contains Element    xpath: //*[contains(text(), "watch")]
    Sleep    2s

Show Group
    [tags]    Show more group
    Click Button Group    ${btn_group}
    Wait Until Page Contains Element    xpath: //div[@aria-label='Preview of a group']    
    Sleep    2s

Show Notofication
    [tags]    Click Notification
    Click Button Notification    ${btn_noti}
    Wait Until Page Contains Element    xpath: //div[@aria-label='Notifications'][@role='dialog']
    Sleep    2s

Show Setting 
    [tags]    Show more Setting
    Click Button Setting    ${btn_setting}    
    Sleep    1s

Log out
    [tags]    Log out Facebook
    Click Button Logout    ${btn_logout}
    Sleep    3s


*** Keywords ***

Input Username and Password
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}

Click Button Login
    [Arguments]    ${login_btn}
    Wait Until Element Is Visible    ${login_btn}    
    Click Element    ${login_btn}   

Click Button Watch 
    [Arguments]    ${watch_btn}
    Wait Until Element Is Visible    ${watch_btn}    
    Click Element    ${watch_btn}   

Click Button Group
    [Arguments]    ${group_btn}
    Wait Until Element Is Visible    ${group_btn}
    Click Element    ${group_btn}


Click Button Notification
    [Arguments]    ${noti_btn}
    Wait Until Element Is Visible    ${noti_btn}
    Click Element    ${noti_btn}


Click Button Setting
    [Arguments]    ${set_btn}
    Wait Until Element Is Visible    ${set_btn}
    Click Element    ${set_btn}

Click Button Logout
    [Arguments]    ${out_btn}
    Wait Until Element Is Visible    ${out_btn}
    Click Element    ${out_btn}