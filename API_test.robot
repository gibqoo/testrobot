*** Settings ***
Library     Collections
Library     String
Library     HttpLibrary.HTTP
Library     RequestsLibrary


*** Variable ***
${url}      http://data.tmd.go.th/api

*** Test Case ***
Get Weather 3Hours Should Success and return data
    &{params}=  Create Dictionary       type=json
    ${resp}=    Get Weather3Hours       ${params}
    Log Json    ${resp.content}
    Response Status Should be Success   ${resp}
    ${header}=  Get Json Value and convert to Object    ${resp.content}     /header
    Response Should Contain Keys    ${header}   ${header_response}
    ${stations}=    Get Json Value and convert to Object    ${resp.resp.content}    /Stations
    ${Len}= Get Length  ${stations}
    Run Keyword If  ${Len} > 0  Response Should Contain keys    @stations[0]    ${stations_response}

*** Keywords *** 
Response Status Should be Success    
    [Arguments]     ${resp}
    Should Be Equal As Strings      ${resp.status_code}     200

Get Json Value and convert to Object
    [Arguments]     ${json_string}      ${path}
    ${value}=   Get Json Value  ${json_string}      ${path}
    ${value}=   Parse Json   ${value}

Response Should Contain Keys
    [Arguments]     ${object}   ${expected_keys}
    ${object_keys}  Get Dictionary Keys     ${object}
    Sort List   ${object_keys}
    Sort List   ${expected_keys}
    Log List    ${object_keys}
    Log List    ${expected_keys}
    Lists Should Be Equal   ${object_keys}      ${expected_keys}

Get Weather3Hours
    [Arguments]     ${params}
    Create Session  tmd  ${url}
    ${resp}=    Get Request     tmd     /Weather3Hours/V1       params=${params}
    Return From Keyword     ${resp}

Get Weather3Hours Json
    [Arguments]     ${params}
    Create Session     tmd   ${url}
    ${resp}=    Get Request  tmd    /Weather3Hours/V1?type=json     params=${params}
    Return From Keyword     ${resp}
