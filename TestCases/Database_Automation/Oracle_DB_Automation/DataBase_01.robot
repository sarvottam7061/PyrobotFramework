*** Settings ***
Documentation    Demo tutorial to connect to THE ORACLE DATABASE using ROBOT FRAMEWORK
Library    DatabaseLibrary
Resource    ../../../Object_repository/Tables/Student.robot


Suite Setup    connect to database using custom params    cx_Oracle  ${DBConnect}
Suite Teardown    disconnect from database

*** Variables ***

${DBConnect}=    'SYSTEM/dibanuj@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=xe)))'


${First_name1}    JIRAIYA
${First_name2}    MADARA
${row}    2
${column}    1

*** Test Cases ***

#TC_01
#    insert multiple data into table
#    Insert single data into table
#TC_02
#    check if exists in the database
#TC_03
#    check if not exists in the database
#TC_04
#    verify row count=0 of the sample select statement
#TC_05
#    verify row count greater than x of the sample select statement
#TC_06
#    verify row count equal to x of the sample select statement
#TC_07
#    verify row count less than x of the sample select statement
#TC_08
#    Access/retrieve data from the table using sample select statement
#TC_09
#    ${res}    Data parsing and seletion in tuple using sample select statement
#    log to console    ${res}
#    log to console    ${res[${row}][${column}]}
#    should be equal as strings    ${res[${row}][${column}]}    ${first_name2}
#TC_10
#    ${res}    Acces every data and validate accordingly using sample select all data
#    log to console    ${res}
#    log to console    ${res[${row}][${column}]}
#    should be equal as strings    ${res[${row}][${column}]}    ${first_name1}
#
#TC_11
#    Delete records from table
