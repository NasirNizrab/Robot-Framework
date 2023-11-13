*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}      https://admin-demo.nopcommerce.com/
${BROWSER}  chrome

*** Keywords ***
Opening my browser
    open browser    ${URL}      ${BROWSER}
    maximize browser window
    sleep   2second

closing my browsers
    close all browsers

inputing user name
    [Arguments]    ${username}
    input text    xpath://input[@id='Email']   ${username}

inputing password
    [Arguments]    ${password}
    input text      xpath://input[@id='Password']   ${password}

click login button
    click element    xpath://button[@type='submit']

click log out button
    click link    Logout

error msg should be visible
    page should contain    Login was unsuccessful.

dashboard page should be visible
    page should contain    Dashboard
