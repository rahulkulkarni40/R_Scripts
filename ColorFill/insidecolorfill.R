library(shiny)
library(shinyjs)

jsCode <- '
shinyjs.backgroundCol = function(params) {
var defaultParams = {
id : null,
col : "red"
};
params = shinyjs.getParams(params, defaultParams);
var el = $("#" + params.id);
el.css("background-color", params.col);
}'

ui <- fluidPage(
  titlePanel("Inside Color Example"),
  useShinyjs(),
  extendShinyjs(text = jsCode),
  sidebarPanel(
    selectInput("TagColor", "Color of my Tag",choices=c("Red","Blue",
                                                        "Yellow","Black", "grey","orange","pink","purple"), 
                selected = "Red", multiple = FALSE)),
  mainPanel(
    p("This Application changes the Color of the Text Output."),
    
    #Bold Texts
    strong("On Change of Options in Select Input."),
    
    #new Line character
    br(),
    br(),
    
    #It is an Output box of R shiny Item
    div(style="width:300px;padding-left:10px;",fluidRow(verbatimTextOutput("val",placeholder = TRUE)))
  )
)

server <- function(input, output, session) {
  observe({
    #x <- FALSE
    d <- input$TagColor
      js$backgroundCol("val",d)
      output$val <-renderText({d})
  })
}

shinyApp(ui, server)