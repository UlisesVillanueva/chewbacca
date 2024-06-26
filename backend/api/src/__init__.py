from flask import Flask
from flask_jwt_extended import JWTManager
from datetime import timedelta
from .routes import  index, people, auth
from flask_cors import CORS

app = Flask(__name__)
CORS(app=app, resources={r"*": {"origins": "*"}})

def init_app(config):
    """Main application function."""
    app.config.from_object(config)

    app.register_blueprint(index.main, url_prefix='/')

    app.register_blueprint(people.main, url_prefix='/people')
        
    app.register_blueprint(auth.main, url_prefix='/auth')


    app.config['JWT_SECRET_KEY'] = 'super'
    app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(days=7)
    JWTManager(app)

    return app