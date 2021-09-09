*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

*** Variables ***
${test_script_path}             ../../Business_Components/Database_Automaton/players_list.sql
${create_table_student}         Create table student1(roll integer,first_name varchar(20),last_name varchar(20));
${insert_single_record}         Insert into student values(100,"David","Bekham")
${select_particular_roll.no}    select * from student where roll=100;
${select1_particular_f.name}    select * from student where first_name='jadon';
${select2_particular_f.name}    select * from student where first_name='david';
${selet_all_data}               Select * from mydb.student;
${delete_all_data}              Delete * from mydb.student;
${Update_a_data}                update mydb.student set last_name='Alaba' where first_name='David';

*** Keywords ***
Create student table
    ${out}=    execute sql string     ${create_table_student}
    log to console    ${out}
    should be equal as strings    ${out}    None
Inserting data in student table     #singlerecord
     ${out}=    execute sql string    ${insert_single_record}
     log to console    ${out}
     should be equal as strings    ${out}    None
Inserting Multiple data
    ${out}=    execute sql script    ${test_script_path}
    log to console    ${out}
    should be equal as strings    ${out}    None
Check with id 100
    check if exists in database    ${select_particular_roll.no}
Check with id 100 not exists
    check if not exists in database     ${select_particular_roll.no}
Verify row count=0
    row count is 0      ${select1_particular_f.name}
Verify row count=some specified value
    row count is equal to x    ${select2_particular_f.name}    1
    row count is less than x    ${select2_particular_f.name}    2
Update a record
    ${out}=     execute sql string    ${Update_a_data}
    log to console    ${out}
    should be equal as strings    ${out}    None
Retrieve data from the database
    @{res}=    query    ${selet_all_data}
    log to console  many @{res}
Delete from database
    ${out}=    execute sql string    ${delete_all_data}
    should be equal as strings    ${out}    None
