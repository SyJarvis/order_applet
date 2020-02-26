from flask import Blueprint, render_template, request, redirect, jsonify
from common.libs.Helper import ops_render, iPagination, getCurrentDate
from common.models.user import User
from common.libs.UrlManager import UrlManager
from common.libs.user.UserService import UserService
from application import app, db
from sqlalchemy import or_
route_account = Blueprint('account_page', __name__)

@route_account.route('/index')
def index():
    resp_data = {}

    req = request.values
    query = User.query
    page = int(req['p']) if ('p' in req and req['p']) else 1
    # app.logger.info(request.full_path)
    if 'mix_kw' in req:
        rule = or_(User.nickname.ilike("%{0}%".format(req['mix_kw'])), User.mobile.ilike("%{0}%".format(req['mix_kw'])))
        query = query.filter(rule)

    if 'status' in req and int(req['status']) > -1:

        # if 'status' in req and int(req['ststus']) > -1:
        query = query.filter(User.status == int(req.get('status')))

    page_params = {
        'total': query.count(),
        'page_size':app.config['PAGE_SIZE'],
        'page':page,
        'display':app.config['PAGE_DISPLAY'],
        'url': request.full_path.replace("&p={}".format(page),"")
    }
    # 计算出分页
    pages = iPagination(page_params)
    # 计算出当前页面第几条数据
    offset = (page - 1) * app.config['PAGE_SIZE']
    # 计算出50条数据×第几页得出要有多少条数据完
    limit = app.config['PAGE_SIZE'] * page

    list = query.order_by(User.uid.desc()).all()[offset:limit]

    resp_data['list'] = list
    resp_data['pages'] = pages
    resp_data['search_con'] = req
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    return ops_render('account/index.html', resp_data)


@route_account.route('/info')
def info():
    resp_data = {}
    req = request.args
    uid = int(req.get('id', 0))
    reback_url = UrlManager.buildUrl('/account/index')
    if uid < 1:
        return redirect(reback_url)

    user_info = User.query.filter_by(uid=uid).first()
    if not user_info:
        return redirect(reback_url)
    resp_data['user_info'] = user_info
    return ops_render("account/info.html", resp_data)


@route_account.route('/set', methods=['GET', 'POST'])
def set():
    default_pwd = "******"
    if request.method == 'GET':
        resp_data = {}
        uid = request.args.get('id', 0)
        user_info = None
        if uid:
            user_info = User.query.filter_by(uid=uid).first()
        resp_data['user_info'] = user_info
        resp_data['default_pwd'] = default_pwd
        return ops_render("account/set.html", resp_data)

    elif request.method == 'POST':

        resp = {'code':200, 'msg':'操作成功', 'data':{}}
        req = request.values
        id = req['id'] if 'id' in req else None
        nickname = req['nickname'] if 'nickname' in req else None
        mobile = req['mobile'] if 'mobile' in req else None
        email = req['email'] if 'email' in req else None
        login_name = req['login_name'] if 'login_name' in req else None
        login_pwd = req['login_pwd'] if  'login_pwd' in req else None

        # if not all([nickname, mobile, email, login_name, login_pwd]):
        #     resp['code'] = -1
        #     resp['msg'] = '数据不完整，请输入完整再提交'
        #     return jsonify(resp)

        if nickname is None or len(nickname) < 1:
            resp['code'] = -1
            resp['msg'] = "请输入符合规范的姓名"
            return jsonify(resp)

        if mobile is None or len(mobile) < 11:
            resp['code'] = -1
            resp['msg'] = "请输入符合规范的手机号码"
            return jsonify(resp)
        if email is None or len(email) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的邮箱'
            return jsonify(resp)
        if login_name is None or len(login_name) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的登录名'
            return jsonify(resp)
        if login_pwd is None or len(login_pwd) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的登录密码'
            return jsonify(resp)

        has_in = User.query.filter(User.login_name==login_name, User.uid != id).first()
        if has_in:
            resp['code'] = -1
            resp['msg'] = '该登录名已存在，请换一个'
            return jsonify(resp)

        user_info = User.query.filter_by(uid=id).first()
        if user_info:
            model_user = user_info
        else:
            model_user = User()
            model_user.created_time = getCurrentDate()
            model_user.login_salt = UserService.geneSalt()
        model_user.nickname = nickname
        model_user.mobile = mobile
        model_user.email = email
        model_user.login_name = login_name
        if login_pwd != default_pwd:
            model_user.login_pwd = UserService.genePwd(login_pwd, model_user.login_salt)

        model_user.updated_time = getCurrentDate()

        db.session.add(model_user)
        db.session.commit()
        return jsonify(resp)


@route_account.route("/ops", methods=['POST'])
def ops():
    resp = {'code':200, 'msg':'操作成功', 'data':{}}
    req = request.values

    id = req['id'] if 'id' in req else 0
    act = req['act'] if 'act' in req else ''
    if not id:
        resp['code'] = -1
        resp['msg'] = '请选择要操作的账号'
        return jsonify(resp)
    if act not in ['remove', 'recover']:
        resp['code'] = -1
        resp['msg'] = '操作有误，请重试'
        return jsonify(resp)

    user_info = User.query.filter_by(uid=id).first()
    if not user_info:
        resp['code'] = -1
        resp['msg'] = '指定账号不存在'
        return jsonify(resp)

    if act == 'remove':
        user_info.status = 0
    elif act == 'recover':
        print('recover')
        user_info.status = 1
    user_info.update_time = getCurrentDate()
    db.session.add(user_info)
    db.session.commit()
    return jsonify(resp)


