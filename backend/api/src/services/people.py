from src.utils.Logger import Logger
from src.controllers.people import get_people_pagination, get_people_all
import pandas as pd
import numpy as np
import traceback
import json


class PeopleService():

    def get_people(page):
        try:
            results = get_people_pagination(page)
            # print('s',results)
            return results
        except Exception as ex:
            Logger.add_to_log("error", str(ex))
            Logger.add_to_log("error", traceback.format_exc())

   

    def get_all():
        try:
            results = get_people_all()
            # return results
            def to_json(data):
                json_data = json.dumps(data)
                return json_data

            json_results = to_json(results)
            return json_results
            return results
        except Exception as ex:
            Logger.add_to_log("error", str(ex))
            Logger.add_to_log("error", traceback.format_exc())
