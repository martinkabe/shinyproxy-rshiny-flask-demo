# Load Packages -----------------------------------------------------------
library(shiny)
library(httr)


# Load Classess -----------------------------------------------------------
source("./Code/API_class.R")

# Globals -----------------------------------------------------------------
endpoint_prefix<-"flask-api/v1/"
url_path<-"http://localhost:5000/"

url<-paste0(url_path,endpoint_prefix)
api<-API$new(url = url)
