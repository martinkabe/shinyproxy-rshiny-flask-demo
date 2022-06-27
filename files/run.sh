#!/bin/sh

# Start Gunicorn processes
echo Starting Gunicorn ...
exec gunicorn backend.app:app \
    --bind 0.0.0.0:5000 \
    --timeout 120 &

echo Starting RShiny ...
R -e "shiny::runApp('/opt/app/frontend')"

# In case of : not found error, run
# dos2unix files/run.sh