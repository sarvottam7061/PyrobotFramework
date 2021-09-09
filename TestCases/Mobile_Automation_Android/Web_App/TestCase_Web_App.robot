*** Settings ***
Library    AppiumLibrary
Resource    ../../../Object_repository/Screens/Web_app/Web_app_resource_Chrome_seleniumeasy.robot

Suite Setup    Open Chrome and go to a url
Suite Teardown    Input submit button
*** Variables ***
${first_name}    Cristiano
${second_name}    Ronaldo
${email}    123@abc.com
${phone}    9807654321
${address}    123,abd street
${city}    Kolkata
${zip}    56743
${website}    www.google.com
${description}    Hi this is a demo project

*** Test Cases ***
TC_01_Simple Validation
    Operations on the page

TC_02_Page Context
    To get current context and all context

TC_03_Input Personal Details
    Input f_name and s_name     ${first_name}    ${second_name}

TC_04_Input Contact Details
    Input email and phone    ${email}    ${phone}

TC_05_Input Address Details
    Input address city state zipcode    ${address}    ${city}    ${zip}

TC_06_Input Website Details
    Input website name and hosting-radio button    ${website}

TC_07_Input Project Description
    Input project description    ${description}

