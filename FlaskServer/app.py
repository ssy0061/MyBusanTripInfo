from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin
from flask_restx import Api, Resource, fields
from predict import Predict
import pandas as pd

app = Flask(__name__)
CORS(app)

api = Api(app, version='1.0', title='model', prefix='/api/',
    description='A simple model API', doc='/api/',decorators=[cross_origin()]
)

ai = api.namespace('ai', description='model operations')
data_fields = api.model('Resource', {
    'gender': fields.String,
    'ages': fields.String,
    'amount': fields.String,
    'cnt': fields.String,
    'avg_amount': fields.String,
    'max_amount': fields.String,
    'min_amount': fields.String,
})

@app.route("/")
def hello():
    return "<p>Hello, World!</p>"

@ai.route("/data")
class model(Resource):
    @api.doc('model_predict')
    @api.expect(data_fields)
    def post(self):
        '''유저 정보로 카테고리 추천'''
        gender = 0 if request.json.get('gender') == '남' else 1
        data = pd.DataFrame({
                '성별': [gender],
                '나이대': [request.json.get('ages')],
                '총 결제 금액': [request.json.get('amount')],
                '총 결제 건수': [request.json.get('cnt')], 
                '건당 평균 결제가격': [request.json.get('avg_amount')], 
                '건당 최대 결제 가격': [request.json.get('max_amount')], 
                '건당 최소 결제 가격': [request.json.get('min_amount')]
        })
        category = Predict.get_category('dt',data)
        print(category)
        return jsonify({'data': str(category)})

if __name__ == '__main__':
    app.run(port=8888, debug=True)