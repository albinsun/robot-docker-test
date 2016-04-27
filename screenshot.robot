*** Variables ***
${BROWSER NAME}    firefox
${SEARCH ENGINE URL}    https://www.google.com
${SEARCH KEYWORD}    ruckus wireless
${SCREENSHOT DST PATH}    ./homepage.png


*** Settings ***
Library    Selenium2Library

Suite Setup    Open Test Browser
Suite Teardown    Close Test Browser


*** Test Cases ***
Google and capture
    Given a valid google search homepage
    When search by i am feeling lucky
    Then capture page screenshot 


*** Keywords ***
Open Test Browser
    Open Browser    ${SEARCH ENGINE URL}    ${BROWSER NAME}

Close Test Browser
    Close all browsers

a valid google search homepage
    Title Should Be    Google
    Element Should Be Enabled    id=lst-ib

search by i am feeling lucky 
    Input Text    id=lst-ib    ${SEARCH KEYWORD}
    Click Element    name=btnI

capture page screenshot 
    Selenium2Library.Capture Page Screenshot    ${SCREENSHOT DST PATH}
