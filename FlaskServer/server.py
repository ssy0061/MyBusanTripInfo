from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route("/")
def index():
    return "<p>Hello, World!</p>"

@app.route("/test/data", methods=['POST'])
def test():
    data = request.form['data']
    return jsonify({'data': data})

if __name__ == '__main__':
    app.run(port=8888, debug=True)