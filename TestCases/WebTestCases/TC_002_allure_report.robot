*** Settings ***
Resource    ../../FrameworkComponents/SeleniumKeywords.robot
Resource    ../../Object_repository/Pages/LoginTest.robot
Test Setup    Start Website and Maximize
Test Teardown    Close Browser Window

*** Test Cases ***
Testing Login using multiple data 1

    click link    ${loginlink}
    input text    ${username}    abcdef
    input text    ${password}    jdhcjsdj
    click button    ${LogIn}

Testing Login using multiple data 2

    click link    ${loginlink}
    input text    ${username}    abcdef
    input text    ${password}    jdhcjsdj
    click button    ${LogIn}