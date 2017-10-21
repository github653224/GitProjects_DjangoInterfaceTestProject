*** Settings ***
Library  MyTestLibrary
*** Variables ***

*** Test Cases ***
Test My Library
    My Library
*** Keywords ***
My Library
    ${result1} =  MyTestLibrary.add  10  10
    log to console  ${result1}

    ${result2} =  MyTestLibrary.sub  10  10
    log to console  ${result2}

    ${result3} =  MyTestLibrary.mul  2  10
    log to console  ${result3}
    Should Be True  ${result1}==${result3}






