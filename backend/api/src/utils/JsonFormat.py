from flask import jsonify


class JsonFormat():

    def successResponse(data):
        return jsonify({
            "data": data,
            'message': "SUCCESS", 'success': True})

    def errorResponse(ex):
        return jsonify({'message': str(ex),  'success': False})