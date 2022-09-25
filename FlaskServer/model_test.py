import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.preprocessing import LabelEncoder

import graphviz
from sklearn.tree import DecisionTreeClassifier, export_graphviz
from sklearn.ensemble import RandomForestClassifier, ExtraTreesClassifier
from xgboost import XGBClassifier

from sklearn.model_selection import cross_val_score, cross_validate
from sklearn.metrics import accuracy_score, f1_score
from xgboost import plot_importance # 중요변수 시각화

import pickle

data = pd.read_excel('./trans_data.xlsx')
# print(data)
# 전처리
lb = LabelEncoder()
lb.fit(data['성별'])
data['성별'] = lb.transform(data['성별'])
data['나이대'] = data['나이대'].str[:-1]
data['나이대'].astype('uint8')

data = pd.concat([data] * 10, ignore_index = True)
# sample y
y = ['카페', '관광지', '카페', '한식', '중식', '한식'] * 10
lb = LabelEncoder()
lb.fit(y)
y = lb.transform(y)
# print(data)
X_train, X_test, y_train, y_test = train_test_split(data, y)

# print(X_train.shape, y_train.shape)
# print(X_test.shape, y_test.shape)

decision_tree_model = DecisionTreeClassifier()
decision_tree_model.fit(X_train, y_train)
cross_val = cross_validate(estimator=decision_tree_model, X=X_train, y=y_train, cv=5)

# print(f"average test score : {cross_val['test_score'].mean()}")

model = decision_tree_model
tmp = pd.DataFrame({
        '성별': [1],
        '나이대': [20],
        '총 결제 금액': [708000],
        '총 결제 건수': [32], 
        '건당 평균 결제가격': [21040], 
        '건당 최대 결제 가격': [18000], 
        '건당 최소 결제 가격': [3000]
}) # 카테고리 2
print(tmp)
y_pred = model.predict(tmp)
print(y_pred)


# print(X_test)
# print(y_test)

# y_pred = model.predict(X_test.iloc[0:1,:])
# print(y_pred[0])
# print(y_test[0])

# 저장한 모델 불러오기
dt = 'model/decision_tree_model.dat'
et = 'model/et_model.dat'
rf = 'model/rf_model.dat'
with open(rf, 'rb') as f:
  model2 = pickle.load(f)  # 로드

print(model2.score(X_test, y_test))