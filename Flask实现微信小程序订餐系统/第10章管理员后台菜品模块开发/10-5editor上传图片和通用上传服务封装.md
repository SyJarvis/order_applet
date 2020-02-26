上传文件的名字以时间戳来命名。

static新建一个upload文件夹

common.libs新建一个UploadServer.py文件

```
from werkzeug.utils import secure_filename
from application import app
from common.libs.Helper import getCurrentDate
import os, stat,uuid


class UploadService():

    @staticmethod
    def uploadByFile(file):
        config_upload = app.config['UPLOAD']
        resp = {'code':200, 'msg':'操作成功', 'data':{}}
        # 进行扩展名的判断
        filename = secure_filename(file.filename)

        ext = filename.rsplit(".", 1)[1]
        print(ext)
        if ext not in config_upload['ext']:
            resp['code'] = -1
            resp['msg'] = '不允许的扩展类型文件'
            return resp
        # 获取保存文件的全局路径
        root_path = app.root_path + config_upload['prefix_path']
        # 生成文件夹名称，以年月日来命名
        file_dir = getCurrentDate(("%Y%m%d"))
        # 获取保存图片的路径
        save_dir = root_path + file_dir
        if not os.path.exists(save_dir):
            os.mkdir(save_dir)
            # 拥有者有全部权限，组用户有读权限，其他用户有全部权限
            os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IRWXO)

        file_name = str(uuid.uuid4()).replace("-", "") + "." + ext
        print("#################################")
        print(dir(file))
        print(type(file))
        file.save("{0}/{1}".format(save_dir, file_name))

        resp['data'] = {
            'file_key':file_dir + "/" + file_name
        }
        return resp
```



Upload.py

```
from flask import Blueprint, jsonify, request
from application import app
import json, re
from common.libs.UploadServer import UploadService
route_upload = Blueprint('upload_page', __name__)


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

    if action == "uploadimage":
        return uploadImage()
    return "upload"

def uploadImage():
    resp = {'state':'SUCCESS', 'url':'', 'title':'', 'original':''}
    file_target = request.files
    print("###################################")
    print(file_target)
    upfile = file_target['upfile'] if 'upfile' in file_target else None
    if upfile is None:
        resp['state'] = '上传失败'
        return jsonify(resp)

    ret = UploadService.uploadByFile(upfile)
    if ret['code'] != 200:
        resp['state'] = '上传失败' + ret['msg']
        return jsonify(resp)

    resp['url'] = ret['data']['file_key']
    return jsonify(resp)
```

