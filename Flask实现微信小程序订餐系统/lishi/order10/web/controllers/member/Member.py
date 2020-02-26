# -*- coding: utf-8 -*-
from flask import Blueprint, request, redirect, jsonify
from common.libs.UrlManager import UrlManager
from common.libs.Helper import ops_render
from common.models.member.Member import Member
from application import app,db
from common.libs.Helper import iPagination
from common.libs.Helper import getCurrentDate
route_member = Blueprint( 'member_page',__name__ )


@route_member.route( "/index" )
def index():
    resp_data = {}
    # 获取前段传递过来的页码
    req = request.values
    page = int(req['p']) if ('p' in req and req['p']) else 1
    query = Member.query
    print("###################")
    print(req)
    if 'mix_kw' in req:
        query = query.filter(Member.nickname.ilike("%{0}%".format(req['mix_kw'])))

    if 'status' in req and int(req['status']) > -1:
        query = query.filter(Member.status == int(req['status']))

    # 定义分页参数
    page_params = {
        # 总数
        'total':query.count(),
        # 单页数量
        'page_size':app.config['PAGE_SIZE'],
        'page':page,
        # 在页面上你想要展示多少页
        'display':app.config['PAGE_DISPLAY'],
        'url': request.full_path.replace("&p={}".format(page), '')
    }
    # 生成分页
    pages = iPagination(page_params)
    # 偏移量
    offset = (page-1)*app.config['PAGE_SIZE']
    # 查询会员信息，条件：以id为字段倒序，取出offset范围内的数据
    list = query.order_by(Member.id.desc()).offset(offset).limit(app.config['PAGE_SIZE']).all()
    # 会员信息
    resp_data['list'] = list
    resp_data['pages'] = pages
    resp_data['search_con'] = req
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['current'] = 'index'

    return ops_render( "member/index.html", resp_data)


@route_member.route("/info")
def info():
    resp_data = {}
    req = request.args
    id = req.get('id', None)

    if not id:
        return redirect(UrlManager.buildUrl("/member/index"))

    user_info = Member.query.filter_by(id=id).first()
    if not user_info:
        return redirect(UrlManager.buildUrl("/member/index"))
    resp_data['user_info'] = user_info
    return ops_render( "member/info.html", resp_data)


@route_member.route("/set", methods=['POST', 'GET'])
def set():
    if request.method == 'GET':
        resp_data = {}
        req = request.args
        id = req.get('id', None)
        if id:
            redirect(UrlManager.buildUrl("/member/index"))

        user_info = Member.query.filter_by(id=id).first()
        if user_info:
            redirect(UrlManager.buildUrl("/member/index"))

        resp_data['user_info'] = user_info
        return ops_render("member/set.html", resp_data)
    elif request.method == 'POST':
        resp = {'code':200, 'msg':'操作成功', 'data':{}}
        req = request.values
        nickname = req['nickname'] if 'nickname' in req else None
        id = req['id'] if 'id' in req else None
        if not all([nickname, id]):
            resp['code '] = -1
            resp['msg'] = '数据不完整'
            return jsonify(resp)
        # 判断是否重名
        user_info = Member.query.filter_by(id=id).first()
        if not user_info and user_info.nickname == nickname:
            resp['code'] = -1
            resp['msg'] = '请重新输入'
            return jsonify(resp)
        user_info.nickname = nickname.strip()
        user_info.update_time = getCurrentDate()
        db.session.add(user_info)
        db.session.commit()
        return jsonify(resp)


@route_member.route( "/comment" )
def comment():
    return ops_render( "member/comment.html")


@route_member.route("/ops", methods=['POST'])
def ops():
    resp = {'code':200, 'msg':'操作成功', 'data':{}}
    req = request.values
    act = req['act'] if 'act' in req else None
    id = req['id'] if 'id' in req else None
    if not all([id, act]):
        resp['code'] = -1
        resp['msg'] = '数据不完整'
        return jsonify(resp)

    if act not in ['remove', 'recover']:
        resp['code'] = -1
        resp['msg'] = '操作有误，请重试'

    user_info = Member.query.filter_by(id=id).first()
    if not user_info:
        resp['code'] = -1
        resp['msg'] = '账号不存在'
        return jsonify(resp)

    if act == 'remove':
        user_info.status = 0
    elif act.strip() == 'recover':
        user_info.status = 1
    user_info.update_time = getCurrentDate()
    db.session.add(user_info)
    db.session.commit()
    return jsonify(resp)

