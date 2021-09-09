*** Settings ***
Documentation    Demo tutorial to connect to PyMySQL database and do necessary validations
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../../Object_repository/Tables/Players.robot
Suite Setup    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}   ${DBPort}
Suite Teardown    Disconnect From Database
*** Variables ***
${DBName}       mydb
${DBUser}       root
${DBPass}           #Originalpassword
${DBHost}       127.0.0.1
${DBPort}       3306

*** Test Cases ***
TC_01_Create_Table
    Create student table
TC_02_Inserting_Data
    Inserting Multiple data
    Inserting data in student table
TC_03_Basic_Operations/Validations
    Check with id 100
    Check with id 100 not exists
    Verify row count=0
    Verify row count=some specified value
    Retrieve data from the database
TC_04_Update_record
    update a record
    Retrieve data from the database
TC_05_Delete_record
    Delete from database
