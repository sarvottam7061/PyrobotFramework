*** Settings ***
Library    DatabaseLibrary

*** Variables ***

#${row}    2
#${column}    1
#${first}    2
#${second}    1
${select_all_people}    SELECT * FROM PEOPLE
${table_name}    STUDENT
${create_table}    CREATE TABLE STUDENT1(ROLL INTEGER,F_NAME VARCHAR(20),L_NAME VARCHAR(20))
${insert_single_data}    INSERT INTO STUDENT1 VALUES(100,'ITACHI','UCCIHA')
${test_data}    ./Business_Components/Database_Automaton/testData.sql
${update_data}    UPDATE STUDENT SET F_NAME='THE GREAT' WHERE L_NAME='GUY'
${sample_select_statement1}    SELECT * FROM STUDENT WHERE L_NAME='UCHIHHA'
${sample_select_statement2}    SELECT * FROM STUDENT WHERE L_NAME='XYZ'
${select_all_data}    SELECT * FROM STUDENT
${delete_data}    DELETE FROM STUDENT

*** Keywords ***
Check table exisits or not
    table must exist    ${table_name}

Select from people table
    @{queryResults}    Query    ${select_all_people}
    log to console   many @{queryResults}
    [Return]    @{queryResults}

Create Table
    ${out}=    execute sql string    ${create_table}
    log to console    ${out}
    should be equal as strings    ${out}    None

Insert single data into table
    ${out}=    execute sql string    ${insert_single_data}
    log to console    ${out}
    should be equal as strings    ${out}    None

Insert multiple data into table
    ${out}=     execute sql script    ${test_data}
    log to console    ${out}
    should be equal as strings    ${out}    None

Update table data
    ${out}=    execute sql string    ${update_data}

Check if exists in the database
    check if exists in database    ${sample_select_statement1}
Check if NOT exists in the database
    check if not exists in database    ${sample_select_statement2}

Verify row count=0 of the sample select statement
    row count is 0    ${sample_select_statement2}
Verify row count greater than x of the sample select statement
    row count is greater than x    ${sample_select_statement1}    2
Verify row count equal to x of the sample select statement
    row count is equal to x    ${sample_select_statement1}    5
Verify row count less than x of the sample select statement
    row count is less than x    ${sample_select_statement1}    6

Access/retrieve data from the table using sample select statement
    @{queryResults}=    query    ${sample_select_statement1}
    #log to console   many @{queryResults}
    log to console  many @{queryResults}
    #log to console    @{queryResults}
    [Return]    @{queryResults}

Delete records from table
    ${out}=    execute sql string    ${delete_data}
    should be equal as strings    ${out}    None

Data parsing and seletion in tuple using sample select statement
    @{res}=    query    ${sample_select_statement1}
    log to console    ${res}

    [Return]    ${res}

Acces every data and validate accordingly using sample select all data
    @{res}=    query    ${select_all_data}
    log to console    ${res}

    [Return]    ${res}