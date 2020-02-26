# coding: utf-8
from sqlalchemy import BigInteger, Column, Date, DateTime, Index, Integer, Numeric, String, Text
from sqlalchemy.schema import FetchedValue
from application import db



class AppAccessLog(db.Model):
    __tablename__ = 'app_access_log'

    id = db.Column(db.Integer, primary_key=True)
    uid = db.Column(db.BigInteger, nullable=False, index=True, server_default=db.FetchedValue(), info='uid')
    referer_url = db.Column(db.String(255), nullable=False, server_default=db.FetchedValue(), info='当前访问的refer')
    target_url = db.Column(db.String(255), nullable=False, server_default=db.FetchedValue(), info='访问的url')
    query_params = db.Column(db.Text, nullable=False, info='get和post参数')
    ua = db.Column(db.String(255), nullable=False, server_default=db.FetchedValue(), info='访问ua')
    ip = db.Column(db.String(32), nullable=False, server_default=db.FetchedValue(), info='访问ip')
    note = db.Column(db.String(1000), nullable=False, server_default=db.FetchedValue(), info='json格式备注字段')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())



class AppErrorLog(db.Model):
    __tablename__ = 'app_error_log'

    id = db.Column(db.Integer, primary_key=True)
    referer_url = db.Column(db.String(255), nullable=False, server_default=db.FetchedValue(), info='当前访问的refer')
    target_url = db.Column(db.String(255), nullable=False, server_default=db.FetchedValue(), info='访问的url')
    query_params = db.Column(db.Text, nullable=False, info='get和post参数')
    content = db.Column(db.String, nullable=False, info='日志内容')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class Food(db.Model):
    __tablename__ = 'food'

    id = db.Column(db.Integer, primary_key=True)
    cat_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='分类id')
    name = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='书籍名称')
    price = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='售卖金额')
    main_image = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='主图')
    summary = db.Column(db.String(10000), nullable=False, server_default=db.FetchedValue(), info='描述')
    stock = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='库存量')
    tags = db.Column(db.String(200), nullable=False, server_default=db.FetchedValue(), info='tag关键字，以","连接')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='状态 1：有效 0：无效')
    month_count = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='月销售数量')
    total_count = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='总销售量')
    view_count = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='总浏览次数')
    comment_count = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='总评论量')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后插入时间')



class FoodCat(db.Model):
    __tablename__ = 'food_cat'

    id = db.Column(db.Integer, primary_key=True, unique=True)
    name = db.Column(db.String(50), nullable=False, server_default=db.FetchedValue(), info='类别名称')
    weight = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='权重')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='状态 1：有效 0：无效')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class FoodSaleChangeLog(db.Model):
    __tablename__ = 'food_sale_change_log'

    id = db.Column(db.Integer, primary_key=True)
    food_id = db.Column(db.Integer, nullable=False, index=True, server_default=db.FetchedValue(), info='商品id')
    quantity = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='售卖数量')
    price = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='售卖金额')
    member_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='会员id')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='售卖时间')



