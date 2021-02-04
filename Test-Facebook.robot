*** Settings ***
Library    SeleniumLibrary   


*** Variable ***
${url_facebook}    http://www.facebook.com
${input_user}      //*[@id="email"]
${input_pass}      //*[@id="pass"]
${btn_login}       name=login
${username_success}            your email
${password_success}            your password
${search}    //input[@type='search']
${search_keyword}    Tester Thailand
${pageContainKeyword}    Tester - Thailand
${btn_watch}    //a[@href='/watch/']
${btn_noti}    //div[@aria-label='Notifications'][@role='button']
${btn_group}    //a[@href='/groups/']
${btn_setting}    //div[@aria-label='Account']
#${btn_logout}    //span[contains(text(),'Log out')]

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
    Wait Until Page Contains Element    Id:ssrb_root_start
    Sleep    3s

Search
    [tags]    Search text success
    Input text    ${search}    ${search_keyword}
    Press Keys    ${search}    ENTER
    Wait Until Page Contains Element    xpath: //*[contains(text(), "Search results for")]
    Sleep    3s

Show Watch Page
    [tags]    Click watch success
    Click Button Watch    ${btn_watch} 
    Wait Until Page Contains Element    xpath: //*[contains(text(), "watch")]
    Sleep    3s

Show Group Page
    [tags]    Show more group
    Click Button Group    ${btn_group}
    Wait Until Page Contains Element    xpath: //div[@aria-label='Preview of a group']    
    Sleep    3s

Show Notification Tabs
    [tags]    Click Notification
    Click Button Notification    ${btn_noti}
    Wait Until Page Contains Element    xpath: //div[@aria-label='Notifications'][@role='dialog']
    Sleep    1s

Setting Facebook
    [tags]    Log out Facebook
    Click Button Setting    ${btn_setting}    
    #Click Button Logout    ${btn_logout}
    Sleep    3s
    #Close Browser

*** Keywords ***

Input Username and Password
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}

Click Button Login
    [Arguments]    ${login_btn} 
    Click Element    ${login_btn}   

Search
    [Arguments]    ${search_txt}    ${btn_enter}
    Input Text    ${search_txt}
    click Element    ${btn_enter}
    
Click Button Watch 
    [Arguments]    ${watch_btn} 
    Click Element    ${watch_btn}   

Click Button Group
    [Arguments]    ${group_btn}
    Click Element    ${group_btn}


Click Button Notification
    [Arguments]    ${noti_btn}
    Click Element    ${noti_btn}


Click Button Setting
    [Arguments]    ${set_btn}
    Click Element    ${set_btn}

#Click Button Logout
    #[Arguments]    ${log_btn}
    #Click Element    ${log_btn}
