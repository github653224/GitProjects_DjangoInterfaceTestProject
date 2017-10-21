class Host(object):
    """say good morning to user"""
    def goodmorning(self,name):
        return "good morning %s" % name

if __name__=="__main__":
    h=Host()
    hi=h.goodmorning("zhangsan")
    print hi