*** Settings ***
Library    SeleniumLibrary
Resource    ../../FrameworkComponents/SeleniumKeywords.robot
Test Setup  Start Browser and Maximize
  ...          Go To   http://localhost:8080/testapp/ng1/alt_root_index.html#/async

Library         AngularJSLibrary
Library    SeleniumLibrary
*** Test Cases ***
Waits For Http Calls
    [Tags]    one
    [Documentation]  `Wait For Angular` should delay for 2 seconds.
    Wait For Angular
    Element Text Should Be  binding=slowHttpStatus  not started

    Click Button  css=[ng-click="slowHttp()"]

    Wait For Angular  timeout=20sec
    Element Text Should Be  binding=slowHttpStatus  done

Waits For Long Javascript Execution
    [Documentation]  This test will take variable amount of time but should not
    ...    take more than about five seconds.
    Wait For Angular
    Element Text Should Be  binding=slowFunctionStatus  not started

    Click Button  css=[ng-click="slowFunction()"]

    Wait For Angular
    Element Text Should Be  binding=slowFunctionStatus  done

DOES NOT wait for timeout
    [Documentation]  The `Wait For Angular` keyword should return immediately
    ...    and not wait for a javascript timeout.
    Wait For Angular
    Element Text Should Be  binding=slowTimeoutStatus  not started

    Click Button  css=[ng-click="slowTimeout()"]

    Wait For Angular
    Element Text Should Be  binding=slowTimeoutStatus  pending...

Waits For $timeout
    [Documentation]  Test should take around 4 seconds.
    Wait For Angular
    Element Text Should Be  binding=slowAngularTimeoutStatus  not started

    Click Button  css=[ng-click="slowAngularTimeout()"]

    Wait For Angular  timeout=30sec
    Element Text Should Be  binding=slowAngularTimeoutStatus  done

Waits For $timeout Then A Promise
    [Documentation]  Test should take around 4 seconds.
    Wait For Angular
    Element Text Should Be  binding=slowAngularTimeoutPromiseStatus  not started

    Click Button  css=[ng-click="slowAngularTimeoutPromise()"]

    Wait For Angular  timeout=30sec
    Element Text Should Be  binding=slowAngularTimeoutPromiseStatus  done

Waits For Long Http Call Then A Promise
    [Documentation]  `Wait For Angular` should delay for 2 seconds.
    Wait For Angular
    Element Text Should Be  binding=slowHttpPromiseStatus  not started

    Click Button  css=[ng-click="slowHttpPromise()"]

    Wait For Angular  timeout=30sec
    Element Text Should Be  binding=slowHttpPromiseStatus  done

Waits For Slow Routing Changes
    Wait For Angular
    Element Text Should Be  binding=routingChangeStatus  not started

    Click Button  css=[ng-click="routingChange()"]

    Wait For Angular  timeout=30sec
    Page Should Contain  polling mechanism

Waits For Slow Ng-Include Templates To Load
    Wait For Angular
    Element Text Should Be  css=.included  fast template contents

    Click Button  css=[ng-click="changeTemplateUrl()"]

    Wait For Angular  timeout=30sec
    Element Text Should Be  css=.included  slow template contents

Wait Times Out
    Wait For Angular
    Element Text Should Be  binding=slowAngularTimeoutStatus  not started

    Click Button  css=[ng-click="slowAngularTimeout()"]

    Run Keyword And Expect Error  *  Wait For Angular  timeout=1sec

Log Pending Http Calls
    Wait For Angular
    Element Text Should Be  binding=slowHttpPromiseStatus  not started

    Click Button  css=[ng-click="slowHttpPromise()"]

    Run Keyword And Expect Error  *  Wait For Angular  timeout=1sec

Implicit Wait For Angular On Timeout
    Wait For Angular

    Click Button  css=[ng-click="slowAngularTimeout()"]

    Click Button  css=[ng-click="slowAngularTimeoutHideButton()"]

Implicit Wait For Angular On Timeout With Promise
    Wait For Angular

    Click Button  css=[ng-click="slowAngularTimeoutPromise()"]

    Click Button  css=[ng-click="slowAngularTimeoutPromiseHideButton()"]

Toggle Implicit Wait For Angular Flag
    Element Should Not Be Visible  css=[ng-click="slowAngularTimeoutHideButton()"]

    Set Ignore Implicit Angular Wait  ${true}

    Click Button  css=[ng-click="slowAngularTimeout()"]

    Run Keyword And Expect Error  *  Click Button  css=[ng-click="slowAngularTimeoutHideButton()"]

    Wait For Angular
    Element Should Be Visible  css=[ng-click="slowAngularTimeoutHideButton()"]
    Click Element  css=[ng-click="slowAngularTimeoutHideButton()"]
    Element Should Not Be Visible  css=[ng-click="slowAngularTimeoutHideButton()"]

    Set Ignore Implicit Angular Wait  ${false}

    Click Button  css=[ng-click="slowAngularTimeout()"]

    Click Button  css=[ng-click="slowAngularTimeoutHideButton()"]

    Element Should Not Be Visible  css=[ng-click="slowAngularTimeoutHideButton()"]