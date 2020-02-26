# -*- coding: utf-8 -*-
from flask import Blueprint,request, jsonify, redirect
from common.libs.UrlManager import UrlManager
from common.libs.Helper import ops_render, getCurrentDate, getDictFilterField
from application import db, app
from decimal import Decimal
from common.models.food.Food import Food
from common.models.food.FoodCat import FoodCat
from common.models.food.FoodStockChangeLog import FoodStockChangeLog
from common.libs.Helper import iPagination
from sqlalchemy import or_

route_food = Blueprint( 'food_page',__name__ )

@route_food.route( "/index", methods=['GET', 'POST'])
def index():
    # http://192.168.153.155:8999/food/index?status=1&cat_id=1&mix_kw=%E9%BB%84%E7%84%96%E9%B8%A1
    resp_data = {}
    req = request.values
    page = int(req['p']) if ('p' in req and req['p']) else 1
    query = Food.query
    # status cat_id mix_kw
    if 'mix_kw' in req:
        # query = query.filter(Member.nickname.ilike("%{0}%".format(req['mix_kw'])))
        rule = or_(Food.name.ilike("%{0}%".format(req['mix_kw'])), Food.tags.ilike("%{0}%".format(req['mix_kw'])))
        query = query.filter(rule)
    if 'cat_id' in req and int(req['cat_id']) > 0:
        print('cat_id...........................................................')
        query = query.filter(Food.cat_id == int(req['cat_id']))

    if 'status' in req and int(req['status']) > -1:
        print('status...........................................................')
        query = query.filter(Food.status == int(req['status']))

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
    offset = (page-1) * app.config['PAGE_SIZE']
    list = query.order_by(Food.id.desc()).offset(offset).limit(app.config['PAGE_SIZE']).all()
    # # 分类
    cat_mapping = getDictFilterField(FoodCat, 'id', 'id', [])

    resp_data['cat_mapping'] = cat_mapping
    resp_data['list'] = list
    resp_data['pages'] = pages
    resp_data['search_con'] = req
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['current'] = 'index'
    return ops_render("food/index.html", resp_data)

@route_food.route( "/info" )
def info():
    resp_data = {}
    req = request.args
    id = int(req.get('id', 0))
    reback_url = UrlManager.buildUrl('/food/index')

    if id < 1:
        return redirect(reback_url)
    info = Food.query.filter_by(id=id).first()
    if not info:
        return redirect(reback_url)

    stock_change_list = FoodStockChangeLog.query.filter(FoodStockChangeLog.food_id == id)\
        .order_by(FoodStockChangeLog.id.desc()).all()
    resp_data['current'] = 'info'
    resp_data['stock_change_list'] = stock_change_list
    resp_data['info'] = info
    return ops_render("food/info.html", resp_data)


@route_food.route("/set", methods = ['GET', 'POST'])
def set():
    if request.method == 'GET':
        resp_data = {}
        req = request.args
        id = int(req.get('id', 0))
        info = Food.query.filter_by(id=id).first()
        if info and info.status != 1:
            return redirect(UrlManager.buildUrl('/food/index'))

        cat_list = FoodCat.query.all()
        resp_data['info'] = info
        resp_data['current'] = 'set'
        resp_data['cat_list'] = cat_list
        return ops_render("food/set.html", resp_data)
    elif request.method == 'POST':
        resp = {'code':200, 'msg':'操作成功', 'data':{}}
        req = request.values
        id = int(req['id']) if ('id' in req and req['id']) else 0
        cat_id = int(req['cat_id']) if 'cat_id' in req else 0
        name = req['name'] if 'name' in req else ''
        price = req['price'] if 'price' in req else ''
        main_image = req['main_image'] if 'main_image' in req else ''
        summary = req['summary'] if 'summary' in req else ''
        stock = int(req['stock']) if 'stock' in req else ''
        tags = req['tags'] if 'tags' in req else ''
        price = Decimal(price).quantize(Decimal('0.00'))
        if cat_id < 1:
            resp['code'] = -1
            resp['msg'] = '请选择分类'
            return jsonify(resp)
        if name is None or len(name) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合会犯的名称'
            return jsonify(resp)

        if price <= 0:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的售卖价格'
            return jsonify(resp)

        if main_image is None or len(main_image) < 3:
            resp['code'] = -1
            resp['msg'] = '请上传封面图'
            return jsonify(resp)

        if summary is None or len(summary) < 3:
            resp['code'] = -1
            resp['msg'] = "请输入图书描述，并不能少于10个字符"
            return jsonify(resp)

        if stock < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的库存量'
            return jsonify(resp)

        if tags is None or len(tags) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入标签，便于搜索'
            return jsonify(resp)

        food_info = Food.query.filter_by(id=id).first()
        before_stock = 0
        if food_info:
            model_food = food_info
            before_stock = model_food.stock
        else:
            model_food = Food()
            model_food.status = 1
            model_food.created_time = getCurrentDate()

        model_food.cat_id = cat_id
        model_food.name = name
        model_food.price = price
        model_food.main_image = main_image
        model_food.summary = summary
        model_food.stock = stock
        model_food.tags = tags
        model_food.updated_time = getCurrentDate()
        db.session.add(model_food)
        ret = db.session.commit()

        model_stock_change = FoodStockChangeLog()
        model_stock_change.food_id = model_food.id
        # 当前的库存减去未修改前的库存，减少的话就是负数，增加就是正数
        model_stock_change.unit = int(stock) - int(before_stock)
        model_stock_change.total_stock = stock
        model_stock_change.note = ''
        model_stock_change.created_time = getCurrentDate()
        db.session.add(model_stock_change)
        db.session.commit()
        return jsonify(resp)



