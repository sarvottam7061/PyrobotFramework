*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary




*** Test Cases ***
Quick Get Request Test
    [Tags]    request
    ${response}    GET    https://reqres.in/
    log to console  ${response.status_code}


Quick Get Request With Parameters Test
    [Tags]    response
    ${response}=    GET  https://reqres.in/api/users  params=page=2  expected_status=200
    log to console  ${response.status_code}
    log to console  ${response.json()}



Quick Get Response from JSON Body Test
    [Tags]    json
    ${response}=   GET  https://reqres.in/api/users  params=page=2  expected_status=200
    should be equal    ${response.json()}[data][0][first_name]    Michael
    log to console    ${response.json()}[data][0][first_name]

Quick Get A JSON Body Test
    [Tags]    listjson
    ${response}=   GET  https://reqres.in/api/users  params=page=2  expected_status=200
    ${json_response}    to json    ${response.content}
    @{json_list}    get value from json    ${json_response}    data[0].first_name
    ${first_name}    get from list    ${json_list}    0
    log to console    ${first_name}
    should be equal    ${first_name}    Michael
