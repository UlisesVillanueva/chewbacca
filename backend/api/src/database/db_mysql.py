from decouple import config
import pymysql
import traceback
from src.utils.Logger import Logger


def get_connection():
    try:
        return pymysql.connect(
            host=config('MYSQL_HOST'),
            user=config('MYSQL_USER'),
            password=config('MYSQL_PASSWORD'),
            db=config('MYSQL_DB'),
            port=3306
        )
    except Exception as ex:
        print(ex)
        Logger.add_to_log("error", str(ex))
        Logger.add_to_log("error", traceback.format_exc())



