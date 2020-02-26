from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager
import os
import pymysql
pymysql.install_as_MySQLdb()


class Application(Flask):
    def __init__(self, import_name, template_folder=None, static_url_path=None, static_folder=None):
        super(Application, self).__init__(import_name, template_folder=template_folder, static_url_path=static_url_path, static_folder=static_folder)
        # export ops_config=local
        # if "ops_config" in os.environ:
        #     self.config.from_pyfile('config/%s_setting.py'%os.environ['ops_config'])
        self.config.from_pyfile('config/base_setting.py')
        db.init_app(self)


db = SQLAlchemy()
app = Application(__name__, template_folder=os.getcwd() + "/web/templates", static_url_path="/static", static_folder=os.getcwd() + '/web/static')
manager = Manager(app)


"""
函数模板
"""
from common.libs.UrlManager import UrlManager
app.add_template_global(UrlManager.buildStaticUrl, 'buildStaticUrl')
app.add_template_global(UrlManager.buildUrl, 'buildUrl')
