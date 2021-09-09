*** Settings ***
Resource    ../../FrameworkComponents/ApiKeyword.robot
Resource    ../../Object_repository/endpoint/ApiUsers.robot
Suite Setup    Connect session
Suite Teardown    Disconnect session

*** Variables ***
${file_path}    ../../TestData/get_response.json

*** Test Cases ***
Get employee and validate employee
    [Tags]    get_request
    ${response}    GET EMPLOYEE FROM PAGE 2
    log to console    ${response.json()}
    status should be    200     ${response}
    ${json_response}    Load JSON From File     ${file_path}
    should be equal    ${response.json()}   ${json_response}
    
    
Post employee and validate details
    [Tags]    post_request
    ${response}    ApiUsers.Add employee
    log to console    ${response.json()}
    status should be    201     ${response}
   
    

