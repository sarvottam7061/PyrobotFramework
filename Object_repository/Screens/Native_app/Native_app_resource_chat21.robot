*** Settings ***
Library    AppiumLibrary
Resource    ../../../Business_Components/Mobile_automation_Android/Open_Application.robot

*** Variables ***

#Login_parameters
${Emailid_Login}    id=chat21.android.demo:id/email
${Password_Login}    id=chat21.android.demo:id/password
${Login_button_Login}    id=chat21.android.demo:id/login
#MainPage
${Home_Icon_Main}    //android.widget.TextView[@text='HOME']
${Profile_Icon_Main}    //android.widget.TextView[@text='PROFILE']
${Logout_button}    //android.widget.Button[@text='LOGOUT']
#Android_10_validatons
${Continue_icon}    id=com.android.permissioncontroller:id/continue_button
${Ok_Widget-Button}    //android.widget.Button[@text='OK']

*** Keywords ***
Open Chat21 Application
    Open The Application
    ${ALERT}    Run Keyword And Return Status    Page Should Not Contain Element    ${Continue_icon}
    Run Keyword If    '${ALERT}' == 'False'    Avoid Popup Alerts For Andriod 10

Login with a User
    [Arguments]    ${Email_id}    ${Password}
    Input User EmailId    ${Email_id}
    Input User Password    ${Password}
    Tap On Login
    Verify Whether Login Is Successful

Avoid popup alerts for Andriod 10
    Wait Until Page Contains Element    ${Continue_icon}    timeout=10
    Click Element    ${Continue_icon}
    Wait Until Page Contains Element    ${Ok_Widget-Button}    timeout=10
    Click Element    ${Ok_Widget-Button}

Input User EmailId
    [Arguments]    ${Email_id}
    Verify Whether Logout Is Successful By Checking Emailid Field
    Input Text    ${Emailid_Login}    ${Email_id}
Input User Password
    [Arguments]    ${Password}
    Wait Until Page Contains Element    ${Password_login}
    Input Text    ${Password_Login}    ${Password}
Tap on Login
    Click Element    ${Login_button_Login}
Verify whether Login is Successful
    Wait Until Page Contains Element    ${Home_Icon_Main}    timeout=10

Logout with a User
    Navigate To The Profile Tab
    Tap On Logout
    Verify Whether Logout Is Successful By Checking Emailid Field


Navigate to the Profile Tab
    Click Element    ${Profile_Icon_Main}
Tap on Logout
    Wait Until Page Contains Element    ${logout_button}    timeout=20
    Click Element    ${Logout_button}
Verify whether Logout is successful by checking Emailid field
    Wait Until Page Contains Element    ${Emailid_Login}    timeout=10

To take page screenshot
    [Arguments]   ${ss_no}
    Capture Page Screenshot    filename=${ss_no}.png

To do screen recording
    Start Screen Recording
To stop screen recording
    Stop Screen Recording