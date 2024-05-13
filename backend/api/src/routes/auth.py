from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token


main = Blueprint('auth_blueprint', __name__)


@main.route('/login', methods=['POST'])
def login():
    username = request.json.get('username')
    password = request.json.get('password')
    if username == 'super' and password == 'admin':
        access_token = create_access_token(identity=username)
        return jsonify({'message': "SUCCESS", 'success': True, "access_token":access_token}), 200
    else:
        return jsonify({'message': "Credenciales inválidas", 'success': False}), 200