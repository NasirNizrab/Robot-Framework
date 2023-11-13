*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     SeleniumLibrary
*** Variables ***
${base_url}=        https://dummy.restapiexample.com/

*** Test Cases ***
Put_Data_in_Site
    create session      mysession     ${base_url}
    ${body}=            create dictionary    name=ansbhatti   salary=100000   age=25
    ${header}=          create dictionary    Content-Type=application/json
    ${response}         POST On Session     mysession   api/v1/create     data=${body}    headers=${header}

    ${status_code}=     convert to string    ${response.status_code}
    should be equal     ${status_code}       201

