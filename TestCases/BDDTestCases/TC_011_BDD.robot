*** Settings ***
Library    SeleniumLibrary
Resource    ../../FrameworkComponents/SeleniumKeywords.robot
Resource    ../../Object_repository/Pages/HomePage.robot
*** Variables ***

*** Test Cases ***
Scenario: Using gherkin syntax design test scripts in robot framework
    Given Start Browser and Maximize
    When Go to the Website and Click on Input Form
    Then Close Browser Window