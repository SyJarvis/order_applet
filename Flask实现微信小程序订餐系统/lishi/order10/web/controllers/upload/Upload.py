from flask import Blueprint, jsonify, request
from application import app
import json, re
from common.libs.UploadServer import UploadService
from common.libs.UrlManager import UrlManager
from common.models.Image import Image
route_upload = Blueprint('upload_page', __name__)


@route_upload.route('/ueditor', methods=['GET', 'POST'])
def ueditor():

    req = request.values
    action = req['action'] if 'action' in req else ''

    if action == "config":
        # http://192.168.153.155:8999/upload/ueditor?action=config&&noCache=1582132760500
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

    if action == "listimage":
        # http://192.168.153.155:8999/upload/ueditor?action=uploadimage&encode=utf-8
        return listImage()

    return "upload"


@route_upload.route("/pic", methods=['GET', 'POST'])
def uploadPic():
    file_target = request.files
    upfile = file_target['pic'] if 'pic' in file_target else None
    callback_target = 'window.parent.upload'
    if upfile is None:
        return "<script type='text/javascript'>{0}.error('{1}')</script>".format(callback_target, '上传失败')
    ret = UploadService.uploadByFile(upfile)
    if ret['code'] != 200:
        return "<script type='text/javascript'>{0}.error('{1}')</script>".format(callback_target, '上传失败:' + ret['msg'])
    # 上传成功也是返回js，但是返回的内容不一样
    return "<script type='text/javascript'>{0}.success('{1}')</script>".format(callback_target, ret['data']['file_key'])

def uploadImage():
    # http://192.168.153.155:8999/upload/ueditor?action=uploadimage&encode=utf-8
    # post
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

    resp['url'] = UrlManager.buildImageUrl(ret['data']['file_key'])
    return jsonify(resp)


def listImage():
    # /upload/ueditor?action=listimage&start=0&size=20&noCache=1582132303383 HTTP/1.1"
    resp = {'state':'SUCCESS', 'list':[], 'start':0, 'total':0}
    req = request.values
    start = int(req['start']) if 'start' in req else 0
    page_size = int(req['size']) if 'size' in req else 0

    query = Image.query
    if start > 0:
        query = query.filter(Image.id < start)
    list = query.order_by(Image.id.desc()).offset(start).limit(page_size).all()
    images = []
    if list:
        for item in list:
            images.append({'url':UrlManager.buildImageUrl(item.file_key)})
            start = item.id
    resp['list'] = images
    resp['start'] = start
    resp['total'] = len(images)
    return jsonify(resp)











