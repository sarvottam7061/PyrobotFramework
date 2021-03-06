*** Settings ***
Test Setup        Start Angular Test
Resource          ../resource.robot
Library           AngularJSLibrary
Library            SeleniumLibrary
*** Test Cases ***
Should Find An Element By Binding
    ${text} =  Get Text  {{greeting}}
    Should Be Equal  '${text}'  'Hiya'

Should Find A Binding By Partial Match
    ${text} =  Get Text  binding=greet
    Should Be Equal  '${text}'  'Hiya'

Should Find An Element By Binding With Ng-Bind Attribute
    ${text} =  Get Text  binding=username
    Should Be Equal  '${text}'  'Anon'

Should Find An Element By Binding With Ng-Bind-Template Attribute
    ${text} =  Get Text  {{nickname|uppercase}}
    Should Be Equal  '${text}'  '(ANNIE)'

Should Find An Element By Text Input Model
    Clear Element Text  model=username
    ${text} =  Get Text  binding=username
    Should Be Equal  '${text}'  ''

    Input Text  model=username  Jane Doe
    ${text} =  Get Text  binding=username
    Should Be Equal  '${text}'  'Jane Doe'

Should Find An Element By Checkbox Input Model
    Element Should Be Visible  id=shower
    Click Element  model=show
    Wait For Angular
    Element Should Not Be Visible  id=shower

Should Find A Textarea By Model
   ${value} =  Get Element Attribute  model=aboutbox@value
   Should Be Equal  '${value}'  'This is a text box'

   Clear Element Text  model=aboutbox
   Input Text  model=aboutbox  Something else to write about

   ${value} =  Get Element Attribute  model=aboutbox@value
   Should Be Equal  '${value}'  'Something else to write about'

Should Find Multiple Selects By Model
   Locator Should Match X Times  model=dayColor.color  3

Should Find Inputs With Alternate Attribute Forms
   Element Text Should Be  id=letterlist  ${EMPTY}

   Click Element  model=check.w
   Element Text Should Be  id=letterlist  w

   Click Element  model=check.x
   Element Text Should Be  id=letterlist  wx

   Click Element  model=check.y
   Element Text Should Be  id=letterlist  wxy

   Click Element  model=check.z
   Element Text Should Be  id=letterlist  wxyz

Should Find Multiple Inputs
   Locator Should Match X Times  model=color  3

Should Clear Text From An Input Model
   Clear Element Text  model=username
   Element Text Should Be  binding=username  ${EMPTY}

   Input Text  model=username  Jane Doe
   Element Text Should Be  binding=username  Jane Doe

   Clear Element Text  model=username
   Element Text Should Be  binding=username  ${EMPTY}

Should Find By Partial Match
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   # Full Match
   Element Text Should Be  repeater=baz in days | filter:'T'@row[0]@column={{baz.initial}}  T
   # Partial Match
   Element Text Should Be  repeater=baz in days@row[0]@column=b  T

   # Partial Row Match
   Element Text Should Be  repeater=baz in days@row[0]  T

Should Return All Rows When Unmodified
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   Locator Should Match X Times  repeater=allinfo in days  5

   Element Text Should Be  repeater=allinfo in days@row[0]  M Monday
   Element Text Should Be  repeater=allinfo in days@row[1]  T Tuesday
   Element Text Should Be  repeater=allinfo in days@row[2]  W Wednesday

   #@{rows} =  Get Elements  repeater=allinfo in days
   #Length Should Be  ${rows}  5
   #Should Be Equal   ${row[0]}  M Monday
   #Should Be Equal   ${row[1]}  T Tuesday
   #Should Be Equal   ${row[2]}  W Wednesday

Should Return A Single Column
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   Locator Should Match X Times  repeater=allinfo in days@column=initial  5

   Element Text Should Be  repeater=allinfo in days@column=initial@row[0]  M
   Element Text Should Be  repeater=allinfo in days@column=initial@row[1]  T
   Element Text Should Be  repeater=allinfo in days@column=initial@row[2]  W

   Locator Should Match X Times  repeater=allinfo in days@column=name  5

   Element Text Should Be  repeater=allinfo in days@column=name@row[0]  Monday
   Element Text Should Be  repeater=allinfo in days@column=name@row[1]  Tuesday
   Element Text Should Be  repeater=allinfo in days@column=name@row[2]  Wednesday

Should Return A Single Row
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   Element Text Should Be  repeater=allinfo in days@row[1]  T Tuesday

Should Return An Individual Cell
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   ${secondNameByRowFirst} =  Get Text  repeater=allinfo in days@row[1]@column=name
   Should Be Equal  ${secondNameByRowFirst}  Tuesday

   ${secondNameByColumnFirst} =  Get Text  repeater=allinfo in days@column=name@row[1]
   Should Be Equal  ${secondNameByColumnFirst}  Tuesday

   Should Be Equal  ${secondNameByRowFirst}  ${secondNameByColumnFirst}

Should Find A Using data-ng-repeat
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   # byRow
   Element text Should Be  repeater=day in days@row[2]  W

   # byCol
   Element text Should Be  repeater=day in days@row[2]@column=day  W

Should Find Using ng:repeat
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   # byRow
   Element text Should Be  repeater=bar in days@row[2]  W

   # byCol
   Element text Should Be  repeater=bar in days@row[2]@column=bar  W

Should Find Using ng_repeat
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   # byRow
   Element text Should Be  repeater=foo in days@row[2]  W

   # byCol
   Element text Should Be  repeater=foo in days@row[2]@column=foo  W

Should Find Using x-ng-repeat
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   # byRow
   Element text Should Be  repeater=qux in days@row[2]  W

   # byCol
   Element text Should Be  repeater=qux in days@row[2]@column=qux  W

#Should Determine If Repeater Elements Are Present
#   [Tags]  ng-repeat
#   [Setup]  Start ng-repeat Test
#   ${row3} =  Get Element  repeater=allinfo in days@row[3]
#
#   Run Keyword And Expect Error  *  Get Elements  repeater=allinfo in days@row[5]

# -- repeaters using ng-repeat-start and ng-repeat-end -- #

Should Return All Elements When Unmodified
   [Tags]  ng-repeat
   [Setup]  Start ng-repeat Test
   Locator Should Match X Times  repeater=bloop in days    15

Should Locate Element Using Default Strategy
   Click Element  disabledButton

Should Locate Element Using id= Strategy
   Click Element  id=disabledButton

Should Locate Element Using id: Strategy
   Click Element  id:disabledButton

*** Keywords ***
Start Angular Test
    Go To   http://${SERVER}/testapp/ng1/alt_root_index.html#/form
    Wait For Angular

Start ng-repeat Test
    Go To   http://${SERVER}/testapp/ng1/alt_root_index.html#/repeater
    Wait For Angular