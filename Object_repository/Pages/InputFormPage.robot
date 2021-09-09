*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${firstname}    //input[@name="first_name"]
${lastname}    //input[@name="last_name"]
${email}    //input[@name="email"]
${phoneNo}    //input[@name="phone"]
${address}    //input[@name="address"]
${city}    //input[@name="city"]
${state}    //select[@name="state"]
${zipcode}    //input[@name="zip"]
${website}    //input[@name="website"]
${Yesno}    hosting
${comments}    //textarea[@name="comment"]
${submit}    //span[@class="glyphicon glyphicon-send"]

*** Keywords ***
Input First Name and Last Name
    [Arguments]    ${first}    ${last}
    Input Text    ${firstname}    ${first}
    Input Text    ${lastname}    ${last}
Input Email and Phone Number
    [Arguments]    ${emailid}    ${phone}
    Input Text    ${email}    ${emailid}
    Input Text    ${phoneNo}    ${phone}
Input Address City State and Zipcode
    [Arguments]    ${address1}    ${city1}    ${state1}    ${zip}
    Input Text    ${address}    ${address1}
    Input Text    ${city}    ${city1}
    select from list by index    ${state}  ${state1}
    Input Text    ${zipcode}    ${zip}
Input website Domain Name and Verify
    [Arguments]    ${domain}    ${verify}
    Input Text    ${website}    ${domain}
    select radio button    ${Yesno}    ${verify}
Type Project Description
    [Arguments]    ${description}
    Input Text    ${comments}    ${description}
Submit The Form
    Click Element    ${submit}


