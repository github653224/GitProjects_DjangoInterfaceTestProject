# -*- coding:utf-8 -*-
from zope.interface import Interface
from zope.interface.declarations import implementer

class IHost(Interface):
    def host1(self,host):
        """Say good morning to host"""
        return "good morning MR or Miss %s" % host
@implementer(IHost) #继承接口
class Host:
    def goodmorning(self, guest):
        """Say good morning to guest"""
        return "Good morning, %s!" % guest

if __name__ == '__main__':
    p = Host()
    hello=p.host1("qiuqiu")
    hi = p.goodmorning('Tom')
    print(hi)
    print (hello)