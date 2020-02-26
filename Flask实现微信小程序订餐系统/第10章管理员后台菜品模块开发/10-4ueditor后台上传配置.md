10-4ueditor后台上传配置



要想保存文件，需要配置后端的请求url

后端配置项没有正常加载，上传插件不能正常使用！

```
serverUrl: common_ops.buildUrl("/upload/ueditor")
http://192.168.153.154:8999/upload/ueditor?action=config&&noCache=1582096358328
```

在后端也需要写一个接口来处理请求

上传文件会使用post，而配置文件会使用get



上传图片通过formdata方式传递，



后台配置项返回格式出错，上传功能将不能正常使用！

```
@route_upload.route('/ueditor', methods=['GET', 'POST'])
def ueditor():

    req = request.values
    action = req['action'] if 'action' in req else ''

    if action == "config":
        rootpath = app.root_path
        config_path = "{0}/web/static/plugins/ueditor/upload_config.json".format(rootpath)
        with open(config_path)as fp:
            try:
                config_data = json.loads(re.sub(r'\/\*.*\*/', '', fp.read()))
            except:
                config_data = {}
        return jsonify(config_data)

    return "upload"

```

image:内容返回就算上传成功

```
def uploadImage():
    resp = {'state':'SUCCESS', 'url':'', 'title':'', 'original':''}
    file_target = request.files
    print("###################################")
    print(file_target)
    return jsonify(resp)
    
```

上传的文件对象格式----字典。

ImmutableMultiDict([('upfile', <FileStorage: 'home01.jpg' ('image/jpeg')>)])
2020-02-19 15:45:16,544 INFO sqlalchemy.engine.base.Engine ROLLBACK



上传代码的封装，

封装的前提是代码基本是通用的，好几处地方都会用到