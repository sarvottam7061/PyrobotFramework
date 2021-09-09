*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${AppBaseURl}    https://reqres.in/
${original_first_name}    sarvottam
${update_first_name}    rahul

*** Test Cases ***
End To End API Testing
     [Tags]    e2e
    create session    EndtoEnd    ${AppBaseURl}
    &{body}    create dictionary    first_name=${original_first_name}  last_name=kumar   job=engineer    gender=male
    ${post_response}    post on session    EndtoEnd   url=/api/users    data=${body}
    log to console    ${post_response.status_code}
    log to console    ${post_response.content}
    ${id}  convert to string    ${post_response.json()}[id]
    log to console    ${id}

    &{body1}    create dictionary  id=${id}    first_name=${update_first_name} last_name=kumar   job=engineer    gender=male
    ${put_response}    put on session    EndtoEnd   url=/api/users/${id}    data=${body1}
    log to console    ${put_response.content}
    log to console    ${put_response.status_code}

    ${get_response}    get on session    EndtoEnd    url=/api/users/${id}
    ${first_name}  convert to string    ${get_response.json()}[first_name]
    log to console    ${first_name}
    log to console    ${get_response.status_code}
    should be equal    ${first_name}    ${update_first_name}

    ${delete_response}    delete on session    EndtoEnd    url=/api/users/${id}
    log to console    ${delete_response.status_code}
    log to console    ${delete_response.content}
