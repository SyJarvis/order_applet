10-7select2、tagsinput插件和无刷新上传功能



select2引入	选择框样式，支持拼音检索

```
<script src="{{buildStaticUrl('/plugins/select2/select2.pinyin.js')}}"></script>
<script src="{{buildStaticUrl('/plugins/select2/pinyin.core.js')}}"></script>
<script src="{{buildStaticUrl('/plugins/select2/zh-CN.js')}}"></script>

<link href="{{buildStaticUrl('/plugins/select2/select2.min.css')}}" rel="stylesheet">
```

```
$(".wrap_food_set select[name=cat_id]").select2({
    language:'zh-CN',
    width:'100%'
});
```





tagsinput	标签

```

$(".wrap_food_set input[name=tags]").tagsInput({
    width: 'auto',
    height: 40,
})
        
<script src="{{buildStaticUrl('/plugins/tagsinput/jquery.tagsinput.min.js')}}"></script>
```



无刷新上传功能

```
监听触击变化发起POST请求


1.添加一个iframe隐藏域在set.html文件,iframe的name要与form表单的target的名字相同，action指定请求的url动作
2.在后端返回一个js对象，在当前的窗口的父对象里调用upload方法
3.执行error或success方法，
4.拼接后端返回的key值
```

http://192.168.153.155:8999/upload/pic



html

```
<form class="upload_pic_wrap" target="upload_file" enctype="multipart/form-data" method="POST" action="{{ buildUrl('/upload/pic') }}">
<div class="upload_wrap pull-left">
<i class="fa fa-upload fa-2x"></i>
<input type="file" name="pic" accept="image/png, image/jpeg, image/jpg,image/gif">
</div>
</form>

<iframe name="upload_file" class="hide"></iframe>
```

js

```
;
// callback_target = 'window.parent.upload',在后端返回的js对象会调用upload方法
var upload = {
    error: function (msg) {
        common_ops.alert(msg);
    },
    success: function (file_key) {
        if (!file_key) {
            return;
        }
        var html = '<img src="' + common_ops.buildPicUrl(file_key) + '"/>'
                + '<span class="fa fa-times-circle del del_image" data="' + file_key + '"></span>';

        if ($(".upload_pic_wrap .pic-each").size() > 0) {
            $(".upload_pic_wrap .pic-each").html(html);
        } else {
            $(".upload_pic_wrap").append('<span class="pic-each">' + html + '</span>');
        }
        food_set_ops.delete_img();
    }
};
var food_set_ops = {
    init:function () {
        this.eventBind();
        this.initEditor();
        this.delete_img();
    },
    eventBind:function () {

        $(".wrap_food_set .upload_pic_wrap input[name=pic]").change(function () {
           $(".wrap_food_set .upload_pic_wrap").submit()
        });

        $(".wrap_food_set select[name=cat_id]").select2({
            language:'zh-CN',
            width:'100%'
        });

        $(".wrap_food_set input[name=tags]").tagsInput({
            width: 'auto',
            height: 40,
        })
    },
    initEditor:function () {
        var that = this;
        that.ue = UE.getEditor('editor', {
            toolbars:[
        [ 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'strikethrough', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall',  '|','rowspacingtop', 'rowspacingbottom', 'lineheight'],
        [ 'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink'],
        [ 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'insertimage', 'insertvideo', '|',
            'horizontal', 'spechars','|','inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols' ]

    ],
            enableAutoSave:true,
            saveInterval: 60000,
            elementPathEnabled:false,
            zIndex:4,
            serverUrl: common_ops.buildUrl("/upload/ueditor")
        })
    },
    delete_img:function () {
        $(".wrap_food_set .del_image").unbind().click(function () {
            $(this).parent().remove();
        })
    }

};

$(document).ready(function () {
    food_set_ops.init()
})
```

py

```
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

```



uploadServer

```
from werkzeug.utils import secure_filename
from application import app, db
from common.libs.Helper import getCurrentDate
import os, stat,uuid
from common.models.Image import Image

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

        model_image = Image()
        model_image.file_key = file_dir + "/" + file_name
        model_image.created_time = getCurrentDate()
        db.session.add(model_image)
        db.session.commit()
        # 'file_key':file_dir + "/" + file_name
        resp['data'] = {
            'file_key': model_image.file_key
        }
        return resp
```

