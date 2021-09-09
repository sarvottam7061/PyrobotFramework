*** Settings ***
Library    SeleniumLibrary
Documentation    Testing Addition of two numbers

*** Variables ***
${Browser}    Chrome
${URL}    https://www.seleniumeasy.com/test/basic-first-form-demo.html
${executable_path}    ../../Drivers/chromedriver
${popupclose}    xpath://*[@id="at-cv-lightbox-button-holder"]/a[2]
${assertion}    id:displayvalue
*** Test Cases ***
Testing Input field and button
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless


    OPEN BROWSER   ${URL}   ${Browser}    options=${chrome_options}    executable_path=${executable_path}
    maximize browser window
    set selenium implicit wait    5 seconds
    wait until page contains element    ${popupclose}
    click element    ${popupclose}
    input text    id:sum1    5
    input text    id:sum2    6
    click button    xpath://button[text()='Get Total']
    element text should be    ${assertion}    11





