*** Settings ***
Library    AppiumLibrary
Resource    ../../../Business_Components/Mobile_automation_Android/Open_Application.robot

*** Variables ***

${First_name_element}                   //input[@name='first_name']
${Last_name_element}                    name=last_name
${Email_element}                        name=email
${Phone_element}                        name=phone
${Address_element}                      name=address
${City_element}                         //input[@name='city']
${State_element}                        //select[@name='state']
${State_optionlist_element}             //option[text()='California']
${zipcode_element}                      //input[@name='zip']
${website_element}                      //input[@name='website']
${project_description_element}          //textarea[@name='comment']
${Radio_button}                         //input[@type='radio' and @value='yes']
${Submit_button}                        //button[@type='submit' and @class='btn btn-default']

*** Keywords ***

Open Chrome and go to a url
    Open Chrome Browser
    Go To Url    https://www.seleniumeasy.com/test/input-form-demo.html
    Wait Until Page Contains    Selenium Easy    timeout=15

Operations on the page
    ${con}    Get Current Context
    log to console    ${con}
    Click Element    ${First_name_element}
    Capture Page Screenshot    filename=click.png

To get current context and all context
    ${con}    Get Current Context
    log to console                 ${con}
    ${con}    Get Contexts
    log to console                 ${con}
Input f_name and s_name
    [Arguments]    ${f_name}    ${secondname}
    Input Text       ${First_name_element}     ${f_name}
    Input text       ${Last_name_element}      ${secondname}
Input email and phone
    [Arguments]   ${email}    ${phone}
    Input text       ${Email_element}          ${email}
    Input text       ${Phone_element}          ${phone}
Input address city state zipcode
    [Arguments]    ${Address}    ${City}    ${zip}
    Input text       ${Address_element}        ${Address}
    Input text       ${City_element}           ${City}
    Click Element    ${State_element}
    Click Element    ${State_optionlist_element}
    input text    ${zipcode_element}    ${zip}
Input website name and hosting-radio button
    [Arguments]    ${web}
    input text    ${website_element}    ${web}
    Click Element    ${Radio_button}
Input project description
    [Arguments]    ${description}
    input text    ${project_description_element}    ${description}
Input submit button
    Click Element    ${Submit_button}
    Capture Page Screenshot    filename=submit.png



