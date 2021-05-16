*** Settings ***
Library     RequestsLibrary

*** Variable ***
${Base_URL}     http://thetestingworldapi.com/

*** Test Case ***

TC_001_Get_Request
    Create Session  Get_student_details     ${Base_URL}
    ${response}=    get request     Get_student_details     api/studentsDetails
    Log To Console  ${response}

