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

data = pd.read_csv('train_data.csv', encoding='cp949')
print(data)

print(data.info())

## 전처리
# 결측치
print("===결측치===")
print(data.isna().sum())
print()

# 성별 처리
lb = LabelEncoder()
lb.fit(data['MEMBER_GENDER'])

print("====성별 인코딩====")
print(lb.classes_)
data['MEMBER_GENDER'] = lb.transform(data['MEMBER_GENDER'])
print(data)
print()

print(data.CATEGORY.value_counts())
print()
lst = list(data[data['CATEGORY'] == '뷔페'].index)
data.drop(lst, inplace=True)
print(data.shape)
print()
#
y = data['CATEGORY'] # ['관광지' '술집' '양식' '일식' '중식' '카페/디저트', '한식']

lb = LabelEncoder()
lb.fit(y)
print("====target label====")
print(lb.classes_)

data['CATEGORY'] = lb.transform(y)
print(data.head())
y = data['CATEGORY'] # [0 1 2 3 4 5 6]

## 분할
data.drop(['CATEGORY'], inplace=True, axis=1)
print("====분할====")
print(data.head())
X_train, X_test, y_train, y_test = train_test_split(data, y)
print()
print(X_test, y_test)

print(X_train.shape, y_train.shape)
print(X_test.shape, y_test.shape)

## 학습
print("====학습====")
decision_tree_model = DecisionTreeClassifier()
decision_tree_model.fit(X_train, y_train)
cross_val = cross_validate(estimator=decision_tree_model, X=X_train, y=y_train, cv=5)

print(f"cross_val avg score : {cross_val['test_score'].mean()}")

rf_model = RandomForestClassifier()
cross_val = cross_validate(estimator=rf_model, X=X_train, y=y_train, cv=5)
print(f"cross_val avg score :", cross_val['test_score'].mean())

et_model = ExtraTreesClassifier()
cross_val = cross_validate(estimator=et_model, X=X_train, y=y_train, cv=5)
print(f"cross_val avg score :", cross_val['test_score'].mean())

xgb_model = XGBClassifier()
cross_val = cross_validate(estimator=xgb_model, X=X_train, y=y_train, cv=5)
print(f"cross_val avg score :", cross_val['test_score'].mean())

decision_tree_model.fit(X_train, y_train)
print(f"dt  train_score: {decision_tree_model.score(X_train, y_train)}\
        test_score: {decision_tree_model.score(X_test, y_test)}")

rf_model.fit(X_train, y_train)
print(f"rf  train_score: {rf_model.score(X_train, y_train)}\
        test_score: {rf_model.score(X_test, y_test)}")
print(X_test, y_test)

et_model.fit(X_train, y_train)
print(f"et  train_score: {et_model.score(X_train, y_train)}\
        test_score: {et_model.score(X_test, y_test)}")

xgb_model.fit(X_train, y_train)
# data = pd.DataFrame({
#                 '성별': 1,
#                 '나이대': 40,
#                 '총 결제 금액': 1169000,
#                 '총 결제 건수': 37, 
#                 '건당 평균 결제가격': 31594.595, 
#                 '건당 최대 결제 가격': 138700, 
#                 '건당 최소 결제 가격': 28000
#         }, index=[0])
# print(xgb_model.predict(data))
print(f"xgb train_score: {xgb_model.score(X_train, y_train)}\
        test_score: {xgb_model.score(X_test, y_test)}")
# 저장
model_file = {
  'dt': 'model/dt.dat',
  'rf': 'model/rf.dat',
  'et': 'model/et.dat',
  'xgb': 'model/xgb.dat'
}
model_estimator = {
  'dt': decision_tree_model,
  'rf': rf_model,
  'et': et_model,
  'xgb': xgb_model
}
for model in model_file:
  with open(model_file[model], 'wb') as f:  # dat는 그냥 의미없음.   # write binary mode
    pickle.dump(model_estimator[model], f)  # 저장하기
