打造高可用的flaskmvc框架



application.py	封装的Flask的全局变量，包括app,数据库等

common		存放公用部分

​	libs				公用方法或者类

​	models		所有的数据库model

config			配置文件

​	base_setting.py		基础配置

​	develop_setting.py		开发环境

​	local_setting_demo.py	本地开发环境配置demo

​	production_sessting.py	生产环境的配置

docs	文档存放

​	Mysql.MD		所有数据库变更必须在这里记录

jobs	定时任务

​	bin

​	tasks		所有定时任务都存放在这里

manager.py	启动入口

release.sh		系统自己的简单操作脚本，包括更新代码，重启应用

requirements.txt		python包扩展

uwsgi.ini		生产环境uwsgi

web	HTTP存放

​	controllers		所有的c层放在这里

​	interceptors	拦截器相关

​	static	静态文件

​	templates	模板文件

www.py	HTTP模块相关文件初始化





application.py

```
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

class Application(Flask):

    def __init__(self, import_name):
        super(Application, self).__init__(import_name)
        self.config.from_pyfile('config/base_setting.py')

        db.init_app(self)
db = SQLAlchemy()
app = Application(__name__)
```





环境变量

```
import os
if 'ops_config' in os.environ:
	self.config.from_pyfile('config/%_setting.py')%os.environ['ops_config']
	
export ops_config=local

```

