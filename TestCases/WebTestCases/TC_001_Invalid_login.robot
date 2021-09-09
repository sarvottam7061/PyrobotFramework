*** Settings ***
Resource    ../../FrameworkComponents/SeleniumKeywords.robot
Resource    ../../Object_repository/Pages/LoginTest.robot
Test Setup    Start Website and Maximize
Test Teardown    Close Browser Window
Test Template    Testing Login using multiple data



*** Test Cases ***       ${user}     ${pass}
Right user empty pass    demo        ${EMPTY}
Right user wrong pass    demo        FooBar

#Empty user right pass    ${EMPTY}    mode
#Empty user empty pass    ${EMPTY}    ${EMPTY}
#Empty user wrong pass    ${EMPTY}    FooBar
#
#Wrong user right pass    FooBar      mode
#Wrong user empty pass    FooBar      ${EMPTY}
#Wrong user wrong pass    FooBar      FooBar


*** Keywords ***
Testing Login using multiple data
    [Arguments]  ${user}    ${pass}
    click link    ${loginlink}
    input text    ${username}    ${user}
    input text    ${password}    ${pass}
    click button    ${LogIn}