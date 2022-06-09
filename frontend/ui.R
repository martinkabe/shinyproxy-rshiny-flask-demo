shinyUI(
    fluidPage(
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "main.css")
    ),
    
    tabsetPanel(
      tabPanel(
        title = "App Info",
        shiny::tags$div(
          class = "appInfo_div",
          shiny::h2("FLASK API"),
          shiny::p("This application calls python flask api.")
        )
      ),
      tabPanel(
        title = "API Test",
        fluidRow(
          column(6,
                 shiny::h3("Test GET request"),
                 textInput(
                   inputId="txtNameForGetRequest",
                   label="Give me your name",
                   value = "Unknown name"
                 ),
                 actionButton(
                   inputId = "btnTestGetRequest",
                   label = "Get Some Text"
                 ),
                 htmlOutput("msgTestGetRequest"),
                 shiny::br(),
          ),
          column(6,
                 shiny::h3("Test POST request"),
                 numericInput(
                  inputId="numInputTestPostRequest", 
                  label="Number that needs to be multiplied by two:",
                  value=10,
                  min=1,
                  max=9999
                 ),
                 actionButton(
                   inputId = "btnTestPostRequest",
                   label = "Multiply number by two"
                 ),
                 htmlOutput("msgTestPostRequest"),
                 shiny::br()
          )
        )
      )
    )
  )
)