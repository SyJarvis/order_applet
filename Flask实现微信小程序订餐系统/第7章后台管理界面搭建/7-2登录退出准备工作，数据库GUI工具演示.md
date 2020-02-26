# 7-2登录退出准备工作，数据库GUI工具演示



登录退出

任何一个大系统，都由小模块组成的，每一个小模块由一些功能特性组成。



1.新建数据库

​	数据库名:food_db

```
create database food_db charset=utf8mb4;
```

2.新建管理员数据表

3.使用flask-sqlacodegen扩展，方便快速生成ORM model

​	3.1pip install flask-sqlacodegen

​	3.2使用方法

```
 flask-sqlacodegen 'mysql://root:mysql0220@127.0.0.1/food_db' --outfile 'common/models/model.py' --flask
 
 flask-sqlacodegen 'mysql://root:mysql0220@127.0.0.1/food_db' --tables user --outfile 'common/models/user.py' --flask
```

4.修改db,在applications.py文件里已经定义了db对象

5.确认配置文件指定的数据库路径是否正确。

6.开始写代码