*** Settings ***
Library BuiltIn
Library Selenium2Library
Resource    file_resource/variable.robot
Resource    file_resource/Keyword.robot


*** Variable ***
&{test}     Success  200


*** Test Case ***
เทสค่าส่งไปที่ Keyword
    Hello name  Kannika

*** Keywords ***
Hello Name
    [Arguments] ${data}
    Log To Console  \nHello ${data}
    Log To Console  Hello   ${Test}   


