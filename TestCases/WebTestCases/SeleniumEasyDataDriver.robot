*** Settings ***
Documentation    A test suite with multiple test using Data Driver
Library    DataDriver    file=../../TestData/TestData1.xlsx    sheet_name=Sheet1
#Library           AllureReportLibrary      ../allure-results
Resource    ../../Object_repository/Pages/HomePage.robot
Resource    ../../Object_repository/Pages/InputFormPage.robot
Resource    ../../FrameworkComponents/SeleniumKeywords.robot
Test Setup    Start Browser and Maximize
Test Teardown    Close Browser Window
Test Template    Input Form of Scenario

*** Test Cases ***
Testing the Input Form of Selenium Easy Website   ${first}    ${last}  ${emailid}    ${phone}  ${address1}    ${city1}    ${state1}    ${zip}  ${domain}    ${verify}  ${description}

*** Keywords ***
Input Form of Scenario
    [Arguments]    ${first}    ${last}    ${emailid}    ${phone}  ${address1}    ${city1}    ${state1}    ${zip}  ${domain}    ${verify}  ${description}
    Go to the Website and Click on Input Form
    Input First Name and Last Name    ${first}    ${last}
    Input Email and Phone Number    ${emailid}    ${phone}
    Input Address City State and Zipcode  ${address1}    ${city1}    ${state1}    ${zip}
    Input website Domain Name and Verify    ${domain}    ${verify}
    Type Project Description    ${description}
    Submit The Form



