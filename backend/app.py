from flask import Flask, jsonify
from flask_restx import Api, Resource, reqparse

 
app = Flask(__name__)
api = Api(
    app,
    version='1.1.0',
    title='FLASK API',
    description="""This is simple Flask API.
                """,
    contact_email='Developer 01 [developer01@gmail.com]',
    default ='Test Flask API',
    default_label='User can test POST, GET, PUT, PATCH, and DELETE requests.'
)


@api.route('/flask-api/v1/get_some_text/', defaults={'name':'Smith'})
@api.route('/flask-api/v1/get_some_text/<string:name>', endpoint='get_some_text')
@api.doc(params={'name':'Name is user name.'})
class GetSomeText(Resource):
    def get(self, name):
        return f"Greeting from flask, {name}!"
 

parser_number = reqparse.RequestParser()
parser_number.add_argument('number', type=int, help='Multiply number by two.')
@api.route('/flask-api/v1/timestwo/', endpoint='timestwo')
@api.doc(parser=parser_number)
class MultipyByTwo(Resource):
    def post(self):
        arg = parser_number.parse_args()
        return int(arg['number'])*2


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=int("5000"),
        debug=False,
        threaded=True
    )
