from decouple import config

from flask import jsonify, request
from src.utils.Logger import Logger

API_KEY = config('API_KEY')


class Security():
    """Security class"""
    def before_request():
        """Before request function to validate api key."""
        api_key = request.headers.get('API-Key')
        if not api_key or not Security.authenticate_api_key(api_key):
            response = jsonify({'Unauthorized': 'Api Key is missing or invalid', 'success': False})
    
            Logger.add_to_log("warn",'Api Key is missing or invalid')
            return response, 401
    
    @staticmethod
    def authenticate_api_key(api_key):
        return api_key == API_KEY
