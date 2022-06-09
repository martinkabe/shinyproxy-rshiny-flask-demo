shinyServer(function(input, output, session){
  
  observeEvent(input$btnTestGetRequest, {
    name<-input$txtNameForGetRequest
    url_encoded<-URLencode(paste0("get_some_text/", name))
    resp<-api$getGeneral(url_encoded)$response
    txt<-httr::content(resp)
    
    output$msgTestGetRequest<-renderUI({
      HTML("<br><p style='color:blue'>From Flask API: <b>",txt,"</b></p>")
    })
    
  })
  
  observeEvent(input$btnTestPostRequest, {
    num<-as.numeric(input$numInputTestPostRequest)
    
    resp<-api$multiplyByTwo("timestwo", num)$response
    num_resp<-httr::content(resp)
    
    output$msgTestPostRequest<-renderUI({
      HTML("<br><p style='color:blue'>From Flask API: <b>",num_resp,"</b></p>")
    })
    
  })
})