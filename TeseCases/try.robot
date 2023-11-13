*** Settings ***
Library              SeleniumLibrary
*** Variables ***
${NAME}         Robot Framework
@{MANY}         one         two      three      four
...             five        six      seven

*** Test Cases ***

*** Keywords ***
@@ -645,6 +647,11 @@ Verify RA view
    element should not be visible    //@[contains(text(),"khancabna"]
    RUN KEYWORD IF
    element should be visible
new one plzzz
      ELEMENT SHOULD BE VISIBLE     //@[contains(text(),"khancabna"]
      AND
      ELEMENT SHOULD BE VISIBLE    //@[contains(text(),"khancabna1"]
      AND
      ELEMENT SHOULD BE VISIBLE    //@[contains(text(),"khancabna4"]
      ELSE    Run keywords