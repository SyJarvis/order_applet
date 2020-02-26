SERVER_HOST = '0.0.0.0'
SERVER_PORT = 5000
SQLALCHEMY_DATABASE_URI = 'mysql://root:mysql0220@127.0.0.1:3306/food_db?charset=utf8mb4'
SQLALCHEMY_TRACK_MODIFICATIONS = True
#SQLALCHEMY_ECHO = True
#SQLALCHEMY_ENCODING = 'utf8mb4'
DEBUG = True

RELEASE_VERSION = '20200206'
AUTH_COOKIE_NAME = "mooc_food"

## 过滤url
IGNORE_URLS = [
    "^/user/login",
    "^/api"
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