*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${AppBaseURl}    https://reqres.in/
${baseUrl}    https://github.com

*** Test Cases ***
Quick Get Request And Validation
    [Tags]    geton
    create session    FetchData    ${AppBaseURl}    verify=true
    ${response}    get on session    FetchData    url=/api/users?page=2
    ${actual_code}    convert to string    ${response.status_code}
    log to console    ${actual_code}
    log to console    ${response.status_code}
    should be equal   ${actual_code}   200
    log to console    ${response.content}
    ${json_response1}  convert to string    ${response.json()}[data][1][first_name]
    log to console  ${json_response1}
    ${json_response2}  convert to string    ${response.json()}[data][1][email]
    log to console  ${json_response2}

Quick Get Response from JSON Body Test
    [Tags]    jsonget
    &{parms}    create dictionary    page=2
    ${response}=   GET  https://reqres.in/api/users  params=&{parms}  expected_status=200
    should be equal    ${response.json()}[data][0][first_name]    Michael
    log to console    ${response.json()}[data][0][first_name]

Delete Request And Validation
    [Tags]    jsondelete
    create session    FetchData    ${AppBaseURl}    verify=true
    ${response}    delete on session    FetchData    url=/api/users/2
    log to console    ${response.status_code}
    log to console    ${response.content}

Post Request And Validation
     [Tags]    jsonpost
    create session    PostData    ${AppBaseURl}    verify=true
    &{body}    create dictionary    first_name=sarvottam    job=engineer
    ${headers}       Create Dictionary    Content-Type=application/octel-stream    authorisationFlag=N
    ${response}    post on session    PostData    url=/api/users    data=&{body}    headers=${headers}
    log to console    ${response.status_code}
    log to console    ${response.content}
    ${actualresponse}    convert to string    ${response.status_code}
    should be equal    ${actualresponse}    201
Put Request And Validation
     [Tags]    jsonput
    create session    PutData    ${AppBaseURl}    verify=true
    &{body}    create dictionary    first_name=rahul   job=engineer
    ${response}    put on session    PutData    url=/api/users/564    data=&{body}
    log to console    ${response.status_code}
    log to console    ${response.content}
    ${actualresponse}    convert to string    ${response.status_code}
    should be equal    ${actualresponse}    200
    ${response1}    get on session    PutData    url=/api/users/2
    log to console    ${response1.content}

Header Request And Validation
    [Tags]    header
    create session    HeaderData    ${AppBaseURl}    verify=true
    ${response}    HEAD On Session    HeaderData    url=/api/users?page=2
    log to console    ${response.status_code}
    log to console    ${response.content}

Test Headers and Validate
    [Tags]    testheader
    create session    FetchData    ${AppBaseURl}    verify=true
    ${response}    get on session    FetchData    url=/api/users?page=2
    log to console    ${response.headers}
    ${ContentTypeValue}    get from dictionary    ${response.headers}  Content-Type
    log to console    ${ContentTypeValue}
    should be equal    ${ContentTypeValue}    application/json; charset=utf-8

Test Cookies and Validate
    [Tags]    testcookies
    create session    FetchData    ${AppBaseURl}    verify=true
    ${response}    get on session    FetchData    url=/api/users?page=2
    log to console    ${response.cookies}

Testing Authentication to make request
    [Tags]    basicauth
    ${auth}    create list    sarvottam7061    Sarvo@7061
    create session    FetchData    ${baseUrl}    verify=true    auth=${auth}
    ${response}    get on session    FetchData    url=/sarvottam7061/SeleniumEasy
    log to console    ${response.content}

Testing Authentication to store the token somewhere and make request

#    [Tags]    bearerauth
#    Create Session  hook    http://xxxx.azurewebsites.net  verify=${True}
#    ${data}=      Create Dictionary     grant_type=client_credentials     client_id=yyy-zzzz     client_secret=xxxxxxxxxxxxxxx
#    ${headers}=   Create Dictionary      Content-Type=application/x-www-form-urlencoded
#    ${resp}=    post on session    hook    /v1/authtoken    data=${data}   headers=${headers}
#    Should Be Equal As Strings  ${resp.status_code}     200
#    Dictionary Should Contain Value     ${resp.json()}  bearer
#    ${accessToken}=    evaluate    $resp.json().get("access_token")
#    Log to Console        ${accessToken}
#    ${Bearer}=      Set Variable   Bearer
#    ${token}=       catenate    Bearer    ${accessToken}
#    Log to Console     ${token}
#    ${headers}=   Create Dictionary   Authorization=${token}
#    ${resp1}=     get request       hook    /v1/integration/accounts  headers=${headers}
#    Should Be Equal As Strings  ${resp1.status_code}    200
#    #Log to Console   ${resp1.json()}
#///////////////////////////////////////////////////////////////////////////////////////////////////////////
    [Tags]    bearerauth
    Create Session    bearerauth    https://certtransaction.elementexpress.com    verify=${True}
#    ${data}=     Create Dictionary    Token_Name=TestTokenname    grant_type=<grant type>    client_Id=<your Id>     Client_Secret=<Your client secret>    scope=<your scpe>
#    ${headers}=   Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${resp}  get on session    bearerauth    /
    Log To Console    ${resp}
    Log To Console    ${resp.status_code}
    Should Be Equal As Strings    ${resp.status_code}    200
    Dictionary Should Contain Value    ${resp.json()}   Bearer

    ${accessToken}=    evaluate    $resp.json().get("access_token")
    Log to Console    ${accessToken}
    ${token}=    catenate    Bearer    ${accessToken}
    Log to Console    ${token}
#    ${headers1}=  Create Dictionary    Authorization=${token}
#
#    RequestsLibrary.Create Session    GT    <Your Server URL>    verify=${True}
#    ${resp}=  RequestsLibrary.Get Request  GT    <Your API URL>    headers=${headers1}
#    Should Be Equal As Strings    ${resp.status_code}    200
#///////////////////////////////////////////////////////////////////////////////////////////////////////