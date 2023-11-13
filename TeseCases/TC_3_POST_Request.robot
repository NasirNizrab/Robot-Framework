*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}            https://restcountries.com/
${country}          india
*** Test Cases ***
Put_Data_in_Site
    create session      mysession     ${base_url}
    ${body}=            create dictionary    name=ansbhatti   salary=100000   age=25
    ${header}=          create dictionary    Content-Type=application/json
    ${response}=        POST On Session     mysession   api/v1/create     data=${body}    headers=${header}
    ${status_code}=        convert to string       ${response.status_code}
    should be equal        ${status_code}           200

    ${body_data}=          convert to string       ${response.content}
    should contain         ${body}                 Republic of India






