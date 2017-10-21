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
*** Variables ***
${BROWSER}  chrome
${url_address}  http://192.168.56.1:8000/login_first_page/
${username}  admin
${password}  admin123456
${event_name}  小米MIX发布会
${phone_number}  18010193180
${admin_url_address}  http://192.168.56.1:8000/admin


${new_user_name}  newuser01
${new_user_password}  admin123456