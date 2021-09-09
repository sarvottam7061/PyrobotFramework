*** Settings ***

Resource    ../../FrameworkComponents/SeleniumKeywords.robot
#Resource    ../../Business_Components/Web_Components/SeleniumEasySteps.robot
#Resource    ../../Business_Components/Web_Components/SeleniumEasyST.robot
Variables    ../../FrameworkLibraries/print_hello.py
Test Setup    Get Test case name and Test suite name

#robot -r ../Report/report.html -o ../Report/output.xml -l ../Report/log.html SeleniumEasy.robot
#robot --listener allure_robotframework ./SeleniumEasy.robot
*** Variables ***

${testData}

*** Test Cases ***
Log information to console
    log to console    "Test case begins"
    log to console    ${testData}
#    log to console    ${test_case_name}
#    log to console    ${suite_py_name}

    
      
  

    
    
