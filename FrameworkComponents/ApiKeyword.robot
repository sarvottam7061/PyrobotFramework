*** Settings ***
Library               RequestsLibrary

*** Variables ***
${BaseUrl}     https://reqres.in/

*** Keywords ***
Connect session
    Create Session    reqres    ${baseUrl}
    set suite variable    ${reqres_client}    reqres
    
Disconnect session
    Delete All Sessions
