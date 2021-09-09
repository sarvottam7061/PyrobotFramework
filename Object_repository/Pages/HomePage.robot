*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${validate1}    id:at-cv-lightbox-close
${popUpClose}    id:at-cv-lightbox-close
${InputFormLink}    //a[@href="#"]
${InputFormSubmitLink}    //a[@href="./input-form-demo.html"]
${validate2}    xpath://label[contains(text() ,'First Name')]

*** Keywords ***
Go to the Website and Click on Input Form

    wait until page contains element    ${validate1}
    click element    ${popUpClose}
    click link    ${InputFormLink}
    click link    ${InputFormSubmitLink}
    wait until page contains element    ${validate2}