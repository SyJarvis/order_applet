
import hashlib, base64

class UserService():

    @staticmethod
    def genePwd(pwd, salt):
        m = hashlib.md5()
        pwd = pwd.encode('utf-8')
        str = "%s-%s"%(base64.encodebytes(pwd), salt)
        m.update(str.encode("utf-8"))
        print('genePwd', m.hexdigest())
        return m.hexdigest()


    @staticmethod
    def geneAuthCode(user_info):
        m = hashlib.md5()
        str = "%s-%s-%s-%s" % (user_info.uid, user_info.login_name, user_info.login_pwd, user_info.login_salt)
        m.update(str.encode('utf-8'))
        print('geneAuthCode',m.hexdigest())
        return m.hexdigest()