from flask import Blueprint, render_template

route_account = Blueprint('account_page', __name__)

@route_account.route('/index')
def login():
    return render_template('account/index.html')


@route_account.route('/info')
def edit():
    return render_template("account/info.html")


@route_account.route('/set')
def resetPwd():
    return render_template("account/set.html")