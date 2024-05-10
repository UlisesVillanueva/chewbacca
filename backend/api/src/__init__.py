from flask import Flask
from flask_jwt_extended import JWTManager
from datetime import timedelta
from flask_paginate import Pagination, get_page_args
from .routes import  index, people, auth

app = Flask(__name__)


def init_app(config):
    """Main application function."""
    app.config.from_object(config)

    app.register_blueprint(index.main, url_prefix='/')

    app.register_blueprint(people.main, url_prefix='/people')
        
    app.register_blueprint(auth.main, url_prefix='/auth')


    app.config['JWT_SECRET_KEY'] = 'super'
    app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(days=7)
    JWTManager(app)



    # # Configure pagination
    # @app.template_global()
    # def paginate(items, per_page=10):
    #     page, per_page, offset = get_page_args()
    #     total = len(items)
    #     pagination = Pagination(page=page, per_page=per_page, total=total)
    #     return items[offset: offset + per_page], pagination

    return app