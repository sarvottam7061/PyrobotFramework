*** Settings ***
Resource    ../../FrameworkComponents/ApiKeywords.robot
Library     RequestsLibrary
Library     JSONLibrary



*** Variables ***
${end_point}    api/users
${get_param}    page=3
&{post_body}    name=morpheus     job=leader


*** Keywords ***
Get employee from page 2
    Create Session    reqres    ${baseUrl}
    set suite variable    ${reqres_client}    reqres
    ${response}    GET On Session   ${reqres_client}    url=${end_point}    params=${get_param}
    [Return]    ${response}


Add employee
    Create Session    reqres    ${baseUrl}
    set suite variable    ${reqres_client}    reqres
    ${response}     POST On Session    ${reqres_client}     url=${end_point}   data=&{post_body}
    [Return]    ${response}

   