*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary

*** Variable ***


*** Test Cases ***
# aboutt event interface test
Test Post Interface for event
    [Tags]  post_event
    Test Add Event Interface via Post


Test Get Interface for event
    [Tags]  get_event
    Test Query Event Interface via Get


# about guest interface test
Test Post Interface for guest
    [Tags]  post_guest
    Test Add Guest Interface via Post

Test Get Interface for guest
    [Tags]  get_guest
    Test Query Guest Interface via Get


*** Keywords ***

Test Query Event Interface via Get
    [Documentation]  Test Event Get Interface
    [Arguments]  ${url_api}=http://192.168.56.1:8000/api
    &{payload} =  Create Dictionary  eid=12
    Create Session  event  ${url_api}
    ${r} =  Get Request  event  /get_event_list/  params=${payload}

    log  ${r.status_code}
    Should Be Equal As Strings  ${r.status_code}  200
    log  ${r}
    log  ${r.json()}

    ${response_dict} =  Set Variable  ${r.json()}
    log  ${response_dict}

    ${msg} =  Get From Dictionary  ${response_dict}  message
    log  ${msg}
    Should Be Equal  ${msg}  success

    ${int_status} =  Get From Dictionary  ${response_dict}  status
    log  ${int_status}
    ${sta} =  Evaluate  int(200)
    Should Be Equal  ${int_status}  ${sta}



Test Add Event Interface via Post
    [Documentation]  Test Event Post Interface
    [Arguments]  ${url_api}=http://192.168.56.1:8000/api
    Create Session  event  ${url_api}
    &{headers} =  Create Dictionary
    Set To Dictionary  ${headers}  Content-Type=application/x-www-form-urlencoded
    &{payload} =  Create Dictionary
    Set To Dictionary  ${payload}  eid=12
    Set To Dictionary  ${payload}  name=SURGER全面屏手机
    Set To Dictionary  ${payload}  limit=100
    Set To Dictionary  ${payload}  status=0
    Set To Dictionary  ${payload}  address=北京
    Set To Dictionary  ${payload}  start_time=2017-10-28 14:00:00

    ${r} =  Post Request  event  /add_event/  data=${payload}  headers=${headers}
    log  ${r.status_code}
    Should Be Equal As Strings  ${r.status_code}  200
    log  ${r}
    log  ${r.json()}

    ${response_dict} =  Set Variable  ${r.json()}
    log  ${response_dict}

    ${msg} =  Get From Dictionary  ${response_dict}  message
    log  ${msg}
    Should Be Equal  ${msg}  add event success

    ${int_status} =  Get From Dictionary  ${response_dict}  status
    log  ${int_status}
    ${sta} =  Evaluate  int(200)
    Should Be Equal  ${int_status}  ${sta}




Test Add Guest Interface via Post
    [Documentation]  Test Add Guest Interface via Post
    [Arguments]  ${url_api}=http://192.168.56.1:8000/api
    Create Session  event  ${url_api}
    &{headers} =  Create Dictionary
    Set To Dictionary  ${headers}  Content-Type=application/x-www-form-urlencoded
    &{payload} =  Create Dictionary
    Set To Dictionary  ${payload}  eid=12
    Set To Dictionary  ${payload}  realname=xiaoming
    Set To Dictionary  ${payload}  phone=18010101100
    Set To Dictionary  ${payload}  email=18010101100@qq.com

    ${r} =  Post Request  event  /add_guest/  data=${payload}  headers=${headers}
    log  ${r.status_code}
    Should Be Equal As Strings  ${r.status_code}  200
    log  ${r}
    log  ${r.json()}

    ${response_dict} =  Set Variable  ${r.json()}
    log  ${response_dict}

    ${msg} =  Get From Dictionary  ${response_dict}  message
    log  ${msg}
    Should Be Equal  ${msg}  add guest success

    ${int_status} =  Get From Dictionary  ${response_dict}  status
    log  ${int_status}
    ${sta} =  Evaluate  int(200)
    Should Be Equal  ${int_status}  ${sta}



Test Query Guest Interface via Get
    [Documentation]  Test Event Get Interface
    [Arguments]  ${url_api}=http://192.168.56.1:8000/api
    &{payload} =  Create Dictionary  eid=12
    Create Session  event  ${url_api}
    ${r} =  Get Request  event  /get_guest_list/  params=${payload}

    log  ${r.status_code}
    Should Be Equal As Strings  ${r.status_code}  200
    log  ${r}
    log  ${r.json()}
    ${response_dict} =  Set Variable  ${r.json()}
    log  ${response_dict}

    ${msg} =  Get From Dictionary  ${response_dict}  message
    log  ${msg}
    Should Be Equal  ${msg}  success

    ${int_status} =  Get From Dictionary  ${response_dict}  status
    log  ${int_status}
    ${sta} =  Evaluate  int(200)
    Should Be Equal  ${int_status}  ${sta}

