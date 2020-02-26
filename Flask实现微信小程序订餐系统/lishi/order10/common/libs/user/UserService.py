import hashlib,base64, random, string
class UserService():

    @staticmethod
    def genePwd(pwd, salt):
        m = hashlib.md5()
        # 字符串转换字节码，encode('utf-8')就可以
        str = "%s-%s" % (base64.encodebytes(pwd.encode('utf-8')), salt)
        m.update(str.encode('utf-8'))
        # 返回十六进制的密码
        return m.hexdigest()

    @staticmethod
    def geneAuthCode(user_info):
        m = hashlib.md5()
        str = "%s-%s-%s-%s" % (user_info.uid, user_info.login_name, user_info.login_pwd, user_info.login_salt)
        m.update(str.encode("utf-8"))
        return m.hexdigest()

    @staticmethod
    def geneSalt(length=16):
        keylist = random.choice(string.ascii_letters + string.digits)
        return ''.join(keylist)


