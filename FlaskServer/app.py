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
                'TOTAL_AMT': [request.json.get('amount')],
                'TRANSACTION_COUNT': [request.json.get('cnt')], 
                'AVG_AMT': [request.json.get('avg_amount')], 
                'MAX_AMT': [request.json.get('max_amount')], 
                'MIN_AMT': [request.json.get('min_amount')],
                'MEMBER_GENDER': [gender],
                'MEMBER_AGE': [request.json.get('ages')]
        }, index=[0])
        category = Predict.get_category('rf',data) #모델 선택
        print(category)
        return jsonify({'category': str(category)})

if __name__ == '__main__':
    app.run(port=8888, debug=True)