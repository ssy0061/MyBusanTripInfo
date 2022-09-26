from flask import Flask, jsonify, request
from flask_cors import CORS
from flask_restx import Api, Resource

app = Flask(__name__)
CORS(app)
api = Api(app, version='1.0', title='model', prefix='/swagger/',
    description='A simple model API', doc='/swagger/'
)

ai = api.namespace('ai', description='model operations')

@app.route("/")
def hello():
    return "<p>Hello, World!</p>"

@ai.route("/data")
class model(Resource):
    @ai.doc('model_predict')
    def post(self):
        data = request.form['data']
        return jsonify({'data': data})

if __name__ == '__main__':
    app.run(port=8888, debug=True)