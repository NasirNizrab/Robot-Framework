*** Settings ***
Library              SeleniumLibrary
*** Variables ***
${url}      https://www.facebook.com/
*** Test Cases ***
Test_try_twooo
    go to    ${url}
   # new_keyword_try
*** Keywords ***
new_keyword_try
 #   ELEMENT SHOULD BE VISIBLE    xpath://img[@alt='Facebook']
 #   AND
  #  ELEMENT SHOULD BE VISIBLE    xpath://h2[contains(text(),'Facebook helps you connect and share with the peop')]
    AND
    ELEMENT SHOULD BE VISIBLE    xpath://div[@id='reg_pages_msg']
    ELSE    run keywords
    ELEMENT SHOULD BE VISIBLE    xpath:(//input[@id='email'])[1]
