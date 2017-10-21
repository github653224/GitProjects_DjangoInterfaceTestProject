######################################################
#                                                    #
# Add keyword: Change Capacity Value in Unified DB   #
# Author : Xueyan Pan                                #
# Date   : 2017/09/25                                #
# License: Ericsson Commercial                       #
# All right reserved (2017)                          #
#                                                    #
# Add keyword: Get Capacity Value from output        #
#              of Checking DB Info                   #
# Author : Xueyan Pan                                #
# Date   : 2017/09/26                                #
#                                                    #
######################################################
*** Settings ***
Library  Selenium2Library
Resource  ../Settings/SiteSettings.robot
*** Variables ***
*** Keywords ***
Test Django

    Open My Web Site
    Login My Web Site
    Search Event
    Check If Sign
    Login out System
    Close Browser



Open My Web Site
    [Documentation]  Open my site
    ...                Examples:
    ...                | BROWSER | chrome | ff | IE |
    ...                | url_address | http://192.168.0.102:8000/login_first_page/ |

    Open Browser  about:blank  ${BROWSER}
    Choose Ok On Next Confirmation
    Set Selenium Speed  0.5 seconds
    Go To  ${url_address}
    Maximize Browser Window
    Wait Until Page Contains Element  //*[@id="btn"]/font

Login My Web Site
    [Documentation]  Login web site
    ...               Examples:
    ...               | username | username |
    ...               | password | password |
    Set Selenium Speed  0.5 seconds
    Input Text  name=username  ${username}
    Input Text  name=password  ${password}
    Click Button  xpath=//*[@id="btn"]
    Wait Until Page Contains  Guest Manage System

Search Event
    [Documentation]  Search event
    ...                Examples:
    ...                | event_name | 小米MIX发布会 |

    Input Text  name=name  ${event_name}
    Click Button  xpath=//*[@id="navbar"]/form/button
    Wait Until Page Contains  ${event_name}

Check If Sign
    [Documentation]  Check if sign
    ...                Examples:
    ...                | phone_number | 18010193180 |

    Click Link  xpath=/html/body/div[2]/div/table/tbody/tr/td[6]/a
    Select Window  Sign Page
    Input Text  xpath=//*[@id="navbar"]/form/div/input  ${phone_number}
    Sleep  2s
    Click Button  //*[@id="navbar"]/form/button
    Wait Until Page Contains  user has sign in.


Login out System
    [Documentation]  Login out System

    Sleep  3s
    Click Link  xpath=//*[@id="navbar"]/ul/li[1]/a
    Sleep  3s
    Click Link  xpath=//*[@id="navbar"]/ul[2]/li[2]/a
    Sleep  5s