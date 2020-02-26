
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

API_IGNORE_URLS = [
    "^/api",
]


PAGE_SIZE = 50
PAGE_DISPLAY = 10

STATUS_MAPPING = {
    "1":"正常",
    "0":"已删除"
}

MINA_APP = {
    'appid':'xxxxx',
    'appkey':'xxxx',
    'paykey':'',
    'mch_id':'1443337302',
    'callback_url':'/api/order/callback'

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

# 以后要改回local_setting.py，暂时无法export ops_config=local
# DEBUG = True
# SERVER_HOST = '0.0.0.0'
# SQLALCHEMY_ECHO = True
# SQLALCHEMY_DATABASE_URI = "mysql://root:ubuntumysql0220@122.51.52.108:3306/food_db?charset=utf8mb4"
# SQLALCHEMY_TRACK_MODIFICATIONS = True
PAY_STATUS_MAPPING = {
    "1":"已支付",
    "-8":"待支付",
    "0":"已关闭"
}
PAP_STATUS_DISPLAY_MAPPING = {
    "0":"订单关闭",
    "1":"支付成功",
    "-8":"待支付",
    "-7":"待发货",
    "-6":"待确认",
    "-5":"待评价"
}


