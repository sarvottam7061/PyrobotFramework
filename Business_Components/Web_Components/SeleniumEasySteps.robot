*** Settings ***
Library    SeleniumLibrary
Library    ../../FrameworkLibraries/ReadData1.py
Resource   ../../Object_repository/Pages/InputFormPage.robot
Resource   ../../Object_repository/Pages/HomePage.robot


*** Variables ***
${first}    test
${last}     tester
${emailid}  tester@gmail.com
${phone}    9006890121
${address1}     1, cross street
${city1}        Newyork
${state1}       8
${zip}      90012
${domain}       www.apple.com   
${verify}       yes
${description}      Testing the site for any errors
*** Keywords ***

Navigate to Input Form
    Go to the Website and Click on Input Form
    fetch number of rows    sheet1

Enter personal details
    Input First Name and Last Name    ${first}    ${last}
    Input Email and Phone Number    ${emailid}    ${phone}

Enter Address details
    Input Address City State and Zipcode  ${address1}    ${city1}    ${state1}    ${zip}


Enter project details
    Input website Domain Name and Verify    ${domain}    ${verify}
    Type Project Description    ${description}

Submit the form in the application
     Submit The Form

