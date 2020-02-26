
DEBUG = False
SQLALCHEMY_ECHO = False
SERVER_PORT = 8999

AUTH_COOKIE_NAME = "mooc_food"


## 过滤url
IGNORE_URLS = [
    "^/user/login",
    "^/api",
    "^/upload"
]

IGNORE_CHECK_LOGIN_URLS = [
    "^/static",
    "^/favicon.ico"
]

PAGE_SIZE = 50
PAGE_DISPLAY = 10

STATUS_MAPPING = {
    "1":"正常",
    "0":"已删除"
}

MINA_APP = {
    'appid':'wx47b5911f64e0c8b1',
    'appkey':'a86200ccfbfc64886ab427b812e2e6fb'
}

UPLOAD = {
    'ext':['jpg', 'gif', 'bmp', 'jpeg', 'png'],
    'prefix_path':'/web/static/upload/',
    'prefix_url':'/static/upload/'
}

# RELEASE_VERSION = '20200219'

APP = {
    'domain': 'http://192.168.153.155:8999'
}
