*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${expect}         MyDockerOnVM
${url}            ${url}    http://www.google.com
${Browser}        chrome
${delay}          1

*** Test Cases ***
1. Open Website
    Open Browser    ${url}    ${Browser}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Set Selenium Speed    0.3

2. Check page info
    ${result}    Get Text    xpath=(/html/body/p[3])
    Log To Console    ${result}
    Should Contain    ${result}    ${expect}

3. Close Browser
    Close Browser
