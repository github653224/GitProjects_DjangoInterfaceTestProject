# -*- coding:utf-8 -*-
import requests
import unittest
url = "http://192.168.56.1:8000/api/get_event_list/"
payload = {'eid':'1'}
r = requests.get(url,params=payload)
results = r.json()
print results

assert results['status']==200
assert results['message']=="success"
assert results['data']['start_time']=="2017-09-17T14:00:00"
# assert results['data']['name'].encode('utf-8')=="小米MIX发布会"
name = results['data']['name']
print name
# assert results['data']['address'].encode('utf-8')=="北京体院馆"
address = results['data']['address']
print address