class FoodStockChangeLog(db.Model):
    __tablename__ = 'food_stock_change_log'

    id = db.Column(db.Integer, primary_key=True)
    food_id = db.Column(db.Integer, nullable=False, index=True, info='商品id')
    unit = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='变更多少')
    total_stock = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='变更之后总量')
    note = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='备注字段')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class Image(db.Model):
    __tablename__ = 'images'

    id = db.Column(db.Integer, primary_key=True)
    file_key = db.Column(db.String(60), nullable=False, server_default=db.FetchedValue(), info='文件名')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class Member(db.Model):
    __tablename__ = 'member'

    id = db.Column(db.Integer, primary_key=True)
    nickname = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='会员名')
    mobile = db.Column(db.String(11), nullable=False, server_default=db.FetchedValue(), info='会员手机号码')
    sex = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='性别 1：男 2：女')
    avatar = db.Column(db.String(200), nullable=False, server_default=db.FetchedValue(), info='会员头像')
    salt = db.Column(db.String(32), nullable=False, server_default=db.FetchedValue(), info='随机salt')
    reg_ip = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='注册ip')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='状态 1：有效 0：无效')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class MemberAddres(db.Model):
    __tablename__ = 'member_address'
    __table_args__ = (
        db.Index('idx_member_id_status', 'member_id', 'status'),
    )

    id = db.Column(db.Integer, primary_key=True)
    member_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='会员id')
    nickname = db.Column(db.String(20), nullable=False, server_default=db.FetchedValue(), info='收货人姓名')
    mobile = db.Column(db.String(11), nullable=False, server_default=db.FetchedValue(), info='收货人手机号码')
    province_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='省id')
    province_str = db.Column(db.String(50), nullable=False, server_default=db.FetchedValue(), info='省名称')
    city_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='城市id')
    city_str = db.Column(db.String(50), nullable=False, server_default=db.FetchedValue(), info='市名称')
    area_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='区域id')
    area_str = db.Column(db.String(50), nullable=False, server_default=db.FetchedValue(), info='区域名称')
    address = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='详细地址')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='是否有效 1：有效 0：无效')
    is_default = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='默认地址')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class MemberCart(db.Model):
    __tablename__ = 'member_cart'

    id = db.Column(db.Integer, primary_key=True)
    member_id = db.Column(db.BigInteger, nullable=False, index=True, server_default=db.FetchedValue(), info='会员id')
    food_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='商品id')
    quantity = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='数量')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class MemberComment(db.Model):
    __tablename__ = 'member_comments'

    id = db.Column(db.Integer, primary_key=True)
    member_id = db.Column(db.Integer, nullable=False, index=True, server_default=db.FetchedValue(), info='会员id')
    food_ids = db.Column(db.String(200), nullable=False, server_default=db.FetchedValue(), info='商品ids')
    pay_order_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='订单id')
    score = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='评分')
    content = db.Column(db.String(200), nullable=False, server_default=db.FetchedValue(), info='评论内容')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class OauthAccessToken(db.Model):
    __tablename__ = 'oauth_access_token'

    id = db.Column(db.Integer, primary_key=True)
    access_token = db.Column(db.String(600), nullable=False, server_default=db.FetchedValue())
    expired_time = db.Column(db.DateTime, nullable=False, index=True, server_default=db.FetchedValue(), info='过期时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class OauthMemberBind(db.Model):
    __tablename__ = 'oauth_member_bind'
    __table_args__ = (
        db.Index('idx_type_openid', 'type', 'openid'),
    )

    id = db.Column(db.Integer, primary_key=True)
    member_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='会员id')
    client_type = db.Column(db.String(20), nullable=False, server_default=db.FetchedValue(), info='客户端来源类型。qq,weibo,weixin')
    type = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='类型 type 1:wechat ')
    openid = db.Column(db.String(80), nullable=False, server_default=db.FetchedValue(), info='第三方id')
    unionid = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue())
    extra = db.Column(db.Text, nullable=False, info='额外字段')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class PayOrder(db.Model):
    __tablename__ = 'pay_order'
    __table_args__ = (
        db.Index('idx_member_id_status', 'member_id', 'status'),
    )

    id = db.Column(db.Integer, primary_key=True)
    order_sn = db.Column(db.String(40), nullable=False, unique=True, server_default=db.FetchedValue(), info='随机订单号')
    member_id = db.Column(db.BigInteger, nullable=False, server_default=db.FetchedValue(), info='会员id')
    total_price = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='订单应付金额')
    yun_price = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='运费金额')
    pay_price = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='订单实付金额')
    pay_sn = db.Column(db.String(128), nullable=False, server_default=db.FetchedValue(), info='第三方流水号')
    prepay_id = db.Column(db.String(128), nullable=False, server_default=db.FetchedValue(), info='第三方预付id')
    note = db.Column(db.Text, nullable=False, info='备注信息')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='1：支付完成 0 无效 -1 申请退款 -2 退款中 -9 退款成功  -8 待支付  -7 完成支付待确认')
    express_status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='快递状态，-8 待支付 -7 已付款待发货 1：确认收货 0：失败')
    express_address_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='快递地址id')
    express_info = db.Column(db.String(1000), nullable=False, server_default=db.FetchedValue(), info='快递信息')
    comment_status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='评论状态')
    pay_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='付款到账时间')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最近一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class PayOrderCallbackDatum(db.Model):
    __tablename__ = 'pay_order_callback_data'

    id = db.Column(db.Integer, primary_key=True)
    pay_order_id = db.Column(db.Integer, nullable=False, unique=True, server_default=db.FetchedValue(), info='支付订单id')
    pay_data = db.Column(db.Text, nullable=False, info='支付回调信息')
    refund_data = db.Column(db.Text, nullable=False, info='退款回调信息')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='创建时间')



