Python Flask订餐系统
============================
## 启动
* export ops_config=local && python manage.py runserver


## 数据库模型类生成

flask-sqlacodegen 'mysql://root:mysql0220@127.0.0.1/food_db' --tables app_access_log --outfile "common/models/log/AppAccessLog.py" --flask
