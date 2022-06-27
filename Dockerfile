FROM openanalytics/r-ver:4.1.3

LABEL maintainer="developer01@gmail.com" app="shinyproxy-flask-rshiny"

ENV TZ=Europe
ENV PYTHONUNBUFFERED "1"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    sudo \
    libcurl4-gnutls-dev \
    libssl-dev \
    libcairo2-dev \
    libxt-dev \
    libssh2-1-dev \ 
    libxml2-dev \
    libv8-dev \
    python3-pip \
    libmpfr-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install ui related packages
RUN R -e "install.packages(c('shiny','httr','R6','jsonlite'), repos = 'https://cran.r-project.org/')"

# copy files
COPY files/Rprofile.site /usr/local/lib/R/etc/
COPY backend /opt/app/backend
COPY frontend /opt/app/frontend
COPY files/run.sh /opt/app

WORKDIR /opt/app

RUN pip install -r backend/requirements.txt
RUN chmod +x ./run.sh

# EXPOSE 3838

CMD ["sh", "run.sh"]