class PayOrderItem(db.Model):
    __tablename__ = 'pay_order_item'

    id = db.Column(db.Integer, primary_key=True)
    pay_order_id = db.Column(db.Integer, nullable=False, index=True, server_default=db.FetchedValue(), info='订单id')
    member_id = db.Column(db.BigInteger, nullable=False, server_default=db.FetchedValue(), info='会员id')
    quantity = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='购买数量 默认1份')
    price = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='商品总价格，售价 * 数量')
    food_id = db.Column(db.Integer, nullable=False, index=True, server_default=db.FetchedValue(), info='美食表id')
    note = db.Column(db.Text, nullable=False, info='备注信息')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='状态：1：成功 0 失败')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最近一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class QueueList(db.Model):
    __tablename__ = 'queue_list'

    id = db.Column(db.Integer, primary_key=True)
    queue_name = db.Column(db.String(30), nullable=False, server_default=db.FetchedValue(), info='队列名字')
    data = db.Column(db.String(500), nullable=False, server_default=db.FetchedValue(), info='队列数据')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='状态 -1 待处理 1 已处理')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class StatDailyFood(db.Model):
    __tablename__ = 'stat_daily_food'
    __table_args__ = (
        db.Index('date_food_id', 'date', 'food_id'),
    )

    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.Date, nullable=False)
    food_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='菜品id')
    total_count = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='售卖总数量')
    total_pay_money = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='总售卖金额')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class StatDailyMember(db.Model):
    __tablename__ = 'stat_daily_member'
    __table_args__ = (
        db.Index('idx_date_member_id', 'date', 'member_id'),
    )

    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.Date, nullable=False, info='日期')
    member_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='会员id')
    total_shared_count = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='当日分享总次数')
    total_pay_money = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='当日付款总金额')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class StatDailySite(db.Model):
    __tablename__ = 'stat_daily_site'

    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.Date, nullable=False, index=True, info='日期')
    total_pay_money = db.Column(db.Numeric(10, 2), nullable=False, server_default=db.FetchedValue(), info='当日应收总金额')
    total_member_count = db.Column(db.Integer, nullable=False, info='会员总数')
    total_new_member_count = db.Column(db.Integer, nullable=False, info='当日新增会员数')
    total_order_count = db.Column(db.Integer, nullable=False, info='当日订单数')
    total_shared_count = db.Column(db.Integer, nullable=False)
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class User(db.Model):
    __tablename__ = 'user'

    uid = db.Column(db.BigInteger, primary_key=True, info='用户uid')
    nickname = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='用户名')
    mobile = db.Column(db.String(20), nullable=False, server_default=db.FetchedValue(), info='手机号码')
    email = db.Column(db.String(100), nullable=False, server_default=db.FetchedValue(), info='邮箱地址')
    sex = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='1：男 2：女 0：没填写')
    avatar = db.Column(db.String(64), nullable=False, server_default=db.FetchedValue(), info='头像')
    login_name = db.Column(db.String(20), nullable=False, unique=True, server_default=db.FetchedValue(), info='登录用户名')
    login_pwd = db.Column(db.String(32), nullable=False, server_default=db.FetchedValue(), info='登录密码')
    login_salt = db.Column(db.String(32), nullable=False, server_default=db.FetchedValue(), info='登录密码的随机加密秘钥')
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='1：有效 0：无效')
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='最后一次更新时间')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='插入时间')



class WxShareHistory(db.Model):
    __tablename__ = 'wx_share_history'

    id = db.Column(db.Integer, primary_key=True)
    member_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='会员id')
    share_url = db.Column(db.String(200), nullable=False, server_default=db.FetchedValue(), info='分享的页面url')
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue(), info='创建时间')