@route_food.route("/cat")
def cat():
    resp_data = {}
    req = request.values
    query = FoodCat.query
    if 'status' in req and int(req['status']) > -1:
        query = query.filter(FoodCat.status==int(req['status']))

    list = query.order_by(FoodCat.weight.desc(), FoodCat.id.desc()).all()
    resp_data['list'] = list
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['search_con'] = req
    resp_data['current'] = 'cat'
    return ops_render("food/cat.html", resp_data)


@route_food.route("/cat-set", methods=['GET', 'POST'])
def catSet():
    if request.method == 'GET':
        resp_data = {}
        req = request.args
        id = int(req.get("id", 0))
        info = None
        if id:
            info = FoodCat.query.filter_by(id=id).first()
        resp_data['info'] = info
        resp_data['current'] = 'cat'
        return ops_render( "food/cat_set.html", resp_data)
    elif request.method == 'POST':
        resp = {'code':200, 'msg':'操作成功', 'data':{}}
        req = request.values

        id = req['id'] if 'id' in req else 0
        name = req['name'] if 'name' in req else ''
        weight = int(req['weight']) if ('weight' in req and int(req['weight']) > 0) else 1

        if name is None or len(name) < 1:
            resp['code'] = -1
            resp['msg'] = '请输入符合规范的分类名称'
            return jsonify(resp)

        food_cat_info = FoodCat.query.filter_by(id=id).first()
        if food_cat_info:
            model_food_cat = food_cat_info
        else:
            model_food_cat = FoodCat()
            model_food_cat.created_time = getCurrentDate()

        model_food_cat.name = name
        model_food_cat.weight = weight
        model_food_cat.updated_time = getCurrentDate()

        db.session.add(model_food_cat)
        db.session.commit()
        return jsonify(resp)



@route_food.route("/cat-ops", methods=['POST'])
def catOps():
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

    food_info = FoodCat.query.filter_by(id=int(id)).first()
    if not food_info:
        resp['code'] = -1
        resp['msg'] = '账号不存在'
        return jsonify(resp)

    if act == 'remove':
        food_info.status = 0
    elif act.strip() == 'recover':
        food_info.status = 1
    food_info.update_time = getCurrentDate()
    db.session.add(food_info)
    db.session.commit()
    return jsonify(resp)


@route_food.route('/ops', methods=['POST'])
def ops():
    resp = {'code':200, 'msg':'操作成功', 'data':{}}
    req = request.values
    act = req['act'] if 'act' in req else None
    id = req['id'] if 'id' in req else None
    if not all([act, id]):
        resp['code'] = -1
        resp['msg'] = '数据不完整'
        return jsonify(resp)
    if act not in ['remove', 'recover']:
        resp['code'] = -1
        resp['msg'] = '操作有误，请重试'
    food_info = Food.query.filter_by(id=int(id)).first()
    if not food_info:
        resp['code'] = -1
        resp['msg'] = '指定美食不存在'
        return jsonify(resp)
    if act.strip() == 'remove':
        food_info.status = 0
    elif act.strip() == 'recover':
        food_info.status = 1
    food_info.update_time = getCurrentDate()
    db.session.add(food_info)
    db.session.commit()
    return jsonify(resp)





