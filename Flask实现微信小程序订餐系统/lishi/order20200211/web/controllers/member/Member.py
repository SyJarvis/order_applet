# -*- coding: utf-8 -*-
from flask import Blueprint, request, redirect, jsonify
from common.libs.Helper import ops_render, iPagination, getCurrentData
from common.libs.UrlManager import UrlManager
from common.models.member.Member import Member
from application import app, db


route_member = Blueprint( 'member_page',__name__ )

@route_member.route( "/index" )
def index():
    resp_data = {}
    # 获取前前端传递过来的p（页码）
    req = request.values
    # 判断页码是否存在，不存在则返回1
    page = int(req['p']) if ('p' in req and req['p']) else 1
    # 会员的模型对象
    query = Member.query

    if 'mix_kw' in req:
        query = query.filter(Member.nickname.ilike("%{0}%".format(req['mix_kw'])))


    if 'status' in req and int(req['status']) > -1:
        query = query.filter(Member.status == int(req['status']))
    # 定义分页参数
    page_params = {
        # 总数
        'total':query.count(),
        # 每一页的数量
        'page_size':app.config['PAGE_SIZE'],
        # 第几页
        'page':page,
        # 在页面上你想展示多少页
        'display':app.config['PAGE_DISPLAY'],
        'url':request.full_path.replace("&p={}".format(page), '')
    }
    # 生成分页
    pages = iPagination(page_params)
    # 偏移量
    offset = (page-1)* app.config['PAGE_SIZE']
    # 查询会员的信息，条件：以id为字段倒序，取出offset范围内的数据
    list = query.order_by(Member.id.desc()).offset(offset).limit(app.config['PAGE_SIZE']).all()
    # 会员信息
    resp_data['list'] = list
    # 页码分页栏
    resp_data['pages'] = pages
    # 当前搜索的参数、页码
    resp_data['search_con'] = req
    # 状态列表
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['current'] = 'index'
    return ops_render("member/index.html", resp_data)

@route_member.route( "/info" )
def info():
    resp_data = {}
    req = request.args
    id = int(req.get("id", 0))
    if id < 1:
        return redirect(UrlManager.buildUrl("/member/index"))
    info = Member.query.filter_by(id=id).first()
    if not info:
        return redirect(UrlManager.buildUrl("/member/index"))
    resp_data['info'] = info
    resp_data['current'] = 'index'
    return ops_render( "member/info.html", resp_data)


@route_member.route("/set", methods=["GET", "POST"])
def set():
    if request.method == "GET":
        resp_data = {}
        req = request.args
        id = int(req.get('id', 0))
        if id < 1:
            return redirect(UrlManager.buildUrl('/member/index'))

        info = Member.query.filter_by(id=id).first()
        if not info:
            return redirect(UrlManager.buildUrl('/member/index'))
        resp_data['current'] = 'index'
        resp_data['info'] = info
        return ops_render( "member/set.html", resp_data)
    elif request.method == "POST":
        resp = {'code':200, 'msg':'操作成功', 'data':{}}
        req = request.values
        id = req['id'] if 'id' in req else 0
        nickname = req['nickname'] if 'nickname' in req else ''
        if nickname is None or len(nickname) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的姓名'
            return jsonify(resp)

        # 获取用户信息
        member_info = Member.query.filter_by(id=id).first()
        if not member_info:
            resp['code'] = -1
            resp['msg'] = '指定的会员不存在'
            return jsonify(resp)

        member_info.nickname = nickname
        member_info.updated_time = getCurrentData()
        db.session.add(member_info)
        db.session.commit()
        return jsonify(resp)



@route_member.route( "/comment" )
def comment():
    return ops_render( "member/comment.html" )


@route_member.route("/ops", methods=["POST"])
def ops():
    resp = {'code': 200, 'msg':'操作成功', 'data':{}}
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

    member_info = Member.query.filter_by(id=id).first()
    if not member_info:
        resp['code'] = -1
        resp['msg'] = '会员不存在'
        return jsonify(resp)

    if act == 'remove':
        member_info.status = 0
    elif act == 'recover':
        member_info.status = 1
    member_info.updated_time = getCurrentData()
    db.session.add(member_info)
    db.session.commit()

    return jsonify(resp)
