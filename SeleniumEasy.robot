*** Settings ***
Resource    ../../FrameworkComponents/SeleniumKeywords.robot
Resource    ../../Business_Components/Web_Components/SeleniumEasySteps.robot
#Resource    ../Business_Components/Web_Components/SeleniumEasyST.robot
Library    ../../FrameworkLibraries/selenium_driver.py
Test Setup    Start Browser and Maximize
Test Teardown    Close Browser Window
#robot -r ../Report/report.html -o ../Report/output.xml -l ../Report/log.html SeleniumEasy.robot
#robot --listener allure_robotframework ./SeleniumEasy.robot

*** Test Cases ***
Enter and Submit Input Form with Valid data
    [Tags]    input_form    selenium_ip
    navigate to google
    SeleniumEasySteps.Navigate to Input Form
    SeleniumEasySteps.Enter personal details
    SeleniumEasySteps.Enter Address details
    SeleniumEasySteps.Enter project details
    SeleniumEasySteps.Submit the form in the application

   
Demo on Python Libraries
    [Tags]    pylib
#     navigate to google
    ${test_data}    read excel row    TC_02
    log to console    ${test_data}
    log to console    ${test_data['first']}
    
