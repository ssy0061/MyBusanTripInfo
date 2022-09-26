import numpy as np
import pandas as pd
import pickle
from sklearn.preprocessing import LabelEncoder

class Predict():
    def get_category(model_name, data):
        y = ['카페', '관광지', '카페', '한식', '중식', '한식'] * 10
        lb = LabelEncoder()
        lb.fit(y)
        y = lb.transform(y)
        dic = {'dt': 'model/decision_tree_model.dat',
           'et': 'model/et_model.dat',
           'rf': 'model/rf_model.dat'}
        with open(dic[model_name], 'rb') as f:
            model = pickle.load(f)
        category = model.predict(data)
        return lb.inverse_transform(category)[0]