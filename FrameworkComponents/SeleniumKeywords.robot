*** Settings ***
Library    SeleniumLibrary
Library    ../FrameworkLibraries/UserKeywords.py
Resource   ../Object_repository/Pages/LoginTest.robot
*** Variables ***
${Browser}    Chrome
${URL}    https://www.seleniumeasy.com/test/
${domain}    https://thetestingworld.com/
${executable_path}     ../../Drivers/chromedriver.exe
${some_var}    Anything
*** Keywords ***
Start Browser and Maximize
    OPEN BROWSER   ${URL}   ${Browser}    executable_path=${executable_path}
    maximize browser window
    set selenium implicit wait    5 seconds
#    create webdriver   ${Browser}   executable_path=${path}
#    go to    ${URL}
#    maximize browser window
#    set selenium implicit wait    5 seconds
    set selenium speed    0.3

Start Website and Maximize
    create webdriver   ${Browser}   executable_path=${executable_path}
    go to    ${domain}   
    maximize browser window
    set selenium implicit wait    5 seconds

Close Browser Window
    close all browsers
    
Get Test case name and Test suite name
    log to console    "starting here"
    log to console    ${TEST_NAME}   
    log to console    ${SUITE_NAME}
    log to console    ${some_var}
    log to console    "ending here"
    set test variable    ${testData}    "hello world"

Start Browser and Maximize for BDD
    OPEN BROWSER   ${URL}   ${Browser}
    maximize browser window
    close all browsers
Create Folder at Runtime
    [Arguments]    ${foldername}    ${subfoldername}
    create_folder_name    ${foldername}
    create_subfolder_name    ${subfoldername}
    log    "Task done successfully"

Concatinate Username and Password
    [Arguments]    ${Username}    ${Password}
    ${resultValue}    concatinate_two_values    ${Username}    ${Password}
    log    ${resultValue}

Testing Login For Multiple Data
    [Arguments]    ${user}    ${pass}
    click link    ${loginlink}
    input text    ${username}    ${user}
    input text    ${password}    ${pass}
    click button    ${LogIn}
