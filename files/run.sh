#!/bin/sh

# Start Gunicorn processes
echo Starting Gunicorn ...
exec gunicorn backend.app:app \
    --bind 0.0.0.0:5000 \
    --workers 4 \
    --timeout 120 &

echo Starting RShiny ...
R -e "shiny::runApp('/root/frontend')"

# In case of : not found error, run
# dos2unix files/run.sh