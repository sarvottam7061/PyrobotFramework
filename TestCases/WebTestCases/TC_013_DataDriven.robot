*** Settings ***
Library    SeleniumLibrary
Resource   ../../Business_Components/Web_Components/SeleniumEasyDataDriven.robot


*** Variables ***
${Browser}    Chrome
${URL}    https://thetestingworld.com/
${executable_path}    ../../Drivers/chromedriver.exe
*** Test Cases ***
ogin Logout Functionality
    open browser    ${URL}    ${Browser}    executable_path=${executable_path}
    maximize browser window
    click element     xpath://a[text()='Login']
    ${rows}    Read Number of Rows    Sheet1
    FOR     ${i}    IN RANGE    1    ${rows}+1
    ${username}    Read Excel Data of Cell    Sheet1    ${i}    1
    ${password}    Read Excel Data of Cell    Sheet1    ${i}    2
    input text    id:username    ${username}
    input text    id:password    ${password}
    click button    xpath://button[@type='submit']
    sleep    3 seconds
    END
    close all browsers

