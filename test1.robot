*** Settings ***

Library     Selenium2Library

*** Variable ***
${expect}    ROBOT FRAME WORK/
${url}  https://www.google.com/
${Browser}  chrome


*** Keywords ***


*** Test Case ***
1. เปิดเว็บไซต์ google
    Open Browser    ${url}  ${Browser}
    Maximize Browser Window 
    Set Selenium Speed  0.3

2. กรอกคำว่า Robot Framework
    Input Text  name=q  Robot Framework
    Mouse Over  name=btnK

3. กดค้นหา    
    Click Button    name=btnK

4. คลิกไปที่ Robot Framework
    Click Element   //h3[@class="LC20lb DKV0Md"]

5. เช็คหน้าเว็บ
    ${result}   Get Text    //h1[@class="main-header"] 
    Log To Console     ${result}
    Should Be Equal    ${result}   ${expect}


    


