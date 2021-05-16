*** Settings ***
Library           String
Library           openpyxl
Library           BuiltIn

*** Variables ***
${excel}   testData.xlsx

*** Test Cases ***
Test Load Data Excel
    ${wb}      Load Workbook           ${CURDIR}/${excel}
    ${ws}    Set Variable    ${wb.get_active_sheet()}
    ${cell}    Set Variable    ${ws.cell(1,1).value}
    ${body}    Fetch From Right    ${cell}    {}
    Log To Console  \n\n${body}\n

