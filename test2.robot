*** Settings ***
Library  BuiltIn


*** Variable ***
${scalar}   Hello
@{List1}    Robot   Framework
&{dict}     Robot=value1    Framework=value2

*** Keywords ***


*** Test Case ***
Test Data
    Log To Console  \n${scalar}
    Log To Console  \n${List1}[1]  
    Log To Console  \n${dict}[Robot]

    ${test}  Create List  Test  2019
    Log To Console  \n${test}[0]

    &{dict2}  Create Dictionary  key1=test1  key2=test2  key3=test3 
    Log To Console  \n${dict2}[key3]




