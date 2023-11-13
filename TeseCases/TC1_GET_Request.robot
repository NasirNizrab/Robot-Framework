*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${url}              https://restcountries.com
${country}          india
*** Test Cases ***
Get_info_apiNEW
    create session    mysession     ${url}
    ${response}=           GET On Session       mysession     v3.1/name/${country}
   # log to console      ${response.status_code}
   # log to console      ${response.content}
   # log to console      ${response.headers}
   # now Validation part below
     ${status_code}=        convert to string       ${response.status_code}
     should be equal        ${status_code}           200

     ${body}=               convert to string       ${response.content}
     should contain         ${body}                 Republic of India

     ${contenttyprvalue}=   get from dictionary     ${response.headers}         Content-Type
     should be equal        ${contenttyprvalue}     application/json




