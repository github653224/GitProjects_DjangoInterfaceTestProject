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
Test Admin
    Open Admin Web Site
    Login Admin Web Site
    Add New One of User
    Modify Added User
    Delete Added User


Open Admin Web Site
    [Documentation]  Open admin web site and go to admin site
    ...                Examples:
    ...               | BROWSER | chrome | ff | IE |
    ...               | admin_url_address | http://192.168.0.102:8000/admin | ip and port will be changed according eviroment |

    Open Browser  about:blank  ${BROWSER}
#    Dismiss Alert  accept=True
    Set Selenium Speed  0.3 seconds
    Go To  ${admin_url_address}
    Maximize Browser Window
    Wait Until Page Contains  Django administration


Login Admin Web Site
    [Documentation]  Login admin site
    ...                Examples:
    ...                | username | username |
    ...                | passoword | password |
    Input Text  name=username  ${username}
    Input Text  name=password  ${password}
    Click Button  xpath=//*[@id="login-form"]/div[3]/input
    Wait Until Page Contains  Django administration


Add New One of User
    [Documentation]  Add a new user on admin site
    ...               Examples:
    ...               | new_user_name | newuser01 |
    ...               | new_user_password | new_user_password |

    Click Link  xpath=//*[@id="content-main"]/div[1]/table/tbody/tr[2]/td[1]/a
    Input Text  xpath=//*[@id="id_username"]  ${new_user_name}
    Input Text  xpath=//*[@id="id_password1"]  ${new_user_password}
    Input Text  xpath=//*[@id="id_password2"]  ${new_user_password}
    Click Button  xpath=//*[@name="_save"]
    Wait Until Page Contains  " was added successfully. You may edit it again below.
    Sleep  3s
    Wait Until Page Contains Element  //*[@id="user_form"]/div/div/input[1]
    Execute Javascript  document.documentElement.scrollTop=1300
    Sleep  3s
    Click Button  xpath=//*[@name="_save"]
    Wait Until Page Contains  Select user to change


Modify Added User
    [Documentation]  Modify user added
    ...                Examples:
    ...                | first name | new_user_name | newuser01 |
    ...                | last name | newuser01_last |
    ...                | email | 18010193180@qq.com |

    Input Text  xpath=//*[@name="q"]  ${new_user_name}
    Click Element  xpath=//*[@id="changelist-search"]/div/input[2]
    Click Link  xpath=//*[@id="result_list"]/tbody/tr/th/a
    Input Text  xpath=//*[@id="id_first_name"]  ${new_user_name}
    Input Text  xpath=//*[@id="id_last_name"]   ${new_user_name}_last
    Input Text  xpath=//*[@id="id_email"]   ${phone_number}@qq.com
    Select Checkbox  xpath=//*[@id="id_is_staff"]
    Sleep  3s
    Set Window Size	${1598}  ${2000}
    Execute Javascript  document.documentElement.scrollTop=15
    Select Checkbox  xpath=//*[@id="id_is_superuser"]
    Execute Javascript  document.documentElement.scrollTop=1300
    Select From List  xpath=//select[@id="id_user_permissions_from"]  auth | group | Can add group
    Select From List By Index  xpath=//select[@id="id_user_permissions_from"]  5
    Click Link  xpath=//*[@id="id_user_permissions_add_link"]
    Click Link  xpath=//*[@id="user_form"]/div/fieldset[4]/div[1]/div/p/span[1]/a[1]
    Set Selenium Speed  0.5 seconds
    Click Link  xpath=//*[@id="clocklink0"]
    Click Link  xpath=//*[@id="clockbox0"]/ul/li[3]/a
    Click Button  xpath=//*[@name="_save"]


Delete Added User
    [Documentation]  Delete user added
    ...                Examples:
    ...                | new_user_name | newuser01 |

    Input Text  xpath=//*[@name="q"]  ${new_user_name}
    Click Element  xpath=//*[@id="changelist-search"]/div/input[2]
    Click Link  xpath=//*[@id="result_list"]/tbody/tr/th/a
    Maximize Browser Window
    Execute Javascript  document.documentElement.scrollTop=1300
    Click Element  xpath=//*[@class="deletelink"]
    Click Element  xpath=//*[@class="button cancel-link"]
    Click Element  xpath=//*[@class="deletelink"]
    Click Element  xpath=//*[@id="content"]/form/div/input[2]
