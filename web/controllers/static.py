from flask import Blueprint, send_from_directory
from application import root_path

route_static = Blueprint('static', __name__)
@route_static.route("/<path:filename>")
def index(filename):
    return send_from_directory(root_path + "/web/static/", filename)