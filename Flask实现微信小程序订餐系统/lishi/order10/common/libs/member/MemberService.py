from application import app
import hashlib, base64, random, string
import requests
import json

class MemberService():

    @staticmethod
    def geneAuthCode(member_info):
        m = hashlib.md5()
        str = "%s-%s-%s" % (member_info.id, member_info.salt, member_info.status)
        m.update(str.encode('utf-8'))
        return m.hexdigest()

    @staticmethod
    def geneSalt(length=6):
        keylist = [random.choice((string.ascii_letters + string.digits)) for i in range(length)]
        return ("".join(keylist))


    @staticmethod
    def getWeChatOpenId(code):
        url = "https://api.weixin.qq.com/sns/jscode2session?appid={0}&secret={1}&js_code={2}&grant_type=authorization_code".format(
            app.config['MINA_APP']['appid'], app.config['MINA_APP']['appkey'], code)

        try:
            r = requests.get(url)
        except Exception as e:
            app.logger.error(e)
        openid = None
        # {"session_key":"dn15Sz\/7sdpNh7lj2STw2g==","openid":"oesTl5ZSMGOOY6lvlZijsxmPtowU"}
        res = json.loads(r.text)
        if 'openid' in res:
            openid = res['openid']
        return openid