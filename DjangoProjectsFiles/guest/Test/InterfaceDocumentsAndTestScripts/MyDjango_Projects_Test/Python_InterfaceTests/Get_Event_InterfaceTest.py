# -*- coding:utf-8 -*-
import requests
import unittest

class GetEventListTest(unittest.TestCase):
    '''查询发布会接口测试'''
    def setUp(self):
        self.url="http://127.0.0.1:8000/api/get_event_list/"

    def test_get_event_null(self):
        '''发布会为空'''
        params_variable={"eid":""}
        r=requests.get(self.url,params=params_variable)
        results=r.json()
        print results

    def test_get_event_success(self):

        params_variable={"eid":"1"}
        r=requests.get(self.url,params=params_variable)
        results = r.json()
        print(results)
        self.assertEqual(results['status'],200)
        self.assertEqual(results['message'], "success")
        self.assertEqual(results['data']['name'].encode("utf-8"), "小米MIX发布会")
        self.assertEqual(results['data']['address'].encode("utf-8"), "北京体院馆")
        self.assertEqual(results['data']['start_time'], "2017-09-17T14:00:00")

if __name__=="__main__":
    unittest.main()



