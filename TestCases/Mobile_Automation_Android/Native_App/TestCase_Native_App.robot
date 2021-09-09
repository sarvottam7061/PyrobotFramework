*** Settings ***
Library    AppiumLibrary
Resource    ../../../Object_repository/Screens/Native_app/Native_app_resource_chat21.robot
Resource    ../../../Business_Components/Mobile_automation_Android/Chat21_App_Credentials.robot

*** Variables ***

*** Test Cases ***
TC_01_Open_App
    Open Chat21 Application
    To Do Screen Recording
    To Take Page Screenshot    001

TC_02_Login
    Login With A User    ${Email_Chat21}    ${Password_Chat21}
    To Take Page Screenshot    002

TC_03_Logout
    Logout With A User
    To Take Page Screenshot    003
    To Stop Screen Recording



