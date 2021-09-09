*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0
Library         ReactLibrary
Suite Setup     Open browser  https://airbnb.com  chrome
Suite Teardown  Close browser


*** Test Cases ***

Scenario: Wait for react
  Go To  https://airbnb.com
  Wait for react
  Page Should Contain  Airbnb Book unique homes

Scenario: Wait for react with reducer
  Go To  https://airbnb.com
  Wait for react  reducer=headlines
  Page Should Contain  Airbnb Book unique homes