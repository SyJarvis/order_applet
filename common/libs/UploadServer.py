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