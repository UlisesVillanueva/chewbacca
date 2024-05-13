from flask import Blueprint, Response, jsonify, request
from src.services.people import PeopleService
from src.utils.JsonFormat import JsonFormat
from src.utils.Logger import Logger
from flask_jwt_extended import jwt_required
from flask_cors import CORS


main = Blueprint('people_blueprint', __name__)
CORS(main)



@main.route('/all')
@jwt_required()
def get_all():
    try:
        results = PeopleService.get_all()
        return JsonFormat.successResponse({"people":results})
    except Exception as ex:
        Logger.add_to_log("error", str(ex))
        return jsonify({'message': str(ex), 'success': False})



@main.route('/')
@main.route('/page/<int:page>')
@jwt_required()
def get_paginate(page):
    try:
        results = PeopleService.get_people(page)
        return JsonFormat.successResponse({"people":results})
    except Exception as ex:
        Logger.add_to_log("error", str(ex))
        return jsonify({'message': str(ex), 'success': False})


@main.route('/search')
@jwt_required()
def search():
    try:
        q = request.args.get('q')
        results = PeopleService.search_people(q)
        return JsonFormat.successResponse({"people":results})
    except Exception as ex:
        Logger.add_to_log("error", str(ex))
        return jsonify({'message': str(ex), 'success': False})