# Useful commands
python -m venv pyvenv
virtualenv -p python venv

flask run --host=0.0.0.0 --port=82

source flask_venv/Scripts/activate
deactivate

pip freeze > requirements.txt
docker-compose --version
docker-compose up

# Build docker container
docker build --tag shiny-flask-app .
# Rund docker image
docker run -d -p 3838:3838 shiny-flask-app

# Run docker image from shinyproxy
Download shinyproxy-2.6.1.jar from here: https://www.shinyproxy.io/downloads/shinyproxy-2.6.1.jar
java -jar shinyproxy-2.6.1.jar