import numpy as np
import pandas as pd
import pickle
from sklearn.preprocessing import LabelEncoder

class Predict():
    def get_category(model_name, data):
        y = ['관광지','뷔페','술집','양식','일식','중식','카페/디저트','한식']
        lb = LabelEncoder()
        lb.fit(y)
        y = lb.transform(y)
        dic = {'dt': 'model/dt.dat',
           'et': 'model/et.dat',
           'rf': 'model/rf.dat',
           'xgb': 'model/xgb.dat'}
        with open(dic[model_name], 'rb') as f:
            model = pickle.load(f)
        print(data)
        category = model.predict(data)
        return lb.inverse_transform(category)[0]