*** Settings ***

Library    SeleniumLibrary
Resource    ../../FrameworkComponents/SeleniumKeywords.robot

*** Variables ***

*** Keywords ***
Scenario:Testing Invalid login
    [Arguments]    ${user}    ${pass}
    Given Start Website and Maximize
    When Testing Login For Multiple Data    ${user}    ${pass}
    Then Close Browser Window

| *Test Case* | | *user* | | *pass* |
| 1 | Scenario:Testing Invalid login | hello | world |
| 2 | Scenario:Testing Invalid login | Priya | kumari |
| 3 | Scenario:Testing Invalid login | fooo | bar |
| 4 | Scenario:Testing Invalid login | rahul | verma |
| 5 | Scenario:Testing Invalid login | Pradeep | singh |


# robot --outputdir ../../Report --listener allure_robotframework;../../Report/allure --listener ../../FrameworkLibraries/Python_Listener.py SeleniumEasyBDD.robot

