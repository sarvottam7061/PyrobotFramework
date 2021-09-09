*** Settings ***
Library    ../../FrameworkLibraries/ReadData1.py

*** Keywords ***
Read Number of Rows
    [Arguments]    ${sheetname}
    ${max}    fetch_number_of_rows    ${sheetname}
    [Return]    ${max}

Read Excel Data of Cell
    [Arguments]    ${sheetname}    ${row}    ${cell}
    ${celldata}    fetch_cell_data    ${sheetname}    ${row}    ${cell}
    [Return]    ${celldata}