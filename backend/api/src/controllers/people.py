
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
    try:
        conexion = get_connection()
        perpage=9
        startat=page*perpage
        with conexion.cursor() as cursor:
            cursor.execute("SELECT  people_id, name, height, mass, hairColor, gender, dob, created_at, img FROM people limit %s, %s;", (startat, perpage))
            columns = [column[0] for column in cursor.description]
            data = [dict(zip(columns, row)) for row in cursor.fetchall()]
            for person in data:
                person['created_at'] = person['created_at'].strftime('%Y-%m-%d')
                person['films'] = get_films_by_people(person['people_id'])
                person['home_world'] = get_home_world_by_people(person['people_id'])
            res =  json.loads(json.dumps(data))
            conexion.close()
    except Exception as ex:
        print(ex)

    return res

def get_films_by_people(people_id):
    try:
        conexion = get_connection()
        with conexion.cursor() as cursor:
            cursor.execute("SELECT f.title FROM film f INNER JOIN people_film pf ON f.film_id = pf.film_id WHERE pf.people_id = %s;", (people_id))
            columns = [column[0] for column in cursor.description]
            data = [dict(zip(columns, row)) for row in cursor.fetchall()]
            conexion.close()
    except Exception as ex:
        print(ex)
    return data

def get_home_world_by_people(people_id):
    try:
        conexion = get_connection()
        with conexion.cursor() as cursor:
            cursor.execute("SELECT w.name FROM world w INNER JOIN people p ON w.world_id = p.homeworld_id WHERE p.people_id = %s;", (people_id))
            data = cursor.fetchone()
            conexion.close()
    except Exception as ex:
        print(ex)
    return data[0]


def search_people(query):
    try:
        print('query',query)
        conexion = get_connection()
        with conexion.cursor() as cursor:


            cursor.execute("SELECT people.people_id, people.gender, people.name, people.dob, people.created_at, world.name as home_world FROM people JOIN people_film ON people.people_id = people_film.people_id JOIN film ON people_film.film_id = film.film_id JOIN world ON people.homeworld_id = world.world_id WHERE people.name like '%{q1}%' OR world.name like  '%{q2}%' GROUP BY people.people_id".format(q1=query, q2=query))  
            print(cursor.description)
            columns = [column[0] for column in cursor.description]
            data = [dict(zip(columns, row)) for row in cursor.fetchall()]

            for person in data:
                person['created_at'] = person['created_at'].strftime('%Y-%m-%d')
            res =  json.loads(json.dumps(data))
            conexion.close()
    except Exception as ex:
        print('search_people',ex)
    return res
