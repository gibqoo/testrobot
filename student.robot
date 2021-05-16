*** Settings ***
Library     RequestsLibrary


*** Variable ***
${Base_URL}      http://thetestingworldapi.com

*** Test Case ***
TC_Get_Request
    Create Session  Get_Student_Details     ${Base_URL}
    ${response}=    Get Request     Get_Student_Details     api/studentsDetails
    Log To Console      ${response.status_code}


