from flask import Blueprint, jsonify
from src.services.people import PeopleService
from src.utils.JsonFormat import JsonFormat
from src.utils.Logger import Logger


main = Blueprint('people_blueprint', __name__)

@main.route('/all')
def get_all():
    try:
        results = PeopleService.get_all()
        return JsonFormat.successResponse({"people":results})
    except Exception as ex:
        Logger.add_to_log("error", str(ex))
        return jsonify({'message': str(ex), 'success': False})



@main.route('/', defaults={'page':0})
@main.route('/page/<int:page>')
def get_paginate(page):
    try:
        results = PeopleService.get_people(page)
        # print('res',results)
        return JsonFormat.successResponse({"people":results})
    except Exception as ex:
        Logger.add_to_log("error", str(ex))
        return jsonify({'message': str(ex), 'success': False})
