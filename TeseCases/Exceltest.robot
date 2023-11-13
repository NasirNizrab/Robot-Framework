*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/resources1.robot
Library             DataDriver  ../My_DB_data/login.xlsx
Suite Setup         Opening my browser
Suite Teardown      closing my browsers

*** Test Cases ***
Login_Test_with_Excel   ${username}     ${password}
    Invalid Login

*** Keywords ***
Invalid Login
    [Arguments]    ${username}  ${password}
    inputing user name      ${username}
    inputing password       ${password}
    click login button
    error msg should be visible
