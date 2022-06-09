library(R6)
library(httr)
library(jsonlite)

API <- R6::R6Class("API",
 public = list(
   
   url=NULL,
   
   initialize = function(url=NA) {
     self$url<-url
   },
   
   set_url = function(val) {
     self$url <- val
   },
   
   multiplyByTwo = function(end_point, num) {
     reqOut = tryCatch({
       return(
         list(
           msg="OK",
           response=httr::POST(
             url = paste0(self$url, end_point),
             body = list(
                number = num
             ),
             encode = "json"
           )
         )
       )
     }, error = function(err) {
       return(list(
         msg=err,
         response=NULL
       ))
     })
     return(reqOut)
   },
   
   getGeneral = function(end_point) {
     reqOut = tryCatch({
       return(
         list(
           msg="OK",
           response=httr::GET(
             url = paste0(self$url, end_point),
             httr::timeout(120)
           )
         )
       )
     }, error = function(err) {
       return(list(
         msg=err,
         response=NULL
       ))
     })
     return(reqOut)
   }
 )
)