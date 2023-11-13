*** Settings ***
Library              SeleniumLibrary
Resource             ../Resources/resource_other.robot
Library              DataDriver    ../My_DB_data/data.csv
Suite Setup          Opening my browser
Suite Teardown       closing my browsers
Test Template        Invalid Login
*** Test Cases ***
Login_Test_with_CSV     ${username}     ${password}

*** Keywords ***
Invalid Login
    [Arguments]     ${username}      ${password}
    resource_other.inputing user name      ${username}
    inputing password       ${password}
    click login button
    error msg should be visible

