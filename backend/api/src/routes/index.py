from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required


main = Blueprint('index_blueprint', __name__)
# main.before_request(Security.before_request)


@main.route('/')
@jwt_required()
def index():

    try:
        return jsonify({'message': "SUCCESS", 'success': True}), 200
    except Exception as ex:
        return jsonify({'message': "Internal Server Error", 'success': False}), 500




