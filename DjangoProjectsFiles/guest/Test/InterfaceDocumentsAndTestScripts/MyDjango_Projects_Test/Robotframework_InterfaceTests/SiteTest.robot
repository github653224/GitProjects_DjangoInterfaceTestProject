# python -m robot.libdoc --name "My Custom Keywords" pan_test.robot pan_results\pan_keyword.html
*** Settings ***
Library  Selenium2Library
Resource  ../Resources/AdminSite.robot
Resource  ../Resources/DjangoSite.robot
Test Teardown  End Test
*** Variables ***

*** Test Cases ***
Test Procedure
    Test Django
    Sleep  5s
    Test Admin

*** Keywords ***
End Test
    Close Browser