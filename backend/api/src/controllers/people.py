
from src.database.db_mysql import get_connection
import json
import datetime 
def get_people_all():
    conexion = get_connection()
    with conexion.cursor() as cursor:
        cursor.execute("SELECT * FROM people")
        result = cursor.fetchall()
    conexion.close()
    return result


def get_people_pagination(page):
    conexion = get_connection()
    perpage=10
    startat=page*perpage
    with conexion.cursor() as cursor:
        #cursor.execute('SELECT name, height, mass, hairColor, gender, dob, img, homeworld_id FROM people limit %s, %s;', (startat,perpage))
        cursor.execute("SELECT  people_id, name, height, mass, hairColor, gender, dob, img FROM people limit %s, %s;", (startat, perpage))
        columns = [column[0] for column in cursor.description]
        data = [dict(zip(columns, row)) for row in cursor.fetchall()]
        res =  json.loads(json.dumps(data))
        conexion.close()

    return res



def serialize_datetime(obj): 
    if isinstance(obj, datetime.datetime): 
        return obj.isoformat() 
    raise TypeError("Type not serializable") 
  
  
